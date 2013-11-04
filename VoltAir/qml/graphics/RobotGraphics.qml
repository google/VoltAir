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
 * @brief A container class for the components used to render Robot.
 */
Item {
    /**
     * @brief Main color of this actor.
     */
    property string color: "grey"
    /**
     * @brief Size of this actor.
     */
    property real size: 0.3184448
    /**
     * @brief type:ImageRenderer Lightning that occurs while magnetising.
     */
    property alias magnetLightning: magnetLightning
    /**
     * @brief type:ImageRenderer Eyes of this actor.
     */
    property alias eyes: eyes
    /**
     * @brief type:QtObject Item that contains properties for rendering the #eyes.
     */
    property alias eyeGraphics: eyeGraphics
    /**
     * @brief type:ImageRenderer Glow that occurs when near other magnetic objects.
     */
    property alias magneticHighlight: magneticHighlight

    ImageRenderer {
        id: magnetLightning

        z: -2
        sizeScale: size * 10.0
        opacity: 0
        source: Util.getPathToImage("Bot/magnetism01.png")
    }

    // Base Texture of Robot - rotates
    ImageRenderer {
        id: moonBase

        sizeScale: size / 0.3
        source: Util.getPathToImage("Bot/bot_ball.png")
    }

    // Eyes - orients to movement direction.
    ImageRenderer {
        id: eyes

        sizeScale: size / 0.3
        source: eyeGraphics.getTurnFrameOfType("front.png")
    }

    // Highlight layer activating when magnetic objects are near - rotates
    MagneticHighlight {
        id: magneticHighlight
        z: -2

        sizeScale: size / 0.2

        source: Util.getPathToImage("Bot/bot_glow.png")
    }

    // Contains values of eye images (left/right/front). Set relative to "color" property.
    QtObject {
        id: eyeGraphics

        property int eyeState: 0
        property int minState: -3
        property int maxState: 3
        // Extra frames of delay between state transitions.
        property int transitionDelay: 2
        property int delayCounter: 0
        property real velocitySquaredThreshold: 15
        property int blinkHold: 0
        property int blinkTimer: 120

        function updateTurnGraphic() {
            if (eyeState == -3) {
                eyes.source = getTurnFrameOfType("left.png")
            } else if (eyeState == -2) {
                eyes.source = getTurnFrameOfType("left_idle.png")
            } else if (eyeState == -1) {
                eyes.source = getTurnFrameOfType("leftfront.png")
            } else if (eyeState == 0) {
                eyes.source = getTurnFrameOfType("front.png")
            } else if (eyeState == 1) {
                eyes.source = getTurnFrameOfType("rightfront.png")
            } else if (eyeState == 2) {
                eyes.source = getTurnFrameOfType("right_idle.png")
            } else if (eyeState == 3) {
                eyes.source = getTurnFrameOfType("right.png")
            }
        }

        function getTurnFrameOfType(name) {
            return Util.getPathToImage("Bot/"
                    + (color == "grey" ? "bot_" : color+"/"+color+"_")
                    + (blinkHold > 0 ? "blink" : "eyes") + "_" + name)
        }

        onEyeStateChanged: {
            if (eyeState > maxState) {
                eyeState = maxState
            } else if (eyeState < minState) {
                eyeState = minState
            }
        }
    }
}
