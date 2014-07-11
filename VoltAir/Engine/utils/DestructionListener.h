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

#ifndef DESTRUCTIONLISTENER_H
#define DESTRUCTIONLISTENER_H

#include <Box2D/Box2D.h>

class Joint;

/**
 * @ingroup Engine
 * @brief Handler for object destruction notifications in @c b2World.
 *
 * Implements @c b2DestructionListener. Used by Engine to clean up resources on destruction of
 * various Box2D objects. Destruction of objects can occur because of manual deletions, and also
 * internal Box2D deletions. For example, when a @c b2Body is destroyed, its associated
 * @c b2Fixture%s and @c b2Joint%s are also destroyed.
 */
class DestructionListener : public b2DestructionListener {
public:
    /**
     * @brief Notifies that @p joint is about to be destroyed.
     * @param joint @c b2Joint getting destroyed
     */
    virtual void SayGoodbye(b2Joint* joint) override;
    /**
     * @brief Notifies that @p fixture is about to be destroyed.
     * @param fixture @c b2Fixture getting destroyed
     */
    virtual void SayGoodbye(b2Fixture* fixture) override;
private:
    static Joint* getJointObjectFromJoint(const b2Joint* joint);
};

#endif // DESTRUCTIONLISTENER_H
