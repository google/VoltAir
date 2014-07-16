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

#include <Box2D/Box2D.h>
#include "Particle.h"
#include "ParticleLayer.h"

Particle::Particle(ParticleLayer* layer) : mLayer(layer) {
}

Particle::~Particle() {
    destroy();
}

void Particle::destroy() {
    if (mDestroyed) {
        return;
    }
    mDestroyed = true;

    b2ParticleSystem* psystem = mLayer->getParticleSystem();

    int particleCount = psystem->GetParticleCount();
    void** userDataBuffer = psystem->GetUserDataBuffer();
    for (int i = 0; i < particleCount; i++) {
        if (userDataBuffer[i] == this) {
            // Delete here.
            psystem->DestroyParticle(i);
            return;
        }
    }
}

void Particle::createNewParticle(const QPointF& position, const QPointF& velocity,
        const QColor& color) {
    b2ParticleDef def;
    def.position = b2Vec2(position.x(), position.y());
    def.velocity = b2Vec2(velocity.x(), velocity.y());
    def.color = b2ParticleColor(color.red(), color.green(), color.blue(), color.alpha());
    def.userData = this;
    mLayer->getParticleSystem()->CreateParticle(def);
}

void Particle::mapToExistingParticle(int index) {
    mLayer->getParticleSystem()->GetUserDataBuffer()[index] = this;
}
