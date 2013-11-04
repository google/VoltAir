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

#include <cassert>
#include "ControllerManager.h"
#include "GamepadRouter.h"

// -------------------------------------------------------------------------------------------
// GamepadRouter::GamepadControllerFactory implementation
// -------------------------------------------------------------------------------------------

// TODO: Add back and home?
std::set<KeyCode> GamepadRouter::GamepadControllerFactory::sValidKeyCodes(
        {
            KEYCODE_BUTTON_A,
            KEYCODE_BUTTON_B,
            KEYCODE_BUTTON_X,
            KEYCODE_BUTTON_Y,
            KEYCODE_BUTTON_L1,
            KEYCODE_BUTTON_R1,
            KEYCODE_BUTTON_L2,
            KEYCODE_BUTTON_R2,
            KEYCODE_DPAD_UP,
            KEYCODE_DPAD_LEFT,
            KEYCODE_DPAD_DOWN,
            KEYCODE_DPAD_RIGHT,
            KEYCODE_DPAD_CENTER, // TODO: Figure out if this is actually true
        });
std::set<JoystickAxisCode> GamepadRouter::GamepadControllerFactory::sValidJoystickAxisCodes(
        {
            LEFT_ANALOG_X,
            LEFT_ANALOG_Y,
            RIGHT_ANALOG_X,
            RIGHT_ANALOG_Y,
        });
std::set<TriggerAxisCode> GamepadRouter::GamepadControllerFactory::sValidTriggerAxisCodes(
        {
            LEFT_TRIGGER,
            RIGHT_TRIGGER,
        });

GamepadRouter::GamepadControllerFactory::GamepadControllerFactory(
        const KeyScheme& keyScheme,
        const JoystickAxisScheme& joystickAxisScheme,
        const TriggerAxisScheme& triggerAxisScheme
        ) : ControllerFactory(),
            mKeyScheme(keyScheme),
            mJoystickAxisScheme(joystickAxisScheme),
            mTriggerAxisScheme(triggerAxisScheme) {
    // Validate the input schemes
    assert(ControllerFactory::isValidInputScheme<KeyCode>(
               keyScheme,
               sValidKeyCodes));
    assert(ControllerFactory::isValidInputScheme<JoystickAxisCode>(
               joystickAxisScheme,
               sValidJoystickAxisCodes));
    assert(ControllerFactory::isValidInputScheme<TriggerAxisCode>(
               triggerAxisScheme,
               sValidTriggerAxisCodes));
}

bool GamepadRouter::GamepadControllerFactory::intersects(
        const ControllerFactory& otherFactory) const {
    const GamepadControllerFactory* otherGamepadFactory =
            dynamic_cast<const GamepadControllerFactory*>(&otherFactory);
    if (otherGamepadFactory) {
        return intersects(*otherGamepadFactory);
    }
    return false;
}

bool GamepadRouter::GamepadControllerFactory::intersects(
        const GamepadControllerFactory& otherFactory) const {
    return mKeyScheme.intersects(otherFactory.mKeyScheme)
           || mJoystickAxisScheme.intersects(otherFactory.mJoystickAxisScheme)
           || mTriggerAxisScheme.intersects(otherFactory.mTriggerAxisScheme);
}

bool GamepadRouter::GamepadControllerFactory::handlesControllerEvent(
        const ControllerEvent* event) const {
    return mKeyScheme.handlesControllerEvent(event)
           || mJoystickAxisScheme.handlesControllerEvent(event)
           || mTriggerAxisScheme.handlesControllerEvent(event);
}

VirtualController* GamepadRouter::GamepadControllerFactory::createNewController(
        int deviceId) const {
    VirtualController* controller = new VirtualController(deviceId);
    controller->setKeyScheme(mKeyScheme);
    controller->setJoystickAxisScheme(mJoystickAxisScheme);
    controller->setTriggerAxisScheme(mTriggerAxisScheme);
    return controller;
}

// -------------------------------------------------------------------------------------------
// GamepadRouter implementation
// -------------------------------------------------------------------------------------------

GamepadRouter* GamepadRouter::sInstance = nullptr;

GamepadRouter::GamepadRouter() : InputRouter() {  }

bool GamepadRouter::addGamepadControllerFactory(const GamepadControllerFactory& factory) {
    // Check for conflicts with other factories
    if (InputRouter::conflictsWithExistingFactories(factory)) {
        return false;
    }
    InputRouter::addControllerFactory(new GamepadControllerFactory(factory));
    return true;
}

GamepadRouter* GamepadRouter::getInstance() {
    if (!sInstance) {
        sInstance = new GamepadRouter();
    }
    return sInstance;
}

