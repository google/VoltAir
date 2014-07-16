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

#ifndef CONTROLLERMANAGER_H
#define CONTROLLERMANAGER_H

#include <functional>
#include <map>
#include <memory>
#include <set>
#include "ControllerFactory.h"
#include "VirtualController.h"

/**
 * @ingroup GameInput
 * @brief Maintains global list of connected controllers and notifies registered listeners of
 * changes in these statuses.
 */
class ControllerManager {
public:
    /**
     * @ingroup GameInput
     * @brief Interface for listening to changes in device connection statuses.
     */
    class DeviceConnectionListener {
    public:
        virtual ~DeviceConnectionListener() { }
        /**
         * @brief Callback function invoked when the device identified by @p deviceId has connected
         * or disconnected.
         */
        virtual void onDeviceConnectionChanged(int deviceId, bool isConnected) = 0;
    };

    /**
     * @brief Callback indicating whether the device identified by @p deviceId has either connected
     * or disconnected.
     */
    typedef std::function<void(int, bool)> DeviceConnectionCallback;

    /**
     * @ingroup GameInput
     * @brief Helper factory class to generate a new DeviceConnectionListerer instance for a static
     * callback function.
     */
    class StaticDeviceConnectionListener : public DeviceConnectionListener {
    public:
        virtual void onDeviceConnectionChanged(int deviceId, bool isConnected) override;

        /**
         * @brief Returns a new DeviceConnectionListener which will forward device connection status
         * changes from onDeviceConnectionChanged() to the specified DeviceConnectionCallback.
         * @param callback Function to invoke onDeviceConnectionChanged()
         */
        static StaticDeviceConnectionListener* get(const DeviceConnectionCallback& callback) {
            return new StaticDeviceConnectionListener(callback);
        }
    private:
        StaticDeviceConnectionListener(const DeviceConnectionCallback& callback);

        DeviceConnectionCallback mDeviceConnectionCallback;
    };

    /**
     * @brief Returns the VirtualController corresponding to the specified @p deviceId.
     *
     * This method will construct the VirtualController if it does not exist and a
     * ControllerFactory is provided (i.e. lazily initialize connection status).
     * @param deviceId Id of the device to retrieve a VirtualController for
     * @param factory ControllerFactory to construct a non-existent VirtualController from
     */
    template <class T = VirtualController>
    T* getController(int deviceId, const ControllerFactory* factory = nullptr) const {
        std::unique_ptr<VirtualController>& controller = mControllers[deviceId];
        initControllerIfNeeded(deviceId, controller, factory);
        return dynamic_cast<T*>(controller.get());
    }

    /**
     * @brief Returns whether or not the specified VirtualController is of the template type.
     * @param controller VirtualController whose type to check
     */
    template <class T>
    bool isControllerOfType(VirtualController* controller) const {
        return dynamic_cast<T*>(controller) != nullptr;
    }

    /**
     * @brief Returns whether or not the VirtualController specified by @p deviceId is of the
     * template type.
     * @param deviceId Id of the VirtualController whose type to check
     */
    template <class T>
    bool isControllerOfType(int deviceId) const {
        return isControllerOfType<T>(mControllers[deviceId].get());
    }

    /**
     * @brief Resets the state (i.e. disconnects) of all connected controllers.
     */
    void reset();

    /**
     * @brief Registers a new listener to be notified of device connection change events.
     * @param listener Listener to be notified of all changes in device connection status
     */
    void registerDeviceConnectionListener(DeviceConnectionListener* listener);
    /**
     * @brief Unregisters a listener to no longer be notified of device connection change events.
     * @param listener Listener to no longer be notified of changes in device connection status
     */
    void unregisterDeviceConnectionListener(DeviceConnectionListener* listener);

    /**
     * @brief Returns whether or not the VirtualController specified by @p deviceId is currently
     * known to be connected.
     * @note This does not directly correspond to the physical connection of the device.
     * @param deviceId Id of the VirtualController to check for connection
     */
    bool isControllerConnected(int deviceId) const {
        return mControllerIds.find(deviceId) != mControllerIds.end();
    }

    /**
     * @brief Returns the list of all VirtualController deviceIds that are currently connected.
     */
    const std::set<int>& getConnectedControllers() const {
        return mControllerIds;
    }

    /**
     * @brief Notifies the ControllerManager that the VirtualController specified by @p deviceId
     * has disconnected.
     * @note There is no analagous @c onControllerConnect(int) method since ControllerManager does
     * lazy initialization of device connection status.
     * @param deviceId Id of VirtualController which has become disconnected
     */
    void onControllerDisconnect(int deviceId);

    /**
     * @brief Returns the global singleton instance of the ControllerManager.
     */
    static ControllerManager* getInstance();

private:
    mutable std::map<int, std::unique_ptr<VirtualController>> mControllers;
    mutable std::set<int> mControllerIds;
    std::set<DeviceConnectionListener*> mDeviceConnectionListeners;

    void notifyDeviceConnectionChanged(int deviceId, bool isConnected) const;
    void initControllerIfNeeded(int deviceId, std::unique_ptr<VirtualController>& controller,
            const ControllerFactory* factory) const;

    static ControllerManager* sInstance;
};

#endif // CONTROLLERMANAGER_H
