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
 * @brief A sensor region which accelerates any body that comes in contact with it.
 *
 * The contacting body is accelerated in the direction of its current velocity.
 */
Actor {
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body
    /**
     * @brief type:AcceleratorLogic How much the contacting body is accelerated each frame.
     */
    property alias acceleration: logic.acceleration

    PolygonBody {
        id: body
        sensor: true
    }

    AcceleratorLogic {
        id: logic
    }
}
