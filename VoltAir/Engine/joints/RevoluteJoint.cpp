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
#include "Body.h"
#include "RevoluteJoint.h"

RevoluteJoint::RevoluteJoint(QObject* parent) : Joint(parent) {
}

void RevoluteJoint::createJoint() {
    if (mJoint) {
        return;
    }
    Body* bodyATarget = getBodyATarget();
    Body* bodyBTarget = getBodyBTarget();
    if (!bodyATarget || !bodyBTarget || !bodyATarget->getBody() || !bodyBTarget->getBody()) {
        return;
    }
    b2World* world = bodyATarget->getBody()->GetWorld();
    b2Body* bodyA = bodyATarget->getBody();
    b2Body* bodyB = bodyBTarget->getBody();

    // Compute anchor location such that the objects are pinned where they are.
    // Use the parent of this joint as the anchor.
    b2Vec2 revolutePos = bodyA->GetPosition();
    float revoluteAngle = bodyB->GetAngle() - bodyA->GetAngle();

    b2RevoluteJointDef def;
    def.bodyA = bodyA;
    def.bodyB = bodyB;
    def.localAnchorA = bodyA->GetLocalPoint(revolutePos);
    def.localAnchorB = bodyB->GetLocalPoint(revolutePos);
    def.referenceAngle = revoluteAngle;
    def.collideConnected = false;
    def.userData = this;
    b2Joint* joint = world->CreateJoint(&def);
    mJoint = joint;
}
