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

#include "Engine.h"
#include "WaterParticle.h"

WaterParticle::WaterParticle(ParticleLayer* layer, const QPointF& position, const QPointF& velocity,
        const QColor& color, float decayTime) : Particle(layer), mInitialDecayTime(decayTime),
        mDecayTime(decayTime) {
    createNewParticle(position, velocity, color);
}

WaterParticle::WaterParticle(ParticleLayer* layer, int index, float decayTime) : Particle(layer),
        mInitialDecayTime(decayTime), mDecayTime(decayTime) {
    mapToExistingParticle(index);
}

void WaterParticle::beginDecaying() {
    mIsDecaying = true;
}

void WaterParticle::resetDecayTime() {
    mDecayTime = mInitialDecayTime;
}

void WaterParticle::update() {
    if (mIsDecaying) {
        mDecayTime -= Engine::TIME_STEP_S;
        if (mDecayTime < 0) {
            // Destroy this particle in the b2World.
            // This object is kept alive, and is cleaned up later, usually by WaterBody.
            destroy();
        }
    }
}
