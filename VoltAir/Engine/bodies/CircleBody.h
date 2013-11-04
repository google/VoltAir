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

#ifndef CIRCLEBODY_H
#define CIRCLEBODY_H

#include "Body.h"

/**
 * @brief A QObject container for a Box2D @c b2Body that represents a circle.
 */
class CircleBody : public Body {
    Q_OBJECT

    /**
     * @brief The radius of the CircleBody.
     */
    Q_PROPERTY(float radius READ getRadius WRITE setRadius NOTIFY radiusChanged)

public:

    /**
     * @brief Constructs a CircleBody.
     */
    explicit CircleBody(QObject* parent = nullptr);

    /**
     * @brief Returns #radius.
     */
    float getRadius() const { return mRadius; }

    /**
     * @brief Sets #radius.
     * @param value Float to set #radius to
     */
    void setRadius(float value);

signals:
    /**
     * @brief Emitted when #radius changes.
     */
    void radiusChanged();

protected:
    /**
     * @brief Calls @p func on the @c b2Shape that represents this CircleBody.
     * @param func Function to call, which receives the @c b2Shape as an argument
     */
    virtual void forEachShape(const std::function<void(b2Shape*)>& func) override;

private:
    float mRadius = 1.0f;
};
Q_DECLARE_METATYPE(CircleBody*)

#endif // CIRCLEBODY_H
