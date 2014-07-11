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

#ifndef PARTICLEEMITTERLOGIC_H
#define PARTICLEEMITTERLOGIC_H

#include <Engine/particles/WaterParticleSet.h>
#include "EmitterLogic.h"

/**
 * @brief Spawns WaterParticle%s into the world (i.e. an unbounded WaterParticleSet).
 *
 * This class can be used to create geysers or streams of particles that interact with the world.
 */
class ParticleEmitterLogic : public EmitterLogic {
    Q_OBJECT

    /**
     * @brief Color of spawned particles.
     */
    Q_PROPERTY(QColor color READ getColor WRITE setColor NOTIFY colorChanged)
    /**
     * @brief Distance units from viewport edge to automatically pause the emitter.
     */
    Q_PROPERTY(float pauseDistance READ getPauseDistance WRITE setPauseDistance
            NOTIFY pauseDistanceChanged)
    /**
     * @brief Layer to spawn particles on.
     */
    Q_PROPERTY(ParticleLayer* layer READ getLayer WRITE setLayer NOTIFY layerChanged)

public:
    /**
     * @brief Returns #color.
     */
    QColor getColor() const { return mColor; }
    /**
     * @brief Sets #color.
     * @param color Color to set #color to
     */
    void setColor(const QColor& color);
    /**
     * @brief Returns #pauseDistance.
     */
    float getPauseDistance() const { return mPauseDistance; }
    /**
     * @brief Sets #pauseDistance.
     * @param value Float to set #pauseDistance to
     */
    void setPauseDistance(float value);
    /**
     * @brief Returns #layer.
     */
    ParticleLayer* getLayer() const { return mLayer; }
    /**
     * @brief Sets #layer.
     * @param value ParticleLayer to set #layer to
     */
    void setLayer(ParticleLayer* value);

    virtual int getEntityCount() const override { return mParticles.getParticleCount(); }
    /**
     * @brief Pauses the emitter if necessary and updates the internal WaterParticleSet into which
     * particles are spawned.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #color changes.
     */
    void colorChanged();
    /**
     * @brief Emitted when #pauseDistance changes.
     */
    void pauseDistanceChanged();
    /**
     * @brief Emitted when #layer changes.
     */
    void layerChanged();

protected:
    /**
     * @brief Returns the backing WaterParticleSet.
     */
    WaterParticleSet& getWaterParticleSet() { return mParticles; }
    /**
     * @brief Spawns a new WaterParticle into an internal WaterParticleSet.
     * @param parameters Parameters to initialize the spawned WaterParticle with
     */
    virtual void emitEntity(const SpawnParameters& parameters) override;
    /**
     * @brief Empties the internal WaterParticleSet when the emitter is #paused.
     */
    virtual void onPausedChanged() override;
    /**
     * @brief Returns the bounding box of this emitter in world coordinates.
     */
    virtual QRectF getEmitterWorldBounds();

private:
    QColor mColor = QColor(0x76A8FF);
    float mPauseDistance = 8.0f;
    WaterParticleSet mParticles;
    ParticleLayer* mLayer = nullptr;
};
Q_DECLARE_METATYPE(ParticleEmitterLogic*)

#endif // PARTICLEEMITTERLOGIC_H
