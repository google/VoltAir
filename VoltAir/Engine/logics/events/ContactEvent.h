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

#ifndef CONTACTEVENT_H
#define CONTACTEVENT_H

#include "logics/Trigger.h"

class Body;

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Raised when two Body%s begin or end contact with each other.
 */
class ContactEvent : public TriggerEvent {
    Q_OBJECT
public:
    Q_ENUMS(Contact)

    /**
     * @brief Types of ContactEvent%s that can occur.
     */
    enum Contact {
        /**
         * @brief Occurs when two Body%s come in contact.
         */
        ContactBegun = 0,
        /**
         * @brief Occurs when two Body%s are no longer in contact.
         */
        ContactEnded
    };

    /**
     * @brief Constructor of the ContactEvent.
     */
    ContactEvent() { }
    /**
     * @brief Constructor for the ContactEvent.
     * @param body Body that will receive this ContactEvent
     * @param contact Contact that began or ended
     */
    ContactEvent(Body* body, Contact contact);

    /**
     * @brief Body that is in contact with the Body that is receieving this ContactEvent.
     */
    Q_PROPERTY(Body* otherBody READ getOtherBody() WRITE setOtherBody NOTIFY otherBodyChanged)
    /**
     * @brief Contact that the event is about.
     */
    Q_PROPERTY(Contact contact READ getContact() WRITE setContact NOTIFY contactChanged)

    /**
     * @brief Returns #otherBody.
     */
    Body* getOtherBody() const { return mOtherBody; }
    /**
     * @brief Sets #otherBody.
     * @param value Body to set #otherBody to
     */
    void setOtherBody(Body* value);
    /**
     * @brief Returns #contact.
     */
    Contact getContact() const { return mContact; }
    /**
     * @brief Sets #contact.
     * @param value Contact to set #contact to
     */
    void setContact(Contact value);

    /**
     * @brief Returns the ContactEvent as a QVariant.
     */
    virtual QVariant toVariant() override { return QVariant::fromValue(this); }

signals:
    /**
     * @brief Emitted when #otherBody changes.
     */
    void otherBodyChanged();
    /**
     * @brief Emitted when #contact changes.
     */
    void contactChanged();

private:
    Body* mOtherBody = nullptr;
    Contact mContact;
};
Q_DECLARE_METATYPE(ContactEvent*)

#endif // CONTACTEVENT_H
