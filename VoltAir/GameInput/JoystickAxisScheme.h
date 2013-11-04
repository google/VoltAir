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

#ifndef JOYSTICKAXISSCHEME_H
#define JOYSTICKAXISSCHEME_H

#include "ControllerEvent.h"
#include "InputScheme.h"
#include "JoystickAxisCodes.h"

/**
 * @ingroup GameInput
 * @brief Represents a scheme mapping input joystick axes to output actions.
 */
class JoystickAxisScheme : public InputScheme<JoystickAxisCode> {
public:
    /**
     * @brief Constructs an empty JoystickAxisScheme.
     */
    JoystickAxisScheme() : InputScheme<JoystickAxisCode>() { }

    /**
     * @brief Constructs a JoystickAxisScheme from the specified @p scheme.
     * @param scheme InputScheme mapping JoystickAxisCode%s to actions
     */
    JoystickAxisScheme(const typename InputScheme<JoystickAxisCode>::Map& scheme)
        : InputScheme<JoystickAxisCode>(scheme) { }

    /**
     * @brief Returns whether or not this JoystickAxisScheme would handle @p event.
     * @param event ControllerEvent to check against the JoystickAxisScheme inputs
     */
    virtual bool handlesControllerEvent(const ControllerEvent* event) const override {
        if (event->hasJoystickAxisInfo() && !InputScheme<JoystickAxisCode>::empty()) {
            for (const auto& joystickStatePair : event->getJoystickAxisStates()) {
                // Will handle if the event has joystick data for a mapped joystick axis
                if (InputScheme<JoystickAxisCode>::hasActionFor(joystickStatePair.first)) {
                    return true;
                }
            }
        }
        return false;
    }
};

#endif // JOYSTICKAXISSCHEME_H
