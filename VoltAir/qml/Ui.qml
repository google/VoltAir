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
import "ui"

/**
 * @ingroup QQuickItem
 * @brief The top-level UI object.
 *
 * The UI root serves as a manager of all possible Ui viewing @c state%s.
 */
UiInternal {
    id: root

    /**
     * @brief First state that the Ui should transition to.
     */
    property string initialState: "SPLASH_SCREEN"
    /**
     * @brief Default transition duration time for changes in Ui's @c state.
     */
    property int transitionDuration: 100
    /**
     * @brief type:SinglePlayerHud Reference to the single player HUD.
     */
    property alias singlePlayerHud: singlePlayerHud

    /**
     * @brief Called by Game when attempting to start the Ui.
     */
    function tryStart() {
        if (state == "STARTING") {
            state = initialState
        }
    }

    /**
     * @brief Passes information about the current level to the Ui.
     * @param type:string levelName Name of the level
     * @param type:int completionThreshold How many points are needed to complete the level
     * @param type:int activationThreshold How many points are needed to pass the level
     */
    function onLevelChanged(levelName, completionThreshold, activationThreshold) {
        d.currentLevelName = levelName
        if (d.isMultiplayerProgression()) {
            multiPlayerHud.onLevelChanged(completionThreshold)
            multiPlayerScoringScreen.completionThreshold = completionThreshold
        } else {
            singlePlayerHud.onLevelChanged(levelName, completionThreshold, activationThreshold)
        }
        root.state = "GAMEPLAY"
    }

    /**
     * @brief Notifies the Ui when the level is completed.
     * @param type:bool gameCompleted Whether or not the game was completed
     * @param type:int oneStarThreshold How many points are needed to win one star
     * @param type:int twoStarThreshold How many points are needed to win two stars
     * @param type:int threeStarThreshold How many points are needed to win three stars
     * @param type:int fourStarThreshold How many points are needed to win four stars
     * @param type:int score Score achieved by the player
     */
    function onLevelCompleted(gameCompleted, oneStarThreshold, twoStarThreshold, threeStarThreshold,
            fourStarThreshold, score) {
        if (d.isMultiplayerProgression()) {
            multiPlayerScoringScreen.gameCompleted = gameCompleted
        } else {
            singlePlayerScoringScreen.gameCompleted = gameCompleted
            singlePlayerScoringScreen.oneStarThreshold = oneStarThreshold
            singlePlayerScoringScreen.twoStarThreshold = twoStarThreshold
            singlePlayerScoringScreen.threeStarThreshold = threeStarThreshold
            singlePlayerScoringScreen.fourStarThreshold = fourStarThreshold
            singlePlayerScoringScreen.score = score
        }
        root.state = "SCORING_SCREEN"
    }

    /**
     * @brief Notifies the Ui when a player's activation changes.
     * @param type:int player ID of player that had their activation change
     * @param type:bool active Active state to set the player to
     */
    function onPlayerActivationChanged(player, active) {
        // We only care about dynamic activation in multiplayer.
        if (d.isMultiplayerProgression()) {
            multiPlayerHud.setPlayerActivation(player, active)
            multiPlayerScoringScreen.setPlayerActivation(player, active)
        }
    }

    /**
     * @brief Notifies the Ui when a player's score changes.
     * @param type:int player ID of player whose score changed
     * @param type:int score Updated player score
     */
    function onPlayerScoreChanged(player, score) {
        if (d.isMultiplayerProgression()) {
            multiPlayerHud.onPlayerScoreChanged(player, score)
            multiPlayerScoringScreen.onPlayerScoreChanged(player, score)
        } else {
            singlePlayerHud.onPlayerScoreChanged(score)
        }
    }

    /**
     * @brief Notifies the Ui when the player data profile has been updated with new data.
     */
    function onPlayerDataChanged() {
        levelSelectionMenu.onPlayerDataChanged()
    }

    /**
     * @brief Notifies the Ui when the device's @c onPause lifecycle event occurs.
     */
    function onDevicePause() {
        if (state == "GAMEPLAY") {
            state = "PAUSE_MENU"
        }
    }

    anchors.fill: parent

    state: "STARTING"

    states: [
        // Game just started up.
        State { name: "STARTING" },
        // The splash screen is active.
        State { name: "SPLASH_SCREEN" },
        // Menu to choose between single- and multi-player active.
        State { name: "LEVEL_SELECTION_MENU" },
        // The Ui menus are inactive.
        State { name: "GAMEPLAY" },
        // Showing the score of the just-completed level.
        State { name: "SCORING_SCREEN" },
        // The final reward screen / movie is showing.
        State { name: "REWARD_SCREEN" },
        // Pause Menu is active.
        State { name: "PAUSE_MENU" },
        // Loading screen to give feedback while loading.
        State { name: "LOADING_SCREEN" },
        // Quit Dialog is active.
        State { name: "QUIT_DIALOG" },
        // In the process of shutting down the app.
        State { name: "QUITTING" }
    ]

    transitions: [
        Transition {
            from: "STARTING"
            to: "SPLASH_SCREEN"
            ScriptAction { script: splashScreen.show(250) }
        },
        Transition {
            from: "STARTING"
            to: "LOADING_SCREEN"
            ScriptAction { script: loadingScreen.show(transitionDuration) }
        },
        Transition {
            from: "GAMEPLAY"
            to: "PAUSE_MENU"
            SequentialAnimation {
                ScriptAction { script: d.pauseGame() }
                ParallelAnimation {
                    ScriptAction { script: overlay.show(transitionDuration) }
                    ScriptAction { script: pauseMenu.show(transitionDuration) }
                    ScriptAction { script: d.hideHud(transitionDuration) }
                }
            }
        },
        Transition {
            from: "PAUSE_MENU"
            to: "GAMEPLAY"
            ScriptAction { script: pauseMenu.hide(transitionDuration) }
            ScriptAction { script: overlay.hide(transitionDuration) }
            ScriptAction { script: d.showHud(transitionDuration) }
        },
        Transition {
            from: "PAUSE_MENU"
            to: "QUIT_DIALOG"
            ScriptAction { script: pauseMenu.hide(transitionDuration) }
        },
        Transition {
            from: "PAUSE_MENU"
            to: "LEVEL_SELECTION_MENU"
            ScriptAction { script: singlePlayerHud.reset() }
            ScriptAction { script: pauseMenu.hide(transitionDuration) }
            ScriptAction { script: overlay.hide(transitionDuration) }
            ScriptAction { script: background.show(transitionDuration) }
            ScriptAction { script: d.showLevelSelectionMenu(transitionDuration) }
        },
        Transition {
            from: "SPLASH_SCREEN"
            to: "LEVEL_SELECTION_MENU"
            ScriptAction { script: d.showLevelSelectionMenu(transitionDuration) }
            ScriptAction { script: background.show(transitionDuration) }
        },
        Transition {
            from: "LEVEL_SELECTION_MENU"
            to: "LOADING_SCREEN"
            ScriptAction { script: background.hide(transitionDuration) }
            ScriptAction { script: levelSelectionMenu.hide(transitionDuration) }
            ScriptAction { script: loadingScreen.show(transitionDuration) }
        },
        Transition {
            from: "LEVEL_SELECTION_MENU"
            to: "QUIT_DIALOG"
            ScriptAction { script: levelSelectionMenu.hide(transitionDuration) }
            ScriptAction { script: confirmQuit.show(transitionDuration) }
        },
        Transition {
            from: "LOADING_SCREEN"
            to: "GAMEPLAY"
            ScriptAction { script: loadingScreen.hide(transitionDuration) }
            ScriptAction { script: d.showHud(transitionDuration) }
        },
        Transition {
            to: "QUIT_DIALOG"
            ScriptAction { script: confirmQuit.show(transitionDuration) }
        },
        Transition {
            from: "GAMEPLAY"
            to: "SCORING_SCREEN"
            ScriptAction { script: overlay.show(transitionDuration) }
            ScriptAction { script: d.showScoringScreen(2500) }
            ScriptAction { script: d.hideHud(transitionDuration) }
        },
        Transition {
            from: "SCORING_SCREEN"
            to: "LOADING_SCREEN"
            ScriptAction { script: d.hideScoringScreen(transitionDuration) }
            ScriptAction { script: loadingScreen.show(transitionDuration) }
            ScriptAction { script: overlay.hide(transitionDuration) }
        },
        Transition {
            from: "SCORING_SCREEN"
            to: "LEVEL_SELECTION_MENU"
            ScriptAction { script: overlay.hide(transitionDuration) }
            ScriptAction { script: background.show(transitionDuration) }
            ScriptAction { script: d.showLevelSelectionMenu(transitionDuration) }
            ScriptAction { script: d.hideScoringScreen(transitionDuration) }
        },
        Transition {
            from: "SCORING_SCREEN"
            to: "REWARD_SCREEN"
            ScriptAction { script: d.hideScoringScreen(transitionDuration) }
            ScriptAction { script: rewardScreen.show(transitionDuration) }
            ScriptAction { script: overlay.hide(transitionDuration) }
        },
        Transition {
            from: "REWARD_SCREEN"
            to: "LEVEL_SELECTION_MENU"
            ScriptAction { script: background.show(transitionDuration) }
            ScriptAction { script: d.showLevelSelectionMenu(transitionDuration) }
            ScriptAction { script: rewardScreen.hide(transitionDuration) }
        },
        Transition {
            from: "QUIT_DIALOG"
            to: "QUITTING"
            ScriptAction { script: confirmQuit.hide(transitionDuration) }
        },
        Transition {
            from: "QUIT_DIALOG"
            ScriptAction { script: confirmQuit.hide(transitionDuration) }
        }
    ]

    menuBGMTrack: "music/music_loop_menu.mp3"

    Background {
        id: background

        anchors.fill: parent
    }

    Overlay {
        id: overlay

        anchors.fill: parent
    }

    Cinematic {
        id: splashScreen
        objectName: "splashScreen"

        anchors.fill: parent

        source: Util.getPathToMovie("animatic01.mp4")

        // When the splash screen is completely visible, we will automatically shut it down.
        onShowCompleted: {
            root.openingCinematicCompleted()
            hide(transitionDuration)
        }

        // When the splash screen is completely hidden, we will begin to fade in the level menu.
        onHideCompleted: {
            root.state = "LEVEL_SELECTION_MENU"
        }
    }

    PauseMenu {
        id: pauseMenu
        objectName: "pauseMenu"

        anchors.fill: parent

        onHideCompleted: {
            if (root.state == "QUIT_DIALOG") {
                confirmQuit.show(transitionDuration)
            } else if (root.state == "GAMEPLAY") {
                d.unpauseGame()
            }
        }

        onResumeRequested: {
            root.state = "GAMEPLAY"
        }

        onChangeLevelProgressionRequested: {
            root.changeLevelProgressionRequested()
            root.state = "LEVEL_SELECTION_MENU"
        }

        onChangeLevelRequested: {
            root.changeLevelRequested()
            root.state = "LEVEL_SELECTION_MENU"
        }

        onShowAchievementsRequested: {
            Engine.sendTrackerEvent("Ui", "ButtonPressed", "ShowAchievements")
            root.showAchievementsRequested()
        }

        onSignIntoCloudRequested: {
            root.signIntoCloudRequested()
        }

        onQuitDialogRequested: {
            confirmQuit.quitReturnState = "PAUSE_MENU"
            root.state = "QUIT_DIALOG"
        }

        onMuteBGMRequested: {
            root.muteBGMRequested()
        }

        onUnmuteBGMRequested: {
            root.unmuteBGMRequested()
        }
    }

    LevelSelectionMenu {
        id: levelSelectionMenu

        anchors.fill: parent

        transitionDuration: root.transitionDuration

        onPlayLevelRequested: {
            root.state = "LOADING_SCREEN"
            root.playLevelRequested(levelProgression, levelName)
        }

        onSignIntoCloudRequested: {
            root.signIntoCloudRequested()
        }

        onShowAchievementsRequested: {
            Engine.sendTrackerEvent("Ui", "ButtonPressed", "ShowAchievements")
            root.showAchievementsRequested()
        }

        onQuitDialogRequested: {
            confirmQuit.quitReturnState = "LEVEL_SELECTION_MENU"
            root.currentProgression = null
            root.state = "QUIT_DIALOG"
        }

        onMuteBGMRequested: {
            root.muteBGMRequested()
        }

        onUnmuteBGMRequested: {
            root.unmuteBGMRequested()
        }
    }

    LoadingScreen {
        id: loadingScreen
        objectName: "loadingScreen"

        anchors.fill: parent

        shouldGainFocus: false

        onHideCompleted: {
            d.unpauseGame()
        }
    }

    ConfirmDialog {
        id: confirmQuit
        objectName: "confirmQuit"

        property string quitReturnState

        width: 0.6 * parent.width
        height: 0.6 * parent.height
        anchors.centerIn: parent

        questionText: "Quit?"
        cancelText: "No"
        confirmText: "Yes"

        onHideCompleted: {
            if (root.state == "PAUSE_MENU") {
                pauseMenu.show(transitionDuration)
            } else if (root.state == "LEVEL_SELECTION_MENU") {
                d.showLevelSelectionMenu(transitionDuration)
            }  else if (root.state == "QUITTING") {
                root.quitRequested()
            }
        }

        onCanceled: {
            root.state = confirmQuit.quitReturnState
        }

        onConfirmed: {
            root.state = "QUITTING"
        }
    }

    SinglePlayerHud {
        id: singlePlayerHud
        objectName: "singlePlayerHud"

        anchors.fill: parent
        anchors.leftMargin: 0.01 * parent.width
        anchors.rightMargin: 0.01 * parent.width
        anchors.topMargin: 0.01 * parent.height
        anchors.bottomMargin: 0.01 * parent.height

        // We want to reset the hud (i.e. fill bar) for use in future levels, but only when
        // a level has actually been completed or abandoned (e.g. when we are going to the
        // scoring screen), and not at other times when it may be hidden (e.g. pause menu), and most
        // importantly, not while it is still visible (e.g. at the exact ending time of the level).
        onHideCompleted: {
            if (root.state != "PAUSE_MENU" && root.state != "QUIT_DIALOG") {
                reset()
            }
        }

        onPauseMenuRequested: {
            root.state = "PAUSE_MENU"
        }
    }

    MultiPlayerHud {
        id: multiPlayerHud
        objectName: "multiPlayerHud"

        anchors.fill: parent

        onPauseMenuRequested: {
            root.state = "PAUSE_MENU"
        }
    }

    SinglePlayerScoringScreen {
        id: singlePlayerScoringScreen
        objectName: "singlePlayerScoringScreen"

        anchors.fill: parent

        onPlayNextLevelRequested: {
            if (gameCompleted) {
                Engine.getSoundManager().paused = true
                root.changeLevelProgressionRequested()
                root.state = "REWARD_SCREEN"
            } else {
                root.state = "LOADING_SCREEN"
                root.playNextLevelRequested()
            }
        }

        onReplayLevelRequested: {
            root.state = "LOADING_SCREEN"
            root.playLevelRequested(currentProgression, d.currentLevelName)
        }

        onStartMenuRequested: {
            root.changeLevelProgressionRequested()
            root.state = "LEVEL_SELECTION_MENU"
        }

        onSignIntoCloudRequested: {
            root.signIntoCloudRequested()
        }

        onShowAchievementsRequested: {
            Engine.sendTrackerEvent("Ui", "ButtonPressed", "ShowAchievements")
            root.showAchievementsRequested()
        }

        onMuteBGMRequested: {
            root.muteBGMRequested()
        }

        onUnmuteBGMRequested: {
            root.unmuteBGMRequested()
        }
    }

    MultiPlayerScoringScreen {
        id: multiPlayerScoringScreen
        objectName: "multiPlayerScoringScreen"

        anchors.fill: parent

        // TODO: Make this echo single player scoring screen with a play next level requested.

        onStartMenuRequested: {
            root.changeLevelProgressionRequested()
            root.state = "LEVEL_SELECTION_MENU"
        }

        onReplayLevelRequested: {
            root.state = "LOADING_SCREEN"
            root.playLevelRequested(currentProgression, d.currentLevelName)
        }

        onSignIntoCloudRequested: {
            root.signIntoCloudRequested()
        }

        onShowAchievementsRequested: {
            Engine.sendTrackerEvent("Ui", "ButtonPressed", "ShowAchievements")
            root.showAchievementsRequested()
        }

        onMuteBGMRequested: {
            root.muteBGMRequested()
        }

        onUnmuteBGMRequested: {
            root.unmuteBGMRequested()
        }
    }

    Cinematic {
        id: rewardScreen
        objectName: "rewardScreen"

        anchors.fill: parent

        source: Util.getPathToMovie("ending.mp4")

        // When the reward screen is completely visible, we will automatically shut it down.
        onShowCompleted: {
            hide(transitionDuration)
        }

        // When the reward screen is completely hidden, we will begin to fade in the level menu.
        onHideCompleted: {
            Engine.getSoundManager().paused = false
            root.state = "LEVEL_SELECTION_MENU"
        }
    }

    VoltAirController {
        anchors.fill: parent

        enabled: visible ? (singlePlayerHud.enabled ? true : multiPlayerHud.enabled) : false
        opacity: (singlePlayerHud.opacity > 0) ? singlePlayerHud.opacity : multiPlayerHud.opacity

        onPauseRequested: {
            root.state = "PAUSE_MENU"
        }
    }

    onStateChanged: {
        activeChanged(state != "GAMEPLAY")
    }

    onSignedIntoCloudChanged: {
        pauseMenu.signedIntoCloud = signedIntoCloud
        levelSelectionMenu.signedIntoCloud = signedIntoCloud
        singlePlayerScoringScreen.signedIntoCloud = signedIntoCloud
        multiPlayerScoringScreen.signedIntoCloud = signedIntoCloud
    }

    onBgmMutedChanged: {
        levelSelectionMenu.bgmMuted = bgmMuted
        pauseMenu.bgmMuted = bgmMuted
        singlePlayerScoringScreen.bgmMuted = bgmMuted
        multiPlayerScoringScreen.bgmMuted = bgmMuted
    }

    onLevelProgressionsChanged: {
        levelSelectionMenu.levelProgressions = levelProgressions
    }

    // Capture all unhandled back navigation events to avoid quitting of the application.
    Keys.onBackPressed: {
        event.accepted = true
    }

    // Private variables / helper functions.
    QtObject {
        id: d

        property string currentLevelName
        property bool hasRequestedPause: false

        function isMultiplayerProgression() {
            if (currentProgression) {
                return currentProgression.multiplayer
            } else {
                return previousProgression && previousProgression.multiplayer
            }
        }

        function showLevelSelectionMenu(time) {
            levelSelectionMenu.showForProgression(currentProgression, time)
        }

        function showHud(duration) {
            if (isMultiplayerProgression()) {
                multiPlayerHud.show(duration)
            } else {
                singlePlayerHud.show(duration)
            }
        }

        function hideHud(duration) {
            if (isMultiplayerProgression()) {
                multiPlayerHud.hide(duration)
            } else {
                singlePlayerHud.hide(duration)
            }
        }

        function showScoringScreen(duration) {
            if (isMultiplayerProgression()) {
                multiPlayerScoringScreen.show(duration)
            } else {
                singlePlayerScoringScreen.show(duration)
            }
        }

        function hideScoringScreen(duration) {
            if (isMultiplayerProgression()) {
                multiPlayerScoringScreen.hide(duration)
            } else {
                singlePlayerScoringScreen.hide(duration)
            }
        }

        function pauseGame() {
            if (!hasRequestedPause) {
                hasRequestedPause = true
                root.pauseRequested()
            }
        }

        function unpauseGame() {
            if (hasRequestedPause || Engine.isPaused()) {
                hasRequestedPause = false
                root.resumeRequested()
            }
        }
    }
}
