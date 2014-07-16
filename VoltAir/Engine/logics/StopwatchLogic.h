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

#ifndef STOPWATCHLOGIC_H
#define STOPWATCHLOGIC_H

#include "Logic.h"

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Defines a stopwatch which triggers any callbacks connected to timeElapsed() after #time
 * game-time seconds have elapsed.
 */
class StopwatchLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Time remaining on countdown.
     */
    Q_PROPERTY(float time READ getTime WRITE setTime NOTIFY timeChanged)

public:
    /**
     * @brief Returns #time.
     */
    float getTime() const { return mTime; }
    /**
     * @brief Sets #time.
     * @param value Seconds to set timer for
     */
    void setTime(float value);

    /**
     * @brief Updates the time remaining on the countdown.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #time is explicitly (re)set.
     */
    void timeChanged();
    /**
     * @brief Emitted when the stopwatch timer expires.
     *
     * Attach all callbacks for the stopwatch timer to this signal.
     */
    void timeElapsed();

private:
    float mTime = 0.0f;
};
Q_DECLARE_METATYPE(StopwatchLogic*)

#endif // STOPWATCHLOGIC_H
