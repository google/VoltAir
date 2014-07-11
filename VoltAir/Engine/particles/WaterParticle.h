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

#ifndef WATERPARTICLE_H
#define WATERPARTICLE_H

#include "Particle.h"

/**
 * @ingroup Engine
 * @brief A Particle which destroys itself after a decay time has elapsed.
 */
class WaterParticle : public Particle {
public:
    /**
     * @brief Constructs a WaterParticle in the given ParticleLayer with the specified position,
     * velocity, color, and time-to-live.
     * @param layer ParticleLayer to spawn particle in
     * @param position Position in world coordinates to spawn the particle at
     * @param velocity Initial velocity of the particle
     * @param color Color of the particle
     * @param decayTime Decay time of the particle
     */
    WaterParticle(
            ParticleLayer* layer,
            const QPointF& position,
            const QPointF& velocity,
            const QColor& color,
            float decayTime);
    /**
     * @brief Constructs a WaterParticle to represent an already existing particle in the particle
     * system.
     *
     * This method uses Particle::mapToExistingParticle() to attach to an existing particle.
     * @param layer ParticleLayer the existing particle is in
     * @param index Index of the particle to attach to
     * @param decayTime Decay time of the particle
     */
    WaterParticle(ParticleLayer* layer, int index, float decayTime);

    /**
     * @brief Start the decay of this WaterParticle.
     *
     * Once the decay time interval of game time has elapsed, the WaterParticle will delete itself
     * in update().
     */
    void beginDecaying();
    /**
     * @brief Reset the decay time of this WaterParticle.
     */
    void resetDecayTime();
    /**
     * @brief Process the decay timer, deleting this WaterParticle if the decay time has elapsed.
     */
    void update();

private:
    bool mIsDecaying = false;
    float mInitialDecayTime = 0.0f;
    float mDecayTime = 0.0f;
};

#endif // WATERPARTICLE_H
