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

#ifndef ROLLINGMOVEMENTLOGIC_H
#define ROLLINGMOVEMENTLOGIC_H

#include <Box2D/Box2D.h>
#include <Engine/Logic.h>

/**
 * @brief Logic which exerts force in a specified direction, causing the #actor to roll in that
 * direction.
 *
 * The movement direction is specified using the #direction property. X represents forwards and
 * backwards movement, while Y represents upwards and downwards movement. This "direction" is not
 * always aligned to world space, or even gravity. When the #actor is considered "in the air", the
 * reference direction for "up" is gravity. When the #actor is close to a surface (i.e. the ground),
 * that surface's normal will be used as "up". Forward and backwards movement will be oriented to
 * this direction.
 *
 * The closest surface is found approximately by casting several rays. If no surface is found, the
 * #actor is considered "in the air" (and orients to gravity). The distance that rays will be cast
 * is controlled by the #proximityRadius property. Alternatively, when magnetism is in effect and
 * the #actor is near a magnetic object, the direction to that object's center will be used as "up".
 *
 * The force that is exerted is a combination of torque (angular acceleration) and linear
 * acceleration (i.e. jetpack-like). Because the #actor can exert a jetpack-like force, to prevent
 * the #actor from "climbing" unnaturally against gravity, damping is applied in the direction of
 * gravity. For example, if the #actor's current reference surface is a vertical wall, when the
 * #actor moves forwards, it will attempt to climb up (or down) the wall. Since this is against
 * gravity, the amount of force that is effectively exerted is reduced (compared to the force that
 * is exerted when on the ground). The amount of reduction is controlled through the
 * #antiGravityAmount property.
 */
class RollingMovementLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Direction the #actor should move in.
     *
     * This should be set by other Logic%s in response to player input.
     */
    Q_PROPERTY(QPointF direction READ getDirection WRITE setDirection NOTIFY directionChanged)
    /**
     * @brief Direction to the magnetic object this #actor is magnetizing to, or a zero vector if
     * there is currently no such object.
     *
     * This property is used to determine whether the normal "up" reference direction should be
     * overridden, and the direction to the magnetic object used instead.
     */
    Q_PROPERTY(QPointF magnetismInfluence READ getMagnetismInfluence WRITE setMagnetismInfluence
            NOTIFY magnetismInfluenceChanged)
    /**
     * @brief Speed the #actor accelerates at.
     *
     * Acceleration and top speed are also affected by Body density, and linear and angular damping.
     */
    Q_PROPERTY(float speed READ getSpeed WRITE setSpeed NOTIFY speedChanged)
    /**
     * @brief Distance that the #actor will sense other bodies to use as orientation references.
     */
    Q_PROPERTY(float proximityRadius READ getProximityRadius WRITE setProximityRadius
            NOTIFY proximityRadiusChanged)
    /**
     * @brief Amount of force the #actor can exert against gravity, as a percentage from 0.0f to
     * 1.0f.
     *
     * Setting this value high allows the #actor to climb steep hills, but also act physically
     * unrealistically.
     */
    Q_PROPERTY(float antiGravityAmount READ getAntiGravityAmount WRITE setAntiGravityAmount
            NOTIFY antiGravityAmountChanged)
    /**
     * @brief Extra force multiplier applied when turning.
     */
    Q_PROPERTY(float turnBoost READ getTurnBoost WRITE setTurnBoost NOTIFY turnBoostChanged)
    /**
     * @brief Balance of torque to linear force.
     */
    Q_PROPERTY(float torqueForceRatio READ getTorqueForceRatio WRITE setTorqueForceRatio
            NOTIFY torqueForceRatioChanged)
    /**
     * @brief Amount of falloff at higher speeds.
     *
     * A higher falloff causes the #actor to reach top speed more quickly, but reduces top speed.
     */
    Q_PROPERTY(float speedFalloffRatio READ getSpeedFalloffRatio WRITE setSpeedFalloffRatio
            NOTIFY speedFalloffRatioChanged)

public:
    /**
     * @brief Returns #direction.
     */
    QPointF getDirection() const { return mDirection; }
    /**
     * @brief Sets #direction.
     * @param value QPointF to set #direction to
     */
    void setDirection(const QPointF& value);
    /**
     * @brief Returns #magnetismInfluence.
     */
    QPointF getMagnetismInfluence() const;
    /**
     * @brief Sets #magnetismInfluence.
     * @param value QPointF to set #magnetismInfluence to
     */
    void setMagnetismInfluence(const QPointF& value);
    /**
     * @brief Returns #speed.
     */
    float getSpeed() const { return mSpeed; }
    /**
     * @brief Sets #speed.
     * @param value Float to set #speed to
     */
    void setSpeed(float value);
    /**
     * @brief Returns #proximityRadius.
     */
    float getProximityRadius() const { return mProximityRadius; }
    /**
     * @brief Sets #proximityRadius.
     * @param value Float to set #proximityRadius to
     */
    void setProximityRadius(float value);
    /**
     * @brief Returns #antiGravityAmount.
     */
    float getAntiGravityAmount() const { return mAntiGravityAmount; }
    /**
     * @brief Sets #antiGravityAmount.
     * @param value Float to set #antiGravityAmount to
     */
    void setAntiGravityAmount(float value);
    /**
     * @brief Returns #turnBoost.
     */
    float getTurnBoost() const { return mTurnBoost; }
    /**
     * @brief Sets #turnBoost.
     * @param value Float to set #turnBoost to
     */
    void setTurnBoost(float value);
    /**
     * @brief Returns #torqueForceRatio.
     */
    float getTorqueForceRatio() const { return mTorqueForceRatio; }
    /**
     * @brief Sets #torqueForceRatio.
     * @param value Float to set #torqueForceRatio to
     */
    void setTorqueForceRatio(float value);
    /**
     * @brief Returns #speedFalloffRatio.
     */
    float getSpeedFalloffRatio() const { return mSpeedFalloffRatio; }
    /**
     * @brief Sets #speedFalloffRatio.
     * @param value Float to set #speedFalloffRatio to
     */
    void setSpeedFalloffRatio(float value);

    /**
     * @brief Returns the current "up" direction used to orient movement.
     *
     * This is computed internally using one of the following: Gravity, the closest surface, or the
     * magnetic object being attracted.
     */
    Q_INVOKABLE QPointF getGroundNormal() const;

    /**
     * @brief Computes and applys torque and linear forces on this #actor's Body.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #direction changes.
     */
    void directionChanged();
    /**
     * @brief Emitted when #magnetismInfluence changes.
     */
    void magnetismInfluenceChanged();
    /**
     * @brief Emitted when #speed changes.
     */
    void speedChanged();
    /**
     * @brief Emitted when #proximityRadius changes.
     */
    void proximityRadiusChanged();
    /**
     * @brief Emitted when #antiGravityAmount changes.
     */
    void antiGravityAmountChanged();
    /**
     * @brief Emitted when #turnBoost changes.
     */
    void turnBoostChanged();
    /**
     * @brief Emitted when #torqueForceRatio changes.
     */
    void torqueForceRatioChanged();
    /**
     * @brief Emitted when #speedFalloffRatio changes.
     */
    void speedFalloffRatioChanged();

private:
    struct Ray;
    class RayCastCallbackHelper;

    QPointF mDirection;

    float mSpeed = 7.0f;
    float mProximityRadius = 0.6f;
    b2Vec2 mGroundNormal = b2Vec2(0.0f, 0.0f);
    b2Vec2 mMagnetismInfluence = b2Vec2(0.0f, 0.0f);
    float mAntiGravityAmount = 0.3f;
    float mTurnBoost = 2.0f;
    float mTorqueForceRatio = 2.0f;
    float mSpeedFalloffRatio = 0.5f;

    static const Ray PROXIMITY_TEST_RAYS[];
    static const int PROXIMITY_TEST_RAY_COUNT;
};
Q_DECLARE_METATYPE(RollingMovementLogic*)

#endif // ROLLINGMOVEMENTLOGIC_H
