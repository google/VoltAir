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

#ifndef UIINTERNAL_H
#define UIINTERNAL_H

#include <QQuickItem>

class LevelProgression;
class LevelProgressionList;

/**
 * @ingroup QQuickItem
 * @brief Internal backing C++ class for the Ui QML item.
 *
 * This class is necessary so Game can connect signals and slots to the Ui for communication.
 * Specifically, in C++ there does not exist a way of connecting a signal to a QML /
 * JavaScript-based slot, nor does there exist a way to connect a signal dynamically defined in QML
 * to a C++ slot in C++ -- both of which are required for Game to communicate with Ui.
 */
class UiInternal : public QQuickItem {
    Q_OBJECT

    /**
     * @brief Whether or not the player is currently signed into Google Play Games Services.
     */
    Q_PROPERTY(bool signedIntoCloud READ isSignedIntoCloud WRITE setSignedIntoCloud
            NOTIFY signedIntoCloudChanged)
    /**
     * @brief Whether or not the background music is currently muted.
     */
    Q_PROPERTY(bool bgmMuted READ isBGMMuted WRITE setBGMMuted NOTIFY bgmMutedChanged)
    /**
     * @brief Unique LevelProgressionList for the game.
     */
    Q_PROPERTY(LevelProgressionList* levelProgressions READ getLevelProgressionList
            WRITE setLevelProgressionList NOTIFY levelProgressionsChanged)
    /**
     * @brief LevelProgression currently being played.
     */
    Q_PROPERTY(LevelProgression* currentProgression READ getCurrentProgression
            WRITE setCurrentProgression NOTIFY currentProgressionChanged)
    /**
     * @brief LevelProgression previously played.
     */
    Q_PROPERTY(LevelProgression* previousProgression READ getPreviousProgression
            NOTIFY previousProgressionChanged)
    /**
     * @brief Name of sound asset file to be played in a loop as background music while the menu
     * is showing.
     */
    Q_PROPERTY(QString menuBGMTrack READ getMenuBGMTrack WRITE setMenuBGMTrack
            NOTIFY menuBGMTrackChanged)

public:
    /**
     * @brief Returns #signedIntoCloud.
     */
    bool isSignedIntoCloud() const { return mSignedIntoCloud; }
    /**
     * @brief Sets #signedIntoCloud.
     * @param value Boolean to set #signedIntoCloud to
     */
    void setSignedIntoCloud(bool value);
    /**
     * @brief Returns #bgmMuted.
     */
    bool isBGMMuted() const { return mBGMMuted; }
    /**
     * @brief Sets #bgmMuted.
     * @param value Boolean to set #bgmMuted to
     */
    void setBGMMuted(bool value);
    /**
     * @brief Returns #levelProgressions.
     */
    LevelProgressionList* getLevelProgressionList() const { return mLevelProgressionList; }
    /**
     * @brief Sets #levelProgressions.
     * @param value LevelProgressionList to set #levelProgressions to
     */
    void setLevelProgressionList(LevelProgressionList* value);
    /**
     * @brief Returns #currentProgression.
     */
    LevelProgression* getCurrentProgression() const { return mCurrentProgression; }
    /**
     * @brief Sets #currentProgression.
     * @param value LevelProgression to set #currentProgression to
     */
    void setCurrentProgression(LevelProgression* value);
    /**
     * @brief Returns #previousProgression.
     */
    LevelProgression* getPreviousProgression() const { return mPreviousProgression; }
    /**
     * @brief Returns #menuBGMTrack.
     */
    const QString& getMenuBGMTrack() const { return mMenuBGMTrack; }
    /**
     * @brief Sets #menuBGMTrack.
     * @param value String to set #menuBGMTrack to
     */
    void setMenuBGMTrack(const QString& value);

    /**
     * @brief Called by Game when attempting to start the UI.
     * @note This function merely forwards the call to a JavaScript method of the same name in @c
     * this.
     */
    void tryStart();

public slots:
    /**
     * @brief Passes information about the current level to the UI.
     * @note This function merely forwards the call to an equivalent JavaScript method in @c this.
     * @param levelName Name of the level
     * @param completionThreshold How many points are needed to complete the level
     * @param activationThreshold How many points are needed to pass the level
     */
    void onLevelChanged(const QString& levelName, int completionThreshold, int activationThreshold);
    /**
     * @brief Notifies the UI when the level is completed.
     * @note This function merely forwards the call to an equivalent JavaScript method in @c this.
     * @param gameCompleted Whether or not the game was completed
     * @param oneStarThreshold How many points are needed to win one star
     * @param twoStarThreshold How many points are needed to win two stars
     * @param threeStarThreshold How many points are needed to win three stars
     * @param fourStarThreshold How many points are needed to win four stars
     * @param playerScore Score achieved by the player
     */
    void onLevelCompleted(bool gameCompleted, int oneStarThreshold, int twoStarThreshold,
            int threeStarThreshold, int fourStarThreshold, int playerScore);
    /**
     * @brief Notifies the UI when a player's activation changes.
     * @note This function merely forwards the call to an equivalent JavaScript method in @c this.
     * @param player Player that had their activation change
     * @param active Active state to set the player to
     */
    void onPlayerActivationChanged(int player, bool active);
    /**
     * @brief Notifies the Ui when a player's score changes.
     * @note This function merely forwards the call to an equivalent JavaScript method in @c this.
     * @param player Player whose score changed
     * @param score Updated player score
     */
    void onPlayerScoreChanged(int player, int score);
    /**
     * @brief Notifies the Ui when the player data profile has been updated with new data.
     * @note This function merely forwards the call to an equivalent JavaScript method in @c this.
     */
    void onPlayerDataChanged();

signals:
    /**
     * @brief Emitted when #signedIntoCloud changes.
     */
    void signedIntoCloudChanged();
    /**
     * @brief Emitted when #bgmMuted changes.
     */
    void bgmMutedChanged();
    /**
     * @brief Emitted when #levelProgressions changes.
     */
    void levelProgressionsChanged();
    /**
     * @brief Emitted when #currentProgression changes.
     */
    void currentProgressionChanged();
    /**
     * @brief Emitted when #previousProgression changes.
     */
    void previousProgressionChanged();
    /**
     * @brief Emitted when #menuBGMTrack changes.
     */
    void menuBGMTrackChanged();

    // TODO: Refactor to not need this signal (or at least, use a more generic signal).
    /**
     * @brief Emitted when the opening cinematic movie is done showing.
     */
    void openingCinematicCompleted();
    /**
     * @brief Emitted when the UI requests the Game to be paused.
     */
    void pauseRequested();
    /**
     * @brief Emitted when the UI requests the Game to be resumed.
     */
    void resumeRequested();
    /**
     * @brief Emitted when the player uses the UI to quit the game.
     */
    void quitRequested();
    /**
     * @brief Emitted when the player uses the UI to select a level to play.
     * @param levelProgression LevelProgression in which @p levelName resides
     * @param levelName Name of level to play
     */
    void playLevelRequested(LevelProgression* levelProgression, const QString& levelName);
    /**
     * @brief Emitted when the player uses the UI to change the current LevelProgression.
     */
    void changeLevelProgressionRequested();
    /**
     * @brief Emitted when the player uses the UI to change the current level but while staying
     * in the same LevelProgression.
     */
    void changeLevelRequested();
    /**
     * @brief Emitted when the player uses the UI to show their Google Play Games Services
     * achievements.
     */
    void showAchievementsRequested();
    /**
     * @brief Emitted when UI changes its foregrounded state.
     *
     * If @p isActive, a UI menu is showing and the game is paused, else the UI is subdued into a
     * simple HUD overlay while the game is running.
     * @param isActive Whether or not the UI is currently active
     */
    void activeChanged(bool isActive);
    /**
     * @brief Emitted when the player uses the UI to play the next level in the LevelProgression.
     */
    void playNextLevelRequested();
    /**
     * @brief Emitted when the player uses the UI to try to sign into Google Play Games Services.
     */
    void signIntoCloudRequested();
    /**
     * @brief Emitted when the player uses the UI to try to mute the background music.
     */
    void muteBGMRequested();
    /**
     * @brief Emitted when the player uses the UI to try to unmute the background music.
     */
    void unmuteBGMRequested();

private:
    bool mSignedIntoCloud = false;
    bool mBGMMuted = false;
    LevelProgressionList* mLevelProgressionList = nullptr;
    LevelProgression* mCurrentProgression = nullptr;
    LevelProgression* mPreviousProgression = nullptr;
    QString mMenuBGMTrack;
};
Q_DECLARE_METATYPE(UiInternal*)

#endif // UIINTERNAL_H
