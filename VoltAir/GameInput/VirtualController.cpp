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

#include "InputUtil.h"
#include "VirtualController.h"

VirtualController::VirtualController(int deviceId) : mDeviceId(deviceId) { }

VirtualController::~VirtualController() { }

void VirtualController::setJoystickAxisScheme(const JoystickAxisScheme& joystickAxisScheme) {
    mJoystickAxisScheme = joystickAxisScheme;
    mActionJoystickAxes.clear();
    // Construct reverse map from actions to a list of joystick axes
    for (auto& axisActionPair : joystickAxisScheme) {
        mActionJoystickAxes[axisActionPair.second].push_back(axisActionPair.first);
    }
}

void VirtualController::setKeyScheme(const KeyScheme& keyScheme) {
    mKeyScheme = keyScheme;
    mActionKeys.clear();
    // Construct reverse map from actions to a list of keys
    for (auto& keyActionPair : keyScheme) {
        mActionKeys[keyActionPair.second].push_back(keyActionPair.first);
    }
}

void VirtualController::setTriggerAxisScheme(const TriggerAxisScheme& triggerAxisScheme) {
    mTriggerAxisScheme = triggerAxisScheme;
    mActionTriggerAxes.clear();
    // Construct reverse map from actions to a list of trigger axes
    for (auto& axisActionPair : triggerAxisScheme) {
        mActionTriggerAxes[axisActionPair.second].push_back(axisActionPair.first);
    }
}

bool VirtualController::isSourceOfEvent(ControllerEvent* event) const {
    return event->getDeviceId() == mDeviceId;
}

bool VirtualController::onControllerEvent(ControllerEvent *event) {
    if (!isSourceOfEvent(event)) {
        return false;
    }

    bool handledEvent = false;

    // Update relevant key info
    if (event->hasKeyInfo() && !mKeyScheme.empty()) {
        for (auto& keyStatePair : event->getKeyStates()) {
            if (mKeyScheme.hasActionFor(keyStatePair.first)) {
                mState.setKeyState(keyStatePair.first, keyStatePair.second);
                handledEvent = true;
            }
        }
    }

    // Update relevant joystick info
    if (event->hasJoystickAxisInfo() && !mJoystickAxisScheme.empty()) {
        for (auto& joystickStatePair : event->getJoystickAxisStates()) {
            if (mJoystickAxisScheme.hasActionFor(joystickStatePair.first)) {
                mState.setJoystickAxisValue(joystickStatePair.first, joystickStatePair.second);
                handledEvent = true;
            }
        }
    }

    // Update relevant trigger info
    if (event->hasTriggerAxisInfo() && !mTriggerAxisScheme.empty()) {
        for (auto& triggerStatePair : event->getTriggerAxisStates()) {
            if (mTriggerAxisScheme.hasActionFor(triggerStatePair.first)) {
                mState.setTriggerAxisValue(triggerStatePair.first, triggerStatePair.second);
                handledEvent = true;
            }
        }
    }

    return handledEvent;
}

int VirtualController::getActionSupport(const InputScheme<>::Action& action) const {
    int support = NO_SUPPORT;
    // Currently, an action's support just depends on which input types we have mapping to it.
    // TODO: Make this also use predicate functions.
    if (mActionKeys.count(action)) {
        support |= BINARY_ACTION;
    }
    if (mActionTriggerAxes.count(action)) {
        support |= UNIT_INTERVAL_ACTION;
    }
    if (mActionJoystickAxes.count(action)) {
        support |= SYMMETRIC_UNIT_INTERVAL_ACTION;
    }
    return support;
}

bool VirtualController::isActionActivated(const InputScheme<>::Action& action) const {
    // Check this is an action we support to avoid needlessly growing our map
    auto it = mActionKeys.find(action);
    if (it == mActionKeys.end()) {
        return false;
    }

    // Check if any of the keys that map to this action are currently activated.
    for (KeyCode key : it->second) {
        if (mState.isKeyPressed(key)) {
            return true;
        }
    }
    return false;
}

float VirtualController::getActionUnitIntervalValue(const InputScheme<>::Action& action) const {
    auto it = mActionTriggerAxes.find(action);
    if (it == mActionTriggerAxes.end()) {
        return 0.0f;
    }

    // Add up all triggers
    float value = 0.0f;
    for (TriggerAxisCode trigger : it->second) {
        value += mState.getTriggerAxisValue(trigger);
    }

    // Clamp to [0,1]
    return InputUtil::clamp(value, 0.0f, 1.0f);
}

float VirtualController::getActionSymmetricUnitIntervalValue(
        const InputScheme<>::Action& action) const {
    auto it = mActionJoystickAxes.find(action);
    if (it == mActionJoystickAxes.end()) {
        return 0.0f;
    }

    // Add up all joysticks
    float value = 0.0f;
    for (JoystickAxisCode joystick : it->second) {
        value += mState.getJoystickAxisValue(joystick);
    }

    // Clamp to [-1, 1]
    return InputUtil::clamp(value, -1.0f, 1.0f);
}
