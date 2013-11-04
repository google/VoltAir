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

#include "DestructionListener.h"
#include "Joint.h"

void DestructionListener::SayGoodbye(b2Fixture*) {
}

void DestructionListener::SayGoodbye(b2Joint* joint) {
    Joint* jointObject = getJointObjectFromJoint(joint);
    jointObject->notifyJointDestroyed(joint);
}

Joint* DestructionListener::getJointObjectFromJoint(const b2Joint* joint) {
    return static_cast<Joint*>(joint->GetUserData());
}
