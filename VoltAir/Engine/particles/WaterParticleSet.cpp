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

#include "WaterParticleSet.h"

WaterParticleSet::WaterParticleSet() {
}

WaterParticleSet::~WaterParticleSet() {
    clearParticles();
}

void WaterParticleSet::addParticle(WaterParticle* particle) {
    mParticles.insert(particle);
}

WaterParticle* WaterParticleSet::getParticleWithUserData(void* userData) const {
    // Temporarily cast this into a WaterParticle. It may not be a valid WaterParticle object,
    // so we check if its pointer value exists in our set. If it does, it must be a valid
    // WaterParticle object.
    WaterParticle* particle = static_cast<WaterParticle*>(userData);
    if (mParticles.contains(particle)) {
        // This is contained in our set, and so must be a valid WaterParticle.
        return particle;
    }
    return nullptr;
}

bool WaterParticleSet::containsParticle(WaterParticle* particle) const {
    return mParticles.contains(particle);
}

void WaterParticleSet::clearParticles() {
    for (WaterParticle* particle : mParticles) {
        delete particle;
    }
    mParticles.clear();
}

void WaterParticleSet::update() {
    // Update particles, and remove those that have died.
    auto it = mParticles.begin();
    while (it != mParticles.end()) {
        WaterParticle* particle = *it;
        particle->update();
        if (particle->isDestroyed()) {
            it = mParticles.erase(it);
            delete particle;
        } else {
            ++it;
        }
    }
}
