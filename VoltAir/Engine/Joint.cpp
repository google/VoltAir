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
#include "Joint.h"

Joint::Joint(QObject* parent) : QObject(parent) {
}

Joint::~Joint() {
    mBodyA->unregisterAttachedJoint(this);
    mBodyB->unregisterAttachedJoint(this);
    setParent(nullptr);
    destroyJoint();
}

void Joint::setTargets(Body* joiner, Body* joinee) {
    mBodyA = joiner;
    mBodyB = joinee;
    mBodyA->registerAttachedJoint(this);
    mBodyB->registerAttachedJoint(this);
}

void Joint::createJoint() {
}

void Joint::destroyJoint() {
    if (mJoint) {
         b2Joint* joint = mJoint;
         mJoint = nullptr;
         joint->GetBodyA()->GetWorld()->DestroyJoint(joint);
    }
}

void Joint::notifyJointDestroyed(b2Joint* joint) {
    // Clean up our pointer, also allowing the joint to be recreated.
    if (mJoint == joint) {
        mJoint = nullptr;
    }
}
