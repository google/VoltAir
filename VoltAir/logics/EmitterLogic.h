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

#ifndef EMITTERLOGIC_H
#define EMITTERLOGIC_H

#include <Engine/Logic.h>

/**
 * @brief Abstract base class to spawn generic entities into the Game based on configurable
 * parameters.
 *
 * EmitterLogic handles the logic for determining if and how an entity needs to be spawned in
 * update(). Subclasses define the actual entity emitted by implementing emitEntity(). The spawned
 * entity's SpawnParameters::position and SpawnParameter::velocity are functions of the emitter
 * location and direction (i.e. the #actor's position and rotation in world space) and the
 * EmitterLogic parameters.
 * @note It is up to subclasses to correctly override update() to decay entities appropriately
 * according to SpawnParameters::decayTime and to accurately track entity count by implementing
 * getEntityCount().
 */
class EmitterLogic : public Logic {
    Q_OBJECT

    /**
     * @brief User-defined maximum number of entities to spawn.
     *
     * Negative values are considered infinite.
     * @default{500}
     * @note The default value can be changed through setRequestedMaxEntityCount() in subclasses,
     * so the documentation for the classes should be checked before assuming this default.
     * @see #supportedMaxEntityCount, #maxEntityCount
     */
    Q_PROPERTY(int requestedMaxEntityCount READ getRequestedMaxEntityCount
            WRITE setRequestedMaxEntityCount NOTIFY requestedMaxEntityCountChanged)
    /**
     * @brief Class-defined maximum number of entities to spawn.
     *
     * Negative values are considered infinite.
     * @note This property value can be defined by subclasses according to their functionality.
     * @see #requestedMaxEntityCount, #maxEntityCount
     */
    Q_PROPERTY(int supportedMaxEntityCount READ getSupportedMaxEntityCount)
    /**
     * @brief Actual maximum number of entities to spawn, bounded by both #requestedMaxEntityCount
     * and #supportedMaxEntityCount.
     * @see #requestedMaxEntityCount, #supportedMaxEntityCount
     */
    Q_PROPERTY(int maxEntityCount READ getMaxEntityCount)
    /**
     * @brief Number of spawned entities still in existence.
     * @note This property value is defined by subclasses according to their functionality.
     */
    Q_PROPERTY(int entityCount READ getEntityCount)
    /**
     * @brief Number of entities spawned per frame (i.e. each non-#paused call to update()).
     */
    Q_PROPERTY(float spawnRate READ getSpawnRate WRITE setSpawnRate NOTIFY spawnRateChanged)
    /**
     * @brief Forward velocity for spawned entities.
     *
     * This value represents the y-component of the initial, local velocity vector.
     */
    Q_PROPERTY(float spawnVelocity READ getSpawnVelocity WRITE setSpawnVelocity
            NOTIFY spawnVelocityChanged)
    /**
     * @brief Horizontal axis spread to apply to spawned entities.
     *
     * This value allows for the initial position of spawned entities to vary perpendicularly by up
     * to #spawnSpread units in order to prevent these entities from colliding immediately.
     */
    Q_PROPERTY(float spawnSpread READ getSpawnSpread WRITE setSpawnSpread NOTIFY spawnSpreadChanged)
    /**
     * @brief Divergence factor affecting the amount entities will stray from the direction of the
     * emitter.
     *
     * If #spawnSpray is positive, emitted entities will have a divergent SpawnParameters::velocity,
     * and if it is negative, emitted entities will have a convergent velocity.
     */
    Q_PROPERTY(float spawnSpray READ getSpawnSpray WRITE setSpawnSpray NOTIFY spawnSprayChanged)
    /**
     * @brief @c true if SpawnParameters are pseudo randomized, or patterned if @c false.
     */
    Q_PROPERTY(bool spawnRandom READ isSpawnRandom WRITE setSpawnRandom NOTIFY spawnRandomChanged)
    /**
     * @brief Number of seconds, in game time, the emitter will stay on in one cycle.
     */
    Q_PROPERTY(float timeOn READ getTimeOn WRITE setTimeOn NOTIFY timeOnChanged)
    /**
     * @brief Number of seconds, in game time, the emitter will stay off in one cycle.
     */
    Q_PROPERTY(float timeOff READ getTimeOff WRITE setTimeOff NOTIFY timeOffChanged)
    /**
     * @brief Number of seconds, in game time, the emitter takes to turn on.
     *
     * The entity spawn rate is non-linearly (quadratically) interpolated from @c 0.0f to
     * #spawnRate over #transitionOnTime seconds.
     */
    Q_PROPERTY(float transitionOnTime READ getTransitionOnTime WRITE setTransitionOnTime
            NOTIFY transitionOnTimeChanged)
    /**
     * @brief Number of seconds, in game time, the emitter takes to turn off.
     *
     * The entity spawn rate is non-linearly (quadratically) interpolated from #spawnRate to @c 0.0f
     * over #transitionOffTime seconds.
     */
    Q_PROPERTY(float transitionOffTime READ getTransitionOffTime WRITE setTransitionOffTime
            NOTIFY transitionOffTimeChanged)
    /**
     * @brief Number of seconds, in game time, before the entity is destroyed.
     *
     * This value (randomized according to #decayTimeRandomLength if #spawnRandom is @c true) is
     * used to initialize SpawnParameters::decayTime, but is not enforced by EmitterLogic. Instead,
     * it is up to subclasses to correctly override update() to decay entities appropriately.
     */
    Q_PROPERTY(float decayTime READ getDecayTime WRITE setDecayTime NOTIFY decayTimeChanged)
    /**
     * @brief Maximum time delta an entity can randomly stay alive if #spawnRandom is @c true.
     *
     * SpawnParameters::decayTime varies by [-#decayTimeRandomLength, #decayTimeRandomLength].
     * @note If #decayTimeRandomLength is greater than or equal to #decayTime,
     * SpawnParameters::decayTime could end up being negative, which means that the spawned entity
     * should decay instantly.
     */
    Q_PROPERTY(float decayTimeRandomLength READ getDecayTimeRandomLength
            WRITE setDecayTimeRandomLength NOTIFY decayTimeRandomLengthChanged)
    /**
     * @brief Whether or not this emitter should spawn entities.
     * @note This differs from #active in that the EmitterLogic will still continue cycling even
     * when #paused, simply opting not to emit entities. To stop the cycle completely, set #active
     * to @c false.
     */
    Q_PROPERTY(bool paused READ isPaused WRITE setPaused NOTIFY pausedChanged)

public:
    /**
     * @brief Parameters to use for creating and initializing spawned entities.
     */
    struct SpawnParameters {
        /**
         * @brief Position, in world space, at which to spawn the entity.
         */
        QPointF position;
        /**
         * @brief Initial velocity to give the spawned entity.
         */
        QPointF velocity;
        /**
         * @brief Number of seconds, in game time, after which the entity should be destroyed.
         */
        float decayTime;
    };

    /**
     * @brief Returns #requestedMaxEntityCount.
     */
    int getRequestedMaxEntityCount() const { return mRequestedMaxEntityCount; }
    /**
     * @brief Sets #requestedMaxEntityCount.
     * @param value Integer to set #requestedMaxEntityCount to
     */
    void setRequestedMaxEntityCount(int value);
    /**
     * @brief Returns #supportedMaxEntityCount.
     */
    virtual int getSupportedMaxEntityCount() const { return -1; }
    /**
     * @brief Returns #maxEntityCount.
     */
    int getMaxEntityCount() const;
    /**
     * @brief Returns #entityCount.
     */
    virtual int getEntityCount() const { return 0; }
    /**
     * @brief Returns #spawnRate.
     */
    float getSpawnRate() const { return mSpawnRate; }
    /**
     * @brief Sets #spawnRate.
     * @param value Float to set #spawnRate to
     */
    void setSpawnRate(float value);
    /**
     * @brief Returns #spawnVelocity.
     */
    float getSpawnVelocity() const { return mSpawnVelocity; }
    /**
     * @brief Sets #spawnVelocity.
     * @param value Float to set #spawnVelocity to
     */
    void setSpawnVelocity(float value);
    /**
     * @brief Returns #spawnSpread.
     */
    float getSpawnSpread() const { return mSpawnSpread; }
    /**
     * @brief Sets #spawnSpread.
     * @param value Float to set #spawnSpread to
     */
    void setSpawnSpread(float value);
    /**
     * @brief Returns #spawnSpray.
     */
    float getSpawnSpray() const { return mSpawnSpray; }
    /**
     * @brief Sets #spawnSpray.
     * @param value Float to set #spawnSpray to
     */
    void setSpawnSpray(float value);
    /**
     * @brief Returns #spawnRandom.
     */
    bool isSpawnRandom() const { return mSpawnRandom; }
    /**
     * @brief Sets #spawnRandom.
     * @param value Boolean to set #spawnRandom to
     */
    void setSpawnRandom(bool value);
    /**
     * @brief Returns #timeOn.
     */
    float getTimeOn() const { return mTimeOn; }
    /**
     * @brief Sets #timeOn.
     * @param value Float to set #timeOn to
     */
    void setTimeOn(float value);
    /**
     * @brief Returns #timeOff.
     */
    float getTimeOff() const { return mTimeOff; }
    /**
     * @brief Sets #timeOff.
     * @param value Float to set #timeOff to
     */
    void setTimeOff(float value);
    /**
     * @brief Returns #transitionOnTime.
     */
    float getTransitionOnTime() const { return mTransitionOnTime; }
    /**
     * @brief Sets #transitionOnTime.
     * @param value Float to set #transitionOnTime to
     */
    void setTransitionOnTime(float value);
    /**
     * @brief Returns #transitionOffTime.
     */
    float getTransitionOffTime() const { return mTransitionOffTime; }
    /**
     * @brief Sets #transitionOffTime.
     * @param value Float to set #transitionOffTime to
     */
    void setTransitionOffTime(float value);
    /**
     * @brief Returns #decayTime.
     */
    float getDecayTime() const { return mDecayTime; }
    /**
     * @brief Sets #decayTime.
     * @param value Float to set #decayTime to
     */
    void setDecayTime(float value);
    /**
     * @brief Returns #decayTimeRandomLength.
     */
    float getDecayTimeRandomLength() const { return mDecayTimeRandomLength; }
    /**
     * @brief Sets #decayTimeRandomLength.
     * @param value Float to set #decayTimeRandomLength to
     */
    void setDecayTimeRandomLength(float value);
    /**
     * @brief Returns #paused.
     */
    bool isPaused() const { return mPaused; }
    /**
     * @brief Sets #paused
     * @param value Boolean to set #paused to
     */
    void setPaused(bool value);

    /**
     * @brief Checks that the EmitterLogic has an #actor.
     */
    virtual void init() override;
    /**
     * @brief Updates the EmitterLogic cycle, calling emitEntity() for any entities that need to
     * be spawned.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #requestedMaxEntityCount changes.
     */
    void requestedMaxEntityCountChanged();
    /**
     * @brief Emitted when #spawnRate changes.
     */
    void spawnRateChanged();
    /**
     * @brief Emitted when #spawnVelocity changes.
     */
    void spawnVelocityChanged();
    /**
     * @brief Emitted when #spawnSpread changes.
     */
    void spawnSpreadChanged();
    /**
     * @brief Emitted when #spawnSpray changes.
     */
    void spawnSprayChanged();
    /**
     * @brief Emitted when #spawnRandom changes.
     */
    void spawnRandomChanged();
    /**
     * @brief Emitted when #timeOff changes.
     */
    void timeOffChanged();
    /**
     * @brief Emitted when #timeOn changes.
     */
    void timeOnChanged();
    /**
     * @brief Emitted when #transitionOnTime changes.
     */
    void transitionOnTimeChanged();
    /**
     * @brief Emitted when #transitionOffTime changes.
     */
    void transitionOffTimeChanged();
    /**
     * @brief Emitted when #decayTime changes.
     */
    void decayTimeChanged();
    /**
     * @brief Emitted when #decayTimeRandomLength changes.
     */
    void decayTimeRandomLengthChanged();
    /**
     * @brief Emitted when #paused changes.
     */
    void pausedChanged();

protected:
    /**
     * @brief Called when the emitter is moving to or from a #paused state.
     */
    virtual void onPausedChanged() { }
    /**
     * @brief Returns a randomized set of SpawnParameters according to EmitterLogic's parameters.
     */
    SpawnParameters getNextRandomSpawnParameters() const;
    /**
     * @brief Performs the creation and initialization of a spawned entity with @p parameters.
     *
     * @param parameters Parameters to configure the spawned entity with
     */
    virtual void emitEntity(const SpawnParameters& parameters);

private:
    void updateHasTimer();

    int mRequestedMaxEntityCount = 500;

    float mSpawnRate = 1.0f;
    float mSpawnVelocity = 5.0f;
    float mSpawnSpread = 0.0f;
    float mSpawnSpray = 0.0f;
    bool mSpawnRandom = true;
    bool mHasTimer = false;
    float mTimeOn = 1.0f;
    float mTimeOff = 0.0f;
    float mTransitionOnTime = 0.3f;
    bool mHasTransitionOn = true;
    float mTransitionOffTime = 0.3f;
    bool mHasTransitionOff = true;
    float mDecayTime = 3.33f;
    float mDecayTimeRandomLength = 1.667f;

    int mSpawnIndex = 0;
    float mSpawnRateCounter = 0.0f;
    float mCycleTimer = 0.0f;
    bool mPaused = false;

    static const float SPAWN_OFFSETS[];
    static const int SPAWN_OFFSET_COUNT;
    static const float SPRAY_STRENGTH;
};
Q_DECLARE_METATYPE(EmitterLogic*)

#endif // EMITTERLOGIC_H
