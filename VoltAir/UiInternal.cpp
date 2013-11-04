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

#include <Engine/utils/Util.h>
#include <QMetaObject>
#include "UiInternal.h"

void UiInternal::setSignedIntoCloud(bool value) {
    mSignedIntoCloud = value;
    emit signedIntoCloudChanged();
}

void UiInternal::setBGMMuted(bool value) {
    mBGMMuted = value;
    emit bgmMutedChanged();
}

void UiInternal::setLevelProgressionList(LevelProgressionList* value) {
    mLevelProgressionList = value;
    emit levelProgressionsChanged();
}

void UiInternal::setCurrentProgression(LevelProgression* value) {
    if (mCurrentProgression != value) {
        mPreviousProgression = mCurrentProgression;
        mCurrentProgression = value;
        emit previousProgressionChanged();
        emit currentProgressionChanged();
    }
}

void UiInternal::setMenuBGMTrack(const QString& value) {
    mMenuBGMTrack = value;
    emit menuBGMTrackChanged();
}

void UiInternal::tryStart() {
    QMetaObject::invokeMethod(this, "tryStart");
}

void UiInternal::onLevelChanged(const QString& levelName, int completionThreshold,
        int activationThreshold) {
    QMetaObject::invokeMethod(this, "onLevelChanged", Qt::DirectConnection,
            Q_ARG(QVariant, QVariant(levelName)), Q_ARG(QVariant, QVariant(completionThreshold)),
            Q_ARG(QVariant, QVariant(activationThreshold)));
}

void UiInternal::onLevelCompleted(bool gameCompleted, int oneStarThreshold, int twoStarThreshold,
        int threeStarThreshold, int fourStarThreshold, int playerScore) {
    QMetaObject::invokeMethod(this, "onLevelCompleted", Qt::DirectConnection,
            Q_ARG(QVariant, QVariant(gameCompleted)),
            Q_ARG(QVariant, QVariant(oneStarThreshold)),
            Q_ARG(QVariant, QVariant(twoStarThreshold)),
            Q_ARG(QVariant, QVariant(threeStarThreshold)),
            Q_ARG(QVariant, QVariant(fourStarThreshold)), Q_ARG(QVariant, QVariant(playerScore)));
}

void UiInternal::onPlayerActivationChanged(int player, bool active) {
    QMetaObject::invokeMethod(this, "onPlayerActivationChanged", Qt::DirectConnection,
            Q_ARG(QVariant, QVariant(player)), Q_ARG(QVariant, QVariant(active)));
}

void UiInternal::onPlayerScoreChanged(int player,int score) {
    QMetaObject::invokeMethod(this, "onPlayerScoreChanged", Qt::DirectConnection,
            Q_ARG(QVariant, QVariant(player)), Q_ARG(QVariant, QVariant(score)));
}

void UiInternal::onPlayerDataChanged() {
    QMetaObject::invokeMethod(this, "onPlayerDataChanged", Qt::DirectConnection);
}
