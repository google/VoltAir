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
import QtQuick.Window 2.1
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Menu displayed when the game is paused.
 *
 * The menu allows the player to go to the main menu, level selection menu, sign-in to Google Play
 * Games Services, show achievements, quit, or resume their game.
 *
 * @note The sign-in function will be replaced with the show achievements button once signed in.
 */
UiComponent {
    id: root

    /**
     * @brief Whether or not the player has signed in to Google Play Games Services.
     */
    property bool signedIntoCloud: false
    /**
     * @brief Whether or not the background music is currently muted.
     */
    property bool bgmMuted: false

    /**
     * @brief Emitted when the player chooses to resume the game.
     */
    signal resumeRequested()
    /**
     * @brief Emitted when the player chooses to return to the main menu.
     */
    signal changeLevelProgressionRequested()
    /**
     * @brief Emitted when the player chooses to return to the level selection menu.
     */
    signal changeLevelRequested()
    /**
     * @brief Emitted when the player chooses to show their achievements.
     */
    signal showAchievementsRequested()
    /**
     * @brief Emitted when the player chooses to sign-in to Google Play Games Services.
     */
    signal signIntoCloudRequested()
    /**
     * @brief Emitted when the player chooses to open the quit ConfirmDialog.
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

    states: [
        State { name: "SHOWING" },
        State { name: "HIDDEN" }
    ]

    showState: "SHOWING"
    hideState: "HIDDEN"

    transitions: [
        Transition {
            to: "SHOWING"
            SequentialAnimation {
                ParallelAnimation {
                    ScriptAction { script: pauseMenu.show(showDuration) }
                    PropertyAnimation {
                        target: root
                        property: "opacity"
                        to: 1.0
                        duration: showDuration
                    }
                }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            to: "HIDDEN"
            SequentialAnimation {
                ParallelAnimation {
                    ScriptAction { script: pauseMenu.hide(hideDuration) }
                    PropertyAnimation {
                        target: root
                        property: "opacity"
                        to: 0.0
                        duration: hideDuration
                    }
                }
                ScriptAction { script: pauseMenu.listView.currentIndex = 0 }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    SimpleListMenu {
        id: pauseMenu

        // How to handle menu item selection.
        function onItemSelected(index) {
            var menuOption = listView.model.get(index).menuOption
            if (menuOption == "Resume") {
                root.resumeRequested()
            } else if (menuOption == "Main Menu") {
                root.changeLevelProgressionRequested()
            } else if (menuOption == "Change Level") {
                root.changeLevelRequested()
            } else if (menuOption == "Quit"){
                root.quitDialogRequested()
            }
        }

        anchors.fill: parent
        listItemWidth: 0.35 * parent.width
        listItemHeight: 0.15 * parent.height
        visibleItemCount: 4

        listView.orientation: ListView.Vertical
        listView.spacing: 0.0

        listView.model: ListModel {
            ListElement { menuOption: "Resume" }
            ListElement { menuOption: "Main Menu" }
            ListElement { menuOption: "Change Level" }
            ListElement { menuOption: "Quit" }
        }

        // Template description of a menu item
        listView.delegate: MenuButton {
            height: pauseMenu.listItemHeight
            width: pauseMenu.listItemWidth

            buttonText: menuOption

            onPressed: {
                pauseMenu.listView.currentIndex = index
            }

            onReleased: {
                pauseMenu.onItemSelected(index)
            }
        }

        focusLeft: muteButton
        focusRight: pgsButton
        focusUp: muteButton

        onEscaped: {
            root.resumeRequested()
        }

        captureBackNavigation: true
        backNavigationMode: QmlConstants.BackNavigation_GamepadOnlyMode
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

        focusDown: pauseMenu
        focusRight: muteButton

        onReleased: {
            root.resumeRequested()
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
        focusRight: pauseMenu
        focusDown: pauseMenu

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

        focusLeft: pauseMenu
        focusDown: pauseMenu

        onReleased: {
            if (root.signedIntoCloud) {
                root.showAchievementsRequested()
            } else {
                root.signIntoCloudRequested()
            }
        }
    }
}
