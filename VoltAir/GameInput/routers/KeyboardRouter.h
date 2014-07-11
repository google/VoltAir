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

#ifndef KEYBOARDROUTER_H
#define KEYBOARDROUTER_H

#include <vector>
#include "ControllerEvent.h"
#include "ControllerFactory.h"
#include "InputRouter.h"
#include "KeyScheme.h"

/**
 * @ingroup GameInput
 * @brief Routes Keyboard-related ControllerEvent%s according to inherent KeyboardControllerFactory
 * specifications.
 */
class KeyboardRouter : public InputRouter {
public:
    /**
     * @ingroup GameInput
     * @brief Factory for constructing VirtualController%s to represent keyboard devices as
     * controllers.
     */
    class KeyboardControllerFactory : public ControllerFactory {
    public:
        /**
         * @brief Constructs a KeyboardControllerFactory from input schemes.
         * @param keyScheme KeyScheme for constructed VirtualController%s
         */
        explicit KeyboardControllerFactory(
                const KeyScheme& keyScheme
                );

        virtual bool intersects(const ControllerFactory& otherFactory) const override;
        /**
         * @brief Returns whether or not this KeyboardControllerFactory intersects (i.e. overlaps
         * input schemes) with the specified KeyboardControllerFactory.
         * @note Two KeyboardControllerFactory%s would be intersecting if both would return @c true
         * for handlesControllerEvent() when passed the same event.
         * @param otherFactory KeyboardControllerFactory to test for intersection with this
         */
        bool intersects(const KeyboardControllerFactory& otherFactory) const;

        virtual bool handlesControllerEvent(const ControllerEvent* event) const override;

        virtual VirtualController* createNewController(int deviceId) const override;

    private:
        KeyScheme mKeyScheme;
    };

    /**
     * @brief Adds the specified KeyboardControllerFactory to the list of factories to route by.
     * @returns @c false if @p factory intersects with existing factories and cannot be added.
     */
    bool addKeyboardControllerFactory(const KeyboardControllerFactory& factory);

    /**
     * @brief Returns the singleton instance of the KeyboardRouter.
     */
    static KeyboardRouter* getInstance();

private:
    /**
     * Private constructor for singleton class.
     */
    KeyboardRouter();

    // Singleton instance of the KeyboardRouter
    static KeyboardRouter* sInstance;
};

#endif // KEYBOARDROUTER_H
