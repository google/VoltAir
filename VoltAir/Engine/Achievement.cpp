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

#include <QDebug>
#include <QJsonObject>
#include <algorithm>
#include "Achievement.h"

#ifdef Q_OS_ANDROID
#include <Engine/android/AndroidActivity.h>
#endif

Achievement::Achievement(const QString& name) : mName(name) {
}

Achievement::Achievement(const QJsonObject& json) {
    if (!json.contains("Name")) {
        qDebug() << "Missing \"Name\" key.";
    } else {
        mName = json["Name"].toString();
    }

    mHasBeenRevealed = json["HasBeenRevealed"].toBool(false);
    mRevealIsDirty = json["RevealIsDirty"].toBool(false);
    mHasBeenUnlocked = json["HasBeenUnlocked"].toBool(false);
    mUnlockIsDirty = json["UnlockIsDirty"].toBool(false);
    mMinStepsSet = json["MinStepsSet"].toInt(0);
    mMinStepsDirty = json["MinStepsDirty"].toBool(false);
    mStepsIncremented = json["StepsIncremented"].toInt(0);
    mStepsIncrementedDirtiness = json["StepsIncrementedDirtiness"].toInt(0);
}

Achievement::AchievementType Achievement::getAchievementType() const {
    if (getMinStepsSet() > 0 || getStepsIncremented() > 0) {
        return INCREMENTAL;
    } else if (mHasBeenUnlocked) {
        return REGULAR;
    } else {
        // Revealed achievements could be either.
        return UNKNOWN;
    }
}

void Achievement::merge(const Achievement& achievement) {
    AchievementType ourType = getAchievementType();
    AchievementType theirType = achievement.getAchievementType();

    if (ourType != UNKNOWN && theirType != UNKNOWN && ourType != theirType) {
        qDebug() << "Error: Fundamentally cannot merge achievments of conflicting types.";
        return;
    }

    mHasBeenRevealed = mHasBeenRevealed || achievement.mHasBeenRevealed;
    mRevealIsDirty = mRevealIsDirty || achievement.mRevealIsDirty;

    if (ourType == REGULAR) {
        mHasBeenUnlocked = mHasBeenUnlocked || achievement.mHasBeenUnlocked;
        mUnlockIsDirty = mUnlockIsDirty || achievement.mUnlockIsDirty;
    } else if (ourType == INCREMENTAL) {
        mMinStepsSet = std::max(mMinStepsSet, achievement.mMinStepsSet);
        mMinStepsDirty = mMinStepsDirty || achievement.mMinStepsDirty;
        // NOTE: There is no intelligent way to know how much the increment may overlap.
        mStepsIncremented = std::max(mStepsIncremented, achievement.mStepsIncremented);
        mStepsIncrementedDirtiness = std::max(mStepsIncrementedDirtiness,
                achievement.mStepsIncrementedDirtiness);
    }
}

QJsonObject Achievement::toJsonObject() const {
    QJsonObject json;
    json["Name"] = mName;
    if (mHasBeenRevealed) {
        json["HasBeenRevealed"] = true;
    }
    if (mRevealIsDirty) {
        json["RevealIsDirty"] = true;
    }
    if (mHasBeenUnlocked) {
        json["HasBeenUnlocked"] = true;
    }
    if (mUnlockIsDirty) {
        json["UnlockIsDirty"] = true;
    }
    if (mMinStepsSet > 0) {
        json["MinStepsSet"] = mMinStepsSet;
    }
    if (mMinStepsDirty) {
        json["MinStepsDirty"] = true;
    }
    if (mStepsIncremented > 0) {
        json["StepsIncremented"] = mStepsIncremented;
    }
    if (mStepsIncrementedDirtiness > 0) {
        json["StepsIncrementedDirtiness"] = mStepsIncrementedDirtiness;
    }
    return json;
}

void Achievement::reveal(bool immediately) {
    if (!mHasBeenRevealed) {
        mHasBeenRevealed = true;
        mRevealIsDirty = !(immediately && cloudReveal());
    }
}

void Achievement::increment(int numSteps, bool immediately) {
    Q_ASSERT(getAchievementType() != REGULAR);
    if (numSteps > 0) {
        mStepsIncremented += numSteps;
        int stepsToIncrement = mStepsIncrementedDirtiness + numSteps;
        mStepsIncrementedDirtiness = !(immediately && cloudIncrement(stepsToIncrement))
                ? stepsToIncrement : 0;
    }
}

void Achievement::setSteps(int numSteps, bool immediately) {
    Q_ASSERT(getAchievementType() != REGULAR);
    if (numSteps > mMinStepsSet) {
        mMinStepsSet = numSteps;
        mMinStepsDirty = !(immediately && cloudSetSteps(numSteps));
    }
}

void Achievement::unlock(bool immediately) {
    Q_ASSERT(getAchievementType() != INCREMENTAL);
    if (!mHasBeenUnlocked) {
        mHasBeenUnlocked = true;
        mUnlockIsDirty = !(immediately && cloudUnlock());
    }
}

bool Achievement::saveToCloud() {
    if (mHasBeenRevealed && mRevealIsDirty) {
        mRevealIsDirty = !cloudReveal();
    }
    if (mHasBeenUnlocked && mUnlockIsDirty) {
        mUnlockIsDirty = !cloudUnlock();
    }
    if (mMinStepsSet > 0 && mMinStepsDirty) {
        mMinStepsDirty = !cloudSetSteps(mMinStepsSet);
    }
    if (mStepsIncremented > 0 && mStepsIncrementedDirtiness > 0) {
        mStepsIncrementedDirtiness = !cloudIncrement(mStepsIncrementedDirtiness)
            ? mStepsIncrementedDirtiness : 0;
    }
    return !mRevealIsDirty && !mUnlockIsDirty && !mMinStepsDirty && mStepsIncrementedDirtiness <= 0;
}

bool Achievement::cloudUnlock() {
#ifdef Q_OS_ANDROID
    return AndroidActivity::unlockAchievement(mName);
#else
    return true;
#endif
}

bool Achievement::cloudReveal() {
#ifdef Q_OS_ANDROID
    return AndroidActivity::revealAchievement(mName);
#else
    return true;
#endif
}

bool Achievement::cloudIncrement(int numSteps) {
#ifdef Q_OS_ANDROID
    return AndroidActivity::incrementAchievement(mName, numSteps);
#else
    Q_UNUSED(numSteps);
    return true;
#endif
}

bool Achievement::cloudSetSteps(int numSteps) {
#ifdef Q_OS_ANDROID
    return AndroidActivity::setAchievementSteps(mName, numSteps);
#else
    Q_UNUSED(numSteps);
    return true;
#endif
}
