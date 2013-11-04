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
#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include "DebugManager.h"
#include "Game.h"
#include "LevelProgression.h"
#include "LevelProgressionList.h"

DebugManager* DebugManager::sInstance = nullptr;
const char* DebugManager::DEBUG_JSON_PATH = "debug.json";

DebugManager::DebugManager() {
    loadFromJson();
}

DebugManager::~DebugManager() {
}

void DebugManager::loadFromJson() {
#if defined(QT_DEBUG)
    QStringList levelList;
    // Check if we have a level specified in debug.json.
    QFile debugJsonFile(Util::getPathToAsset(DEBUG_JSON_PATH));
    if (debugJsonFile.exists()) {
        debugJsonFile.open(QIODevice::ReadOnly | QIODevice::Text);
        QString fileText = debugJsonFile.readAll();
        debugJsonFile.close();

        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(fileText.toUtf8(), &err);
        if (err.error != QJsonParseError::NoError) {
            qDebug() << "Error parsing JSON file debug.json:" << err.errorString();
        } else {
            QVariantMap docMap = doc.toVariant().toMap();
            QList<QVariant> levelsToLoad = docMap.values("level");
            for (QVariant levelToLoadVar : levelsToLoad) {
                QString levelToLoad = levelToLoadVar.toString();
                if (!levelToLoad.isEmpty()) {
                    // Add this to the list of levels to load.
                    levelList.append(levelToLoad);
                }
            }
        }
    }

    if (!levelList.isEmpty()) {
        LevelProgressionList* levelProgressionList = Game::getInstance()->getLevelProgressionList();

        mDebugLevelProgression = new LevelProgression(levelProgressionList);
        mDebugLevelProgression->setName("DEBUG");
        mDebugLevelProgression->setMultiplayer(false);
        levelProgressionList->getProgressions().append(mDebugLevelProgression);

        Environment* debugEnvironment = new Environment(mDebugLevelProgression);
        debugEnvironment->setName("Debug Environment");

        QList<Environment*>& environmentList = mDebugLevelProgression->getEnvironments();
        environmentList.append(debugEnvironment);

        for (const QString& levelFileName : levelList) {
            LevelInfo* levelInfo = new LevelInfo(debugEnvironment);
            levelInfo->setName(levelFileName);
            levelInfo->setFileName(levelFileName);
            // TODO: Figure out how to set other metadata here.
            debugEnvironment->getLevelInfos().append(levelInfo);
        }
    }
#endif
}

DebugManager* DebugManager::getInstance() {
    if (!sInstance) {
        sInstance = new DebugManager();
    }
    return sInstance;
}
