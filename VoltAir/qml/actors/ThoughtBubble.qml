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
 * @brief A thought bubble that follows the actor around and displays hints to the player.
 */
Actor {
    id: bubble

    /**
    * @brief Value <tt>[0.0, 1.0]</tt> which determines how the difference between the bubble and the actor
    * position parameters decay.
    * @note @c 0.0 is no attenuation. @c 1.0 is instant complete decay.
    */
    property real movementSpeed: 0.75
    /**
    * @brief Attenuation for the change in x position.
    */
    property real deltaXAttenuation: 0.9
    /**
    * @brief Increase in opacity per frame when fading in.
    */
    property real fadeInSpeed: 0.02
    /**
    * @brief Decrease in opacity per frame when fading out.
    */
    property real fadeOutSpeed: 0.03
    /**
    * @brief How close the bubble should be to the portal for it to show.
    */
    property real portalDist: 6.0
    /**
    * @brief How many total frames magnetism must be enabled before we consider magnetism taught.
    */
    property int minFramesMagnetized: 20
    /**
    * @brief How many seconds to delay before fading in magnetism bubble.
    */
    property real fadeInDelayTime: 3.0
    /**
    * @brief Which level magnetism bubble will automatically reveal itself.
    */
    property string tutorialLevel: "E1S0"
    /**
    * @brief Followed player actor.
    */
    property Robot playerActor
    /**
    * @brief Portal in the level.
    */
    property Portal portal

    visible: d.sharedOpacity > 0.0

    state: "PORTAL"

    states: [
        State { name: "PORTAL" },
        State { name: "MAGNETISM" }
    ]

    transitions: [
        Transition {
            to: "MAGNETISM"
            PropertyAction { target: thoughtBubble; property: "source";
                    value: Util.getPathToImage("PressA.png") }
            PropertyAction { target: fadeInDelay; property: "active"; value: true }
        },
        Transition {
            to: "PORTAL"
            PropertyAction { target: thoughtBubble; property: "source";
                    value: Util.getPathToImage("MoreEnergy.png") }
        }
    ]

    ImageRenderer {
        id: smallBubble
        source: Util.getPathToImage("thoughtbubble_small.png")
        sizeScale: 0.15
        x: 0.15
        y: -0.6
        opacity: Math.max(0.0 , Math.min(1.0, d.sharedOpacity * 3.0))
    }

    ImageRenderer {
        id: mediumBubble
        source: Util.getPathToImage("thoughtbubble_medium.png")
        sizeScale: 0.25
        y: -0.9
        opacity: Math.max(0.0, Math.min(1.0, d.sharedOpacity * 3.0 - 1.0))
    }

    ImageRenderer {
        id: thoughtBubble
        source: Util.getPathToImage("MoreEnergy.png")
        sizeScale: 1.5
        x: 0.5
        y: -1.85
        opacity: Math.max(0.0 , Math.min(1.0, d.sharedOpacity * 3.0 - 2.0))
    }

    JavaScriptLogic {
        function updateFunc() {
            var deltaX = movementSpeed * (x - playerActor.x)
            x -= deltaX
            y -= movementSpeed * (y - playerActor.y)

            d.averageDeltaX += deltaX
            d.averageDeltaX *= deltaXAttenuation

            // Cause bubbles to stretch when moving horizontally.
            smallBubble.rotation = -5.0 * d.averageDeltaX
            mediumBubble.x = 0.2 + 0.2 * d.averageDeltaX
            mediumBubble.rotation = -10.0 * d.averageDeltaX
            thoughtBubble.x = 0.4 + 0.4 * d.averageDeltaX

            // Offset rotation based on horizonal velocity to simulate drag on the bubble.
            rotation =  5.0 * d.averageDeltaX

            if (state == "MAGNETISM") {
                if (d.framesMagnetized > 0) {
                    if (playerActor.magnetized) {
                        d.framesMagnetized--
                    }
                } else if (visible) {
                    d.sharedOpacity -= fadeOutSpeed
                    if (d.sharedOpacity <= 0.0) {
                        state = "PORTAL"
                    }
                }
            } else if (state == "PORTAL") {
                // Increased coefficient of y component to shorten y trigger distance.
                var dist2 = (portal.x - x) * (portal.x - x) + 2.0 * (portal.y - y) * (portal.y - y)
                // If the bubble is less than portalDist units away from the portal
                // and it isn't active, show the bubble.
                if (dist2 < portalDist * portalDist && d.sharedOpacity < 1.0
                        && !portal.isActivated()) {
                    d.sharedOpacity += fadeInSpeed
                } else if (d.sharedOpacity > 0.0
                        && (portal.isActivated() || dist2 > portalDist * portalDist)) {
                    d.sharedOpacity -= fadeOutSpeed
                }
            }
        }
    }

    PropertyAnimation {
        id:fadeIn

        target: d
        property: "sharedOpacity"
        duration: 1500
        to: 1.0
        running: false
    }

    StopwatchLogic {
        id: fadeInDelay

        time: fadeInDelayTime
        active: false
        onTimeElapsed: {
            time = fadeInDelayTime
            fadeInDelay.active = false
            if (state == "MAGNETISM" && d.framesMagnetized > 0) {
                fadeIn.running = true
            }
        }
    }

    Component.onCompleted: {
        if (Game.getCurrentLevelInfo().tutorial) {
            state = "MAGNETISM"
        }
    }

    QtObject {
        id: d

        property real averageDeltaX: 0.0
        property int framesMagnetized: minFramesMagnetized
        property real sharedOpacity: 0.0
    }
}
