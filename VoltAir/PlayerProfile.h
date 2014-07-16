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

#ifndef PLAYERPROFILE_H
#define PLAYERPROFILE_H

#include <QJsonArray>
#include <QJsonDocument>
#include <QMap>
#include <QObject>
#include <QSet>
#include <QSharedPointer>

class Achievement;
class Environment;
class LevelInfo;
class LevelProgression;
class LevelProgressionList;

/**
 * @brief Represents a player's profile or "save game" state.
 *
 * This class contains logic for storing information on both temporary game state information (e.g.
 * current Level scores) and more persistent game state information (e.g. which levels are unlocked,
 * stars achieved for completed levels, etc.). This persistent game state information is saved both
 * locally and to the cloud if on an Android device. To have cloud storage be successful, the
 * Android device must be signed into Google Play Games Services -- a process which can be started
 * by using signIntoCloud(). Finally, this class provides a mechanism for affecting Achievement
 * changes through Google Play Games Services.
 */
class PlayerProfile : public QObject {
    Q_OBJECT
public:
    /**
     * @brief Current status of persistent data in the player profile.
     */
    enum LoadState {
        /**
         * @brief No state has been loaded.
         */
        UNLOADED,
        /**
         * @brief In the process of loading state from local and/or cloud.
         */
        LOADING,
        /**
         * @brief Available state has been loaded from local and cloud, if necessary.
         */
        LOADED
    };

    /**
     * @brief Returns the current LoadState of the PlayerProfile.
     */
    LoadState getLoadState() const { return mLoadState; }
    /**
     * @brief Returns the LevelInfo of the level the player most recently played (or was set to
     * play) in @p progressionName.
     * @param progressionName Name of the LevelProgression to get the last played LevelInfo for
     */
    LevelInfo* getLastPlayedLevelInfo(const QString& progressionName) const;
    /**
     * @brief Returns whether or not the Environment denoted by @p environmentName in the
     * LevelProgression denoted by @p progressionName is unlocked.
     * @param progressionName Name of LevelProgression in which @p environmentName resides
     * @param environmentName Name of Environment to query for locked state
     */
    bool isEnvironmentUnlocked(const QString& progressionName,
            const QString& environmentName) const;
    /**
     * @brief Returns whether or not the Environment denoted by @p levelName in the
     * LevelProgression denoted by @p progressionName is unlocked.
     * @param progressionName Name of LevelProgression in which @p levelName resides
     * @param levelName Name of LevelInfo to query for locked state
     */
    bool isLevelUnlocked(const QString& progressionName, const QString& levelName) const;
    /**
     * @brief Returns the current score for @p playerId.
     * @note A default player ID of @c 0 is used for single player LevelProgression%s.
     * @param playerId Player ID <tt>[0, 3]</tt> of player whose score to query
     */
    int getCurrentPlayerScore(int playerId = 0) const;
    /**
     * @brief Returns the scores for all players for the current level.
     *
     * The returned value is a map from player ID to score.
     */
    const QMap<int, int>& getCurrentPlayerScores() const { return mCurrentScores; }
    /**
     * @brief Updates the current level score for @p playerId by @p amountChanged.
     * @param playerId Player ID <tt>[0, 3]</tt> of player whose score to change
     * @param amountChanged Delta value to change the score by
     */
    int updatePlayerScore(int playerId, int amountChanged);
    /**
     * @brief Returns the number of star achieved by the player on the level denoted by @p levelName
     * in the LevelProgression denoted by @p progressionName.
     * @note @p progressionName must be the name of a single player LevelProgression, since star
     * scores are only assigned for single player levels. -1 will be returned if
     * getCurrentLevelProgression()'s LevelProgression#multiplayer property is @c true.
     * @param progressionName Name of the LevelProgression in which @p levelName resides
     * @param levelName Name of the LevelInfo to query for highest number of stars achieved
     */
    int getNumStars(const QString& progressionName, const QString& levelName) const;
    /**
     * @brief Returns whether or not the player has achieved at least a minimum number of stars on
     * each level in the LevelProgression.
     * @param progressionName Name of LevelProgression to query for a minimum number of stars
     * @param minStars Threshold of stars to query for
     */
    bool hasMinStars(const QString& progressionName, int minStars) const;
    /**
     * @brief Returns whether or not the player has achieved a minimum number of stars on each
     * level in the Environment.
     * @param progressionName Name of LevelProgression in which @p environmentName resides
     * @param environmentName Name of Envirionment to query for a minimum number of stars
     * @param minStars Threshold of stars to query for
     */
    bool hasMinStars(const QString& progressionName, const QString& environmentName,
            int minStars) const;

    /**
     * @brief Unlocks a Google Play Games Services achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    void unlockAchievement(const QString& name, bool immediately);
    /**
     * @brief Increments a Google Play Games Services incremental achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param numSteps Number of steps to increment the achievement
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    void incrementAchievement(const QString& name, int numSteps, bool immediately);
    /**
     * @brief Sets a Google Play Games Services incremental achievement to have a minimum number of
     * steps.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param minSteps Lower bound for incremental progress
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    void setAchievementSteps(const QString& name, int minSteps, bool immediately);
    /**
     * @brief Reveals a Google Play Games Services achievement.
     * @note This function only has an effect on an Android device.
     * @param name Android resource name used to locate the achievement id
     * @param immediately Whether or not to sync the achievement change with Google Play Games
     * Services now
     */
    void revealAchievement(const QString& name, bool immediately);
    /**
     * @brief Requests that the PlayerProfile launch a view of the Google Play Games Services
     * achievements.
     * @note This function only has an effect on an Android device.
     */
    void showAchievements();

    /**
     * @brief Asynchronously starts a full load of the PlayerProfile from local storage and, if
     * available, cloud data.
     */
    void startLoad();
    /**
     * @brief Attempts to complete the loading of the PlayerProfile which was asynchronously started
     * with startLoad().
     * @note This call is non-blocking, and is intended to be called over time in the application's
     * main processing loop.
     * @return Whether or not the load has finished
     */
    bool tryFinishLoad();
    /**
     * @brief Saves the permanent state of the PlayerProfile to local storage and, if available,
     * cloud storage.
     */
    void save();
    /**
     * @brief Tries to push all buffered achievement state updates to the cloud.
     */
    void saveAchievementsToCloud();
    /**
     * @brief Clears the temporary and permanent data loaded into the PlayerProfile.
     * @param permanently Whether or not to wipe the PlayerProfile data from local and cloud storage
     */
    void reset(bool permanently);

    /**
     * @brief Returns whether or not the device supports cloud save.
     */
    bool hasCloudSave() const;
    /**
     * @brief Returns whether or not the player is signed into Google Play Games Services.
     */
    bool isSignedIntoCloud() const;
    /**
     * @brief Returns whether or not a previous attempt to sign into Google Play Games Services
     * failed.
     */
    bool cloudSignInFailed() const;
    /**
     * @brief Attempts to sign the player into Google Play Games Services.
     */
    void signIntoCloud();
    /**
     * @brief Signs the player out of Google Play Games Services.
     */
    void signOutOfCloud();

    /**
     * @brief Returns the PlayerProfile serialized as a JSON document.
     */
    QJsonDocument toJsonDocument();

signals:
    /**
     * @brief Emitted when new data from either local or cloud storage has been merged into the
     * PlayerProfile.
     */
    void newDataMerged();

private slots:
    void onCloudDataLoaded(int statusCode, const QString& data);
    QString onCloudDataConflict(const QString& localData, const QString& serverData);
    void onCurrentLevelAbandoned();
    /**
     * @brief Handles the level completion event for the current level in @p levelProgression.
     * @returns Whether or not the game (i.e. LevelProgression denoted by @p progressionName) has
     * ended
     */
    bool onCurrentLevelCompleted(const QString& progressionName, int numStars = -1);
    void onLevelSelected(const QString& progressionName, const QString& levelName,
            bool forceUnlock);

private:
    enum CloudLoadStatus {
        STATUS_OK = 0x0,
        STATUS_INTERNAL_ERROR = 0x01,
        STATUS_CLIENT_RECONNECT_REQUIRED = 0x02,
        STATUS_NETWORK_ERROR_STALE_DATA = 0x03,
        STATUS_NETWORK_ERROR_NO_DATA = 0x04,
        STATUS_NETWORK_ERROR_OPERATION_DEFERRED = 0x05,
        STATUS_NETWORK_ERROR_OPERATION_FAILED = 0x06,
        STATUS_DEVELOPER_ERROR = 0x07,
        STATUS_WRITE_OUT_OF_DATE_VERSION = 0x7d0,
        STATUS_WRITE_SIZE_EXCEEDED = 0x7d1,
        STATUS_STATE_KEY_NOT_FOUND = 0x7d2,
        STATUS_STATE_KEY_LIMIT_EXCEEDED = 0x7d3,
    };

    // This class is exclusively a helper for Game, and can only be construted by it.
    friend class Game;

    explicit PlayerProfile(QObject* parent = nullptr);
    PlayerProfile(const QJsonDocument& doc, const LevelProgressionList* progressionList);

    void setLevelProgressionList(const LevelProgressionList* value);
    void init();
    void merge(const PlayerProfile& other);
    int getValidPlayerStarScore(int starScore) const;
    bool startLoadFromCloud();
    bool tryFinishLoadFromCloud();
    void loadFromLocal();
    void saveToCloud();
    void saveToLocal();
    void clearCloud();
    void clearLocal();
    void clearAchievements();
    QJsonArray getAchievementsAsJsonArray() const;
    QSharedPointer<Achievement>& getAchievement(const QString& name);

    LoadState mLoadState = UNLOADED;
    bool mHasCloudData = false;

    const LevelProgressionList* mLevelProgressionList = nullptr;

    QMap<QString, QString> mLastPlayedLevels;
    QMap<QString, QSet<QString>> mUnlockedLevels;
    QMap<int, int> mCurrentScores;
    QMap<QString, QMap<QString, int>> mNumStars;
    // Achievement updates / actions.
    // NOTE: Using a QSharedPointer because regular smart pointers do not work in Qt Containers
    QMap<QString, QSharedPointer<Achievement> > mAchievements;
};
Q_DECLARE_METATYPE(PlayerProfile*)

#endif // PLAYERPROFILE_H
