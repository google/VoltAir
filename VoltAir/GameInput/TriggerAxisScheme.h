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

#ifndef TRIGGERAXISSCHEME_H
#define TRIGGERAXISSCHEME_H

#include "ControllerEvent.h"
#include "InputScheme.h"
#include "TriggerAxisCodes.h"

/**
 * @ingroup GameInput
 * @brief Represents a scheme mapping input trigger axes to output actions.
 */
class TriggerAxisScheme : public InputScheme<TriggerAxisCode> {
public:
    /**
     * @brief Constructs an empty TriggerAxisScheme.
     */
    TriggerAxisScheme() : InputScheme<TriggerAxisCode>() { }

    /**
     * @brief Constructs a TriggerAxisScheme from the specified @p scheme.
     * @param scheme InputScheme mapping TriggerAxisCode%s to actions
     */
    TriggerAxisScheme(const typename InputScheme<TriggerAxisCode>::Map& scheme)
        : InputScheme<TriggerAxisCode>(scheme) { }

    /**
     * @brief Returns whether or not this TriggerAxisScheme would handle @p event.
     * @param event ControllerEvent to check against the TriggerAxisScheme inputs
     */
    virtual bool handlesControllerEvent(const ControllerEvent* event) const override {
        if (event->hasTriggerAxisInfo() && !InputScheme<TriggerAxisCode>::empty()) {
            for (const auto& triggerStatePair : event->getTriggerAxisStates()) {
                // Will handle if the event has data for a mapped trigger axis
                if (InputScheme<TriggerAxisCode>::hasActionFor(triggerStatePair.first)) {
                    return true;
                }
            }
        }
        return false;
    }
};

#endif // TRIGGERAXISSCHEME_H
