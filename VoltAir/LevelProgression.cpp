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

#include <Engine/Environment.h>
#include <Engine/LevelInfo.h>
#include <Engine/utils/Util.h>
#include "LevelProgression.h"

LevelProgression::LevelProgression(QObject* parent) : QObject(parent) {
}

void LevelProgression::setName(const QString& value) {
    mName = value;
    emit nameChanged();
}

void LevelProgression::setMultiplayer(bool value) {
    mMultiplayer = value;
    emit multiplayerChanged();
}

QQmlListProperty<Environment> LevelProgression::getEnvironmentsListProperty() {
    return Util::QQmlListPropertyOnQList<
            LevelProgression,
            Environment,
            QList<Environment*>,
            &LevelProgression::mEnvironments,
            &LevelProgression::environmentsChanged>::createList(this);
}

void LevelProgression::setScreenshotFileName(const QString& value) {
    mScreenshotFileName = value;
    emit screenshotFileNameChanged();
}

void LevelProgression::setAchievementToUnlockOnPerfection(const QString& value) {
    mAchievementToUnlockOnPerfection = value;
    emit achievementToUnlockOnPerfectionChanged();
}

bool LevelProgression::hasLevel(const QString& levelName) const {
    return getEnvironmentFromLevelName(levelName);
}

LevelInfo* LevelProgression::getLevelInfoByName(const QString& levelName) const {
    for (const Environment* environment : mEnvironments) {
        LevelInfo* levelInfo = environment->getLevelInfoByName(levelName);
        if (levelInfo) {
            return levelInfo;
        }
    }
    return nullptr;
}

LevelInfo* LevelProgression::getStartingLevelInfo() const {
    if (mEnvironments.isEmpty() || mEnvironments[0]->getLevelInfos().isEmpty()) {
        return nullptr;
    } else {
        return mEnvironments[0]->getLevelInfos()[0];
    }
}

Environment* LevelProgression::getEnvironmentByName(const QString& environmentName) const {
    int index = getIndexOfEnvironment(environmentName);
    return index < 0 ? nullptr : mEnvironments[index];
}

int LevelProgression::getIndexOfEnvironment(const QString& environmentName) const {
    for (int i = 0; i < mEnvironments.size(); ++i) {
        if (mEnvironments[i]->getName() == environmentName) {
            return i;
        }
    }
    return -1;
}

Environment* LevelProgression::getEnvironmentFromLevelName(const QString& levelName) const {
    int index = getIndexOfEnvironmentFromLevelName(levelName);
    return index < 0 ? nullptr : mEnvironments[index];
}

int LevelProgression::getIndexOfEnvironmentFromLevelName(const QString& levelName) const {
    for (int i = 0; i < mEnvironments.size(); ++i) {
        if (mEnvironments[i]->getLevelInfoByName(levelName)) {
            return i;
        }
    }
    return -1;
}

int LevelProgression::getNumLevels() const {
    int numLevels = 0;
    for (const Environment* environment : mEnvironments) {
        numLevels += environment->getLevelInfos().size();
    }
    return numLevels;
}

LevelInfo* LevelProgression::getNextLevelInfo(const QString& currentLevelName,
        bool* wasLastLevel) const {
    Q_ASSERT(wasLastLevel);

    int envNum = getIndexOfEnvironmentFromLevelName(currentLevelName);
    if (envNum < 0) {
        *wasLastLevel = false;
        return nullptr;
    }
    int sectionNum = mEnvironments[envNum]->getIndexOfLevelInfo(currentLevelName);

    const QList<LevelInfo*>& envLevelList = mEnvironments[envNum]->getLevelInfos();
    bool isLastEnvironment = envNum == mEnvironments.size() - 1;
    bool isLastLevel = sectionNum == envLevelList.size() - 1;

    if (isLastLevel && isLastEnvironment) {
        *wasLastLevel = true;
        return nullptr;
    } else if (isLastLevel) {
        const QList<LevelInfo*>& nextEnvLevelList = mEnvironments[envNum + 1]->getLevelInfos();
        Q_ASSERT(!nextEnvLevelList.isEmpty());
        return nextEnvLevelList[0];
    } else {
        return envLevelList[sectionNum + 1];
    }
}

int LevelProgression::compareLevels(const QString& levelNameA, const QString& levelNameB) const {
    int envNumA = getIndexOfEnvironmentFromLevelName(levelNameA);
    int envNumB = getIndexOfEnvironmentFromLevelName(levelNameB);
    int envDiff = envNumA - envNumB;
    if (envDiff != 0) {
        // Different environment, so just return envDiff.
        // Note: If both were not found, then the compare is undefined and are "equal".
        return envDiff;
    } else {
        int sectionNumA = mEnvironments[envNumA]->getIndexOfLevelInfo(levelNameA);
        int sectionNumB = mEnvironments[envNumB]->getIndexOfLevelInfo(levelNameB);
        // Same environment, so compare the section numbers.
        return sectionNumA - sectionNumB;
    }
}
