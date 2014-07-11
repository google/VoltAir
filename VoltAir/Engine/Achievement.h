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

#ifndef ACHIEVEMENT_H
#define ACHIEVEMENT_H

#include <QString>

class QJsonObject;

/**
 * @ingroup Engine
 * @brief Representation of a Google Play Games Services achievement.
 *
 * This class represents the current state of an application-defined achievement and provides
 * mechanisms for altering this state (e.g. unlocking, revealing, incrementing, etc.). Additionally,
 * this class provides ways of storing this achievement state locally and syncing that state to
 * the cloud on Android devices.
 * @note This class uses all the fire-and-forget, non-blocking forms of the Google Play Games
 * Services API where the status / time of completion of the operations are not immediately known.
 * @see https://developer.android.com/reference/com/google/android/gms/games/achievement/Achievements.html
 */
class Achievement {
public:
    /**
     * @brief Category of achievement.
     *
     * Achievements become bound to an AchievementType through actions performed on the achievement.
     * Once an achievement has been bound to a certain AchievementType, future actions on the
     * achievement are limited, with certain actions becoming undefined operations. For example, an
     * achievement becomes AchievementType::INCREMENTAL after a call to increment(), at which time
     * actions reserved for AchievementType::REGULAR achievements (e.g. unlock()) are no longer
     * defined or allowed.
     * @note The syncing of achievement data is one-directional (i.e. from local to cloud). This
     * means that: (1) local achievement data may not be fully comprehensive of all achievement
     * data currently represented in the cloud through AndroidActivity::showAchievements() and
     * (2) incremental achievements have no ability to be unlocked "offline", as the pre-defined
     * number of total progress steps is unknown.
     */
    enum AchievementType{
        /**
         * @brief No actions (i.e. increment()) have been performed on the achievement allowing its
         * type to be distinguished.
         */
        UNKNOWN = 0,
        /**
         * @brief Standard achievement that has binary state (i.e. "locked" vs. "unlocked").
         */
        REGULAR,
        /**
         * @brief Achievement whose progress advances incrementally and becomes "unlocked" after a
         * certain number of pre-defined steps.
         */
        INCREMENTAL,
    };

    /**
     * @brief Constructs an achievement with the specified resource name.
     * @param name Android resource name that can be used to locate the achievement id
     */
    Achievement(const QString& name);
    /**
     * @brief Constructs an achievement from serialized JSON data.
     * @param json Serialized JSON representation of an achievement to load
     */
    Achievement(const QJsonObject& json);

    /**
     * @brief Merges @c this with another set of achievement data.
     * @param achievement Achievement whose state to merge
     */
    void merge(const Achievement& achievement);
    /**
     * @brief Returns the name of the Achievement.
     */
    const QString& getName() const { return mName; }
    /**
     * @brief Returns the type of the Achievement.
     */
    AchievementType getAchievementType() const;
    /**
     * @brief Returns whether or not the Achievement has been revealed through reveal().
     * @note Due to one-directional syncing of achievement data, this method returning @c false does
     * not guarantee the achievement in question is a "hidden" achievement -- merely that there was
     * no action actively made to reveal it with reveal().
     */
    bool hasBeenRevealed() const { return mHasBeenRevealed; }
    /**
     * @brief Returns whether or not the Achievement has been unlocked through unlock().
     */
    bool hasBeenUnlocked() const { return mHasBeenUnlocked; }
    /**
     * @brief Returns the number of progress steps minimally set for the incremental Achievement
     * through setSteps().
     * @note This is separate from the current number of progress steps which is unavailable.
     */
    int getMinStepsSet() const { return mMinStepsSet; }
    /**
     * @brief Returns the number of progress steps incremented for the incremental Achievement
     * through increment().
     * @note This is separate from the current number of progress steps which is unavailable.
     */
    int getStepsIncremented() const { return mStepsIncremented; }

    /**
     * @brief Returns the Achievement serialized as a JSON object.
     */
    QJsonObject toJsonObject() const;

    /**
     * @brief Unlocks the achievement.
     * @param immediately Whether or not the achievement will be unlocked directly in the cloud
     */
    void unlock(bool immediately);
    /**
     * @brief Reveals the achievement.
     * @param immediately Whether or not the achievement will be revealed directly in the cloud
     */
    void reveal(bool immediately);
    /**
     * @brief Increments the incremental achievement.
     * @param numSteps Number of steps to increment the achievement
     * @param immediately Whether or not the achievement will be incremented directly in the cloud
     */
    void increment(int numSteps, bool immediately);
    /**
     * @brief Sets the incremental achievement to minimally have @p numSteps.
     * @param numSteps Minimum number of steps to set the progress of the achievement to
     * @param immediately Whether or not the achievement steps will be set directly in the cloud
     */
    void setSteps(int numSteps, bool immediately);

    /**
     * @brief Saves any buffered achievement actions (i.e. state changed for which @c immediately
     * was @c false) to the cloud.
     * @returns Whether or not the cloud sync successful for all buffered actions
     */
    bool saveToCloud();

private:
    bool cloudUnlock();
    bool cloudReveal();
    bool cloudIncrement(int numSteps);
    bool cloudSetSteps(int numSteps);

    QString mName;
    bool mHasBeenRevealed = false;
    bool mRevealIsDirty = false;
    bool mHasBeenUnlocked = false;
    bool mUnlockIsDirty = false;
    int mMinStepsSet = 0;
    bool mMinStepsDirty = false;
    int mStepsIncremented = 0;
    int mStepsIncrementedDirtiness = 0;
};

#endif // ACHIEVEMENT_H
