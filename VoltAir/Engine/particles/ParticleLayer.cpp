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
#include "Engine.h"
#include "ParticleLayer.h"

ParticleLayer::ParticleLayer(QObject* parent) : QObject(parent) {
    b2ParticleSystemDef def;
    mParticleSystem = Engine::getInstance()->getWorld()->CreateParticleSystem(&def);
    mParticleSystem->SetStrictContactCheck(true);
    setRadius(0.05f);
    setDensity(1.2f);
    setGravityScale(0.4f);
}

ParticleLayer::~ParticleLayer() {
    // TODO: Gracefully delete b2ParticleSystem.
    // Currently it's deleted by b2World, and we never dynamically create / delete layers except at
    // level load.
}

float ParticleLayer::getRadius() const {
    return mParticleSystem->GetRadius();
}

void ParticleLayer::setRadius(float value) {
    mParticleSystem->SetRadius(value);
    emit radiusChanged();
}

float ParticleLayer::getDensity() const {
    return mParticleSystem->GetDensity();
}

void ParticleLayer::setDensity(float value) {
    mParticleSystem->SetDensity(value);
    emit densityChanged();
}

float ParticleLayer::getGravityScale() const {
    return mParticleSystem->GetGravityScale();
}

void ParticleLayer::setGravityScale(float value) {
    mParticleSystem->SetGravityScale(value);
    emit gravityScaleChanged();
}
