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

#ifndef KEYSCHEME_H
#define KEYSCHEME_H

#include "ControllerEvent.h"
#include "InputScheme.h"
#include "KeyCodes.h"

/**
 * @ingroup GameInput
 * @brief Represents a scheme mapping keyboard input to output actions.
 */
class KeyScheme : public InputScheme<KeyCode> {
public:
    /**
     * @brief Constructs an empty KeyScheme.
     */
    KeyScheme() : InputScheme<KeyCode>() { }

    /**
     * @brief Constructs a KeyScheme from the specified @p scheme.
     * @param scheme InputScheme mapping KeyCode%s to actions
     */
    explicit KeyScheme(const typename InputScheme<KeyCode>::Map& scheme)
        : InputScheme<KeyCode>(scheme) { }

    /**
     * @brief Returns whether or not this KeyScheme would handle @p event.
     * @param event ControllerEvent to check against the KeyScheme inputs
     */
    virtual bool handlesControllerEvent(const ControllerEvent* event) const override {
        if (event->hasKeyInfo() && !InputScheme<KeyCode>::empty()) {
            for (const auto& keyStatePair : event->getKeyStates()) {
                // Will handle if the event has data for a mapped key
                if (InputScheme<KeyCode>::hasActionFor(keyStatePair.first)) {
                    return true;
                }
            }
        }
        return false;
    }
};

#endif // KEYSCHEME_H
