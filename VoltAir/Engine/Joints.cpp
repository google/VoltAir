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
#include "Joints.h"
#include "joints/RevoluteJoint.h"
#include "joints/WeldJoint.h"

Joints* Joints::sInstance = nullptr;

Joints::Joints(QObject* parent) : QObject(parent) {
}

WeldJoint* Joints::createWeldJoint(Body* bodyA, Body* bodyB) {
    WeldJoint* joint = new WeldJoint(bodyA);
    joint->setTargets(bodyA, bodyB);
    return joint;
}

RevoluteJoint* Joints::createRevoluteJoint(Body* bodyA, Body* bodyB) {
    RevoluteJoint* joint = new RevoluteJoint(bodyA);
    joint->setTargets(bodyA, bodyB);
    return joint;
}

Joints* Joints::getInstance() {
    if (!sInstance) {
        sInstance = new Joints();
    }
    return sInstance;
}
