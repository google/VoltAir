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
 * @brief A sensor actor that awards a point when contacted.
 * @note This actor will shrink, fade out, and move toward the fillbar once touched.
 */
Actor {
    id: orb

    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body

    z: 4

    AnimatedImageRenderer {
        id: graphic

        sizeScale: 1.25
        rotation: Math.random() * 360.0
        useGameTime: false
        cacheRenderParams: true
        cullingControlsBodyActive: true
        pauseWhenHidden: true
        frameCount: 11
        frameDelay: 0.05
        currentPosition: Math.random()
        source: Util.getPathToImage("zap/zap.png")
    }

    CircleBody {
        id: body

        radius: 0.3 * graphic.sizeScale
        sensor: true
        gravityScale: 0.0
    }

    JavaScriptLogic {
        id: movementLogic

        property real epsilon: 1.0e-8
        // Decaying lifetime of the orb once it is contacted.
        property real lifeTime: 1.0
        // Velocity of the orb when it is contacted.
        property point initialVelocity
        // Offset from the move destination when the orb is contacted.
        property point initialOffset

        active: false

        function updateFunc() {
            if (body.bodyType == Body.DynamicBody && lifeTime > 0.0) {
                // TODO: Pass fillBar.fillPoint through controller so that we aren't breaking MVP.
                var fillBar = Game.getUi().singlePlayerHud.fillBar
                var position = mapFromItem(fillBar, fillBar.fillPoint.x, fillBar.fillPoint.y)
                var fillPosition = Qt.point(position.x, position.y)

                // Move the orb upwards, to the right, and then upwards.
                x += fillPosition.x * (1.0 - lifeTime * lifeTime)
                y += fillPosition.y * (0.015 * lifeTime + (1.0 - lifeTime))

                // Decay the initial velocity kick if it is in the direction of the fillBar.
                if (Math.abs(initialOffset.x) > epsilon
                        && initialVelocity.x / initialOffset.x > 0.0) {
                    initialVelocity.x *= 0.9
                }
                if (Math.abs(initialOffset.y) > epsilon
                        && initialVelocity.y / initialOffset.y > 0.0) {
                    initialVelocity.y *= 0.9
                }

                var lifeTimeSquared = lifeTime * lifeTime

                // Push the orb to fake a knock back force.
                x += initialVelocity.x * lifeTimeSquared / 40.0
                y += initialVelocity.y * lifeTimeSquared / 40.0

                // Slowly increase the decay amount in lifeTime.
                lifeTime -= (1.1 - lifeTime) * (1.1 - lifeTime) / 10.0
                lifeTime = Math.max(0.0, lifeTime)

                // Fade out opacity.
                graphic.opacity = lifeTimeSquared * lifeTimeSquared

                // Scale from 100% to 20%.
                graphic.sizeScale = 1.25 - (1.0 - lifeTimeSquared)
            } else if (lifeTime <= 0.0) {
                // Hide and remove from simulation.
                visible = false
                body.active = false

                // Reset properties that were changed by being picked up.
                lifeTime = 1.0
                body.gravityScale = cachedProperties.gravityScale
                opacity = cachedProperties.opacity
                active = false
                body.bodyType = Body.StaticBody
            }
        }
    }

    PickupLogic {
        id: pickupLogic
        pickupSound: Util.getPathToSound("pickup.wav")
        active: false

        onCollected: {
            graphic.cacheRenderParams = false
            body.bodyType = Body.DynamicBody

            // Cache properties.
            cachedProperties.gravityScale = body.gravityScale
            cachedProperties.opacity = orb.opacity

            var normal = Qt.point(orb.x - otherActor.body.position.x, orb.y
                    - otherActor.body.position.y)

            var dot = normal.x * otherActor.body.linearVelocity.x
                    + normal.y * otherActor.body.linearVelocity.y

            var velocity = Qt.point(otherActor.body.linearVelocity.x,
                    otherActor.body.linearVelocity.y)
            var speed = Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y) * dot
            speed *= 0.65
            movementLogic.initialVelocity = Qt.point(normal.x * speed, normal.y * speed)

            var fillBar = Game.getUi().singlePlayerHud.fillBar
            var position = mapFromItem(fillBar, fillBar.fillPoint.x, fillBar.fillPoint.y)
            movementLogic.initialOffset = Qt.point(body.position.x, body.position.y)
            // "Release" the orb to allow it to float away.
            body.clearAllAttachedJoints()
            body.gravityScale = 0.0
            movementLogic.active = true
        }
    }

    QtObject {
        id: cachedProperties

        property real gravityScale
        property real opacity
    }
}
