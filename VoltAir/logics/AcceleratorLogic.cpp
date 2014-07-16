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

#include <Engine/Actor.h>
#include <Engine/Body.h>
#include "AcceleratorLogic.h"

void AcceleratorLogic::setAcceleration(float value) {
    mAcceleration = value;
    emit accelerationChanged();
}

void AcceleratorLogic::init() {
    Logic::init();

    Actor* actor = getActor();
    if (!actor) {
        qDebug() << "Warning: AcceleratorLogic created out of the scope of an Actor";
        return;
    }

    Body* body = actor->getBody();
    if (!body) {
        qDebug() << "Body not found for Actor" << actor->property("id").toString();
        return;
    }
}

void AcceleratorLogic::update() {
    Actor* actor = getActor();
    if (!actor) {
        return;
    }

    Body* body = actor->getBody();
    if (!body) {
        return;
    }

    for (Body* otherBody : body->getContactedBodies()) {
        if (!otherBody->isSensor()) {
            // TODO: consider dividing by mass for consistent acceleration.
            otherBody->applyForceToCenter(otherBody->getLinearVelocity() * mAcceleration);
        }
    }
}
