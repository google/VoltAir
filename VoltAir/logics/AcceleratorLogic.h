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

#ifndef ACCELERATORLOGIC_H
#define ACCELERATORLOGIC_H

#include <Engine/Logic.h>

/**
 * @brief Accelerates Body%s that are in contact with the AcceleratorLogic's #actor in the
 * direction that they are moving.
 */
class AcceleratorLogic : public Logic {
    Q_OBJECT

    /**
     * @brief How much the contacting Body%s are accelerated each frame.
     * @default{3.0f}
     */
    Q_PROPERTY(float acceleration READ getAcceleration WRITE setAcceleration
            NOTIFY accelerationChanged)
public:
    /**
     * @brief Returns #acceleration.
     */
    float getAcceleration() const { return mAcceleration; }
    /**
     * @brief Sets #acceleration.
     * @param value Float to set #acceleration to
     */
    void setAcceleration(float value);

    /**
     * @brief Checks the AcceleratorLogic has an #actor with a Body.
     */
    virtual void init() override;

    /**
     * @brief Uses Body::applyForceToCenter() to accelerate Body%s in contact with #actor.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #acceleration changes.
     */
    void accelerationChanged();

private:
    float mAcceleration = 3.0f;
};
Q_DECLARE_METATYPE(AcceleratorLogic*)

#endif // ACCELERATORLOGIC_H
