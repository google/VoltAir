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

#ifndef CONTACTLISTENER_H
#define CONTACTLISTENER_H

#include <Box2D/Box2D.h>

class Body;
class ContactTrigger;

/**
 * @ingroup Engine
 * @brief Handler for notifications of ContactEvent%s from the @c b2World.
 */
class ContactListener : public b2ContactListener {
public:
    /**
     * @brief Notifies both Body%s involved that they have contacted.
     * @param contact Contact between both bodies
     */
    virtual void BeginContact(b2Contact* contact) override;
    /**
     * @brief Notifies both Body%s involved that they are no longer contacting.
     * @param contact Contact between both bodies
     */
    virtual void EndContact(b2Contact* contact) override;

private:
    static Body* getBodyFromFixture(const b2Fixture* fixture);
};

#endif // CONTACTLISTENER_H
