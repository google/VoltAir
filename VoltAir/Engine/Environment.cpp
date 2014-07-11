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

#include "Environment.h"
#include "LevelInfo.h"
#include "LevelProgression.h"
#include "utils/Util.h"

Environment::Environment(QObject* parent) : QObject(parent) {
}

void Environment::setName(const QString& value) {
    mName = value;
    emit nameChanged();
}

QQmlListProperty<LevelInfo> Environment::getLevelInfosListProperty() {
    return Util::QQmlListPropertyOnQList<
            Environment,
            LevelInfo,
            QList<LevelInfo*>,
            &Environment::mLevelInfos,
            &Environment::levelInfosChanged>::createList(this);
}

void Environment::setBGMTrack(const QString& value) {
    mBGMTrack = value;
    emit bgmTrackChanged();
}

void Environment::setScreenshotFileName(const QString& value) {
    mScreenshotFileName = value;
    emit screenshotFileNameChanged();
}

void Environment::setAchievementToUnlockOnPassing(const QString& value) {
    mAchievementToUnlockOnPassing = value;
    emit achievementToUnlockOnPassingChanged();
}

void Environment::setAchievementToUnlockOnCompletion(const QString& value) {
    mAchievementToUnlockOnCompletion = value;
    emit achievementToUnlockOnCompletionChanged();
}

void Environment::setAchievementsToRevealOnPassing(const QStringList& value) {
    mAchievementsToRevealOnPassing = value;
    emit achievementsToRevealOnPassingChanged();
}

LevelProgression* Environment::getLevelProgression() const {
    if (!mLevelProgression) {
        mLevelProgression = qobject_cast<LevelProgression*>(parent());
    }
    return mLevelProgression;
}

LevelInfo* Environment::getLevelInfoByName(const QString& levelName) const {
    int index = getIndexOfLevelInfo(levelName);
    return index < 0 ? nullptr : mLevelInfos[index];
}

int Environment::getIndexOfLevelInfo(const QString& levelName) const {
    for (int i = 0; i < mLevelInfos.size(); ++i) {
        if (mLevelInfos[i]->getName() == levelName) {
            return i;
        }
    }
    return -1;
}
