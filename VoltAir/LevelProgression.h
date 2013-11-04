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

#ifndef LEVELPROGRESSION_H
#define LEVELPROGRESSION_H

#include <QObject>
#include <QQmlListProperty>

class Environment;
class LevelInfo;

/**
 * @brief Grouping of related Environment%s together into a logical, ordered list.
 *
 * This class also contains metadata that defines the LevelProgression and can be used for loading
 * or displaying of it. Additionally, this class provides functions for determining the unique
 * order of the Environment%s' LevelInfo%s.
 * @note All LevelInfo%s in all resident Environment%s should be unique to the LevelProgression.
 */
class LevelProgression : public QObject {
    Q_OBJECT

    /**
     * @brief Human-readable name of the LevelProgression.
     */
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    /**
     * @brief Whether or not the LevelProgression is for multiple players.
     */
    Q_PROPERTY(bool multiplayer READ isMultiplayer WRITE setMultiplayer NOTIFY multiplayerChanged)
    /**
     * @brief QML mutable list of Envrionment%s that compose this progression.
     */
    Q_PROPERTY(QQmlListProperty<Environment> environments READ getEnvironmentsListProperty
            NOTIFY environmentsChanged)
    /**
     * @brief Total number of levels that comprise this LevelProgression.
     */
    Q_PROPERTY(int numLevels READ getNumLevels)
    /**
     * @brief Name of image asset file for the LevelProgression screenshot / thumbnail.
     */
    Q_PROPERTY(QString screenshotFileName READ getScreenshotFileName WRITE setScreenshotFileName
            NOTIFY screenshotFileNameChanged)
    /**
     * @brief Name of the achievement to unlock upon "perfecting" the progression, which is
     * defined as earning all 4 stars on each level in the progression.
     */
    Q_PROPERTY(QString achievementToUnlockOnPerfection READ getAchievementToUnlockOnPerfection
            WRITE setAchievementToUnlockOnPerfection NOTIFY achievementToUnlockOnPerfectionChanged)

public:
    /**
     * @brief Constructs a LevelProgression.
     * @param parent Parent object
     */
    explicit LevelProgression(QObject* parent = nullptr);

    /**
     * @brief Returns #name.
     */
    const QString& getName() const { return mName; }
    /**
     * @brief Sets #name.
     * @param value String to set #name to
     */
    void setName(const QString& value);
    /**
     * @brief Returns #multiplayer.
     */
    bool isMultiplayer() const { return mMultiplayer; }
    /**
     * @brief Sets #multiplayer.
     * @param value Boolean to set #multiplayer to
     */
    void setMultiplayer(bool value);
    /**
     * @brief Returns #environments.
     */
    QQmlListProperty<Environment> getEnvironmentsListProperty();
    /**
     * @brief Returns #environments as a QList.
     */
    QList<Environment*>& getEnvironments() { return mEnvironments; }
    /**
     * @brief Returns #environments as a @c const QList.
     */
    const QList<Environment*>& getEnvironments() const { return mEnvironments; }
    /**
     * @brief Returns #numLevels.
     */
    int getNumLevels() const;
    /**
     * @brief Returns #screenshotFileName.
     */
    const QString& getScreenshotFileName() const { return mScreenshotFileName; }
    /**
     * @brief Sets #screenshotFileName.
     * @param value String to set #screenshotFileName to
     */
    void setScreenshotFileName(const QString& value);
    /**
     * @brief Returns #achievementToUnlockOnPerfection.
     */
    const QString& getAchievementToUnlockOnPerfection() const {
        return mAchievementToUnlockOnPerfection;
    }
    /**
     * @brief Sets #achievementToUnlockOnPerfection.
     * @param value String to set #achievementToUnlockOnPerfection to
     */
    void setAchievementToUnlockOnPerfection(const QString& value);

    /**
     * @brief Returns whether or not the LevelProgression is for only one player.
     */
    Q_INVOKABLE bool isSinglePlayer() const { return !mMultiplayer; }
    /**
     * @brief Returns whether or not the LevelProgression contains a LevelInfo named @p levelName.
     * @param levelName Name of LevelInfo to search for
     */
    Q_INVOKABLE bool hasLevel(const QString& levelName) const;
    /**
     * @brief Returns child LevelInfo identified by @p levelName, or @c null if not found.
     * @param levelName Name of LevelInfo to search for
     */
    Q_INVOKABLE LevelInfo* getLevelInfoByName(const QString& levelName) const;
    /**
     * @brief Returns child LevelInfo representing the first level in the progression.
     */
    Q_INVOKABLE LevelInfo* getStartingLevelInfo() const;
    /**
     * @brief Returns child Environment identified by @p environmentName, or @c null if not found.
     * @param environmentName Name of Environment to search for
     */
    Q_INVOKABLE Environment* getEnvironmentByName(const QString& environmentName) const;
    /**
     * @brief Returns the index of the child Environment identified by @p environmentName, or @c -1
     * if not found.
     * @param environmentName Name of Environment to search for
     */
    Q_INVOKABLE int getIndexOfEnvironment(const QString& environmentName) const;
    /**
     * @brief Returns child Environment containing a LevelInfo identified by @p levelName, or @c
     * null if not found.
     * @param levelName Name of LevelInfo to use for retrieving the Environment
     */
    Q_INVOKABLE Environment* getEnvironmentFromLevelName(const QString& levelName) const;
    /**
     * @brief Returns index of child Environment containing a LevelInfo identified by @p levelName,
     * or @c -1 if not found.
     * @param levelName Name of LevelInfo to use for retrieving the Environment index
     */
    Q_INVOKABLE int getIndexOfEnvironmentFromLevelName(const QString& levelName) const;
    /**
     * @brief Returns the child LevelInfo representing the next level in the progression after the
     * level identified by @p currentLevelName.
     *
     * This method returns @c null and sets @p wasLastLevel to @c true if @p currentLevelName
     * represented the last level in the progression. Otherwise, this method returns @c and sets
     * @p wasLastLevel to @c false if the @p currentLevelName was not found in the progression.
     * @param currentLevelName Name of the current LevelInfo
     * @param wasLastLevel Boolean output parameter whose value denotes whether or not
     * @p currentLevelName was the last level in the progression
     */
    Q_INVOKABLE LevelInfo* getNextLevelInfo(const QString& currentLevelName,
            bool* wasLastLevel) const;
    /**
     * @brief Compares the specified levels in terms of how far in the progression they are.
     * @returns Negative if @p levelNameA @c < @p levelNameB, 0 if @p levelNameA @c == @p
     * levelNameB, and positive if @p levelNameA @c > @p levelNameB.
     * @note If both @p levelNameA and @p levelNameB are not part of the progression, then 0 will be
     * returned.
     */
    Q_INVOKABLE int compareLevels(const QString& levelNameA, const QString& levelNameB) const;

signals:
    /**
     * @brief Emitted when #name changes.
     */
    void nameChanged();
    /**
     * @brief Emitted when #multiplayer changes.
     */
    void multiplayerChanged();
    /**
     * @brief Emitted when #environments changes.
     */
    void environmentsChanged();
    /**
     * @brief Emitted when screenshotFileName changes.
     */
    void screenshotFileNameChanged();
    /**
     * @brief Emitted when #achievementToUnlockOnPerfection changes.
     */
    void achievementToUnlockOnPerfectionChanged();

private:
    QString mName;
    bool mMultiplayer = false;
    QList<Environment*> mEnvironments;
    QString mScreenshotFileName;
    QString mAchievementToUnlockOnPerfection;
};
Q_DECLARE_METATYPE(LevelProgression*)

#endif // LEVELPROGRESSION_H
