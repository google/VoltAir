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
#include "TouchNavigationRouter.h"

// -------------------------------------------------------------------------------------------
// TouchNavigationRouter::TouchNavigationControllerFactory implementation
// -------------------------------------------------------------------------------------------

// TODO: Add back and home?
std::set<KeyCode> TouchNavigationRouter::TouchNavigationControllerFactory::sValidKeyCodes(
        {
            KEYCODE_DPAD_LEFT,
            KEYCODE_DPAD_RIGHT,
            KEYCODE_DPAD_DOWN,
            KEYCODE_DPAD_UP,
            KEYCODE_DPAD_CENTER,
            KEYCODE_VOLUME_UP,
            KEYCODE_VOLUME_DOWN,
        });
std::set<JoystickAxisCode>
        TouchNavigationRouter::TouchNavigationControllerFactory::sValidJoystickAxisCodes(
        {
            TOUCH_NAVIGATION_X,
            TOUCH_NAVIGATION_Y,
        });

TouchNavigationRouter::TouchNavigationControllerFactory::TouchNavigationControllerFactory(
        const KeyScheme& keyScheme,
        const JoystickAxisScheme& joystickAxisScheme
        ) : ControllerFactory(),
            mKeyScheme(keyScheme),
            mJoystickAxisScheme(joystickAxisScheme) {
    assert(ControllerFactory::isValidInputScheme<KeyCode>(
               keyScheme,
               sValidKeyCodes));
    assert(ControllerFactory::isValidInputScheme<JoystickAxisCode>(
               joystickAxisScheme,
               sValidJoystickAxisCodes
               ));
}

bool TouchNavigationRouter::TouchNavigationControllerFactory::intersects(
        const ControllerFactory& otherFactory) const {
    const TouchNavigationControllerFactory* otherTouchNavigationFactory =
            dynamic_cast<const TouchNavigationControllerFactory*>(&otherFactory);
    if (otherTouchNavigationFactory) {
        return intersects(*otherTouchNavigationFactory);
    }
    return false;
}

bool TouchNavigationRouter::TouchNavigationControllerFactory::intersects(
        const TouchNavigationControllerFactory& otherFactory) const {
    return mKeyScheme.intersects(otherFactory.mKeyScheme)
           || mJoystickAxisScheme.intersects(otherFactory.mJoystickAxisScheme);
}

bool TouchNavigationRouter::TouchNavigationControllerFactory::handlesControllerEvent(
        const ControllerEvent* event) const {
    return mKeyScheme.handlesControllerEvent(event)
           || mJoystickAxisScheme.handlesControllerEvent(event);
}

VirtualController* TouchNavigationRouter::TouchNavigationControllerFactory::createNewController(
        int deviceId) const {
    VirtualController* controller = new VirtualController(deviceId);
    controller->setKeyScheme(mKeyScheme);
    controller->setJoystickAxisScheme(mJoystickAxisScheme);
    return controller;
}

// -------------------------------------------------------------------------------------------
// TouchNavigationRouter implementation
// -------------------------------------------------------------------------------------------

TouchNavigationRouter* TouchNavigationRouter::sInstance = nullptr;

TouchNavigationRouter::TouchNavigationRouter() : InputRouter() {  }

bool TouchNavigationRouter::addTouchNavigationControllerFactory(
        const TouchNavigationControllerFactory& factory) {
    // Only allow one factory at a time since a TouchNavigation device has no logical way that it
    // can be divided.
    if (InputRouter::hasFactoryRoutes()) {
        InputRouter::clearFactories();
    }
    InputRouter::addControllerFactory(new TouchNavigationControllerFactory(factory));
    return true;
}

TouchNavigationRouter* TouchNavigationRouter::getInstance() {
    if (!sInstance) {
        sInstance = new TouchNavigationRouter();
    }
    return sInstance;
}

