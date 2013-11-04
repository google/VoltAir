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
import QtQuick.Window 2.1
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Menu which allows the player to choose which level they want to enter.
 *
 * Locked cards will not allow players to enter that environment or level until the previous one
 * has be completed. This menu navigates through states to allow the player filter what type of
 * level they wish to play.  The progression menu subdivides into single player or multiplayer
 * progressions.  Then, an environment is chosen to select the type of setting for the level.
 * Lastly, the specific level is selected.  The hidden state is used to hide and disable all cards.
 */
UiComponent {
    id: root

    /**
     * @brief Map of all levels nested in their environments.
     */
    property LevelProgressionList levelProgressions
    /**
     * @brief Duration of transitions in milliseconds.
     */
    property int transitionDuration: 100
    /**
     * @brief Whether or not the user has signed into Google Play Games Services.
     */
    property bool signedIntoCloud: false
    /**
     * @brief Whether or not the background music is currently muted.
     */
    property bool bgmMuted: false
    /**
     * @brief Emitted when the player has chosen a level to play.
     */
    signal playLevelRequested(LevelProgression levelProgression, string levelName)
    /**
     * @brief Emitted when a request to Google Play Games Services has been issued.
     */
    signal signIntoCloudRequested()
    /**
     * @brief Emitted when requesting the Google Play Games Services' achievement view.
     */
    signal showAchievementsRequested()
    /**
     * @brief Emitted when the player chooses to quit and is about to be shown a ConfirmDialog.
     */
    signal quitDialogRequested()
    /**
     * @brief Emitted when the player chooses to mute the background music.
     */
    signal muteBGMRequested()
    /**
     * @brief Emitted when the player chooses to unmute the background music.
     */
    signal unmuteBGMRequested()

    /**
     * @brief Reveals the level progession over the specified duration.
     * @param type:LevelProgression levelProgression Ordered list of levels to complete
     * @param type:int showDuration Time to reveal the menu
     */
    function showForProgression(levelProgression, showDuration) {
        // Reset previous "selections".
        levelMenu.environment = null
        environmentMenu.levelProgression = levelProgression

        levelMenu.refresh()
        environmentMenu.refresh()

        show(showDuration)
    }

    /**
     * @brief Notifies the LevelSelectionMenu when the player data profile has been updated with new
     * data.
     */
    function onPlayerDataChanged() {
        environmentMenu.refresh()
        levelMenu.refresh()
    }

    states: [
        State { name: "HIDDEN" },
        State { name: "PROGRESSION_MENU" },
        State { name: "ENVIRONMENT_MENU" },
        State { name: "LEVEL_MENU" }
    ]

    showState: (environmentMenu.levelProgression) ? "ENVIRONMENT_MENU" : "PROGRESSION_MENU"
    hideState: "HIDDEN"

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "PROGRESSION_MENU"
            ScriptAction { script: showAnimation.start() }
            ScriptAction { script: progressionMenu.show(showDuration) }
        },
        Transition {
            from: "HIDDEN"
            to: "ENVIRONMENT_MENU"
            ScriptAction { script: showAnimation.start() }
            ScriptAction { script: environmentMenu.show(showDuration) }
        },
        Transition {
            from: "PROGRESSION_MENU"
            to: "HIDDEN"
            ScriptAction { script: hideAnimation.start() }
            ScriptAction { script: progressionMenu.hide(hideDuration) }
        },
        Transition {
            from: "PROGRESSION_MENU"
            to: "ENVIRONMENT_MENU"
            ScriptAction { script: progressionMenu.hide(transitionDuration) }
            ScriptAction { script: environmentMenu.show(transitionDuration) }
        },
        Transition {
            from: "ENVIRONMENT_MENU"
            to: "LEVEL_MENU"
            ScriptAction { script: environmentMenu.hide(transitionDuration) }
            ScriptAction { script: levelMenu.show(transitionDuration) }
        },
        Transition {
            from: "ENVIRONMENT_MENU"
            to: "PROGRESSION_MENU"
            ScriptAction { script: environmentMenu.hide(transitionDuration) }
            ScriptAction { script: progressionMenu.show(transitionDuration) }
        },
        Transition {
            from: "LEVEL_MENU"
            to: "ENVIRONMENT_MENU"
            ScriptAction { script: levelMenu.hide(transitionDuration) }
            ScriptAction { script: environmentMenu.show(transitionDuration) }
        },
        Transition {
            from: "LEVEL_MENU"
            to: "HIDDEN"
            ScriptAction { script: hideAnimation.start() }
            ScriptAction { script: levelMenu.hide(hideDuration) }
        }
    ]

    captureBackNavigation: true

    SequentialAnimation {
        id: showAnimation
        ScriptAction { script: hideAnimation.stop() }
        PropertyAnimation {
            target: root
            property: "opacity"
            to: 1.0
            duration: showDuration
        }

        onStopped: {
            root.showCompleted()
        }
    }

    SequentialAnimation {
        id: hideAnimation
        ScriptAction { script: showAnimation.stop() }
        PropertyAnimation {
            target: root
            property: "opacity"
            to: 0.0
            duration: hideDuration
        }

        onStopped: {
            root.hideCompleted()
        }
    }

    SimpleListMenu {
        id: progressionMenu
        objectName: "progressionMenu"

        anchors.fill: parent

        // Size the cards so that 3 fit easily on the screen.  If we have more than 3 progressions,
        // we display a part of the next progression card to hint at the others that exist.
        listItemWidth: parent.width / 3.3
        listItemHeight: 0.8 * parent.height
        visibleItemCount: (root.levelProgressions
                && root.levelProgressions.progressions.length <= 2) ? 2 : 3

        listView.model: (root.levelProgressions) ? root.levelProgressions.progressions : null

        listView.delegate: MenuCard {
            height: progressionMenu.listItemHeight
            width: progressionMenu.listItemWidth

            titleText: name
            backgroundImagePath: "UI/screenshots/" + screenshotFileName

            onPressed: {
                progressionMenu.focus = true
                progressionMenu.listView.currentIndex = index
            }

            onActionFired: {
                environmentMenu.levelProgression = root.levelProgressions.getLevelProgressionByName(
                        name)
                root.state = "ENVIRONMENT_MENU"
            }
        }

        focusUp: (listView.currentIndex >= listView.count / 2) ? pgsButton : backButton
        focusRight: pgsButton
        focusLeft: muteButton
    }

    SimpleListMenu {
        id: environmentMenu
        objectName: "environmentMenu"

        property LevelProgression levelProgression

        anchors.fill: parent

        listItemWidth: parent.width / 3.5
        listItemHeight: 0.6 * parent.height
        visibleItemCount: 3

        listView.model: (levelProgression) ? levelProgression.environments : null
        listView.delegate: MenuCard {
            function refresh() {
                locked = !Game.isEnvironmentUnlocked(environmentMenu.levelProgression.name, name)
            }

            width: environmentMenu.listItemWidth
            height: environmentMenu.listItemHeight

            // TODO: Fix the slight breakage of MVP here.
            locked: !Game.isEnvironmentUnlocked(environmentMenu.levelProgression.name, name)
            hideTitleWhenLocked: true
            titleText: name
            backgroundImagePath: "UI/screenshots/" + screenshotFileName

            onPressed: {
                environmentMenu.focus = true
                environmentMenu.listView.currentIndex = index
            }

            onActionFired: {
                levelMenu.environment = environmentMenu.levelProgression.getEnvironmentByName(
                        name)
                root.state = "LEVEL_MENU"
            }
        }

        listView.onModelChanged: {
            if (listView.model && levelProgression) {
                listView.currentIndex = Game.getLastPlayedEnvironmentIndex(levelProgression.name)
            }
        }

        focusUp: (listView.currentIndex >= listView.count / 2) ? pgsButton : backButton
        focusRight: pgsButton
        focusLeft: muteButton
    }

    SimpleListMenu {
        id: levelMenu
        objectName: "levelMenu"

        property Environment environment

        anchors.fill: parent

        listItemWidth: parent.width / 5.0
        listItemHeight: 0.6 * parent.height
        visibleItemCount: 4.5

        listView.model: (environment) ? environment.levelInfos : null
        listView.delegate: MenuCard {
            id: levelCard

            property int numStars: Game.getNumStars(environmentMenu.levelProgression.name, name)

            function refresh() {
                numStars = Game.getNumStars(environmentMenu.levelProgression.name, name)
                locked = !Game.isLevelUnlocked(environmentMenu.levelProgression.name, name)
            }

            width: levelMenu.listItemWidth
            height: levelMenu.listItemHeight

            // TODO: Fix the slight breakage of MVP here.
            locked: !Game.isLevelUnlocked(environmentMenu.levelProgression.name, name)
            backgroundImagePath: "UI/screenshots/" + screenshotFileName

            titleText: name

            Row {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0.06 * parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    width: 0.2 * levelCard.width
                    height: width * sourceSize.height / sourceSize.width
                    visible: enabled && numStars > 0
                    source: Util.getPathToImage("UI/starCenter.png")
                }
                Image {
                    width: 0.2 * levelCard.width
                    height: width * sourceSize.height / sourceSize.width
                    visible: enabled && numStars > 1
                    source: Util.getPathToImage("UI/starCenter.png")
                }
                Image {
                    width: 0.2 * levelCard.width
                    height: width * sourceSize.height / sourceSize.width
                    visible: enabled && numStars > 2
                    source: Util.getPathToImage("UI/starCenter.png")
                }
                Image {
                    width: 0.2 * levelCard.width
                    height: width * sourceSize.height / sourceSize.width
                    visible: enabled && numStars > 3
                    source: Util.getPathToImage("UI/starCenter.png")
                }
            }

            onPressed: {
                levelMenu.focus = true
                levelMenu.listView.currentIndex = index
            }

            onActionFired: {
                playLevelRequested(environmentMenu.levelProgression, name)
            }
        }

        listView.onModelChanged: {
            if (listView.model && environment) {
                listView.currentIndex = Game.getLastPlayedLevelIndexInEnvironment(
                        environmentMenu.levelProgression.name, environment.name)
            }
        }

        focusUp: (listView.currentIndex >= listView.count / 2) ? pgsButton : backButton
        focusRight: pgsButton
        focusLeft: muteButton
    }

    MenuIcon {
        id: backButton

        anchors.left: parent.left
        anchors.leftMargin: 0.01 * parent.width
        anchors.top: parent.top
        anchors.topMargin: 0.01 * parent.height

        width: 0.09 * parent.width
        height: width

        unselectedIconSource: Util.getPathToImage("UI/back.png")
        selectedIconSource: Util.getPathToImage("UI/back_h.png")

        focusDown: d.getCurrentMenu()
        focusRight: muteButton

        onReleased: {
            if (root.state == "PROGRESSION_MENU") {
                root.quitDialogRequested()
            } else if (root.state == "ENVIRONMENT_MENU") {
                root.state = "PROGRESSION_MENU"
            } else if (root.state == "LEVEL_MENU") {
                root.state = "ENVIRONMENT_MENU"
            }
        }
    }

    MenuIcon {
        id: muteButton

        anchors.left: backButton.right
        anchors.top: backButton.top

        width: backButton.width
        height: backButton.height

        unselectedIconSource: root.bgmMuted
                ? Util.getPathToImage("UI/musicOff.png")
                : Util.getPathToImage("UI/musicOn.png")
        selectedIconSource: root.bgmMuted
                ? Util.getPathToImage("UI/musicOff_h.png")
                : Util.getPathToImage("UI/musicOn_h.png")

        focusLeft: backButton
        focusDown: d.getCurrentMenu()
        focusRight: focusDown

        onReleased: {
            if (root.bgmMuted) {
                root.unmuteBGMRequested()
            } else {
                root.muteBGMRequested()
            }
        }
    }

    MenuIcon {
        id: pgsButton

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 0.01 * parent.height
        anchors.rightMargin: 0.01 * parent.width

        width: backButton.width
        height: backButton.height

        unselectedIconSource: root.signedIntoCloud
                ? Util.getPathToImage("UI/play_services.png")
                : Util.getPathToImage("UI/google_plus.png")
        selectedIconSource: root.signedIntoCloud
                ? Util.getPathToImage("UI/play_services_h.png")
                : Util.getPathToImage("UI/google_plus_h.png")

        focusDown: d.getCurrentMenu()
        focusLeft: focusDown

        onReleased: {
            if (root.signedIntoCloud) {
                root.showAchievementsRequested()
            } else {
                root.signIntoCloudRequested()
            }
        }
    }

    onEscaped: {
        if (state == "PROGRESSION_MENU") {
            quitDialogRequested()
        } else if (state == "ENVIRONMENT_MENU") {
            state = "PROGRESSION_MENU"
        } else if (state == "LEVEL_MENU") {
            state = "ENVIRONMENT_MENU"
        }
    }

    QtObject {
        id: d

        function getCurrentMenu() {
            if (root.state == "PROGRESSION_MENU") {
                return progressionMenu
            } else if (root.state == "ENVIRONMENT_MENU") {
                return environmentMenu
            } else if (root.state == "LEVEL_MENU") {
                return levelMenu
            } else {
                return null
            }
        }
    }
}
