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

#ifndef ENVIRONMENT_H
#define ENVIRONMENT_H

#include <QObject>
#include <QQmlListProperty>
#include <QString>

class LevelInfo;
class LevelProgression;

/**
 * @ingroup Engine
 * @brief Grouping of related LevelInfo%s together into an logical, ordered list.
 *
 * This class also contains metadata that defines the Environment and can be used for loading or
 * displaying of it.
 * @note Each LevelInfo in the list of LevelInfo%s that comprise an environment is unique to the
 * Environment, and, importantly should also be unique across all Environment%s that comprise a
 * LevelProgression.
 */
class Environment : public QObject {
    Q_OBJECT

    /**
     * @brief Human-readable name of the Environment.
     */
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    /**
     * @brief QML mutable list of levels that compose the Environment.
     */
    Q_PROPERTY(QQmlListProperty<LevelInfo> levelInfos READ getLevelInfosListProperty
            NOTIFY levelInfosChanged)
    /**
     * @brief Name of sound asset file to be played in a loop as background music.
     */
    Q_PROPERTY(QString bgmTrack READ getBGMTrack WRITE setBGMTrack NOTIFY bgmTrackChanged)
    /**
     * @brief Name of image asset file for the Environment screenshot / thumbnail.
     */
    Q_PROPERTY(QString screenshotFileName READ getScreenshotFileName WRITE setScreenshotFileName
            NOTIFY screenshotFileNameChanged)
    /**
     * @brief Name of the achievement to unlock upon "passing" the environment, which is defined as
     * minimally earning 1 star on each level in the environment.
     */
    Q_PROPERTY(QString achievementToUnlockOnPassing READ getAchievementToUnlockOnPassing
            WRITE setAchievementToUnlockOnPassing NOTIFY achievementToUnlockOnPassingChanged)
    /**
     * @brief Name of the achievement to unlock upon "completing" the environment, which is defined
     * as minimally earning 3 stars on each level in the environment.
     */
    Q_PROPERTY(QString achievementToUnlockOnCompletion READ getAchievementToUnlockOnCompletion
            WRITE setAchievementToUnlockOnCompletion NOTIFY achievementToUnlockOnCompletionChanged)
    /**
     * @brief Names of the achievements to reveal upon "passing" the environment, which is defined
     * as minimally earning 1 star on each level in the environment.
     */
    Q_PROPERTY(QStringList achievementsToRevealOnPassing READ getAchievementsToRevealOnPassing
            WRITE setAchievementsToRevealOnPassing NOTIFY achievementsToRevealOnPassingChanged)
    /**
     * @brief LevelProgression to which this LevelInfo belongs, or @c nullptr if defined out of the
     * context of a LevelProgression.
     */
    Q_PROPERTY(LevelProgression* levelProgression READ getLevelProgression)

public:
    /**
     * @brief Constructs an Environment.
     * @param parent Parent object
     */
    explicit Environment(QObject* parent = nullptr);

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
     * @brief Returns #levelInfos as a QList.
     */
    QList<LevelInfo*>& getLevelInfos() { return mLevelInfos; }
    /**
     * @brief Returns #levelInfos as a @c const QList.
     */
    const QList<LevelInfo*>& getLevelInfos() const { return mLevelInfos; }
    /**
     * @brief Returns #levelInfos.
     */
    QQmlListProperty<LevelInfo> getLevelInfosListProperty();
    /**
     * @brief Returns #bgmTrack.
     */
    const QString& getBGMTrack() const { return mBGMTrack; }
    /**
     * @brief Sets #bgmTrack.
     * @param value String to set #bgmTrack to
     */
    void setBGMTrack(const QString& value);
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
     * @brief Returns #achievementToUnlockOnPassing.
     */
    const QString& getAchievementToUnlockOnPassing() const { return mAchievementToUnlockOnPassing; }
    /**
     * @brief Sets #achievementToUnlockOnPassing.
     * @param value String to set #achievementToUnlockOnPassing to
     */
    void setAchievementToUnlockOnPassing(const QString& value);
    /**
     * @brief Returns #achievementToUnlockOnCompletion.
     */
    const QString& getAchievementToUnlockOnCompletion() const {
        return mAchievementToUnlockOnCompletion;
    }
    /**
     * @brief Sets #achievementToUnlockOnCompletion.
     * @param value String to set #achievementToUnlockOnCompletion to
     */
    void setAchievementToUnlockOnCompletion(const QString& value);
    /**
     * @brief Returns #achievementsToRevealOnPassing.
     */
    QStringList& getAchievementsToRevealOnPassing() { return mAchievementsToRevealOnPassing; }
    /**
     * @brief Returns #achievementsToRevealOnPassing.
     */
    const QStringList& getAchievementsToRevealOnPassing() const {
        return mAchievementsToRevealOnPassing;
    }
    /**
     * @brief Sets #achievementsToRevealOnPassing.
     * @param value List of strings to set #achievementsToRevealOnPassing to
     */
    void setAchievementsToRevealOnPassing(const QStringList& value);
    /**
     * @brief Returns #levelProgression.
     */
    LevelProgression* getLevelProgression() const;

    /**
     * @brief Returns the child LevelInfo identified by @p levelName, or @c nullptr if not found.
     * @param levelName Name of LevelInfo to search for
     */
    Q_INVOKABLE LevelInfo* getLevelInfoByName(const QString& levelName) const;
    /**
     * @brief Returns the index of the child LevelInfo identified by @p levelName, or @c -1 if not
     * found.
     * @param levelName Name of LevelInfo to search for
     */
    Q_INVOKABLE int getIndexOfLevelInfo(const QString& levelName) const;

signals:
    /**
     * @brief Emitted when #name changes.
     */
    void nameChanged();
    /**
     * @brief Emitted when #levelInfos changes.
     */
    void levelInfosChanged();
    /**
     * @brief Emitted when #bgmTrack changes.
     */
    void bgmTrackChanged();
    /**
     * @brief Emitted when #screenshotFileName changes.
     */
    void screenshotFileNameChanged();
    /**
     * @brief Emitted when #achievementToUnlockOnPassing changes.
     */
    void achievementToUnlockOnPassingChanged();
    /**
     * @brief Emitted when #achievementToUnlockOnCompletion changes.
     */
    void achievementToUnlockOnCompletionChanged();
    /**
     * @brief Emitted when #achievementsToRevealOnPassing changes.
     */
    void achievementsToRevealOnPassingChanged();

private:
    QString mName;
    QList<LevelInfo*> mLevelInfos;
    QString mBGMTrack;
    QString mScreenshotFileName;
    QString mAchievementToUnlockOnPassing;
    QString mAchievementToUnlockOnCompletion;
    QStringList mAchievementsToRevealOnPassing;
    mutable LevelProgression* mLevelProgression = nullptr;
};
Q_DECLARE_METATYPE(Environment*)

#endif // ENVIRONMENT_H
