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

#ifndef PARTICLE_H
#define PARTICLE_H

#include <QColor>
#include <QPointF>

class ParticleLayer;

/**
 * @ingroup Engine
 * @brief Wrapper around a LiquidFun particle.
 *
 * When createNewParticle() is called, a new LiquidFun particle is spawned, and its user data
 * property is set to this Particle's pointer. This allows the Particle for each LiquidFun particle
 * to be easily retrieved. The LiquidFun particle is destroyed when destroy() is called, or when
 * this object is deleted.
 */
class Particle {
public:
    /**
     * @brief Constructs a new Particle.
     * @param layer ParticleLayer to associate with
     */
    Particle(ParticleLayer* layer);
    virtual ~Particle();

    /**
     * @brief Returns whether or not destroy() was already called.
     */
    bool isDestroyed() const { return mDestroyed; }
    /**
     * @brief Destroys the associated LiquidFun particle, removing it from the @c b2ParticleSystem.
     */
    void destroy();

protected:
    /**
     * @brief Constructs a new LiquidFun particle in the particle system associated with this
     * wrapper, using the specified position, velocity, and color.
     *
     * The new particle's user data will be set to point to this object.
     * @param position Position in world coordinates to spawn the new particle at
     * @param velocity Initial velocity of the new particle
     * @param color Color to set for the new particle
     */
    void createNewParticle(const QPointF& position, const QPointF& velocity, const QColor& color);

    /**
     * @brief Associates this Particle with an existing LiquidFun particle in the
     * @c b2ParticleSystem.
     *
     * This does the equivalent of createNewParticle(), without spawning a new particle. Instead it
     * is used to "take over" particles spawned through other means. For example, when spawning
     * groups of particles using @c b2ParticleSystem::CreateParticleGroup(), multiple particles
     * get created, and can be attached to Particle wrappers using this method.
     * @param index Index of the LiquidFun particle to attach to
     */
    void mapToExistingParticle(int index);

private:
    ParticleLayer* mLayer = nullptr;
    bool mDestroyed = false;
};

#endif // PARTICLE_H
