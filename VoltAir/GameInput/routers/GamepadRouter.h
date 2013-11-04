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

#ifndef GAMEPADROUTER_H
#define GAMEPADROUTER_H

#include <set>
#include <vector>
#include "ControllerEvent.h"
#include "ControllerFactory.h"
#include "InputRouter.h"
#include "JoystickAxisScheme.h"
#include "KeyScheme.h"
#include "TriggerAxisScheme.h"

/**
 * @ingroup GameInput
 * @brief Routes gamepad-related ControllerEvent%s according to inherent GamepadControllerFactory
 * specifications.
 */
class GamepadRouter : public InputRouter {
public:
    /**
     * @ingroup GameInput
     * @brief Factory for constructing VirtualController%s to represent gamepad devices as
     * controllers.
     */
    class GamepadControllerFactory : public ControllerFactory {
    public:
        /**
         * @brief Constructs a GamepadControllerFactory from input schemes.
         * @param keyScheme KeyScheme for constructed VirtualController%s
         * @param joystickAxisScheme JoystickAxisScheme for constructed VirtualController%s
         * @param triggerAxisScheme TriggerAxisScheme for constructed VirtualController%s
         */
        explicit GamepadControllerFactory(
                const KeyScheme& keyScheme,
                const JoystickAxisScheme& joystickAxisScheme,
                const TriggerAxisScheme& triggerAxisScheme
                );

        virtual VirtualController* createNewController(int deviceId) const override;

        virtual bool intersects(const ControllerFactory& otherFactory) const override;
        /**
         * @brief Returns whether or not this GamepadControllerFactory intersects (i.e. overlaps
         * input schemes) with the specified GamepadControllerFactory.
         * @note Two GamepadControllerFactory%s would be intersecting if both would return @c true
         * for handlesControllerEvent() when passed the same event.
         * @param otherFactory GamepadControllerFactory to test for intersection with this
         */
        bool intersects(const GamepadControllerFactory& otherFactory) const;

        virtual bool handlesControllerEvent(const ControllerEvent* event) const override;

        /**
         * @brief Set of KeyCode%s valid as input on a gamepad.
         */
        static std::set<KeyCode> sValidKeyCodes;
        /**
         * @brief Set of JoystickAxisCode%s valid as input on a gamepad.
         */
        static std::set<JoystickAxisCode> sValidJoystickAxisCodes;
        /**
         * @brief Set of TriggerAxisCode%s valid as input on a gamepad.
         */
        static std::set<TriggerAxisCode> sValidTriggerAxisCodes;

    private:
        KeyScheme mKeyScheme;
        JoystickAxisScheme mJoystickAxisScheme;
        TriggerAxisScheme mTriggerAxisScheme;
    };

    /**
     * @brief Adds the specified GamepadControllerFactory to the list of factories to route by.
     * @returns @c false if @p factory intersects with existing factories and cannot be added.
     */
    bool addGamepadControllerFactory(const GamepadControllerFactory& factory);

    /**
     * @brief Returns the singleton instance of GamepadRouter.
     */
    static GamepadRouter* getInstance();

private:
    /**
     * Private constructor for singleton class.
     */
    GamepadRouter();

    // List of GamepadControllerFactories to route by.
    std::vector<GamepadControllerFactory> mGamepadControllerFactories;

    // Singleton instance of the GamepadRouter.
    static GamepadRouter* sInstance;
};

#endif // GAMEPADROUTER_H
