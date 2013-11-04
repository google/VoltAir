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

#include "ControllerManager.h"
#include "KeyboardRouter.h"

// -------------------------------------------------------------------------------------------
// KeyboardRouter::KeyboardControllerFactory implementation
// -------------------------------------------------------------------------------------------

KeyboardRouter::KeyboardControllerFactory::KeyboardControllerFactory(
        const KeyScheme& keyScheme
        ) : ControllerFactory(),
            mKeyScheme(keyScheme) {
}

bool KeyboardRouter::KeyboardControllerFactory::intersects(
        const ControllerFactory& otherFactory) const {
    const KeyboardControllerFactory* otherKeyboardFactory =
            dynamic_cast<const KeyboardControllerFactory*>(&otherFactory);
    if (otherKeyboardFactory) {
        return intersects(*otherKeyboardFactory);
    }
    return false;
}

bool KeyboardRouter::KeyboardControllerFactory::intersects(
        const KeyboardControllerFactory& otherFactory) const {
    return mKeyScheme.intersects(otherFactory.mKeyScheme);
}

bool KeyboardRouter::KeyboardControllerFactory::handlesControllerEvent(
        const ControllerEvent* event) const {
    return mKeyScheme.handlesControllerEvent(event);
}

VirtualController* KeyboardRouter::KeyboardControllerFactory::createNewController(
        int deviceId) const {
    VirtualController* controller = new VirtualController(deviceId);
    controller->setKeyScheme(mKeyScheme);
    return controller;
}

// -------------------------------------------------------------------------------------------
// KeyboardRouter implementation
// -------------------------------------------------------------------------------------------

KeyboardRouter* KeyboardRouter::sInstance = nullptr;

KeyboardRouter::KeyboardRouter() : InputRouter() {
}

bool KeyboardRouter::addKeyboardControllerFactory(const KeyboardControllerFactory& factory) {
    // Check for conflicts with other factories
    if (InputRouter::conflictsWithExistingFactories(factory)) {
        return false;
    }
    InputRouter::addControllerFactory(new KeyboardControllerFactory(factory));
    return true;
}

KeyboardRouter* KeyboardRouter::getInstance() {
    if (!sInstance) {
        sInstance = new KeyboardRouter();
    }
    return sInstance;
}
