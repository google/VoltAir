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
 * @brief Overlays the screen during multiplayer play and provides information on game progress.
 *
 * The MultiPlayerHud reveals and colors a SimpleFillBar for each player that drops into
 * a multiplayer game.  Additionally, a Toast will appear if less than two players have joined and
 * instruct players how to set up a local multiplayer session.
 */
UiComponent {
    id: root

    /**
     * @brief Emitted when the pause menu is requested.
     */
    signal pauseMenuRequested()


    /**
     * @brief Updates the gauge of the player when their score changes.
     * @param type:int playerId Id of the player whose score changed
     * @param type:int score Updated score of the player
     */
    function onPlayerScoreChanged(playerId, score) {
        d.gauges[playerId].amountFilled = score
    }

    /**
     * @brief Resets the all gauges and sets their new capacity.
     * @param type:int completionThreshold New capacity of the gauge
     */
    function onLevelChanged(completionThreshold) {
        for (var i = 0 ; i < d.gauges.length ; i++) {
            d.gauges[i].amountFilled = 0
            d.gauges[i].capacity = completionThreshold
        }
        d.players = 0
    }

    /**
     * @brief Called to either show or hide a player gauge.
     * @param type:int playerId Id of the player whose gauge needs updating
     * @param type:bool active Whether or not that gauge should be shown
     */
    function setPlayerActivation(playerId, active) {
        if (showing) {
            var anim = d.anims[playerId]
            anim.to = active ? 1 : 0
            anim.restart()
            d.players++
        } else {
            d.gauges[playerId].opacity = 0.0
        }
    }

    showState: "SHOWING"
    hideState: "HIDDEN"

    states: [
        State { name: "SHOWING" },
        State { name: "HIDDEN" }
    ]

    transitions: [
        Transition {
            to: "SHOWING"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 1.0
                    duration: showDuration
                }
                ScriptAction { script: toastDelay.active = true }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            to: "HIDDEN"
            SequentialAnimation {
                ParallelAnimation {
                    PropertyAnimation {
                        target: root
                        property: "opacity"
                        to: 0.0
                        duration: hideDuration
                    }
                    ScriptAction { script: toastDelay.active = false }
                    ScriptAction { script: toast.hide(hideDuration) }
                }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    SimpleFillBarSmall {
        id: gauge0

        width: 0.45 * parent.width
        height: 0.03 * parent.height

        anchors.top: parent.top
        anchors.topMargin: 0.02 * parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        opacity: 0.0

        fillColor: "red"

        PropertyAnimation { id: anim0; target: gauge0; property: "opacity"; duration: 250 }

        Behavior on amountFilled {
            NumberAnimation { duration: 250 }
        }
    }

    captureBackNavigation: true
    backNavigationMode: QmlConstants.BackNavigation_BackButtonOnlyMode

    SimpleFillBarSmall {
        id: gauge1

        width: gauge0.width
        height: gauge0.height

        anchors.top: gauge0.bottom
        anchors.topMargin: 0.1 * height
        anchors.horizontalCenter: parent.horizontalCenter

        opacity: 0.0

        fillColor: "green"

        PropertyAnimation { id: anim1; target: gauge1; property: "opacity"; duration: 250 }

        Behavior on amountFilled {
            NumberAnimation { duration: 250 }
        }
    }

    SimpleFillBarSmall {
        id: gauge2

        width: gauge0.width
        height: gauge0.height

        anchors.top: gauge1.bottom
        anchors.topMargin: 0.1 * height
        anchors.horizontalCenter: parent.horizontalCenter

        opacity: 0
        fillColor: "blue"

        PropertyAnimation { id: anim2; target: gauge2;  property: "opacity"; duration: 250 }

        Behavior on amountFilled {
            NumberAnimation { duration: 250 }
        }
    }

    SimpleFillBarSmall {
        id: gauge3

        width: gauge0.width
        height: gauge0.height

        anchors.top: gauge2.bottom
        anchors.topMargin: 0.1 * height
        anchors.horizontalCenter: parent.horizontalCenter

        opacity: 0
        fillColor: "yellow"

        PropertyAnimation { id: anim3; target: gauge3; property: "opacity"; duration: 250 }

        Behavior on amountFilled {
            NumberAnimation { duration: 250 }
        }
    }

    StopwatchLogic {
        id: toastDelay

        time: 5.0
        active: false

        onTimeElapsed: {
            time = 5.0
            active = false

            if (d.players < 2) {
                toast.show(500)
            }
        }
    }

    Toast {
        id: toast

        textElement.text: "Connect controllers to play with your friends!"

        width: 0.6 * parent.width
        height: 0.15 * parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 0.15 * parent.height

        hideDuration: 500
    }

    onEscaped: {
        root.pauseMenuRequested()
    }

    QtObject {
        id: d

        property int players: 0
        property var anims: [anim0, anim1, anim2, anim3]
        property var gauges: [gauge0, gauge1, gauge2, gauge3]
    }
}
