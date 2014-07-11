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

#ifndef PARTICLELAYER_H
#define PARTICLELAYER_H

#include <QObject>

class b2ParticleSystem;

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Wrapper around a @c b2ParticleSystem, which represents an independent layer of particles.
 *
 * Each @c b2ParticleSystem contains an independent particle simulation, and can have independent
 * physical properties like radius and density. Particles on different layers do not interact.
 */
class ParticleLayer : public QObject {
    Q_OBJECT

    /**
     * @brief Radius of particles in this layer, corresponding to @c b2ParticleSystem::SetRadius().
     */
    Q_PROPERTY(float radius READ getRadius WRITE setRadius NOTIFY radiusChanged)
    /**
     * @brief Density of particles in this layer, corresponding to
     * @c b2ParticleSystem::SetDensity().
     */
    Q_PROPERTY(float density READ getDensity WRITE setDensity NOTIFY densityChanged)
    /**
     * @brief Scaling factor on gravity affecting particles in this layer, corresponding to
     * @c b2ParticleSystem::SetGravityScale().
     */
    Q_PROPERTY(float gravityScale READ getGravityScale WRITE setGravityScale
            NOTIFY gravityScaleChanged)

public:
    /**
     * @brief Construct a new ParticleLayer, and also construct a corresponding b2ParticleSystem.
     * @param parent Parent object
     */
    explicit ParticleLayer(QObject* parent = nullptr);
    virtual ~ParticleLayer();

    /**
     * @brief Returns #radius.
     */
    float getRadius() const;
    /**
     * @brief Sets #radius.
     * @param value Float to set #radius to
     */
    void setRadius(float value);
    /**
     * @brief Returns #density.
     */
    float getDensity() const;
    /**
     * @brief Sets #density.
     * @param value Float to set #density to
     */
    void setDensity(float value);
    /**
     * @brief Returns #gravityScale.
     */
    float getGravityScale() const;
    /**
     * @brief Sets #gravityScale.
     * @param value Float to set #gravityScale to
     */
    void setGravityScale(float value);

    /**
     * @brief Returns the underlying @c b2ParticleSystem.
     */
    b2ParticleSystem* getParticleSystem() const { return mParticleSystem; }

signals:
    /**
     * @brief Emitted when #radius changes.
     */
    void radiusChanged();
    /**
     * @brief Emitted when #density changes.
     */
    void densityChanged();
    /**
     * @brief Emitted when #gravityScale changes.
     */
    void gravityScaleChanged();

private:
    b2ParticleSystem* mParticleSystem = nullptr;
};
Q_DECLARE_METATYPE(ParticleLayer*)

#endif // PARTICLELAYER_H
