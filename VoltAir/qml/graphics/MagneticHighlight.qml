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

import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief A Graphic based on ImageRenderer that gradually becomes visible if something magnetic is
 * nearby.
 */
ImageRenderer {
    /**
     * @brief Time to fade, in milliseconds.
     */
    property real fadeDuration: 500.0

    id: image
    state: "OFF"
    opacity: 0.275

    transitions: [
        Transition {
            from: "OFF"
            to: "ON"
            PropertyAnimation {
                target: image
                property: "opacity"
                to: 1.0
                duration: fadeDuration
            }
        },
        Transition {
            from: "ON"
            to: "OFF"
            PropertyAnimation {
                target: image
                property: "opacity"
                to: 0.275
                duration: fadeDuration
            }
        }
    ]
}
