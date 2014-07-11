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

#ifndef WATERPARTICLESET_H
#define WATERPARTICLESET_H

#include <QSet>
#include "WaterParticle.h"

/**
 * @ingroup Engine
 * @brief A collection of WaterParticle%s which can perform updates each frame.
 *
 * This class is used to track particles which came from the same logical source, for example a
 * particle emitter like ParticleEmitterLogic. When this object is destroyed, all associated
 * particles are also deleted.
 */
class WaterParticleSet {
public:
    /**
     * @brief Construct an empty WaterParticleSet.
     */
    WaterParticleSet();
    ~WaterParticleSet();

    /**
     * @brief Returns the number of WaterParticle%s in this set.
     */
    int getParticleCount() const { return mParticles.count(); }
    /**
     * @brief Adds a WaterParticle to be tracked by this set.
     * @param particle WaterParticle to add
     */
    void addParticle(WaterParticle* particle);
    /**
     * @brief Returns the WaterParticle associated with the given particle's user data, or
     * @c nullptr if it does not correspond to a WaterParticle in this set.
     * @param userData LiquidFun particle's user data value
     */
    WaterParticle* getParticleWithUserData(void* userData) const;
    /**
     * @brief Returns whether or not the given WaterParticle exists in this set.
     * @param particle WaterParticle to check
     */
    bool containsParticle(WaterParticle* particle) const;
    /**
     * @brief Deletes all WaterParticle%s associated with this set, deleting the associated
     * LiquidFun particles as well.
     */
    void clearParticles();
    /**
     * @brief Calls WaterParticle::update() on all WaterParticle%s in this set.
     */
    void update();

private:
    QSet<WaterParticle*> mParticles;
};

#endif // WATERPARTICLESET_H
