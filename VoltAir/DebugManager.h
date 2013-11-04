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

#ifndef DEBUGMANAGER_H
#define DEBUGMANAGER_H

#include <QList>
#include <QString>

class LevelProgression;

/**
 * @brief Class to manage debug options defined in debug.json data file.
 *
 * Currently, the debug.json data file is a JSON object of the following format:
 *   - Property "level" with a list of level asset filenames to load into a debug LevelProgression.
 *
 * This class is used by Game to bypass the normal UI flow and launch the game directly into
 * specified levels for debugging.
 */
class DebugManager {
public:
    /**
     * @brief Returns the LevelProgression constructed from debug option data.
     *
     * The constructed LevelProgression consists of a single Environment filled with a list of
     * LevelInfo%s named after the level asset filenames.
     */
    LevelProgression* getDebugLevelProgression() const { return mDebugLevelProgression; }

    /**
     * @brief Returns the singleton instance of DebugManager.
     */
    static DebugManager* getInstance();

private:
    DebugManager();
    ~DebugManager();

    void loadFromJson();

    LevelProgression* mDebugLevelProgression = nullptr;

    static DebugManager* sInstance;
    static const char* DEBUG_JSON_PATH;
};

#endif // DEBUGMANAGER_H
