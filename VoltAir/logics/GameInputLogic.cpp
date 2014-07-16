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

#include <Engine/Body.h>
#include "Game.h"
#include "GameInputLogic.h"
#include "LevelProgression.h"
#include "inputs/PlayerManager.h"

GameInputLogic::GameInputLogic(QObject* parent) : Logic(parent) {
}

void GameInputLogic::init() {
    Logic::init();

    Actor* actor = getActor();
    if (!actor) {
        qDebug() << "Warning: GameInputLogic created out of the scope of an Actor";
        return;
    } else if (actor->getActorType() != Actor::PlayerActor) {
        qDebug() << "Warning: GameInputLogic created out of the scope of a Player Actor";
        return;
    }

    Body* body = actor->getBody();
    if (!body) {
        qDebug() << "Body not found for Actor" << actor->property("id").toString();
        return;
    }
}

void GameInputLogic::update() {
    Actor* actor = getActor();
    if (actor && actor->getActorType() != Actor::PlayerActor) {
        return;
    }

    Body* body = actor->getBody();
    PlayerManager* manager = PlayerManager::getInstance();
    int playerId = actor->property("playerId").toInt();

    if (manager->isPlayerAvailable(playerId)) {
        // Re-activate the PlayerActor.  This is to service MultiPlayerMode, but since it will
        // have no effect on a SinglePlayer PlayerActor, we re-activate without prejudice.
        actor->setVisible(true);
        if (body) {
            body->setActive(true);
        }

        actor->setProperty("inputForce", manager->getHorizontal(playerId));
        actor->setProperty("magnetized", manager->isMagnetized(playerId));
    } else if (Game::getInstance()->getCurrentLevelProgression()->isMultiplayer()) {
        actor->setVisible(false);
        if (body) {
            body->setActive(false);
        }
    }
}

