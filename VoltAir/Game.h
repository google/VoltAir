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

#ifndef GAME_H
#define GAME_H

#include <QList>
#include "PlayerProfile.h"

class DebugMetricsMonitor;
class LevelProgression;
class LevelProgressionList;
class QObject;
class UiInternal;

/**
 * @brief The top-level Game object for VoltAir.
 *
 * This singleton class is effectively the mainline of the game as well as the parent object for all
 * game-related objects (e.g. PlayerProfile, LevelProgression).
 */
class Game : public QObject {
    Q_OBJECT
public:
    virtual ~Game();

    /**
     * @brief Initialize the game.
     *
     * This includes instantiating the UI, reading in the level progressions, player profiles
     * and making signal/slot connections to the various submodules.
     *
     */
    void init();
    /**
     * @brief Returns if any of the UI screens are active.
     */
    bool isUiActive() const { return mIsUiActive; }
    /**
     * @brief Returns the unique LevelProgressionList for the game.
     */
    LevelProgressionList* getLevelProgressionList() const { return mLevelProgressionList; }
    /**
     * @brief Informs the engine to load the current level.
     *
     * The call to the engine is only made if the PlayerProfile is loaded and it has
     * a LevelProgression from which it can get the current level to load.
     */
    void tryLoadLevel();
    /**
     * @brief Returns the unique DebugMetricsMonitor for the game.
     */
    DebugMetricsMonitor* getDebugMetricsMonitor() const { return mDebugMetricsMonitor; }
    /**
     * @brief Updates score and completes level if appropriate.
     * @param playerId Unique ID <tt>[0, 3]</tt> of the player
     * @param amountChanged Delta of the score change
     */
    void updatePlayerScore(int playerId, int amountChanged);

    /**
     * @brief Returns the main UI element.
     */
    Q_INVOKABLE UiInternal* getUi() const { return mUi; }
    /**
     * @brief Returns the current LevelProgression selected by the player.
     * @note The returned value can be non-@c null even if Engine::getLevel() is @c null.
     */
    Q_INVOKABLE LevelProgression* getCurrentLevelProgression() const {
        return mCurrentLevelProgression;
    }
    /**
     * @brief Returns the current LevelInfo selected by the player.
     * @note The returned value is always non-@c null if getCurrentLevelProgression is non-@c null.
     * That is, selections of LevelInfo can be implicit based on the previous level played in a
     * LevelProgression.
     */
    Q_INVOKABLE LevelInfo* getCurrentLevelInfo() const;
    /**
     * @brief Returns whether or not the specified environment is unlocked in the specified
     * progression.
     * @param progressionName Name of LevelProgression in which @p environmentName resides
     * @param environmentName Name of Environment whose lock status to check
     */
    Q_INVOKABLE bool isEnvironmentUnlocked(const QString& progressionName,
            const QString& environmentName) const;
    /**
     * @brief Returns whether or not the specified level is unlocked in the specified progression.
     * @param progressionName Name of LevelProgression in which @p levelName resides
     * @param levelName Name of LevelInfo whose lock status to check
     */
    Q_INVOKABLE bool isLevelUnlocked(const QString& progressionName,
            const QString& levelName) const;
    /**
     * @brief Returns the highest number of stars achieved on a level, as logged in the
     * PlayerProfile.
     * @note If @p progressionName is a multiplayer LevelProgression, this function will always
     * return a invalid (i.e. negative) star score.
     * @param progressionName Name of single player LevelProgression in which @p levelName resides
     * @param levelName Name of the LevelInfo whose number of stars is being queried
     */
    Q_INVOKABLE int getNumStars(const QString& progressionName, const QString& levelName) const;
    /**
     * @brief Returns the index of the environment last played in the specified progression.
     * @param progressionName Name of LevelProgression to query
     */
    Q_INVOKABLE int getLastPlayedEnvironmentIndex(const QString& progressionName) const;
    /**
     * @brief Returns the index of the last played level in a given environment.
     * @param progressionName Name of LevelProgression in which @p environmentName resides
     * @param environmentName Name of Environment to query
     */
    Q_INVOKABLE int getLastPlayedLevelIndexInEnvironment(const QString& progressionName,
            const QString& environmentName) const;
    /**
     * @brief Unlocks a Google Play Games Services achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    Q_INVOKABLE void unlockAchievement(const QString& name, bool immediately = true);
    /**
     * @brief Increments a Google Play Games Services incremental achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param numSteps Number of steps to increment the achievement
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    Q_INVOKABLE void incrementAchievement(const QString& name, int numSteps,
            bool immediately = false);
    /**
     * @brief Sets a Google Play Games Services incremental achievement to have a minimum number of
     * steps.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param minSteps Lower bound for incremental progress
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    Q_INVOKABLE void setAchievementSteps(const QString& name, int minSteps,
            bool immediately = false);
    /**
     * @brief Reveals a Google Play Games Services achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    Q_INVOKABLE void revealAchievement(const QString& name, bool immediately = true);

    /**
     * @brief Gets the singleton Game.
     */
    static Game* getInstance();
signals:

    /**
     * @brief Emitted on level completed.
     *
     * This is emitted upon completion of the call to onLevelCompleted().
     *
     * @param gameIsOver Whether this level completion resulted in the game being over
     * @param oneStarThreshold Threshold for a single star on the completed level
     * @param twoStarThreshold Threshold for a two stars on the completed level
     * @param threeStarThreshold Threshold for a three stars on the completed level
     * @param fourStarThreshold Threshold for a four stars on the completed level
     * @param playerScore Player's score on the completed level
     */
    void levelCompleted(bool gameIsOver, int oneStarThreshold, int twoStarThreshold,
            int threeStarThreshold, int fourStarThreshold, int playerScore);

    /**
     * @brief Emitted when a player's score changes.
     * @param playerId Unique ID of the player (0-3)
     * @param score Player's new score
     */
    void playerScoreChanged(int playerId, int score);

public slots:
    /**
     * @brief Respond to a level being completed.
     */
    void onLevelCompleted();

    /**
     * @brief Respond to a change to the state of GPGS cloud sign-in.
     * @param signedIntoCloud @c true if notifying of sign-in success
     */
    void onSignedIntoCloudChanged(bool signedIntoCloud);

    /**
     * @brief Respond to the GPGS cloud data being loaded.
     * @param statusCode Status of load, zero implying success, non-zero is error
     * @param data String encoded loaded save game data or a null string if loading error occurred
     */
    void onCloudDataLoaded(int statusCode, const QString& data);

    /**
     * @brief Respond to a conflict in the loading of GPGS cloud data.
     * @param localData String encoded local save game data that is in conflict
     * @param serverData String encoded cloud save game data that is in conflict
     * @returns JSON representing the conflicting GPGS cloud data, when possible
     */
    QString onCloudDataConflict(const QString& localData, const QString& serverData);

private slots:
    void onUiActiveChanged(bool isActive);
    void onChangeLevelProgressionRequested();
    void onChangeLevelRequested();
    void onOpeningCinematicCompleted();
    void onPlayLevelRequested(LevelProgression* levelProgression, const QString& levelName);
    void onPlayNextLevelRequested();
    void onQuitRequested();
    void onSignIntoCloudRequested();
    void onMuteBGMRequested();
    void onUnmuteBGMRequested();
    void onBeforeUpdate();
    void onAfterUpdate();
    void onLevelChanged();

private:
    struct ScoringInfo {
        int oneStarThreshold;
        int twoStarThreshold;
        int threeStarThreshold;
        int perfectScore;
    };

    Game(QObject* parent = nullptr);

    ScoringInfo getScoringInfo() const;
    int getStarScore(int playerScore) const;
    QString getLevelTrackerTag(const QString& eventName) const;
    void abandonCurrentLevel();

    DebugMetricsMonitor* mDebugMetricsMonitor = nullptr;
    bool mIsInitialized = false;
    bool mIsUiActive = false;
    volatile bool mIsPlayingLevel = false;
    LevelProgressionList* mLevelProgressionList = nullptr;
    LevelProgression* mCurrentLevelProgression = nullptr;
    PlayerProfile mPlayerProfile;
    UiInternal* mUi = nullptr;
    // Trigger Energy Crisis achievement by collecting mScoreUpdateComboAchievement points in under
    // mTimeForComboAchievement seconds.
    int mScoreUpdateComboAchievement = 10;
    float mTimeForComboAchievement = 5.0f;
    // Event queue counter for the number of score updates that have occured over the last
    // mTimeForComboAchievement seconds.
    QList<long long> mScoreUpdateTimes;

    static Game* sInstance;

    // A [0,1) value that describes where between completionThreshold and activationThreshold a two
    // star score is awarded.  A value of 0 grants two stars at exactly the completionThreshold and
    // above. A value of 0.5 would grant two stars for a score greater than or equal to the average
    // of completionThreshold and activationThreshold.
    static constexpr float TWO_STAR_THRESHOLD_FACTOR = 0.35f;
    // A [0,1) value that describes where between completionThreshold and the calculated
    // twoStarThreshold a three star score is awarded. A value of 0.5 would grant three stars for
    // a score greater than or equal to the average of completionThreshold and the calculated
    // twoStarThreshold.
    static constexpr float THREE_STAR_THRESHOLD_FACTOR = 0.5f;
};
Q_DECLARE_METATYPE(Game*)
#endif
