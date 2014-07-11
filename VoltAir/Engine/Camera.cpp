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

#include "Camera.h"
#include <QQmlProperty>
#include <QQuickWindow>
#include <QSGNode>

Camera::Camera(QQuickItem* parent) :
        QQuickItem(parent),
        mPaintNode(new QSGNode()) {
    setFlag(ItemHasContents, true);
}

Camera::~Camera() {
    // Required to delete QSGNode mPaintNode.
}

void Camera::setFov(float fov) {
    if (mFov != fov) {
        mFov = fov;
        emit fovChanged();
    }
}

void Camera::setLookAt(const QPointF& lookAt) {
    if (mLookAt != lookAt) {
        mLookAt = lookAt;
        emit lookAtChanged();
    }
}

void Camera::setParallaxOrigin(const QPointF& value) {
    mParallaxOrigin = value;
}

float Camera::getAspectRatio() const {
    return window()->width() / (float) window()->height();
}

void Camera::updateTransform() {
    // The camera is set to fill the parent's width with the
    // contents of this object's children. Get the width from
    // the parent, just skipping entire update if it isn't
    // there yet.
    QQuickItem* p = parentItem();
    if (!p) {
        return;
    }

    float wid = p->width();

    // Given that this calculation is simple, simply set the
    // scale, x and y values of this node rather than deal with
    // transforms. We scale so that the fov fills the parent,
    // then translate to the center of the item, compensating
    // for the fact that we just scaled.
    float sc = wid / mFov;
    mTransformScale = sc;
    mTransformTranslate.setX(-(mLookAt.x() * sc) + (0.5f * wid));
    mTransformTranslate.setY(-(mLookAt.y() * sc) + (0.5f * p->height()));

    updateOpenGLViewMatrix();

    // Compute parallax.
    mParallaxOffset = mLookAt - mParallaxOrigin;

    // Compute viewport bounds.
    mViewportWorldBounds = QRectF(toWorldSpace(QPointF(0.0f, 0.0f)),
            toWorldSpace(QPointF(p->width(), p->height())));
    mWorldCullBounds = mViewportWorldBounds;
    // For performance, precompute padding around viewport to cull objects.
    mWorldCullBounds.adjust(-VIEWPORT_CULL_PADDING, -VIEWPORT_CULL_PADDING,
            VIEWPORT_CULL_PADDING, VIEWPORT_CULL_PADDING);
}

void Camera::updateOpenGLViewMatrix() {
    float scale = 2.0f / mFov;
    float scaleX = scale;
    float scaleY = -scale * getAspectRatio(); // GL coordinates are flipped from QtQuick.

    QMatrix4x4 scaleMat;
    scaleMat.scale(scaleX, scaleY);
    QMatrix4x4 transMat;
    transMat.translate(-mLookAt.x(), -mLookAt.y());
    mGlViewMatrix = scaleMat * transMat;
}

void Camera::applyTransform() {
    setScale(mTransformScale);
    setX(mTransformTranslate.x());
    setY(mTransformTranslate.y());
    mAppliedGlViewMatrix = mGlViewMatrix;
    emit transformApplied();
}

QSGNode* Camera::updatePaintNode(QSGNode*, UpdatePaintNodeData*) {
    QSGNode* node = mPaintNode.get();
    // Force view to repaint.
    node->markDirty(QSGNode::DirtyOpacity);
    update();
    return node;
}

QPointF Camera::toWorldSpace(const QPointF& point) const {
    return (point - mTransformTranslate) / mTransformScale;
}
