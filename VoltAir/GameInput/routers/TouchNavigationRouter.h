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

#ifndef TOUCHNAVIGATIONROUTER_H
#define TOUCHNAVIGATIONROUTER_H

#include <vector>
#include "ControllerEvent.h"
#include "ControllerFactory.h"
#include "InputRouter.h"
#include "JoystickAxisScheme.h"
#include "KeyScheme.h"

/**
 * @ingroup GameInput
 * @brief Routes gamepad-related ControllerEvent%s according to inherent
 * TouchNativationControllerFactory specifications.
 */
class TouchNavigationRouter : public InputRouter {
public:
    /**
     * @ingroup GameInput
     * @brief Factory for constructing VirtualController%s to represent touch navigation devices as
     * controllers.
     */
    class TouchNavigationControllerFactory : public ControllerFactory {
    public:
        /**
         * @brief Constructs a TouchNavigationControllerFactory from input schemes.
         * @param keyScheme KeyScheme for constructed VirtualController%s
         * @param joystickAxisScheme JoystickAxisScheme for constructed VirtualController%s
         */
        explicit TouchNavigationControllerFactory(
                const KeyScheme& keyScheme,
                const JoystickAxisScheme& joystickAxisScheme
                );

        virtual VirtualController* createNewController(int deviceId) const override;

        virtual bool intersects(const ControllerFactory& otherFactory) const override;
        /**
         * @brief Returns whether or not this TouchNavigationControllerFactory intersects (i.e.
         * overlaps input schemes) with the specified TouchNavigationControllerFactory.
         * @note Two TouchNavigationControllerFactory%s would be intersecting if both would return
         * @c true for handlesControllerEvent() when passed the same event.
         * @param otherFactory TouchNavigationControllerFactory to test for intersection with this
         */
        bool intersects(const TouchNavigationControllerFactory& otherFactory) const;

        virtual bool handlesControllerEvent(const ControllerEvent* event) const override;

        /**
         * @brief Set of KeyCode%s valid as input on a touch navigation device.
         */
        static std::set<KeyCode> sValidKeyCodes;
        /**
         * @brief Set of JoystickAxisCode%s valid as input on a touch navigation device.
         */
        static std::set<JoystickAxisCode> sValidJoystickAxisCodes;

    private:
        KeyScheme mKeyScheme;
        JoystickAxisScheme mJoystickAxisScheme;
    };

    /**
     * @brief Adds the specified TouchNavigationControllerFactory to the list of factories to
     * route by.
     * @returns @c false if @p factory intersects with existing factories and cannot be added.
     */
    bool addTouchNavigationControllerFactory(const TouchNavigationControllerFactory& factory);

    /**
     * @brief Returns singleton instance of TouchNavigationRouter.
     */
    static TouchNavigationRouter* getInstance();

private:
    /**
     * Private constructor for singleton class.
     */
    TouchNavigationRouter();

    // Singleton instance of the TouchNavigationRouter
    static TouchNavigationRouter* sInstance;
};

#endif // TOUCHNAVIGATIONROUTER_H
