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
#include <Engine/Camera.h>
#include <Engine/Engine.h>
#include <Engine/utils/Util.h>
#include "EmitterLogic.h"

// Table of position offsets to cycle through, when spawnRandom is false. Entities will be spawned
// offset from the actor's position by these amounts.
const float EmitterLogic::SPAWN_OFFSETS[] = { 0.2f, 0.6f, -0.2f, -0.6f };
const int EmitterLogic::SPAWN_OFFSET_COUNT =
        sizeof(SPAWN_OFFSETS) / sizeof(SPAWN_OFFSETS[0]);
const float EmitterLogic::SPRAY_STRENGTH = 5.0f;

void EmitterLogic::setRequestedMaxEntityCount(int value) {
    mRequestedMaxEntityCount = value;
    emit requestedMaxEntityCountChanged();
}

int EmitterLogic::getMaxEntityCount() const {
    int supportedMaxEntityCount = getSupportedMaxEntityCount();
    int requestedMaxEntityCount = getRequestedMaxEntityCount();
    if (requestedMaxEntityCount < 0) {
        return supportedMaxEntityCount;
    } else if (supportedMaxEntityCount < 0) {
        return requestedMaxEntityCount;
    } else {
        return qMin(requestedMaxEntityCount, supportedMaxEntityCount);
    }
}

void EmitterLogic::setSpawnRate(float value) {
    mSpawnRate = value;
    emit spawnRateChanged();
}

void EmitterLogic::setSpawnVelocity(float value) {
    mSpawnVelocity = value;
    emit spawnVelocityChanged();
}

void EmitterLogic::setSpawnSpread(float value) {
    mSpawnSpread = value;
    emit spawnSpreadChanged();
}

void EmitterLogic::setSpawnSpray(float value) {
    mSpawnSpray = value;
    emit spawnSpreadChanged();
}

void EmitterLogic::setSpawnRandom(bool value) {
    mSpawnRandom = value;
    emit spawnSpreadChanged();
}

void EmitterLogic::setTimeOn(float value) {
    mTimeOn = value;
    updateHasTimer();
    emit spawnSpreadChanged();
}

void EmitterLogic::setTimeOff(float value) {
    mTimeOff = value;
    updateHasTimer();
    emit spawnSpreadChanged();
}

void EmitterLogic::updateHasTimer() {
    mHasTimer = (mTimeOn > Engine::TIME_STEP_S) && (mTimeOff > Engine::TIME_STEP_S);
}

void EmitterLogic::setTransitionOnTime(float value) {
    mTransitionOnTime = value;
    mHasTransitionOn = value > Engine::TIME_STEP_S;
    emit spawnSpreadChanged();
}

void EmitterLogic::setTransitionOffTime(float value) {
    mTransitionOffTime = value;
    mHasTransitionOff = value > Engine::TIME_STEP_S;
    emit spawnSpreadChanged();
}

void EmitterLogic::setDecayTime(float value) {
    mDecayTime = value;
    emit decayTimeChanged();
}

void EmitterLogic::setDecayTimeRandomLength(float value) {
    mDecayTimeRandomLength = value;
    emit decayTimeChanged();
}

void EmitterLogic::setPaused(bool value) {
    bool oldValue = mPaused;
    mPaused = value;
    emit pausedChanged();

    if (oldValue != value) {
        onPausedChanged();
    }
}

void EmitterLogic::emitEntity(const SpawnParameters&) {
}

void EmitterLogic::init() {
    Logic::init();

    Actor* actor = getActor();
    if (!actor) {
        qDebug() << "Warning: EmitterLogic created out of the scope of an Actor";
        return;
    }
}

void EmitterLogic::update() {
    Logic::update();

    bool cycleOn = true;
    float cycleStrength = 1.0f;
    if (mHasTimer) {
        float cyclePeriod = mTimeOn + mTimeOff;
        mCycleTimer += Engine::TIME_STEP_S;
        // Wrap our timer.
        // Since cyclePeriod is greater than our step time, we only need to check once.
        if (mCycleTimer >= cyclePeriod) {
            mCycleTimer -= cyclePeriod;
        }

        // Check if we're on or off.
        cycleOn = mCycleTimer > mTimeOff;

        // Check if we're transitioning on or off.
        if (cycleOn) {
            if (mHasTransitionOn) {
                cycleStrength = (mCycleTimer - mTimeOff) / mTransitionOnTime;
            }
        } else {
            if (mHasTransitionOff) {
                cycleStrength = 1.0f - mCycleTimer / mTransitionOffTime;
                cycleOn = cycleStrength > 0.0f;
            }
        }
        cycleStrength = Util::clamp(cycleStrength, 0.0f, 1.0f);
        cycleStrength *= cycleStrength;
    }

    // Check if we shouldn't spawn entities.
    if (isPaused()) {
        return;
    }

    // Step our spawn rate counter.
    int maxEntityCount = getMaxEntityCount();
    bool forceSpawnEntities = maxEntityCount < 0 && cycleOn;
    if ((forceSpawnEntities || getEntityCount() < maxEntityCount) && cycleOn) {
        mSpawnRateCounter += mSpawnRate * cycleStrength;
    }

    // Spawn entities for this frame step.
    while ((forceSpawnEntities || getEntityCount() < getMaxEntityCount()) &&
           mSpawnRateCounter >= 1.0f) {
        mSpawnRateCounter -= 1.0f;
        mSpawnIndex++;

        emitEntity(getNextRandomSpawnParameters());
    }
}

EmitterLogic::SpawnParameters EmitterLogic::getNextRandomSpawnParameters() const {
    // Choose a random spray value.
    float decayTime = mDecayTime;
    if (decayTime < 0) {
        decayTime = std::numeric_limits<int>::max();
    } else {
        if (mDecayTimeRandomLength > 0) {
            decayTime += Util::qrandF() * mDecayTimeRandomLength;
        }
    }

    float spawnSprayPValue = mSpawnRandom ? ((Util::qrandF() - 0.5f) * 2.0f)
            : SPAWN_OFFSETS[mSpawnIndex % SPAWN_OFFSET_COUNT];
    QPointF spawnOffset(spawnSprayPValue * mSpawnSpread, 0.0f);
    float spawnVelocityOffsetX = spawnSprayPValue * mSpawnSpray * SPRAY_STRENGTH;

    // Spawn a new entity.
    Actor* actor = getActor();
    QPointF spawnVelocity(spawnVelocityOffsetX, mSpawnVelocity);
    QPointF actorOrigin = actor->mapToItem(actor->parentItem(), QPointF());
    spawnOffset = actor->mapToItem(actor->parentItem(), spawnOffset) - actorOrigin;
    spawnVelocity = actor->mapToItem(actor->parentItem(), spawnVelocity) - actorOrigin;
    QPointF position = actor->position() + spawnOffset;

    return { position, spawnVelocity, decayTime };
}
