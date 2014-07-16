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
#include <Engine/particles/WaterParticle.h>
#include "ParticleEmitterLogic.h"

void ParticleEmitterLogic::setColor(const QColor& color) {
    mColor = color;
    emit colorChanged();
}

void ParticleEmitterLogic::setPauseDistance(float value) {
    mPauseDistance = value;
    emit pauseDistanceChanged();
}

void ParticleEmitterLogic::setLayer(ParticleLayer* value) {
    mLayer = value;
    emit layerChanged();
}

void ParticleEmitterLogic::update() {
    // Check if we need to pause our emitter.
    float padding = mPauseDistance;
    QRectF worldBounds = getEmitterWorldBounds();
    QRectF viewportBounds = Engine::getInstance()->getCamera()->getViewportWorldBounds();
    viewportBounds.adjust(-padding, -padding, padding, padding);
    bool shouldPause = worldBounds.right() < viewportBounds.left()
            || worldBounds.left() > viewportBounds.right()
            || worldBounds.top() > viewportBounds.bottom()
            || worldBounds.bottom() < viewportBounds.top();
    setPaused(shouldPause);

    EmitterLogic::update();
    mParticles.update();
}

void ParticleEmitterLogic::emitEntity(const SpawnParameters& parameters) {
    // Returning if we don't have a layer set is a bad idea, as it can cause an infinite loop.
    Q_ASSERT(mLayer);

    WaterParticle* particle = new WaterParticle(mLayer, parameters.position, parameters.velocity,
            getColor(), parameters.decayTime);
    mParticles.addParticle(particle);

    // Begin particle decay immediately.
    particle->beginDecaying();
}

void ParticleEmitterLogic::onPausedChanged() {
    EmitterLogic::onPausedChanged();
    if (isPaused()) {
        mParticles.clearParticles();
    }
}

QRectF ParticleEmitterLogic::getEmitterWorldBounds() {
    return QRectF(getActor()->position(), QSizeF(0.0f, 0.0f));
}
