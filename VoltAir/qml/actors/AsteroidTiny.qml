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
import "../graphics"

/**
 * @ingroup QQuickItem
 * @brief A tiny kinematic actor that rotates and is magnetic.
 */
Actor {
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body

    PolygonBody {
        id: body
    }

    MagneticHighlightLogic {
        id: magneticHighlightLogic
    }

    MagneticHighlight {
        source: Util.getPathToImage("middleground_e2/deco_e2_boulder01_on.png")
        sizeScale: image.sizeScale
        z: 1
        state: magneticHighlightLogic.inAttractorRange ? "ON" : "OFF"
    }
}
