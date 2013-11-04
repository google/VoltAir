/*
 * Copyright (C) 2014 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <Engine/Camera.h>
#include <Engine/Engine.h>
#include <Engine/Level.h>
#include <Engine/utils/Util.h>
#include <QRectF>
#include <algorithm>
#include <cmath>
#include "CameraMovementLogic.h"

void CameraMovementLogic::setMinFov(float value) {
    mMinFov = value;
    emit minFovChanged();
}

void CameraMovementLogic::setXPullFactor(float value) {
    mXPullFactor = value;
    emit xPullFactorChanged();
}

void CameraMovementLogic::setYPullFactor(float value) {
    mYPullFactor = value;
    emit yPullFactorChanged();
}

void CameraMovementLogic::setTowedXPullFactor(float value) {
    mTowedXPullFactor = value;
    emit towedXPullFactorChanged();
}

void CameraMovementLogic::setTowedYPullFactor(float value) {
    mTowedYPullFactor = value;
    emit towedYPullFactorChanged();
}

void CameraMovementLogic::setLookaheadScale(float value) {
    mLookaheadScale = value;
    emit lookaheadScaleChanged();
}

void CameraMovementLogic::setFovPullFactor(float value) {
    mFovPullFactor = value;
    emit fovPullFactorChanged();
}

void CameraMovementLogic::setXFovBorder(float value) {
    mXFovBorder = value;
    emit xFovBorderChanged();
}

void CameraMovementLogic::setYFovBorder(float value) {
    mYFovBorder = value;
    emit yFovBorderChanged();
}

void CameraMovementLogic::init() {
    Logic::init();

    mCamera = Util::findParentOfType<Camera>(this);
    Level* level = Engine::getInstance()->getLevel();

    if (!mCamera || !level) {
        return;
    }

    QPointF lookAt;
    float fov;

    if (level->shouldFillCamera()) {
        fillCameraViewport(&lookAt, &fov);
    } else {
        const QSet<Actor*>& actors = level->getActors(Actor::PlayerActor);
        for (Actor* actor : actors){
            mTowedControlPoints[actor] = QPointF(actor->position());
        }

        const QRectF actorsBBox = getExpandedBBoxOfPlayerActors();

        lookAt = actorsBBox.center();
        fov = actorsBBox.width();
        boundCameraViewport(&lookAt, &fov);
    }

    mCamera->setLookAt(lookAt);
    mCamera->setFov(fov);
}

void CameraMovementLogic::update() {
    // Check we have a camera, it is viewing a level, and that it's movable
    const Level* level = Engine::getInstance()->getLevel();
    if (!mCamera || !level || level->shouldFillCamera()) {
        return;
    }

    const QSet<Actor*>& actors = level->getActors(Actor::PlayerActor);
    for (Actor* actor : actors) {
        QPointF towedPoint = mTowedControlPoints[actor];
        QPointF position = actor->position();

        //TODO: Clamp towed points to stay within camera boundary
        towedPoint.setX(towedPoint.x() + (position.x() - towedPoint.x()) * mTowedXPullFactor);
        towedPoint.setY(towedPoint.y() + (position.y() - towedPoint.y()) * mTowedYPullFactor);

        mTowedControlPoints[actor] = towedPoint;
    }

    const QRectF actorsBBox = getExpandedBBoxOfPlayerActors();

    QPointF lookAt = computeLookAt(actorsBBox);
    float fov = computeFov(actorsBBox);

    boundCameraViewport(&lookAt, &fov);

    mCamera->setLookAt(lookAt);
    mCamera->setFov(fov);
}

// TODO: Switch this to using more general world bboxes once implemented.
QRectF CameraMovementLogic::getExpandedBBoxOfPlayerActors() const {
    const Camera* camera = mCamera;
    const Level* level = Engine::getInstance()->getLevel();
    const QSet<Actor*>& actors = level->getActors(Actor::PlayerActor);

    if (actors.isEmpty()) {
        return QRectF(camera->getLookAt(), QSizeF(0, 0));
    }

    auto it = actors.begin();
    QRectF actorsBBox(getExtrapolatedPosition(*it), QSizeF(0, 0));
    for (++it; it != actors.end(); ++it) {
        actorsBBox = Util::united(actorsBBox, getExtrapolatedPosition(*it));
    }

    // Expand the sides of the bounding box to include the fov "buffer" space
    float xFovBorderInWorld = mXFovBorder * camera->getFov();
    float yFovBorderInWorld = mYFovBorder * camera->getFov() / camera->getAspectRatio();
    actorsBBox.adjust(-xFovBorderInWorld, -yFovBorderInWorld, xFovBorderInWorld, yFovBorderInWorld);
    return actorsBBox;
}

QPointF CameraMovementLogic::getExtrapolatedPosition(Actor* actor) const{
    QPointF invertedPoint;
    QPointF towedPoint = mTowedControlPoints[actor];
    QPointF position = actor->position();
    invertedPoint.setX(position.x() + (position.x() - towedPoint.x()) * mLookaheadScale);
    invertedPoint.setY(position.y() + (position.y() - towedPoint.y()) * mLookaheadScale);
    return invertedPoint;
}

QPointF CameraMovementLogic::computeLookAt(const QRectF& actorsBBox) const {
    // Adjust camera's lookAt point according to PlayerActors' BBox
    QPointF lookAt = mCamera->getLookAt();

    // Calculate the diff between where camera and actor are, in both world and camera space
    // NOTE: The latter is on [-1, 1]
    const float xdiff = actorsBBox.center().x() - lookAt.x();
    lookAt.rx() += mXPullFactor * xdiff;

    // Perform the same calculations for the y axis.
    const float ydiff = actorsBBox.center().y() - lookAt.y();
    lookAt.ry() += mYPullFactor * ydiff;

    return lookAt;
}

float CameraMovementLogic::computeFov(const QRectF& actorsBBox) const {
    // Adjust camera's fov according to PlayerActors' BBox
    float fov = mCamera->getFov();

    // Calculate the difference between how wide the camera is and how wide the camera would
    // need to be in order to enclose the PlayerActor's BBox, in world space
    const float camWidth = mCamera->getFov();
    const float widthDiff = actorsBBox.width() - camWidth;
    const float camHeight = camWidth / mCamera->getAspectRatio();
    const float heightDiff = (-actorsBBox.height()) - camHeight;
    // The fovDiff is amount fov would need to change to enclose width *and* height
    const float fovDiff = std::max(widthDiff, heightDiff * mCamera->getAspectRatio());

    // We currently always adjust the fov without a threshold.  Otherwise it would be possible
    // for PlayerActors to get off screen.
    // NOTE: To avoid oscillations of zoom in-and-out, we could add a "zoom in" threshold here
    // when fovDiff is < 0.
    fov += mFovPullFactor * fovDiff;

    return fov;
}

void CameraMovementLogic::boundCameraViewport(QPointF* lookAt, float* fov) const {
    const float aspectRatio = mCamera->getAspectRatio();
    const Level* level = Engine::getInstance()->getLevel();
    const QRectF cameraBoundary = level->getCameraBoundary();

    // If camera is so large that it spans the entire boundary, reduce its fov. We do the
    // two dimensions independently as either or both of them can cause this case.
    *fov = std::min(*fov, (float) cameraBoundary.width());
    *fov = std::min(*fov, (float) cameraBoundary.height() * aspectRatio);

    // In all cases, make sure the fov is at least as big as the minimum fov.
    *fov = std::max(*fov, mMinFov);

    // If the camera, now limited in fov, extends beyond the boundary, move it inside.
    const float halfCamWidth = *fov * 0.5f;
    const float halfCamHeight = halfCamWidth / aspectRatio;
    lookAt->rx() = std::min(lookAt->x(), cameraBoundary.right() - halfCamWidth);
    lookAt->rx() = std::max(lookAt->x(), cameraBoundary.left() + halfCamWidth);
    lookAt->ry() = std::max(lookAt->y(), cameraBoundary.top() + halfCamHeight);
    lookAt->ry() = std::min(lookAt->y(), cameraBoundary.bottom() - halfCamHeight);
}

void CameraMovementLogic::fillCameraViewport(QPointF* lookAt, float* fov) const {
    const float aspectRatio = mCamera->getAspectRatio();
    const Level* level = Engine::getInstance()->getLevel();
    const QRectF cameraBoundary = level->getCameraBoundary();

    *fov = mMinFov;
    *fov = std::max(*fov, (float) cameraBoundary.width());
    *fov = std::max(*fov, (float) cameraBoundary.height() * aspectRatio);
    *lookAt = cameraBoundary.center();
}
