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

#ifndef TRIGGER_H
#define TRIGGER_H

#include <memory>
#include <queue>
#include "Logic.h"
#include "utils/Util.h"

class TriggerEvent;

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Listens for one or more events (TriggerEvent) and calls an event handler (handleEvent())
 * in response to received events.
 */
class Trigger : public Logic {
    Q_OBJECT
public:
    /**
     * @brief Processes queued TriggerEvent%s, firing handleEvent() for each.
     */
    virtual void update() override;

protected:
    /**
     * @brief Enqueues a TriggerEvent for processing in the next game update.
     *
     * Ownership (parent) of the TriggerEvent object is transferred to this class.
     * @param event TriggerEvent to queue
     */
    void queueEvent(TriggerEvent* event);
    /**
     * @brief Responds to a TriggerEvent.
     * @note The default implementation delegates by invoking the JavaScript method "handleEvent"
     * if present on this QObject. This method can do a custom response to the TriggerEvent fired.
     * For example, this happens in TriggerArea.
     * @param event TriggerEvent to respond to
     */
    virtual void handleEvent(TriggerEvent* event);

private:
    std::queue<std::unique_ptr<TriggerEvent>> mEventQueue;
};
Q_DECLARE_METATYPE(Trigger*)


/**
 * @ingroup Engine
 * @brief Abstract base class for events which can be handled by Trigger%s.
 */
class TriggerEvent : public QObject {
    Q_OBJECT
public:
    /**
     * @brief Returns the value to be passed as the first parameter of the JavaScript
     * @c handleEvent() function when this TriggerEvent is responded to.
     * @see Trigger::handleEvent()
     */
    virtual QVariant toVariant() { return QVariant(); }
};
Q_DECLARE_METATYPE(TriggerEvent*)

#endif // TRIGGER_H
