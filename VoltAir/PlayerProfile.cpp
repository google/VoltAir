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

#include <Engine/Achievement.h>
#include <Engine/Environment.h>
#include <Engine/LevelInfo.h>
#include <Engine/utils/Util.h>
#include <QDebug>
#include <QDir>
#include <QFile>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonParseError>
#include "LevelProgression.h"
#include "LevelProgressionList.h"
#include "PlayerProfile.h"

#ifdef Q_OS_ANDROID
#include "android/AndroidActivity.h"
#endif

PlayerProfile::PlayerProfile(QObject* parent) : QObject(parent) {
}

PlayerProfile::PlayerProfile(const QJsonDocument& doc,
            const LevelProgressionList* progressionList) {
    setLevelProgressionList(progressionList);

    QVariantMap stateToLoad = doc.object().toVariantMap();

    if (!stateToLoad.contains("LastPlayedLevels")) {
        qDebug() << "Missing \"LastPlayedLevels\" key.";
    } else {
        mLastPlayedLevels = Util::toMap<QString>(stateToLoad["LastPlayedLevels"].toMap());
    }

    if (!stateToLoad.contains("NumStars")) {
        qDebug() << "Missing \"NumStars\" key.";
    } else {
        mNumStars = Util::toMap<QMap<QString, int>>(stateToLoad["NumStars"].toMap());
    }

    if (!stateToLoad.contains("UnlockedLevels")) {
        qDebug() << "Missing \"UnlockedLevels\" key.";
    } else {
        mUnlockedLevels = Util::toMap<QSet<QString>>(stateToLoad["UnlockedLevels"].toMap());
    }

    if (!stateToLoad.contains("Achievements")) {
        qDebug() << "Missing \"Achievements\" key.";
    } else {
        for (const QJsonObject& object : Util::toList<QJsonObject>(
                stateToLoad["Achievements"].toList())) {
            Achievement* achievement = new Achievement(object);
            mAchievements[achievement->getName()].reset(achievement);
        }
    }
}

void PlayerProfile::setLevelProgressionList(const LevelProgressionList* value) {
    Q_ASSERT(value);
    mLevelProgressionList = value;
    init();
}

void PlayerProfile::init() {
    QVariant unlockAllLevels = mLevelProgressionList->property("unlockAllLevels");
    bool shouldUnlockAllLevels = unlockAllLevels.isValid() && unlockAllLevels.toBool();

    for (const LevelProgression* levelProgression : mLevelProgressionList->getProgressions()) {
        LevelInfo* startingLevelInfo = levelProgression->getStartingLevelInfo();
        // Make sure there is at least one environment/level.
        Q_ASSERT(startingLevelInfo);

        if (shouldUnlockAllLevels) {
            for (const Environment* environment : levelProgression->getEnvironments()) {
                for (const LevelInfo* levelInfo : environment->getLevelInfos()) {
                    mUnlockedLevels[levelProgression->getName()].insert(levelInfo->getName());
                }
            }
        } else {
            // Initialize all progressions to have the starting level unlocked.
            mUnlockedLevels[levelProgression->getName()].insert(startingLevelInfo->getName());
        }

        if (!mLastPlayedLevels.contains(levelProgression->getName())) {
            // Initialize all of our last played levels to the starting levels of the progressions
            // if it does not currently have a recently played level.
            mLastPlayedLevels[levelProgression->getName()] = startingLevelInfo->getName();
        }
    }
}

void PlayerProfile::merge(const PlayerProfile& other) {
    // Always make our current levels the furthest available in the progression.
    for (auto it = other.mLastPlayedLevels.begin(); it != other.mLastPlayedLevels.end(); ++it) {
        const LevelProgression* levelProgression =
                mLevelProgressionList->getLevelProgressionByName(it.key());
        // Check that this level progression is still relevant and that it still contains the
        // specified level.
        if (levelProgression && levelProgression->hasLevel(it.value())) {
            // Make sure that this level is unlocked in the other PlayerProfile to avoid
            // a scenario where our last played level happens to still be locked.
            Q_ASSERT(other.mUnlockedLevels.contains(it.key()));

            if (levelProgression->compareLevels(mLastPlayedLevels[it.key()], it.value()) < 0) {
                mLastPlayedLevels[it.key()] = it.value();
            }
        }
    }

    // Union our sets of unlocked levels.
    for (auto it = other.mUnlockedLevels.begin(); it != other.mUnlockedLevels.end(); ++it) {
        const LevelProgression* levelProgression =
                mLevelProgressionList->getLevelProgressionByName(it.key());
        // Check that this level progression is still relevant.
        if (levelProgression) {
            for (const QString& level : it.value()) {
                // Check that the level progression still contains the specified level.
                if (levelProgression->hasLevel(level)) {
                    mUnlockedLevels[it.key()].insert(level);
                }
            }
        }
    }

    // Merge our best star scores table.
    for (auto progIt = other.mNumStars.begin(); progIt != other.mNumStars.end(); ++progIt) {
        const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
                progIt.key());
        // Check that this level progression is still relevant.
        if (levelProgression) {
            QMap<QString, int>& levelStars = mNumStars[progIt.key()];
            for (auto levelIt = progIt.value().begin(); levelIt != progIt.value().end();
                    ++levelIt) {
                // Check that the level progression still contains the specified level.
                if (levelProgression->hasLevel(levelIt.key())) {
                    levelStars[levelIt.key()] = std::max(levelStars.value(levelIt.key(), 0),
                            levelIt.value());
                }
            }
        }
    }

    // We do not merge our current high scores because this information is not "saved" information.

    for (auto achievement : other.mAchievements) {
        getAchievement(achievement->getName())->merge(*achievement);
    }

    emit newDataMerged();
}

LevelInfo* PlayerProfile::getLastPlayedLevelInfo(const QString& progressionName) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        return nullptr;
    }
    QString lastPlayedLevelName = mLastPlayedLevels.value(progressionName);
    return levelProgression->getLevelInfoByName(lastPlayedLevelName);
}

bool PlayerProfile::isEnvironmentUnlocked(const QString& progressionName,
        const QString& environmentName) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        qDebug() << "Error:" << progressionName << "is not part of progression list";
        return false;
    }
    const Environment* environment = levelProgression->getEnvironmentByName(environmentName);
    if (!environment) {
        qDebug() << "Error: Environment" << environmentName << "is not part of progression"
                << progressionName;
        return false;
    }

    const QSet<QString>& levelSet = mUnlockedLevels[progressionName];
    for (LevelInfo* levelInfo : environment->getLevelInfos()) {
        // If any of the environment levels are unlocked, the environment is unlocked.
        if (levelSet.contains(levelInfo->getName())) {
            return true;
        }
    }
    return false;
}

bool PlayerProfile::isLevelUnlocked(const QString& progressionName,
        const QString& levelName) const {
    if (mUnlockedLevels.contains(progressionName)) {
        return mUnlockedLevels[progressionName].contains(levelName);
    } else {
        return false;
    }
}

int PlayerProfile::getCurrentPlayerScore(int playerId) const {
    return mCurrentScores[playerId];
}

int PlayerProfile::updatePlayerScore(int playerId, int amountChanged) {
    return mCurrentScores[playerId] += amountChanged;
}

int PlayerProfile::getNumStars(const QString& progressionName, const QString& levelName) const {
    if (mNumStars.contains(progressionName)) {
        return mNumStars[progressionName].value(levelName, 0);
    } else {
        return 0;
    }
}

bool PlayerProfile::hasMinStars(const QString& progressionName, int minStars) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        qDebug() << "Error:" << progressionName << "is not part of progression list";
        return false;
    }
    for (const Environment* environment : levelProgression->getEnvironments()) {
        if (!hasMinStars(progressionName, environment->getName(), minStars)) {
            return false;
        }
    }
    return true;
}

bool PlayerProfile::hasMinStars(const QString& progressionName, const QString& environmentName,
        int minStars) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        qDebug() << "Error:" << progressionName << "is not part of progression list";
        return false;
    }
    const Environment* environment = levelProgression->getEnvironmentByName(environmentName);
    if (!environment) {
        qDebug() << "Error: Environment" << environmentName << "is not part of progression"
                << progressionName;
        return false;
    }
    for (const LevelInfo* levelInfo : environment->getLevelInfos()) {
        if (getNumStars(progressionName, levelInfo->getName()) < minStars) {
            return false;
        }
    }
    return true;
}

int PlayerProfile::getValidPlayerStarScore(int starScore) const {
    return Util::clamp(starScore, 0, 4);
}

void PlayerProfile::onCurrentLevelAbandoned() {
    // No need to save high scores, as we have done that with all of the updates.
    mCurrentScores.clear();
}

bool PlayerProfile::onCurrentLevelCompleted(const QString& progressionName, int numStars) {
    const LevelProgression* currentLevelProgression =
            mLevelProgressionList->getLevelProgressionByName(progressionName);
    const LevelInfo* currentLevelInfo = getLastPlayedLevelInfo(progressionName);
    if (!currentLevelProgression || !currentLevelInfo) {
        return false;
    }

    bool progressionIsOver = false;
    LevelInfo* nextLevelInfo = currentLevelProgression->getNextLevelInfo(
            currentLevelInfo->getName(), &progressionIsOver);
    Q_ASSERT(nextLevelInfo || progressionIsOver);

    // Update best star score.
    if (currentLevelProgression->isSinglePlayer()) {
        QMap<QString, int>& levelStars = mNumStars[progressionName];
        levelStars[currentLevelInfo->getName()] = std::max(levelStars[currentLevelInfo->getName()],
                numStars);
    }

    // Clear state for current level.
    mCurrentScores.clear();

    if (progressionIsOver) {
        // Wrap current level back to beginning of progression once it is over.
        nextLevelInfo = currentLevelProgression->getStartingLevelInfo();
    }

    mLastPlayedLevels[progressionName] = nextLevelInfo->getName();
    mUnlockedLevels[progressionName].insert(nextLevelInfo->getName());
    return progressionIsOver;
}

void PlayerProfile::onLevelSelected(const QString& progressionName, const QString& levelName,
        bool forceUnlock) {
    const LevelProgression* currentLevelProgression =
            mLevelProgressionList->getLevelProgressionByName(progressionName);
    if (!currentLevelProgression) {
        return;
    }

    if (currentLevelProgression->hasLevel(levelName)) {
        // Clear any state for the current level.
        mCurrentScores.clear();
        if (!mUnlockedLevels[progressionName].contains(levelName)) {
            if (forceUnlock) {
                qDebug() << "Warning: Unlocking level prematurely, could cause issues.";
                mUnlockedLevels[progressionName].insert(levelName);
            } else {
                Q_ASSERT("Level is not unlocked" && forceUnlock);
                return;
            }
        }
        mLastPlayedLevels[progressionName] = levelName;
    } else {
        qDebug() << "Error: Level" << levelName << "is not in current progression"
                << progressionName;
    }
}

void PlayerProfile::unlockAchievement(const QString& name, bool immediately) {
    getAchievement(name)->unlock(immediately);
}

void PlayerProfile::incrementAchievement(const QString& name, int numSteps, bool immediately) {
    getAchievement(name)->increment(numSteps, immediately);
}

void PlayerProfile::setAchievementSteps(const QString& name, int minSteps, bool immediately) {
    getAchievement(name)->setSteps(minSteps, immediately);
}

void PlayerProfile::revealAchievement(const QString& name, bool immediately) {
    getAchievement(name)->reveal(immediately);
}

void PlayerProfile::showAchievements() {
#ifdef Q_OS_ANDROID
    AndroidActivity::showAchievementsRequested();
#endif
    // TODO: If we want to show our achievements on Mac, we will have to build a whole Ui flow for
    // it.
}

void PlayerProfile::startLoad() {
    reset(false);

    // TODO: Implement a maximum number of tries to start a cloud load.
    // Currently this only fails if the activity is hidden from view.
    if (startLoadFromCloud()) {
        mLoadState = LOADING;
        loadFromLocal();
    }
}

bool PlayerProfile::tryFinishLoad() {
    if (mLoadState != LOADING) {
        qDebug() << "Cannot finish a load that was not started";
        return true;
    }

    if (!tryFinishLoadFromCloud()) {
        return false;
    }

    mLoadState = LOADED;

    return true;
}

void PlayerProfile::save() {
    // NOTE: Must try to save to cloud first as we do not need to write out achievement changes
    // locally that were already uploaded to the cloud
    // TODO: Refactor to possibly re-use Json conversion
    saveToCloud();
    saveToLocal();
}

void PlayerProfile::reset(bool permanently) {
    mLoadState = UNLOADED;
    mHasCloudData = false;

    mLastPlayedLevels.clear();
    mUnlockedLevels.clear();
    mNumStars.clear();
    mCurrentScores.clear();
    mAchievements.clear();

    if (permanently) {
        // TODO: Make sure the sure the user has been prompted with an "are you sure?"
        clearAchievements();
        clearLocal();
        clearCloud();
    }

    init();
}

bool PlayerProfile::hasCloudSave() const {
#ifdef Q_OS_ANDROID
    return true;
#else
    return false;
#endif
}

bool PlayerProfile::isSignedIntoCloud() const {
#ifdef Q_OS_ANDROID
    return AndroidActivity::isSignedIntoCloud();
#else
    return false;
#endif
}

bool PlayerProfile::cloudSignInFailed() const {
#ifdef Q_OS_ANDROID
    return AndroidActivity::cloudSignInFailed();
#else
    return false;
#endif
}

void PlayerProfile::signIntoCloud() {
#ifdef Q_OS_ANDROID
    AndroidActivity::signIntoCloud();
#endif
}

void PlayerProfile::signOutOfCloud() {
#ifdef Q_OS_ANDROID
    AndroidActivity::signOutOfCloud();
#endif
}

QJsonDocument PlayerProfile::toJsonDocument() {
    QJsonObject playerProfile;
    playerProfile["LastPlayedLevels"] = QJsonObject::fromVariantMap(Util::toVariantMap(
            mLastPlayedLevels));
    playerProfile["NumStars"] = QJsonObject::fromVariantMap(Util::toVariantMap(mNumStars));
    playerProfile["UnlockedLevels"] = QJsonObject::fromVariantMap(Util::toVariantMap(
            mUnlockedLevels));
    playerProfile["Achievements"] = getAchievementsAsJsonArray();

    QJsonDocument doc;
    doc.setObject(playerProfile);
    return doc;
}

void PlayerProfile::onCloudDataLoaded(int statusCode, const QString& data) {
    mHasCloudData = true;

    // TODO: either notify the user of relevant information here in this C++ callback or in the java
    // Android Activity
    if (statusCode != STATUS_OK && statusCode != STATUS_NETWORK_ERROR_STALE_DATA) {
        qDebug() << "Error loading cloud data:" << statusCode;
        return;
    }

    QJsonParseError err;
    QJsonDocument doc = QJsonDocument::fromJson(data.toUtf8(), &err);
    if (err.error != QJsonParseError::NoError) {
        qDebug() << "Error parsing cloud save data" << err.errorString();
    } else {
        PlayerProfile playerProfile(doc, mLevelProgressionList);
        merge(playerProfile);
        qDebug() << "Successfully merged cloud save data!";
    }
}

QString PlayerProfile::onCloudDataConflict(const QString& localData, const QString& serverData) {
    QJsonParseError localDataErr;
    QJsonParseError serverDataErr;
    QJsonDocument localJson = QJsonDocument::fromJson(localData.toUtf8(), &localDataErr);
    QJsonDocument serverJson = QJsonDocument::fromJson(serverData.toUtf8(), &serverDataErr);

    if (localDataErr.error != QJsonParseError::NoError
            && serverDataErr.error != QJsonParseError::NoError) {
        qDebug() << "Error parsing local" << localDataErr.errorString()
                << "and cloud" << serverDataErr.errorString() << "conflict data.";
        // Nothing we can do but return the current state
        return QString::fromUtf8(toJsonDocument().toJson());
    } else if (localDataErr.error != QJsonParseError::NoError) {
       qDebug() << "Error parsing local conflict data" << localDataErr.errorString();
       PlayerProfile serverPlayerProfile(serverJson, mLevelProgressionList);
       return QString::fromUtf8(serverPlayerProfile.toJsonDocument().toJson());
    } else if (serverDataErr.error != QJsonParseError::NoError) {
        qDebug() << "Error parsing cloud conflict data" << serverDataErr.errorString();
        PlayerProfile localPlayerProfile(localJson, mLevelProgressionList);
        return QString::fromUtf8(localPlayerProfile.toJsonDocument().toJson());
    } else {
        PlayerProfile localPlayerProfile(localJson, mLevelProgressionList);
        PlayerProfile serverPlayerProfile(serverJson, mLevelProgressionList);
        localPlayerProfile.merge(serverPlayerProfile);
        return QString::fromUtf8(localPlayerProfile.toJsonDocument().toJson());
    }
}

bool PlayerProfile::startLoadFromCloud() {
#ifdef Q_OS_ANDROID
    if (!AndroidActivity::isStarted()) {
        return false;
    }
    // Can ignore return value for now, just need to kick off a sync if possible
    AndroidActivity::ensureCloudSync();
#endif
    return true;
}

bool PlayerProfile::tryFinishLoadFromCloud() {
    if (mHasCloudData) {
        mHasCloudData = false;
        return true;
    }
#ifdef Q_OS_ANDROID
    // If we are currently stopped, we cannot check on the state of cloud sync.
    // Additionally, if cloud is still syncing, we are not finished.
    // TODO: Implement a maximum number of times to check (even though Play Services should
    // timeout).
    if (!AndroidActivity::isStarted() || AndroidActivity::ensureCloudSync()) {
        return false;
    }
#endif
    return true;
}

void PlayerProfile::loadFromLocal() {
#if defined(Q_OS_ANDROID)
    QFile playerProfileFile(QString("%1/playerProfile.json").arg(QDir::homePath()));
    if (playerProfileFile.exists()) {
        playerProfileFile.open(QIODevice::ReadOnly | QIODevice::Text);
        QString playerProfileText = playerProfileFile.readAll();
        playerProfileFile.close();

        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(playerProfileText.toUtf8(), &err);
        if (err.error != QJsonParseError::NoError) {
            qDebug() << "Error parsing JSON file playerProfile.json:" << err.errorString();
        } else {
            PlayerProfile playerProfile(doc, mLevelProgressionList);
            merge(playerProfile);
            return;
        }
    }
#endif
}

void PlayerProfile::saveToCloud() {
    // NOTE: Must try to push achievement updates to cloud first as we do not need to write out
    // achievement changes in our cloud state that were already synced to the cloud
    saveAchievementsToCloud();
#ifdef Q_OS_ANDROID
    AndroidActivity::saveToCloud(QString::fromUtf8(toJsonDocument().toJson()));
#endif
}

void PlayerProfile::saveAchievementsToCloud() {
    // NOTE: Cannot iterate over the QSharedPointers, as that would invoke the copy constructor
    // which indirectly tries to increase a reference count using QBasicAtomicInteger, but this
    // blows up on the render thread with a SIGSEV
    for (const QString& name : mAchievements.keys()) {
        mAchievements[name]->saveToCloud();
    }
}

void PlayerProfile::saveToLocal() {
    // TODO: Decide if we want to also save state on Mac as writing to QFile would also work on Mac
#ifdef Q_OS_ANDROID
    QFile playerProfileFile(QString("%1/playerProfile.json").arg(QDir::homePath()));
    playerProfileFile.open(QIODevice::WriteOnly | QIODevice::Text);
    playerProfileFile.write(toJsonDocument().toJson());
    playerProfileFile.close();
#endif
}

QJsonArray PlayerProfile::getAchievementsAsJsonArray() const {
    QJsonArray json;
    for (auto achievement : mAchievements) {
        json.append(achievement->toJsonObject());
    }
    return json;
}

QSharedPointer<Achievement>& PlayerProfile::getAchievement(const QString &name) {
    auto& achievement = mAchievements[name];
    if (!achievement) {
        achievement.reset(new Achievement(name));
    }
    return achievement;
}

void PlayerProfile::clearCloud() {
#ifdef Q_OS_ANDROID
    AndroidActivity::clearCloudData();
#endif
}

void PlayerProfile::clearLocal() {
#ifdef Q_OS_ANDROID
    QFile playerProfileFile(QString("%1/playerProfile.json").arg(QDir::homePath()));
    playerProfileFile.remove();
#endif
}

void PlayerProfile::clearAchievements() {
    mAchievements.clear();
#ifdef Q_OS_ANDROID
    AndroidActivity::resetAchievementsRequested();
#endif
}
