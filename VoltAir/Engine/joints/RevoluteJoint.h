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

#ifndef REVOLUTEJOINT_H
#define REVOLUTEJOINT_H

#include "Joint.h"

/**
 * @ingroup Engine
 * @brief A constraint that fixes the distance between each Body%s anchor point.
 * @note The current implementations assumes the distance between each point is 0.
 */
class RevoluteJoint : public Joint {
    Q_OBJECT

public:
    /**
     * @brief Construct a RevoluteJoint.
     * @param parent Parent object
     */
    explicit RevoluteJoint(QObject* parent = nullptr);

    /**
     * @brief Creates a @c b2RevoluteJoint between @c bodyA and @c bodyB, pinning them together at
     * @c bodyA's position, but allowing them to rotate about the pivot.
     */
    virtual void createJoint() override;
};
Q_DECLARE_METATYPE(RevoluteJoint*)

#endif // REVOLUTEJOINT_H
