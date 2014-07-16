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

#ifndef INPUTROUTER_H
#define INPUTROUTER_H

#include <map>
#include <memory>
#include <vector>
#include "ControllerEvent.h"
#include "ControllerFactory.h"

/**
 * @ingroup GameInput
 * @brief Routes ControllerEvent%s according to inherent ControllerFactory specifications.
 *
 * InputRouter represents an additional layer of input abstraction on top of ControllerManager to
 * allow events to be routed to different VirtualController instances rather than just according to
 * a 1:1 mapping on @c deviceId. This is accomplished by using an intermediate layer of fake @c
 * deviceId%s. As a result, this allows splitting one device into many based on InputScheme%s that
 * compromise the resident ControllerFactory%s.
 * @note InputRouter implicitly handles both single (e.g. built in keyboard on Mac) and multi (e.g.
 * connected gamepads on Android) instance devices.
 * @note By convention, all implementations of this interface should make the router a singleton
 * by implementing a @c getInstance() method.
 */
class InputRouter {
public:
    virtual ~InputRouter() { }

    /**
     * @brief Notifies the ControllerManager of device disconnections for all VirtualController%s
     * associated with the specified @p deviceId.
     * @param deviceId Id of the device that disconnected. If the deviceId is negative, the device
     * is assumed to be a singleton.
     */
    void onControllerDisconnect(int deviceId);
    /**
     * @brief Routes the given ControllerEvent.
     * @returns @c true if the @p event was both routed properly and handled.
     * @note Events without a deviceId are considered to be from singleton devices (i.e. devices
     * for which there exists only a single global instance). Events with a deviceId are considered
     * to be a possible multi-instance device.
     * @note ControllerEvent%s are currently manipulated which may affect subsequent routing.
     */
    virtual bool routeControllerEvent(ControllerEvent* event);

protected:
    /**
     * @brief Constructs an empty InputRouter.
     */
    InputRouter();

    /**
     * @brief Returns whether or not @p factory conficts (i.e. intersects) with ControllerFactory%s
     * previously added to this router.
     * @param factory ControllerFactory to check for conflict
     */
    bool conflictsWithExistingFactories(const ControllerFactory& factory) const;
    /**
     * @brief Returns whether or not this InputRouter contains any ControllerFactory%s to route by.
     */
    bool hasFactoryRoutes() const { return !mControllerFactories.empty(); }
    /**
     * @brief Adds a ControllerFactory to route by.
     * @note This method transfers ownership of the factory memory to this InputRouter.
     * @param factory ControllerFactory to add to the InputRouter
     */
    void addControllerFactory(ControllerFactory* factory);
    /**
     * @brief Clears all ControllerFactory%s used for routing by this InputRouter.
     */
    void clearFactories();

private:
    /**
     * Generates a random deviceId.
     * NOTE: This deviceId is not guaranteed to be unique at the time of creation, nor remain
     * unique as controllers connect and disconnect -- however, with high probability, it is
     * unlikely we get a deviceId collision.
     */
    int getNextFakeDeviceId();

    // Maps a scheme to a fake deviceId for single-instance devices
    std::map<ControllerFactory*, int> mFakeSingletonDeviceIds;
    // Maps real deviceId to a map of scheme to fake deviceId
    // E.g. each connected gamepad would be split according to the different schemes, generating
    // # gamepads * # schemes different fake deviceIds
    std::map<int, std::map<ControllerFactory*, int>> mFakeMultiDeviceIds;
    // Factories by which to route
    std::vector<std::unique_ptr<ControllerFactory>> mControllerFactories;

    // The next available fake device id to be assigned
    static int sNextFakeDeviceId;
};

#endif // INPUTROUTER_H
