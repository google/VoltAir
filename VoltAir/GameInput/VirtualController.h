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

#ifndef VIRTUALCONTROLLER_H
#define VIRTUALCONTROLLER_H

#include <map>
#include <vector>
#include "ControllerEvent.h"
#include "InputScheme.h"
#include "JoystickAxisScheme.h"
#include "KeyScheme.h"
#include "TriggerAxisScheme.h"

/**
 * @ingroup GameInput
 * @brief Software represention and state capable of describing almost all physical controllers.
 *
 * Specifically, a VirtualController represents the state of any controller whose input capabilities
 * can be specified in a ControllerEvent. Furthermore, this abstraction stores the state of
 * higher-level, pre-specified actions as opposed to lower level event data.
 */
class VirtualController {
public:
    /**
     * @brief Flags to specify how an action is supported (i.e. what data can be retrieved for it).
     */
    enum SupportedAsFlag {
        /**
         * @brief Action is unsupported.
         */
        NO_SUPPORT = 0x00,

        /**
         * @brief Action is binary (i.e. can be "on/off").
         */
        BINARY_ACTION = 0x01,

        /**
         * @brief Action has a normalized <tt>[0.0f, 1.0f]</tt> real value.
         */
        UNIT_INTERVAL_ACTION = 0x02,

        /**
         * @brief Action has a bipolar <tt>[-1.0f, 1.0f]</tt> real value.
         */
        SYMMETRIC_UNIT_INTERVAL_ACTION = 0x04,
    };

    /**
     * @brief Constructs a VirtualController with the specified @p deviceId.
     * @param deviceId Id to identify the VirtualController
     */
    VirtualController(int deviceId);

    virtual ~VirtualController();

    /**
     * @brief Sets the VirtualController's JoystickAxisScheme.
     * @param joystickAxisScheme JoystickAxisScheme to use
     */
    void setJoystickAxisScheme(const JoystickAxisScheme& joystickAxisScheme);
    /**
     * @brief Sets the VirtualController's KeyScheme.
     * @param keyScheme KeyScheme to use
     */
    void setKeyScheme(const KeyScheme& keyScheme);
    /**
     * @brief Sets the VirtualController's TriggerAxisScheme.
     * @param triggerAxisScheme TriggerAxisScheme to use
     */
    void setTriggerAxisScheme(const TriggerAxisScheme& triggerAxisScheme);

    /**
     * @brief Returns the VirtualController's device identifier.
     */
    int getDeviceId() const { return mDeviceId; }
    /**
     * @brief Returns whether or not this VirtualController, and the device it abstracts, is the
     * source of @p event.
     * @param event ControllerEvent to check source of
     */
    bool isSourceOfEvent(ControllerEvent* event) const;

    /**
     * @brief Notifies the VirtualController of the @p event.
     * @returns @c true if @p event was handled by this VirtualController.
     * @param event ControllerEvent to process
     */
    virtual bool onControllerEvent(ControllerEvent* event);

    /**
     * @brief Returns the VirtualController's type of support for @p action (as a set of flags).
     * @param action Action to query the VirtualController's type of support for
     */
    virtual int getActionSupport(const InputScheme<>::Action& action) const;

    /**
     * @brief Returns whether or not @p action is "activated" (i.e. the binary value of the action).
     * @param action Action to query for binary value
     */
    virtual bool isActionActivated(const InputScheme<>::Action& action) const;
    /**
     * @brief Returns the <tt>[0.0f, 1.0f]</tt> unit interval value for @p action.
     * @param action Action to query for unit interval value
     */
    virtual float getActionUnitIntervalValue(const InputScheme<>::Action& action) const;
    /**
     * @brief Returns the <tt>[-1.0f, 1.0f]</tt> symmetric unit interval value for @p action.
     * @param action Action to query for symmetric unit interval value
     */
    virtual float getActionSymmetricUnitIntervalValue(const InputScheme<>::Action& action) const;

private:
    int mDeviceId = -1;

    JoystickAxisScheme mJoystickAxisScheme;
    // Reverse maps Actions to joystick axes that trigger that action
    std::map<InputScheme<>::Action, std::vector<JoystickAxisCode> > mActionJoystickAxes;

    KeyScheme mKeyScheme;
    // Reverse maps Actions to keys that trigger that action
    std::map<InputScheme<>::Action, std::vector<KeyCode> > mActionKeys;

    TriggerAxisScheme mTriggerAxisScheme;
    // Reverse maps Actions to trigger axes that trigger that action
    std::map<InputScheme<>::Action, std::vector<TriggerAxisCode> > mActionTriggerAxes;

    // Since VirtualController can represent the state of a any controller whose input capabilities
    // can be specified in a ControllerEvent, it makes most sense to store state as a
    // ControllerEvent
    ControllerEvent mState;
};

#endif // VIRTUALCONTROLLER_H
