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

#include "ControllerEvent.h"
#include "InputUtil.h"

ControllerEvent::ControllerEvent(int deviceId) : mDeviceId(deviceId) { }

ControllerEvent::~ControllerEvent() { }

bool ControllerEvent::isKeyPressed(const KeyCode& keyCode) const {
    auto it = mKeyStates.find(keyCode);
    if (it == mKeyStates.end()) {
        return false;
    }
    return it->second;
}

float ControllerEvent::getJoystickAxisValue(const JoystickAxisCode& axis) const {
    auto it = mJoystickAxisStates.find(axis);
    if (it == mJoystickAxisStates.end()) {
        return 0.0f;
    }
    return it->second;
}

void ControllerEvent::setJoystickAxisValue(const JoystickAxisCode& axis, float value) {
    mJoystickAxisStates[axis] = InputUtil::clamp(value, -1.0f, 1.0f);
}

float ControllerEvent::getTriggerAxisValue(const TriggerAxisCode& axis) const {
    auto it = mTriggerAxisStates.find(axis);
    if (it == mTriggerAxisStates.end()) {
        return 0.0f;
    }
    return it->second;
}

void ControllerEvent::setTriggerAxisValue(const TriggerAxisCode& axis, float value) {
    mTriggerAxisStates[axis] = InputUtil::clamp(value, 0.0f, 1.0f);
}
