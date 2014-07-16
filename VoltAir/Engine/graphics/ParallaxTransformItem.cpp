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

#include "Actor.h"
#include "Camera.h"
#include "Engine.h"
#include "Level.h"
#include "ParallaxTransformItem.h"
#include "utils/Util.h"

ParallaxTransformItem::ParallaxTransformItem(QQuickItem* parent) : QQuickItem(parent) {
    setFlag(ItemHasContents);

    connect(Engine::getInstance()->getCamera(), &Camera::transformApplied,
        this, &ParallaxTransformItem::updateItemOffset, Qt::DirectConnection);
}

ParallaxTransformItem::~ParallaxTransformItem() {
}

void ParallaxTransformItem::setZDepth(float value) {
    mZDepth = value;

    // Recompute projection coefficients.
    updateProjectionRatio();

    emit zDepthChanged();
}

void ParallaxTransformItem::componentComplete() {
    QQuickItem::componentComplete();


    // Recompute projection coefficients.
    updateProjectionRatio();

    // Find our Actor.
    mActor = Util::findParentOfType<Actor>(this);
}

void ParallaxTransformItem::updateItemOffset() {
    if (!mActor) {
        return;
    }
    // Compute how much offset this z-depth has.
    Camera* camera = Engine::getInstance()->getCamera();
    QPointF offset = camera->getParallaxOffset();
    offset.rx() *= mZProjectionRatioX;
    offset.ry() *= mZProjectionRatioY;
    offset += mActor->position();

    // Transform to body space so we can position our graphic.
    QPointF offsetBody = camera->mapToItem(mActor, offset);
    setX(offsetBody.x());
    setY(offsetBody.y());
}

void ParallaxTransformItem::updateProjectionRatio() {
    Level* level = Util::findParentOfType<Level>(this);
    if (!level) {
        return;
    }
    QPointF strength = level->getParallaxStrength();
    mZProjectionRatioX = 1.0f - 1.0f / (1.0f + (mZDepth - REFERENCE_DEPTH) * strength.x());
    mZProjectionRatioY = 1.0f - 1.0f / (1.0f + (mZDepth - REFERENCE_DEPTH) * strength.y());
}
