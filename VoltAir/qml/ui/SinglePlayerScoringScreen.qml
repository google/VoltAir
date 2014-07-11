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
 * @brief Scoring screen presented after completing a single player level that lets the player
 * navigate to menus or continue playing.
 *
 * The player is presented with an animated "star score" based on the total points that they scored.
 * The player will receive atleast one star and can get up to four stars.
 */
UiComponent {
    id: root

    /**
     * @brief Minimum #score needed to acheive the first star.
     * @default{0.0}
     */
    property real oneStarThreshold: 0.0
    /**
     * @brief Minimum #score needed to acheive the second star.
     * @default{0.5}
     */
    property real twoStarThreshold: 0.5
    /**
     * @brief Minimum #score needed to acheive the third star.
     * @default{0.75}
     */
    property real threeStarThreshold: 0.75
    /**
     * @brief Minimum #score needed to acheive the fourth star.
     * @default{1.0}
     */
    property real fourStarThreshold: 1.0
    /**
     * @brief Ratio of points collected over the maximum number of possible points.
     * @default{0.0}
     */
    property real score: 0.0
    /**
     * @brief Whether or not the game has been completed.
     * @default{false}
     */
    property bool gameCompleted: false
    /**
     * @brief Whether or not the player has signed in to Google Play Games Services.
     * @default{false}
     */
    property bool signedIntoCloud: false
    /**
     * @brief Whether or not the background music is currently muted.
     */
    property bool bgmMuted: false

    /**
     * @brief Emitted when the player chooses to play the next level.
     */
    signal playNextLevelRequested()
    /**
     * @brief Emitted when the player chooses to replay the current level.
     */
    signal replayLevelRequested()
    /**
     * @brief Emitted when the player chooses to go to the start menu.
     */
    signal startMenuRequested()
    /**
     * @brief Emitted when the player chooses to sign in to Google Play Games Services.
     */
    signal signIntoCloudRequested()
    /**
     * @brief Emitted when the player chooses to show their achievements.
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

    showState: "SHOW_START"
    hideState: "HIDDEN"

    states: [
        State { name: "HIDDEN" },
        State { name: "SHOW_START" },
        State { name: "SHOW_ONE_STAR" },
        State { name: "SHOW_TWO_STARS" },
        State { name: "SHOW_THREE_STARS" },
        State { name: "SHOW_FOUR_STARS" },
        State { name: "SHOW_FINISH" }
    ]

    transitions: [
        Transition {
            to: "HIDDEN"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 0
                    duration: hideDuration
                }
                ScriptAction { script: d.resetState() }
                ScriptAction { script: root.hideCompleted() }
            }
        },
        Transition {
            to: "SHOW_START"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 1.0
                    duration: 100
                }
                PauseAnimation { duration: 100 }
                ScriptAction { script: d.goToNextState() }
            }
        },
        Transition {
            to: "SHOW_ONE_STAR"
            SequentialAnimation {
                NumberAnimation {
                    target: fillBar
                    property: "orbsCollected"
                    from: 0.0
                    to: Math.min(root.score, root.oneStarThreshold)
                    duration: 500
                }
                PauseAnimation { duration:  200 }
                ScriptAction { script: d.goToNextState() }
            }
        },
        Transition {
            to: "SHOW_TWO_STARS"
            SequentialAnimation {
                NumberAnimation {
                    target: fillBar
                    property: "orbsCollected"
                    to: Math.min(root.score, root.twoStarThreshold)
                    duration: 500
                }
                PauseAnimation { duration: score >= root.threeStarThreshold ? 600 : 200 }
                ScriptAction { script: d.goToNextState() }
            }
        },
        Transition {
            to: "SHOW_THREE_STARS"
            SequentialAnimation {
                NumberAnimation {
                    target: fillBar
                    property: "orbsCollected"
                    to: Math.min(root.score, root.threeStarThreshold)
                    duration: 500
                }
                PauseAnimation { duration: score >= root.fourStarThreshold ? 1500 : 200 }
                ScriptAction { script: d.goToNextState() }
            }
        },
        Transition {
            to: "SHOW_FOUR_STARS"
            SequentialAnimation {
                NumberAnimation {
                    target: fillBar
                    property: "orbsCollected"
                    to: Math.min(root.score, root.fourStarThreshold)
                    duration: (root.score >= root.fourStarThreshold) ? 100 : 500
                }
                PauseAnimation { duration: 200 }
                ScriptAction { script: d.goToNextState() }
            }
        },
        Transition {
            to: "SHOW_FINISH"
            SequentialAnimation {
                PauseAnimation { duration: 0.083 * showDuration }
                PropertyAction { target: nextLevelButton; property: "enabled"; value: true }
                PropertyAnimation {
                    target: nextLevelButton
                    property: "opacity"
                    to: 1.0
                    duration: 0.083 * showDuration
                }
                ScriptAction { script: root.showCompleted() }
            }
        }
    ]

    captureBackNavigation: true
    backNavigationMode: QmlConstants.BackNavigation_BackButtonOnlyMode

    SimpleFrame {
        id: scoreScreenCard

        anchors.centerIn: parent

        width: 0.5 * parent.width
        height: 0.6 * parent.height

        Image {
            id: starSlot1

            width: 0.25 * scoreScreenCard.width
            height: width * sourceSize.height / sourceSize.width
            anchors.left: scoreScreenCard.left
            anchors.leftMargin: 0.1 * scoreScreenCard.width
            anchors.verticalCenter: scoreScreenCard.verticalCenter
            anchors.verticalCenterOffset: -0.02 * scoreScreenCard.height

            source: Util.getPathToImage("UI/starLeftSlot.png")
        }

        Image {
            id: starSlot2

            width: 0.3 * scoreScreenCard.width
            height: width * sourceSize.height / sourceSize.width
            anchors.left: starSlot1.right
            anchors.verticalCenter: scoreScreenCard.verticalCenter
            anchors.verticalCenterOffset: -0.02 * scoreScreenCard.height - 0.15 * height

            source: Util.getPathToImage("UI/starCenterSlot.png")
        }

        Image {
            id: starSlot3

            width: 0.25 * scoreScreenCard.width
            height: width * sourceSize.height / sourceSize.width
            anchors.left: starSlot2.right
            anchors.verticalCenter: scoreScreenCard.verticalCenter
            anchors.verticalCenterOffset: -0.02 * scoreScreenCard.height

            mirror: true

            source: Util.getPathToImage("UI/starLeftSlot.png")
        }

        Image {
            id: starSlot4

            width: 0.21* scoreScreenCard.width
            height: width * sourceSize.height / sourceSize.width
            anchors.left: starSlot3.right
            anchors.verticalCenter: scoreScreenCard.verticalCenter
            anchors.verticalCenterOffset: -0.02 * scoreScreenCard.height

            mirror: true
            opacity: 0.0

            source: Util.getPathToImage("UI/starLeftSlot.png")
        }

        Image {
            id: star1

            anchors.fill: starSlot1

            opacity: 0.0

            source: Util.getPathToImage("UI/starLeft.png")
        }

        Image {
            id: star2

            anchors.fill: starSlot2

            opacity: 0.0

            source: Util.getPathToImage("UI/starCenter.png")
        }

        Image {
            id: star3

            anchors.fill: starSlot3

            mirror: true
            opacity: 0.0

            source: Util.getPathToImage("UI/starLeft.png")
        }

        Image {
            id: star4

            anchors.fill: starSlot4

            mirror: true
            opacity: 0.0

            source: Util.getPathToImage("UI/starLeft.png")
        }
    }

    ParallelAnimation {
        id: star1Animation
        ScriptAction { script: Engine.getSoundManager().playSoundEffect(d.firstStarSound) }
        PropertyAnimation {
            target: star1
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: d.starFadeInDuration
        }
    }

    ParallelAnimation {
        id: star2Animation
        ScriptAction { script: Engine.getSoundManager().playSoundEffect(d.secondStarSound) }
        PropertyAnimation {
            target: star2
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: d.starFadeInDuration
        }
    }

    ParallelAnimation {
        id: star3Animation
        ScriptAction { script: Engine.getSoundManager().playSoundEffect(d.thirdStarSound) }
        PropertyAnimation {
            target: star3
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: d.starFadeInDuration
        }
    }

    ParallelAnimation {
        id: star4Animation
        ScriptAction { script: Engine.getSoundManager().playSoundEffect(d.fourthStarSound) }
        PropertyAnimation {
            target: starSlot4
            property: "opacity"
            to: 1.0
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: star4
            property: "opacity"
            to: 1.0
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: starSlot1
            property: "width"
            to: 0.21 * scoreScreenCard.width
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: starSlot2
            property: "width"
            to: 0.24 * scoreScreenCard.width
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: starSlot3
            property: "width"
            to: 0.24 * scoreScreenCard.width
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: starSlot3.anchors
            property: "verticalCenterOffset"
            to: -0.02 * scoreScreenCard.height - 0.15 * starSlot3.height
            duration: 0.35 * d.starFadeInDuration
        }
        PropertyAnimation {
            target: starSlot1.anchors
            property: "leftMargin"
            to: 0.05 * scoreScreenCard.width
            duration: 0.35 * d.starFadeInDuration
        }
    }

    SinglePlayerFillBar {
        id: fillBar

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: root.top
        anchors.topMargin: 0.05 * parent.height

        width: 0.3 * parent.width
        height: 0.1 * parent.height

        threshold: root.oneStarThreshold
        totalOrbs: root.fourStarThreshold

        onOrbsCollectedChanged: {
            if (orbsCollected >= root.oneStarThreshold && star1.opacity <= 0.0) {
                star1Animation.start()
            }
            if (orbsCollected >= root.twoStarThreshold && star2.opacity <= 0.0) {
                star2Animation.start()
            }
            if (orbsCollected >= root.threeStarThreshold && star3.opacity <= 0.0) {
                star3Animation.start()
            }
            if (orbsCollected >= root.fourStarThreshold && star4.opacity <= 0.0) {
                star4Animation.start()
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

        anchors.left: scoreScreenCard.left
        anchors.leftMargin: 0.1 * scoreScreenCard.width
        anchors.verticalCenter: scoreScreenCard.bottom
        anchors.verticalCenterOffset: -0.1 * height

        width: 0.4 * scoreScreenCard.width
        height: 0.3 * scoreScreenCard.height

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

        anchors.right: scoreScreenCard.right
        anchors.rightMargin: 0.1 * scoreScreenCard.width
        anchors.verticalCenter: scoreScreenCard.bottom
        anchors.verticalCenterOffset: -0.1 * height

        width: 0.4 * scoreScreenCard.width
        height: 0.3 * scoreScreenCard.height

        enabled: false
        focus: true

        opacity: 0
        buttonText: root.gameCompleted ? "Finish" : "Next"

        focusRight: pgsButton
        focusUp: pgsButton
        focusLeft: retryButton

        onReleased: {
            root.playNextLevelRequested()
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

        // These private properties should be made public when necessary.

        // The amount of time (in ms) to fade in a "reward" star.
        property int starFadeInDuration: 200
        property string firstStarSound: Util.getPathToSound("reward_star01.wav")
        property string secondStarSound: Util.getPathToSound("reward_star02.wav")
        property string thirdStarSound: Util.getPathToSound("reward_star03.wav")
        property string fourthStarSound: Util.getPathToSound("reward_star04.wav")

        function goToNextState() {
            if (state == "SHOW_START") {
                state = "SHOW_ONE_STAR"
            } else if (state == "SHOW_ONE_STAR" && score > oneStarThreshold) {
                state = "SHOW_TWO_STARS"
            } else if (state == "SHOW_TWO_STARS" && score > twoStarThreshold) {
                state = "SHOW_THREE_STARS"
            } else if (state == "SHOW_THREE_STARS" && score > threeStarThreshold) {
                state = "SHOW_FOUR_STARS"
            } else {
                state = "SHOW_FINISH"
            }
        }

        function resetState() {
            star1.opacity = 0.0
            starSlot1.width = 0.25 * scoreScreenCard.width
            starSlot1.anchors.leftMargin = 0.1 * scoreScreenCard.width
            star2.opacity = 0.0
            starSlot2.width = 0.3 * scoreScreenCard.width
            star3.opacity = 0.0
            starSlot3.width = 0.25 * scoreScreenCard.width
            starSlot3.anchors.verticalCenterOffset = -0.02 * scoreScreenCard.height
            star4.opacity = 0.0
            starSlot4.opacity = 0.0
            fillBar.orbsCollected = 0.0
            nextLevelButton.enabled = false
            nextLevelButton.focus = true
            nextLevelButton.opacity = 0.0
        }
    }
}
