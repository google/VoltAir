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

#include "Body.h"
#include "ContactListener.h"
#include "utils/Box2dUtil.h"

void ContactListener::BeginContact(b2Contact* contact) {
    Body* bodyA = getBodyFromFixture(contact->GetFixtureA());
    Body* bodyB = getBodyFromFixture(contact->GetFixtureB());
    b2WorldManifold worldManifold;
    contact->GetWorldManifold(&worldManifold);
    QPointF normal = Box2dUtil::toQPointF(worldManifold.normal);
    // Invert the normal so that it points from B to A.
    QPointF normalInv = Box2dUtil::toQPointF(-1.0f * worldManifold.normal);
    bodyA->beginContact(bodyB, normal);
    bodyB->beginContact(bodyA, normalInv);
}

void ContactListener::EndContact(b2Contact* contact) {
    Body* bodyA = getBodyFromFixture(contact->GetFixtureA());
    Body* bodyB = getBodyFromFixture(contact->GetFixtureB());
    b2WorldManifold worldManifold;
    contact->GetWorldManifold(&worldManifold);
    QPointF normal = Box2dUtil::toQPointF(worldManifold.normal);
    // Invert the normal so that it points from B to A.
    QPointF normalInv = Box2dUtil::toQPointF(-1.0f * worldManifold.normal);
    bodyA->endContact(bodyB, normal);
    bodyB->endContact(bodyA, normalInv);
}

Body* ContactListener::getBodyFromFixture(const b2Fixture* fixture) {
    return static_cast<Body*> (fixture->GetBody()->GetUserData());
}
