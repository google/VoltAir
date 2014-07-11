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

#ifndef CONTACTTRIGGER_H
#define CONTACTTRIGGER_H

#include "Actor.h"
#include "logics/Trigger.h"
#include "logics/events/ContactEvent.h"

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Listens to ContactEvent%s between the parent Actor's Body and another body of the
 * specified ActorType.
 */
class ContactTrigger : public Trigger {
    Q_OBJECT
public:
    /**
     * @brief Contact type of this trigger.
     */
    Q_PROPERTY(ContactEvent::Contact contact READ getContact WRITE setContact
            NOTIFY contactChanged)
    /**
     * @brief Actor::ActorType that will activate this trigger.
     */
    Q_PROPERTY(Actor::ActorType actorType READ getActorType WRITE setActorType
            NOTIFY actorTypeChanged)

    /**
     * @brief Returns #actorType.
     */
    Actor::ActorType getActorType() { return mActorType; }
    /**
     * @brief Sets #actorType.
     * @param value Actor::ActorType to set #actorType to
     */
    void setActorType(Actor::ActorType value);
    /**
     * @brief Returns #contact.
     */
    ContactEvent::Contact getContact() { return mContact; }
    /**
     * @brief Sets #contact.
     * @param value ContactEvent::Contact to set #contact to
     */
    void setContact(ContactEvent::Contact value);

    /**
     * @brief Initializes the ContactTrigger.
     */
    virtual void init() override;

signals:
    /**
     * @brief Emitted when #actorType changes.
     */
    void actorTypeChanged();
    /**
     * @brief Emitted when #contact changes.
     */
    void contactChanged();

private:
    bool actorTypeMatches(Body* body);

    Actor::ActorType mActorType;
    ContactEvent::Contact mContact;
};
Q_DECLARE_METATYPE(ContactTrigger*)

#endif // CONTACTTRIGGER_H
