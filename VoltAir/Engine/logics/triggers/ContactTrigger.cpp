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
#include "Body.h"
#include "ContactTrigger.h"
#include "logics/events/ContactEvent.h"

void ContactTrigger::init() {
    Logic::init();
    Actor* actor = getActor();
    if (!actor) {
        qDebug() << "Actor not found";
        return;
    }
    Body* body = actor->getBody();
    if (!body) {
        qDebug() << "Body not found";
        return;
    }
    auto e = (mContact == ContactEvent::ContactBegun) ?  &Body::contactBegun : &Body::contactEnded;
    connect(body, e, this, [this] (Body* otherBody, QPointF) {
        if (actorTypeMatches(otherBody)) {
            queueEvent(new ContactEvent(otherBody, mContact));
        }
    });
}

bool ContactTrigger::actorTypeMatches(Body* body) {
    if (mActorType == Actor::GenericActor) {
        return true; // every actor is (also) a generic actor.
    }
    Actor* actor = body->getActor();
    if (!actor) {
        qDebug() << "Actor of contact body not found";
        return false;
    }
    return actor->getActorType() == mActorType;
}

void ContactTrigger::setActorType(Actor::ActorType value) {
    mActorType = value;
    emit actorTypeChanged();
}

void ContactTrigger::setContact(ContactEvent::Contact value) {
    mContact = value;
    emit contactChanged();
}
