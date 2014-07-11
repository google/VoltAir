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
#include "InputRouter.h"
#include "VirtualController.h"

// Starting with a high, arbitrary deviceId to avoid collisions with existing deviceIds.
int InputRouter::sNextFakeDeviceId = 0x0100000;

InputRouter::InputRouter() {
}

void InputRouter::onControllerDisconnect(int deviceId) {
    ControllerManager* manager = ControllerManager::getInstance();
    if (mFakeMultiDeviceIds.count(deviceId)) {
        for (auto it : mFakeMultiDeviceIds[deviceId]) {
            manager->onControllerDisconnect(it.second);
        }
        mFakeMultiDeviceIds.erase(deviceId);
    } else if (deviceId < 0) {
        for (auto it : mFakeSingletonDeviceIds) {
            manager->onControllerDisconnect(it.second);
        }
        mFakeSingletonDeviceIds.clear();
    }
}

// TODO: Should we write this method to restore the original deviceId?
bool InputRouter::routeControllerEvent(ControllerEvent* event) {
    for (const std::unique_ptr<ControllerFactory>& factory : mControllerFactories) {
        if (factory->handlesControllerEvent(event)) {
            if (event->hasDeviceId()) { // Multi device
                std::map<ControllerFactory*, int>& fakeDeviceIdsForDevice =
                        mFakeMultiDeviceIds[event->getDeviceId()];
                // Check if this is first time we have seen this multi device match this factory
                if (!fakeDeviceIdsForDevice.count(factory.get())) {
                    fakeDeviceIdsForDevice[factory.get()] = getNextFakeDeviceId();
                }
                event->setDeviceId(fakeDeviceIdsForDevice[factory.get()]);
            } else { // Singleton device
                // Check if this is first time we have seen this singleton device match this factory
                if (!mFakeSingletonDeviceIds.count(factory.get())) {
                    mFakeSingletonDeviceIds[factory.get()] = getNextFakeDeviceId();
                }
                event->setDeviceId(mFakeSingletonDeviceIds[factory.get()]);
            }

            // Route event to the controller associated with the chosen fake deviceId using the
            // matching scheme
            VirtualController* controller = ControllerManager::getInstance()->getController(
                        event->getDeviceId(),
                        factory.get());
            return controller->onControllerEvent(event);
        }
    }
    return false;
}

bool InputRouter::conflictsWithExistingFactories(const ControllerFactory& factory) const {
    for (const std::unique_ptr<ControllerFactory>& existingFactory : mControllerFactories) {
        if(factory.intersects(*existingFactory)) {
            return true;
        }
    }
    return false;
}

void InputRouter::addControllerFactory(ControllerFactory* factory) {
    mControllerFactories.push_back(std::unique_ptr<ControllerFactory>(factory));
}

void InputRouter::clearFactories() {
    mControllerFactories.clear();
}

int InputRouter::getNextFakeDeviceId() {
  return sNextFakeDeviceId++;
}
