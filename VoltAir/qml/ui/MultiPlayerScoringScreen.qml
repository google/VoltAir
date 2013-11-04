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
 * @brief Displays the results of a multiplayer game.
 */
UiComponent {
    id: root

    /**
     * @brief Number of Snowflake%s needed by a single player to complete the game.
     */
    property int completionThreshold: 0
    /**
     * @brief Whether or not the game has completed.
     */
    property bool gameCompleted: false
    /**
     * @brief Whether or not a player has signed into the cloud.
     */
    property bool signedIntoCloud: false
    /**
     * @brief Whether or not the background music is currently muted.
     */
    property bool bgmMuted: false

    /**
     * @brief Emitted when the start menu is requested.
     */
    signal startMenuRequested()
    /**
     * @brief Emitted when a player has chosen to replay the level.
     */
    signal replayLevelRequested()
    /**
     * @brief Emitted when a player tries to sign-in to the cloud.
     */
    signal signIntoCloudRequested()
    /**
     * @brief Emitted when a player requests the Google Play Games Services achievements be shown.
     */
    signal showAchievementsRequested()
    /**
     * @brief Emitted when the player chooses to mute the background music.
     */
    signal muteBGMRequested()
    /**
     * @brief Emitted when the player chooses to unmute the background music.
     */
    signal unmuteBGMRequested()

    /**
     * @brief Updates the gauge of the player when their score changes.
     * @param type:int playerId Id of the player whose score changed
     * @param type:int score Updated score of the player
     */
    function onPlayerScoreChanged(playerId, score) {
        d.rows[playerId].score = score
    }

    /**
     * @brief Called to either show or hide a player gauge.
     * @param type:int playerId Id of the player whose gauge needs updating
     * @param type:bool active Whether or not that gauge should be shown
     */
    function setPlayerActivation(playerId, active) {
        d.rows[playerId].opacity = active ? 1.0 : 0.0
    }

    showState: "SHOWING"
    hideState: "HIDDEN"

    states: [
        State { name: "SHOWING" },
        State { name: "HIDDEN" }
    ]

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "SHOWING"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 1.0
                    duration: 0.083 * showDuration
                }
                ParallelAnimation {
                    PropertyAnimation {
                        target: row0
                        property: "snowflakesCollected"
                        from: 0.0
                        to: row0.score
                        duration: 0.83 * showDuration * row0.score / row0.totalSnowflakes
                    }
                    PropertyAnimation {
                        target: row1
                        property: "snowflakesCollected"
                        from: 0.0
                        to: row1.score
                        duration: 0.83 * showDuration * row1.score / row1.totalSnowflakes
                    }
                    PropertyAnimation {
                        target: row2
                        property: "snowflakesCollected"
                        from: 0.0
                        to: row2.score
                        duration: 0.83 * showDuration * row2.score / row2.totalSnowflakes
                    }
                    PropertyAnimation {
                        target: row3
                        property: "snowflakesCollected"
                        from: 0.0
                        to: row3.score
                        duration: 0.83 * showDuration * row3.score / row3.totalSnowflakes
                    }
                }
                PropertyAction { target: nextLevelButton; property: "enabled"; value: true }
                PropertyAnimation {
                    target: nextLevelButton
                    property: "opacity"
                    to: 1.0
                    duration: 0.083 * showDuration
                }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            from: "SHOWING"
            to: "HIDDEN"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 0.0
                    duration: hideDuration
                }
                PropertyAction { target: nextLevelButton; property: "enabled"; value: false }
                PropertyAction { target: nextLevelButton; property: "opacity"; value: 0.0 }
                PropertyAction { target: row0; property: "score"; value: 0.0 }
                PropertyAction { target: row0; property: "snowflakesCollected"; value: 0.0 }
                PropertyAction { target: row1; property: "score"; value: 0.0 }
                PropertyAction { target: row1; property: "snowflakesCollected"; value: 0.0 }
                PropertyAction { target: row2; property: "score"; value: 0.0 }
                PropertyAction { target: row2; property: "snowflakesCollected"; value: 0.0 }
                PropertyAction { target: row3; property: "score"; value: 0.0 }
                PropertyAction { target: row3; property: "snowflakesCollected"; value: 0.0 }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    captureBackNavigation: true
    backNavigationMode: QmlConstants.BackNavigation_BackButtonOnlyMode

    SimpleFrame {
        id: frame

        width: 0.65 * parent.width
        height: 0.75 * parent.height
        anchors.centerIn: parent

        Column {
            id: column

            anchors.fill: parent
            anchors.leftMargin: 0.05 * parent.width
            anchors.rightMargin: 0.05 * parent.width
            anchors.topMargin: 0.1 * parent.height
            anchors.bottomMargin: 0.3 * parent.height

            spacing: 0.05 * height

            MultiPlayerFillBar {
                id: row0

                property int score: 0

                height: 0.25 * parent.height
                width: parent.width
                opacity: 0.0
                totalSnowflakes: root.completionThreshold
                fillColor: "red"
            }

            MultiPlayerFillBar {
                id: row1

                property int score: 0

                height: 0.25 * parent.height
                width: parent.width
                opacity: 0.0
                totalSnowflakes: root.completionThreshold
                fillColor: "green"
            }

            MultiPlayerFillBar {
                id: row2

                property int score: 0

                height: 0.25 * parent.height
                width: parent.width
                opacity: 0.0
                totalSnowflakes: root.completionThreshold
                fillColor: "blue"
            }

            MultiPlayerFillBar {
                id: row3

                property int score: 0

                height: 0.25 * parent.height
                width: parent.width
                opacity: 0.0
                totalSnowflakes: root.completionThreshold
                fillColor: "yellow"
            }
        }
    }

    MenuIcon {
        id: startMenuButton

        anchors.left: parent.left
        anchors.leftMargin: 0.01 * parent.width
        anchors.top: parent.top
        anchors.topMargin: 0.01 * parent.height

        width: 0.09 * parent.width
        height: width

        unselectedIconSource: Util.getPathToImage("UI/menu.png")
        selectedIconSource: Util.getPathToImage("UI/menu_h.png")

        focusDown: retryButton
        focusRight: muteButton

        enabled: nextLevelButton.enabled
        opacity: nextLevelButton.opacity

        onReleased: {
            root.startMenuRequested()
        }
    }

    MenuIcon {
        id: muteButton

        anchors.left: startMenuButton.right
        anchors.top: startMenuButton.top

        width: startMenuButton.width
        height: startMenuButton.height

        unselectedIconSource: root.bgmMuted
                ? Util.getPathToImage("UI/musicOff.png")
                : Util.getPathToImage("UI/musicOn.png")
        selectedIconSource: root.bgmMuted
                ? Util.getPathToImage("UI/musicOff_h.png")
                : Util.getPathToImage("UI/musicOn_h.png")

        focusLeft: startMenuButton
        focusRight: retryButton
        focusDown: retryButton

        enabled: nextLevelButton.enabled
        opacity: nextLevelButton.opacity

        onReleased: {
            if (root.bgmMuted) {
                root.unmuteBGMRequested()
            } else {
                root.muteBGMRequested()
            }
        }
    }

    MenuButton {
        id: retryButton

        anchors.left: frame.left
        anchors.leftMargin: nextLevelButton.anchors.rightMargin
        anchors.verticalCenter: frame.bottom
        anchors.verticalCenterOffset: -0.1 * height

        width: nextLevelButton.width
        height: nextLevelButton.height

        enabled: nextLevelButton.enabled
        buttonText: "Retry"

        focusLeft: muteButton
        focusUp: muteButton
        focusRight: nextLevelButton

        opacity: nextLevelButton.opacity

        onReleased: {
            root.replayLevelRequested()
        }
    }

    MenuButton {
        id: nextLevelButton

        anchors.right: frame.right
        anchors.rightMargin: 0.15 * frame.width
        anchors.verticalCenter: frame.bottom
        anchors.verticalCenterOffset: -0.1 * height

        width: 0.33 * frame.width
        height: 0.27 * frame.height

        focus: true

        enabled: false
        opacity: 0.0
        buttonText: "Finish"

        focusLeft: retryButton
        focusRight: pgsButton
        focusUp: pgsButton

        onReleased: {
            root.startMenuRequested()
        }
    }

    MenuIcon {
        id: pgsButton

        anchors.top: parent.top
        anchors.topMargin: 0.01 * parent.height
        anchors.right: parent.right
        anchors.rightMargin: 0.01 * parent.width

        width: 0.09 * parent.width
        height: width

        unselectedIconSource: root.signedIntoCloud
                ? Util.getPathToImage("UI/play_services.png")
                : Util.getPathToImage("UI/google_plus.png")
        selectedIconSource: root.signedIntoCloud
                ? Util.getPathToImage("UI/play_services_h.png")
                : Util.getPathToImage("UI/google_plus_h.png")

        focusLeft: nextLevelButton
        focusDown: nextLevelButton

        enabled: nextLevelButton.enabled
        opacity: nextLevelButton.opacity

        onReleased: {
            if (root.signedIntoCloud) {
                root.showAchievementsRequested()
            } else {
                root.signIntoCloudRequested()
            }
        }
    }

    onEscaped: {
        root.startMenuRequested()
    }

    QtObject {
        id: d

        property var rows: [row0, row1, row2, row3]
    }
}
