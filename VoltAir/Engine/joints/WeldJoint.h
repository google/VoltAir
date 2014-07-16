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

#ifndef WELDJOINT_H
#define WELDJOINT_H

#include "Joint.h"

/**
 * @ingroup Engine
 * @brief A constraint that fixes the relative positions of two Body%s.
 */
class WeldJoint : public Joint {
    Q_OBJECT

public:
    /**
     * @brief Construct a WeldJoint.
     * @param parent Parent object
     */
    explicit WeldJoint(QObject* parent = nullptr);

    /**
     * @brief Creates a weld joint between @c bodyA and @c bodyB, welding them together in their
     * current relative positions.
     */
    virtual void createJoint() override;
};
Q_DECLARE_METATYPE(WeldJoint*)

#endif // WELDJOINT_H
