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

LevelInfo::LevelInfo(QObject* parent) : QObject(parent) {
}

void LevelInfo::setName(const QString& value) {
    mName = value;
    emit nameChanged();
}

void LevelInfo::setFileName(const QString& value) {
    mFileName = value;
    emit fileNameChanged();
}

void LevelInfo::setTutorial(bool value) {
    mTutorial = value;
    emit tutorialChanged();
}

void LevelInfo::setScreenshotFileName(const QString& value) {
    mScreenshotFileName = value;
    emit screenshotFileNameChanged();
}

Environment* LevelInfo::getEnvironment() const {
    if (!mEnvironment) {
        mEnvironment = qobject_cast<Environment*>(parent());
    }
    return mEnvironment;
}
