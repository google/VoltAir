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
 * @brief Overlays the screen during single player play and provides additional information
 * for the game.
 */
UiComponent {
    id: root

    /**
     * @brief type:SinglePlayerFillBar SinglePlayerFillBar that tracks game progress.
     */
    property alias fillBar: fillBar

    /**
     * @brief Emitted when the pause menu is opened.
     */
    signal pauseMenuRequested()

    /**
     * @brief Notifies the HUD that the player's score changed.
     * @param type:int score Updated score of the player
     */
    function onPlayerScoreChanged(score) {
        fillBar.orbsCollected = score
    }

    /**
     * @brief Notifies the HUD that the level has changed.
     * @param type:int completionThreshold New capacity of the gauge
     * @param type:int activationThreshold New activation threshold of the gauge
     */
    function onLevelChanged(levelName, completionThreshold, activationThreshold) {
        fillBar.orbsCollected = 0
        fillBar.totalOrbs = completionThreshold
        fillBar.threshold = activationThreshold
        debugHud.levelName = levelName
    }

    /**
     * @brief Resets the HUD.
     */
    function reset() {
        fillBar.orbsCollected = 0
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
                    to: 1
                    duration: showDuration
                }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            to: "HIDDEN"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 0
                    duration: hideDuration
                }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    captureBackNavigation: true
    backNavigationMode: QmlConstants.BackNavigation_BackButtonOnlyMode

    DebugHud {
        id: debugHud
        objectName: "debugHud"

        anchors.fill: parent
    }

    SinglePlayerFillBar {
        id: fillBar

        width: 0.25 * parent.width
        height: 0.12 * parent.height

        anchors.top: parent.top
        anchors.right: parent.right

        Behavior on orbsCollected {
            NumberAnimation { duration: 250 }
        }
    }

    onEscaped: {
        root.pauseMenuRequested()
    }
}
