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

#ifndef LOGIC_H
#define LOGIC_H

#include <QQuickItem>
#include "Actor.h"

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Non-visual entities in the QML item tree that define behavior for their parent Actor.
 *
 * Logic%s are initialized in the first Engine::LOGICS_PHASE and are then evaluated through a call
 * to update() on each subsequent Engine::LOGICS_PHASE.
 */
class Logic : public QObject {
    Q_OBJECT
    /**
     * @brief Parent actor that is affected by this Logic's behavior.
     */
    Q_PROPERTY(Actor* actor READ getActor)
    /**
     * @brief Whether or not Engine calls update() on this Logic during the Engine::LOGICS_PHASE.
     */
    Q_PROPERTY(bool active READ isActive WRITE setActive NOTIFY activeChanged)

public:
    /**
     * @brief Constructs a Logic.
     * @param parent Parent object
     */
    explicit Logic(QObject* parent = nullptr) : QObject(parent) { }

    /**
     * @brief Returns #actor.
     */
    Actor* getActor() const { return mActor; }
    /**
     * @brief Returns #active.
     */
    bool isActive() const { return mActive; }
    /**
     * @brief Sets #active.
     * @param value Boolean to set #active to
     */
    void setActive(bool value);

    /**
     * @brief Performs initialization of this Logic.
     * @note This function can be called more than once if the Logic exists in the game outside
     * of the Level and the Level is changed / re-loaded.
     */
    virtual void init();
    /**
     * @brief Performs the update (i.e. execution of behavior) of this Logic.
     * @note This method is only executed by Engine in Engine::LOGICS_PHASE if #active is @c true.
     */
    virtual void update();

signals:
    /**
     * @brief Emitted when #active changes.
     */
    void activeChanged();

private:
    bool mActive = true;
    Actor* mActor = nullptr;
};
Q_DECLARE_METATYPE(Logic*)

#endif // LOGIC_H
