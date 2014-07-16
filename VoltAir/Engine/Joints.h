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

#ifndef JOINTS_H
#define JOINTS_H

#include <QObject>

class Body;
class RevoluteJoint;
class WeldJoint;

/**
 * @ingroup Engine
 * @brief Factory class for creating Joint%s from QML.
 */
class Joints : public QObject {
    Q_OBJECT
public:

    /**
     * @brief Creates a RevoluteJoint.
     * @param joiner A Body constrained by the RevoluteJoint
     * @param joinee Other Body constrained by the RevoluteJoint
     */
    Q_INVOKABLE RevoluteJoint* createRevoluteJoint(Body* joiner, Body* joinee);

    /**
     * @brief Creates a WeldJoint.
     * @note @c b2WeldJoint%s are not completely rigid and will flex under sufficient stress.
     * @param joiner A Body constrained by the WeldJoint
     * @param joinee Other Body constrained by the WeldJoint
     */
    Q_INVOKABLE WeldJoint* createWeldJoint(Body* joiner, Body* joinee);

    /**
     * @brief Returns the Joints singleton.
     */
    static Joints* getInstance();
private:
    Joints(QObject* parent = nullptr);

    static Joints* sInstance;
};
Q_DECLARE_METATYPE(Joints*)

#endif // JOINTS_H
