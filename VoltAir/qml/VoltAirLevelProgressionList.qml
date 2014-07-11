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

import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Map of all levels in their environments.
 */
LevelProgressionList {
    objectName: "levelProgressions"

    /**
     * @brief Whether or not to force all levels to be unlocked for debugging.
     */
    property bool unlockAllLevels: false

    progressions: [
        LevelProgression {
            name: "Single Player"
            environments: [
                Environment {
                    name: "Planetfall"
                    levelInfos: [
                        LevelInfo {
                            name: "1-1"
                            fileName: "E1S0.qml"
                            tutorial: true
                            screenshotFileName: "1_1.jpg"
                        },
                        LevelInfo {
                            name: "1-2"
                            fileName: "E1S1.qml"
                            screenshotFileName: "1_2.jpg"
                        },
                        LevelInfo {
                            name: "1-3"
                            fileName: "E1S2.qml"
                            screenshotFileName: "1_3.jpg"
                        },
                        LevelInfo {
                            name: "1-4"
                            fileName: "E1S3.qml"
                            screenshotFileName: "1_4.jpg"
                        },
                        LevelInfo {
                            name: "1-5"
                            fileName: "E1S4.qml"
                            screenshotFileName: "1_5.jpg"
                        }
                    ]
                    bgmTrack: "music/music_loop_e1.mp3"
                    screenshotFileName: "1.jpg"
                    achievementToUnlockOnPassing: "spelunking"
                    achievementToUnlockOnCompletion: "extraterrestrial"
                    achievementsToRevealOnPassing: ["stargazing"]
                },
                Environment {
                    name: "Underworld"
                    levelInfos: [
                        LevelInfo {
                            name: "2-1"
                            fileName: "E2S1.qml"
                            screenshotFileName: "2_1.jpg"
                        },
                        LevelInfo {
                            name: "2-2"
                            fileName: "E2S2.qml"
                            screenshotFileName: "2_2.jpg"
                        },
                        LevelInfo {
                            name: "2-3"
                            fileName: "E2S3.qml"
                            screenshotFileName: "2_3.jpg"
                        },
                        LevelInfo {
                            name: "2-4"
                            fileName: "E2S4.qml"
                            screenshotFileName: "2_4.jpg"
                        }
                    ]
                    bgmTrack: "music/music_loop_e2.mp3"
                    screenshotFileName: "2.jpg"
                    achievementToUnlockOnPassing: "stargazing"
                    achievementToUnlockOnCompletion: "dark_matter"
                    achievementsToRevealOnPassing: ["escape_velocity"]
                },
                Environment {
                    name: "Moonlight"
                    levelInfos: [
                        LevelInfo {
                            name: "3-1"
                            fileName: "E3S1.qml"
                            screenshotFileName: "3_1.jpg"
                        }
                    ]
                    bgmTrack: "music/music_loop_e3.mp3"
                    screenshotFileName: "3.jpg"
                    achievementToUnlockOnPassing: "escape_velocity"
                    achievementToUnlockOnCompletion: "the_cosmos"
                }
            ]
            screenshotFileName: "sp.jpg"
            achievementToUnlockOnPerfection: "collect_all_the_things"
        },
        LevelProgression {
            name: "Multiplayer"
            multiplayer: true
            environments: [
                Environment {
                    name: "Arenas"
                    levelInfos: [
                        LevelInfo {
                            name: "Ice Cave"
                            fileName: "arena2.qml"
                            screenshotFileName: "mp_icecave.jpg"
                        }
                    ]
                    bgmTrack: "music/music_loop_e1.mp3"
                    screenshotFileName: "mp_arena.jpg"
                }
            ]
            screenshotFileName: "mp.jpg"
        }
    ]
}

