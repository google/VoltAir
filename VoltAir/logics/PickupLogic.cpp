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

#include <Engine/Actor.h>
#include <Engine/Body.h>
#include <Engine/Engine.h>
#include <Engine/audio/SoundManager.h>
#include <Engine/utils/Util.h>
#include "Game.h"
#include "LevelProgression.h"
#include "PickupLogic.h"
#include "inputs/PlayerManager.h"

void PickupLogic::setPickupValue(int value) {
    mPickupValue = value;
    emit pickupValueChanged();
}

void PickupLogic::setAllowNonPlayerPickup(bool value) {
    mAllowNonPlayerPickup = value;
    emit allowNonPlayerPickupChanged();
}

void PickupLogic::setPickupSound(const QString& value) {
    mPickupSound = value;
    mPickupSoundInstance.reset(Engine::getInstance()->getSoundManager()->getSoundEffect(value));
    emit pickupSoundChanged();
}

void PickupLogic::reset() {
    mPickedUp = false;
}

void PickupLogic::init() {
    Logic::init();

    Actor* actor = getActor();
    if (!actor) {
        qDebug() << "Warning: PickupLogic created out of the scope of an Actor";
        return;
    }

    Body* body = actor->getBody();
    if (!body) {
        qDebug() << "Body not found for Actor" << actor->property("id").toString();
        return;
    }

    // Queue connection as this signal is thrown from within a Box2D callback.
    connect(body, &Body::queuedContactBegun, this, &PickupLogic::onPickupContacted);
}

void PickupLogic::onPickupContacted(Body* otherBody, QPointF) {
    if (mPickedUp) {
        return;
    }

    Actor* otherActor = otherBody->getActor();
    if (otherActor->getActorType() == Actor::PlayerActor) {
        // Only pick this up once.
        mPickedUp = true;

        Game* game = Game::getInstance();

        // Increment achievements for single player.
        if (game->getCurrentLevelProgression()->isSinglePlayer()) {
            game->incrementAchievement("nova", mPickupValue);
            game->incrementAchievement("supernova", mPickupValue);
            game->incrementAchievement("meganova", mPickupValue);
            game->incrementAchievement("hypernova", mPickupValue);
            game->incrementAchievement("ultranova", mPickupValue);
        }

        // Add to the score of the player performing the pickup
        int playerId = otherActor->property("playerId").toInt();
        if (PlayerManager::getInstance()->isPlayerAvailable(playerId)) {
            game->updatePlayerScore(playerId, mPickupValue);
        }

        // Play the audio sound
        mPickupSoundInstance.play();

        emit collected(otherActor);
    } else if (mAllowNonPlayerPickup && !otherBody->isSensor()) {
        mPickedUp = true;
        emit collected(otherActor);
    }
}
