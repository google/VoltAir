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

#ifndef WATERBODYLOGIC_H
#define WATERBODYLOGIC_H

#include "ParticleEmitterLogic.h"

/**
 * @brief Creates a body of water formed from WaterParticle%s.
 *
 * When the level starts (i.e. init() is called), this class spawns enough particles to fill
 * #actor's Body shape.
 * @note This class changes the default of #requestedMaxEntityCount to @c -1, making the default
 * bound on particles spawned to be the number of particles to fill the body of water.
 */
class WaterBodyLogic : public ParticleEmitterLogic {
    Q_OBJECT
    /**
     * @brief Distance between spawned particles in the WaterBody, as a scale of particle size.
     */
    Q_PROPERTY(float spawnStride MEMBER mSpawnStride NOTIFY spawnStrideChanged)

public:
    /**
     * @brief Constructs a WaterBodyLogic.
     */
    WaterBodyLogic();

    /**
     * @brief Returns the maximum number of particles that can be spawned by the class (i.e. the
     * maximum number of particles that can fit in the #actor's Body shape.
     */
    virtual int getSupportedMaxEntityCount() const override { return mInitialSpawnCount; }
    /**
     * @brief Spawns initial particles to fill the body of water.
     */
    virtual void init() override;
    /**
     * @brief Spawns particles to fill the WaterBody if necessary and decays particles outside of
     * the #actor's Body bounding box.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when spawnStride changes.
     */
    void spawnStrideChanged();

protected:
    /**
     * @brief Notifies WaterBodyLogic to respawn enough particles to fill #actor's Body shape if the
     * emitter has because unpaused.
     */
    virtual void onPausedChanged() override;
    virtual QRectF getEmitterWorldBounds() override;

private:
    class KeepAliveQueryCallback;

    void spawnInitialParticles();

    float mSpawnStride = 1.35f;
    bool mNeedsRespawn = false;
    int mInitialSpawnCount = 0;
    QRectF mInitialBoundingBox;
};

#endif // WATERBODYLOGIC_H
