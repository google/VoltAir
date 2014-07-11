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

#ifndef CONTROLLERFACTORY_H
#define CONTROLLERFACTORY_H

#include <set>
#include "InputScheme.h"
#include "VirtualController.h"

class ControllerEvent;

/**
 * @ingroup GameInput
 * @brief Base interface for constructing virtual controllers from a deviceId.
 *
 * In essence, classes that derive from this interface implicitly define controller types by
 * specifying the particular input schemes supported by that controller type.  Furthermore,
 * factories act as an encapsulation of component input schemes that comprise a controller.
 */
class ControllerFactory {
public:
    virtual ~ControllerFactory() { }

    /**
     * @brief Returns a new VirtualController for the specified @p deviceId.
     * @param deviceId Id to identify the constructed VirtualController
     */
    virtual VirtualController* createNewController(int deviceId) const = 0;

    /**
     * @brief Returns whether or not this ControllerFactory intersects (i.e. overlaps input schemes)
     * with the specified ControllerFactory.
     * @note Two ControllerFactory%s would be intersecting if both would return @c true for
     * handlesControllerEvent() when passed the same event.
     * @param otherFactory ControllerFactory to test for intersection with this
     */
    virtual bool intersects(const ControllerFactory& otherFactory) const = 0;

    /**
     * @brief Returns whether or not this ControllerFactory can process the specified @p event.
     * @param event ControllerEvent to check for affinity with this ControllerFactory
     */
    virtual bool handlesControllerEvent(const ControllerEvent* event) const = 0;

    /**
     * @brief Returns whether or not the given InputScheme is valid (i.e. only contains input
     * mappings which are valid) according to the specified validation set.
     * @param scheme InputScheme to validate
     * @param validInputs Set of inputs to validate all inputs in the InputScheme against
     */
    template <typename Input>
    static bool isValidInputScheme(const InputScheme<Input>& scheme, std::set<Input>& validInputs) {
        for (auto& inputActionPair : scheme) {
            if (!validInputs.count(inputActionPair.first)) {
                return false;
            }
        }
        return true;
    }
};

#endif // CONTROLLERFACTORY_H
