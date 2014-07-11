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
 * @brief A magnetic sensor actor that awards a point when contacted.
 * @note Once touched, this actor will change to the player's color and float upwards.
 */
Actor {
    id: snowflake

    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body

    ImageRenderer {
        id: image

        source: Util.getPathToImage("middleground_mp/snowflake.png")
    }

    CircleBody {
        id: body

        radius: 0.35 * image.sizeScale
        sensor: true
        magnetic: true
        linearDamping: 4.0
        gravityScale: 0.1
        density: 0.002
        magneticStrength: 0.75
        angularVelocity: 1.0 - 2.0 * Math.random()
        bodyType: Body.DynamicBody
    }

    PropertyAnimation {
        id: fadeAnimation

        target: snowflake
        property: "opacity"
        to: 0.0

        onStopped: {
            snowflake.visible = false
            body.active = false
            // Reset properties that were changed by being picked up.
            pickupLogic.reset()
            body.magnetic = cachedProperties.magnetic
            body.linearDamping = cachedProperties.magnetic
            body.gravityScale = cachedProperties.gravityScale
            opacity = cachedProperties.opacity
            image.source = cachedProperties.source
        }
    }

    PickupLogic {
        id: pickupLogic

        allowNonPlayerPickup: true
        pickupSound: Util.getPathToSound("pickup.wav")

        onCollected: {
            // Cache properties
            cachedProperties.magnetic = body.magnetic
            cachedProperties.linearDampening = body.linearDamping
            cachedProperties.gravityScale = body.gravityScale
            cachedProperties.opacity = snowflake.opacity
            cachedProperties.source = image.source

            // Prevent the magnetic star from being pulled after being contacted.
            body.magnetic = false
            // Reset linear damping to allow it to float up.
            body.linearDamping = 0.0

            var normal = Qt.point(snowflake.x - otherActor.body.position.x,
                    snowflake.y - otherActor.body.position.y)

            var dot = normal.x * otherActor.body.linearVelocity.x
                    + normal.y * otherActor.body.linearVelocity.y

            var velocity = Qt.point(otherActor.body.linearVelocity.x,
                    otherActor.body.linearVelocity.y)
            var speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y) * dot

            // Dampen the velocity.
            speed *= 0.02
            body.applyForceToCenter(Qt.point(normal.x * speed, normal.y * speed))

            // "Release" the snowflake to allow it to float away.
            body.clearAllAttachedJoints()

            if (otherActor.actorType == Actor.PlayerActor) {
                body.gravityScale = -2.0
                fadeAnimation.duration = 1000

                image.source = Util.getPathToImage("middleground_mp/snowflake_"
                        + otherActor.graphics.color + ".png")
            } else {
                body.gravityScale = 1.0
                fadeAnimation.duration = 200
            }

            fadeAnimation.start();
        }
    }

    QtObject {
        id: cachedProperties

        property bool magnetic
        property real linearDampening
        property real gravityScale
        property real opacity
        property string source
    }
}
