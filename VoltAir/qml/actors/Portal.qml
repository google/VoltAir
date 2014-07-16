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
 * @brief Progresses the game to the next level when this actor is contacted by a player.
 *
 * The points collected must be greater than or equal to #activationThreshold before the
 * Portal can be triggered.  When the #activationThreshold is met, lights on the portal turn on
 * and #portalActivateSound plays.  Similarly, a warp animation and #levelChangeSound play when
 * the Portal is triggered.
 */
Actor {
    id: portal

    /**
     * @brief Sound played when Portal is active and contacted.
     */
    property string levelChangeSound: Util.getPathToSound("warp_whoosh_02.wav")
    /**
     * @brief Sound played when the #activationThreshold is met.
     */
    property string portalActivateSound: Util.getPathToSound("success_elegant_03.wav")
    /**
     * @brief How many points must be collected before the Portal is activated.
     */
    property int activationThreshold: 0
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body

    /**
     * @brief Emitted when the #activationThreshold is met and the Portal is contacted by a player.
     */
    signal levelCompleted()

    /**
     * @brief Whether or not the #activationThreshold is met and a level change can be triggered.
     */
    function isActivated() {
        return body.active
    }

    PolygonBody {
        id: body

        active: (activationThreshold <= 0)
        sensor: true
        // These vertices should be used in all cases.  Preexisting vertices are ignored.
        vertices: [[-1.5, -0.5], [-0.8, 2.2], [-1.0, 2.2]]
    }

    PolygonBody {
        // Top of the portal.
        vertices: [[-1.56, -0.98], [-0.7, -1.08], [-0.7, -0.7], [-1.5, -0.7]]
    }

    PolygonBody {
        // Bottom ramp.
        vertices: [[-3.2, 2.55], [-0.7, 2.45], [-1.0, 2.2]]
    }

    ImageRenderer {
        id: portalBack

        sizeScale: 3.5
        x: -1.475
        y: 1.31
        z: 0

        source: Util.getPathToImage("middleground_e1/portalin_e1_back.png")
    }

    ImageRenderer {
        id: portalBackGlow

        sizeScale: 3.5
        x: portalBack.x
        y: portalBack.y
        z: 0

        source: Util.getPathToImage("middleground_e1/portalin_e1_backglow.png")
        opacity: 0.0

        Behavior on opacity { NumberAnimation { duration: 250 } }
    }

    AnimatedImageRenderer {
        id: portalOpenAnimation

        sizeScale: 3.5
        x: portalFront.x
        y: portalFront.y
        z: 2
        opacity: 0.0
        useGameTime: false
        frameCount: 10
        frameDelay: 0.05
        source: Util.getPathToImage("middleground_e1/portalin_e1_fill/portal_fx.png")

        Behavior on opacity { NumberAnimation { duration: 250 } }
    }

    AnimatedImageRenderer {
        id: warpAnimation

        visible: false
        sizeScale: 3.0
        paused: true
        looped: false
        frameCount: 11
        frameDelay: 0.05
        useGameTime: true
        source: Util.getPathToImage("middleground_e1/Warp/warp.png")
        x: portalFront.x
        y: portalFront.y - 0.5
        z: 2

        onAnimationReachedEnd: {
            portal.levelCompleted()
            visible = false
        }

        function activate() {
            visible = true
            paused = false
        }
    }

    ImageRenderer {
        id: portalFront

        sizeScale: 3.5
        x: -1.5
        y: 1.3
        z: 2

        source: Util.getPathToImage("middleground_e1/portalin_e1_front.png")
    }

    ImageRenderer {
        id: portalFrontGlow

        sizeScale: portalFront.sizeScale
        x: portalFront.x
        y: portalFront.y
        z: 2

        opacity: 0.0
        source: Util.getPathToImage("middleground_e1/portalin_e1_frontglow.png")

        Behavior on opacity {
            NumberAnimation { duration: 250 }
        }
    }

    ContactTrigger {
        contact: ContactEvent.ContactBegun
        actorType: Actor.PlayerActor

        function handleEvent(e) {
            warpAnimation.activate()
            if (e.otherBody.actor.deactivate) {
                e.otherBody.actor.deactivate()
            }

            Engine.getSoundManager().playSoundEffect(levelChangeSound)
        }
    }

    Component.onCompleted: {
        Game.playerScoreChanged.connect(d.onPlayerScoreChanged)
        portal.levelCompleted.connect(Game.onLevelCompleted)
        if (activationThreshold <= 0) {
            portalFrontGlow.opacity = 1.0
            portalOpenAnimation.opacity = 1.0
        }
    }

    Component.onDestruction: {
        Game.playerScoreChanged.disconnect(d.onPlayerScoreChanged)
        portal.levelCompleted.disconnect(Game.onLevelCompleted)
    }

    QtObject {
        id: d

        function onPlayerScoreChanged(player, score) {
            if (player == 0 && score >= activationThreshold && !isActivated()) {
                body.active = true
                portalFrontGlow.opacity = 1.0
                portalOpenAnimation.opacity = 1.0
                portalBackGlow.opacity = 1.0
                Engine.getSoundManager().playSoundEffect(portalActivateSound)
            }
        }
    }
}
