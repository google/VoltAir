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

ControllerManager* ControllerManager::sInstance = nullptr;

ControllerManager::StaticDeviceConnectionListener::StaticDeviceConnectionListener(
        const DeviceConnectionCallback& callback) : mDeviceConnectionCallback(callback) {
}

void ControllerManager::StaticDeviceConnectionListener::onDeviceConnectionChanged(int deviceId,
        bool isConnected) {
    mDeviceConnectionCallback(deviceId, isConnected);
}

void ControllerManager::reset() {
    for (int deviceId : mControllerIds) {
        notifyDeviceConnectionChanged(deviceId, false);
    }
    mControllers.clear();
    mControllerIds.clear();
}

void ControllerManager::onControllerDisconnect(int deviceId) {
    mControllers.erase(deviceId);
    mControllerIds.erase(deviceId);
    notifyDeviceConnectionChanged(deviceId, false);
}

void ControllerManager::registerDeviceConnectionListener(DeviceConnectionListener* listener) {
    mDeviceConnectionListeners.insert(listener);
}

void ControllerManager::unregisterDeviceConnectionListener(DeviceConnectionListener* listener) {
    mDeviceConnectionListeners.erase(listener);
}

ControllerManager* ControllerManager::getInstance() {
    if (!sInstance) {
        sInstance = new ControllerManager;
    }
    return sInstance;
}

void ControllerManager::notifyDeviceConnectionChanged(int deviceId, bool isConnected) const {
    for (DeviceConnectionListener* listener : mDeviceConnectionListeners) {
        listener->onDeviceConnectionChanged(deviceId, isConnected);
    }
}

void ControllerManager::initControllerIfNeeded(int deviceId,
        std::unique_ptr<VirtualController> &controller, const ControllerFactory *factory) const {
    if (!controller.get() && factory) {
        controller.reset(factory->createNewController(deviceId));
        mControllerIds.insert(deviceId);
        notifyDeviceConnectionChanged(deviceId, true);
    }
}
