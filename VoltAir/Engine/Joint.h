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

#ifndef JOINT_H
#define JOINT_H

#include <QObject>

class Body;
class b2Joint;
/**
 * @ingroup Engine
 * @brief A constraint between two Body%s.
 */
class Joint : public QObject {
    Q_OBJECT
public:
    /**
     * @brief Construct a Joint.
     * @param parent Parent object
     */
    explicit Joint(QObject* parent = 0);
    virtual ~Joint();

    /**
     * @brief Sets the two Body%s constrained by this Joint.
     * @param bodyA A Body constrained by this Joint
     * @param bodyB Other Body constrained by this Joint
     */
    void setTargets(Body* bodyA, Body* bodyB);
    /**
     * @brief Returns Body A.
     */
    Body* getBodyATarget() const { return mBodyA; }
    /**
     * @brief Returns Body B.
     */
    Body* getBodyBTarget() const { return mBodyB; }

    /**
     * @brief Creates the Box2D joint.
     *
     * This may be called by any of the participants of the joint.
     * @note Default implementation does nothing.
     */
    virtual void createJoint();

    /**
     * @brief Destroys the @c b2Joint, if it has been created.
     */
    virtual void destroyJoint();

    /**
     * @brief Called when a @c b2Joint associated with this object has been deleted by Box2D.
     */
    virtual void notifyJointDestroyed(b2Joint* joint);

protected:
    /**
     * @brief Reference to the Box2D b2Joint.
     */
    b2Joint* mJoint = nullptr;

private:
    Body* mBodyA = nullptr;
    Body* mBodyB = nullptr;
};
Q_DECLARE_METATYPE(Joint*)

#endif // JOINT_H
