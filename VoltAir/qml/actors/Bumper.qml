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

import QtQuick 2.0
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief A polygon actor that kicks back any body that comes in contact with it.
 *
 * The contacted body is forced in the direction of the contact normal with uniform kickbackForce.
 */
Actor {
    /**
     * @brief Magnitude of force applied to the contacting body.
     */
    property real kickbackForce: 500.0
    /**
     * @brief How much larger the image becomes after kicking.
     *
     * @c 0.1 equates to 10% larger than the original.
     */
    property real scaleIncrease: 0.1
    /**
     * @brief Amount per frame to shrink the sizeScale when resetting.
     */
    property real resetSpeed: 0.015
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body

    PolygonBody {
        id: body

        onQueuedContactBegun: {
            if (!otherBody.sensor && !resetAnimation.active){
                resetAnimation.active = true
                image.sizeScale = d.kickedScale
                normal.x *= kickbackForce
                normal.y *= kickbackForce
                otherBody.applyForceToCenter(normal)
            }
        }
    }

    JavaScriptLogic {
        id: resetAnimation


        // Gradually returns the image to its cachedScale then disables the resetAnimation.
        function updateFunc() {
            if (Math.abs(image.sizeScale) > Math.abs(d.cachedScale)) {
                image.sizeScale /= (1.0 + resetSpeed)
            } else {
                active = false
            }
        }
    }

    Component.onCompleted: {
        d.cachedScale = image.sizeScale
        d.kickedScale = image.sizeScale * (1.0 + scaleIncrease)
    }

    QtObject {
        id: d

        property real kickedScale
        property real cachedScale
    }
}
