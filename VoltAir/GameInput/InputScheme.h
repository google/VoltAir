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

#ifndef INPUTSCHEME_H
#define INPUTSCHEME_H

#include <map>
#include "ControllerEvent.h"

/**
 * @ingroup GameInput
 * @brief Represents a scheme mapping generic input "events" to output "actions".
 */
template <typename Input = int>
class InputScheme {
public:
    /**
     * @brief Output type.
     */
    typedef int Action;

    /**
     * @brief Input "event" to Action output map.
     */
    typedef std::map<Input, Action> Map;

    /**
     * @brief Constructs an empty input scheme.
     */
    InputScheme() {
    }

    /**
     * @brief Constructs an InputScheme from the specified input to action map.
     * @param scheme Map from which to construct the InputScheme
     */
    explicit InputScheme(const Map& scheme)
        : mScheme(scheme) {
    }

    virtual ~InputScheme() { }

    /**
     * @brief Returns whether or not the InputScheme contains any mappings.
     */
    bool empty() const { return mScheme.empty(); }

    /**
     * @brief Returns a const iterator positioned at the beginning of the InputScheme.
     */
    typename Map::const_iterator begin() const {
        return mScheme.cbegin();
    }

    /**
     * @brief Returns a const iterator positioned at the end of the InputScheme.
     */
    typename Map::const_iterator end() const {
        return mScheme.cend();
    }

    /**
     * @brief Returns whether or not this input scheme has an action associated with the specified
     * @p input.
     * @param input Input to check for the existence of the associated action
     */
    bool hasActionFor(const Input& input) const {
        return mScheme.count(input) > 0;
    }

    /**
     * @brief Returns whether or not @p inputScheme intersects with this InputScheme.
     * @param inputScheme InputScheme to check for intersection against
     */
    bool intersects(const InputScheme<Input>& inputScheme) const {
        for (auto& inputActionPair : inputScheme) {
            if (mScheme.count(inputActionPair.first)) {
                return true;
            }
        }
        return false;
    }

    /**
     * @brief Returns whether or not this InputScheme would handle @p event.
     * @param event ControllerEvent to check for information on inputs in this InputScheme
     */
    virtual bool handlesControllerEvent(const ControllerEvent* event) const = 0;

private:
    Map mScheme;
};

#endif // INPUTSCHEME_H
