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

#ifndef INPUTLOGIC_H
#define INPUTLOGIC_H

#include <Engine/Logic.h>

/**
 * @brief Logic that synchronously polls global controller state and changes the parent Actor's
 * @c inputForce and @c magnetized dynamic properties accordingly.
 * @note This class requires a parent Actor of type Actor::PlayerActor.
 */
class GameInputLogic : public Logic {
    Q_OBJECT
public:
    /**
     * @brief Constructs a GameInputLogic.
     * @param parent Parent object
     */
    GameInputLogic(QObject* parent = nullptr);

    virtual void init() override;

    /**
     * @brief Polls the global state of the controller identified by the parent Actor::PlayerActor's
     * @c playerId and updates the parent Actor::PlayerActor's dynamic properties accordingly.
     */
    virtual void update() override;
};
Q_DECLARE_METATYPE(GameInputLogic*)

#endif // INPUTLOGIC_H
