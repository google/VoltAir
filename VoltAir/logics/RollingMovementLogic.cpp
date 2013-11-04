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

#include <Engine/Body.h>
#include <Engine/audio/SoundManager.h>
#include <Engine/utils/Box2dUtil.h>
#include <limits>
#include "RollingMovementLogic.h"

/**
 * A ray, stored as a struct to allow it to be POD.
 */
struct RollingMovementLogic::Ray {
    float x;
    float y;
    float distanceScale;

    b2Vec2 getDirection() const {
        return b2Vec2(x, y);
    }
};

/**
 * Precomputed ray cast direction vectors.
 */
const RollingMovementLogic::Ray RollingMovementLogic::PROXIMITY_TEST_RAYS[] = {
    { 1.0f, 0.0f, 1.0f },
    { M_SQRT2, M_SQRT2, 1.0f },
    { 0.0f, 1.0f, 0.8f },
    { -M_SQRT2, M_SQRT2, 1.0f },
    { -1.0f, 0.0f, 1.0f },
    { -M_SQRT2, -M_SQRT2, 1.0f },
    { 0.0f, -1.0f, 0.8f },
    { M_SQRT2, -M_SQRT2, 1.0f },
};

const int RollingMovementLogic::PROXIMITY_TEST_RAY_COUNT =
        sizeof(PROXIMITY_TEST_RAYS) / sizeof(PROXIMITY_TEST_RAYS[0]);


/**
 * Helper class used to find the closest surface to use as a direction reference.
 */
class RollingMovementLogic::RayCastCallbackHelper : public b2RayCastCallback {
public:
    RayCastCallbackHelper(b2Body* ownerBody) : ownerBody(ownerBody) {
    }

    virtual float ReportFixture(b2Fixture* fixture, const b2Vec2& point, const b2Vec2& normal,
            float fraction) override {
        if (fixture->GetBody() == ownerBody || fixture->IsSensor()) {
            // Continue ray casting.
            return -1.0f;
        }
        contactedFixture = fixture;
        contactedPoint = point;
        contactedNormal = normal;
        // Continue ray casting, but don't return fixtures further away than this point.
        // (Find the closest intersecting fixture)
        return fraction;
    }

    virtual bool ShouldQueryParticleSystem(const b2ParticleSystem*) override {
        // Ignore all particle systems for performance.
        return false;
    }

    b2Body* ownerBody = nullptr;
    b2Fixture* contactedFixture = nullptr;
    b2Vec2 contactedPoint;
    b2Vec2 contactedNormal;
};


void RollingMovementLogic::setDirection(const QPointF& value) {
    mDirection = value;
    emit directionChanged();
}

void RollingMovementLogic::setSpeed(float value) {
    mSpeed = value;
    emit speedChanged();
}

void RollingMovementLogic::setProximityRadius(float value) {
    mProximityRadius = value;
    emit proximityRadiusChanged();
}

void RollingMovementLogic::setAntiGravityAmount(float value) {
    mAntiGravityAmount = value;
    emit antiGravityAmountChanged();
}

void RollingMovementLogic::setTurnBoost(float value) {
    mTurnBoost = value;
    emit turnBoostChanged();
}

void RollingMovementLogic::setTorqueForceRatio(float value) {
    mTorqueForceRatio = value;
    emit torqueForceRatioChanged();
}

void RollingMovementLogic::setSpeedFalloffRatio(float value) {
    mSpeedFalloffRatio = value;
    emit speedFalloffRatioChanged();
}

QPointF RollingMovementLogic::getGroundNormal() const {
    return Box2dUtil::toQPointF(mGroundNormal);
}

QPointF RollingMovementLogic::getMagnetismInfluence() const {
    return Box2dUtil::toQPointF(mMagnetismInfluence);
}

void RollingMovementLogic::setMagnetismInfluence(const QPointF& value) {
    mMagnetismInfluence = Box2dUtil::toB2Vec2(value);
    emit magnetismInfluenceChanged();
}

void RollingMovementLogic::update() {
    Body* bodyItem = getActor()->getBody();
    if (!bodyItem || !bodyItem->getBody()) {
        return;
    }

    b2Body* body = bodyItem->getBody();
    b2World* world = body->GetWorld();

    // Find our "up" direction.
    b2Vec2 gravity = body->GetGravityScale() * world->GetGravity();
    b2Vec2 gravityNorm = gravity;
    gravityNorm.Normalize();

    // Start by assuming gravity is our only reference.
    b2Vec2 forwardDir = b2Vec2(gravityNorm.y, -gravityNorm.x);
    b2Vec2 upDir = -gravityNorm;
    b2Vec2 pos = body->GetWorldCenter();

    // Cast rays to find our approximately closest surface.
    b2Fixture* bestFixture = nullptr;
    float bestFixtureDist2 = std::numeric_limits<float>::max();
    b2Vec2 bestContactPos;
    b2Vec2 bestContactNormal;

    // We do not need to worry about precision because the zero vector is explicitly set.
    b2Vec2 magnetismInfluence = mMagnetismInfluence;
    bool hasMagnetism = magnetismInfluence.LengthSquared() > 0.0f;

    if (hasMagnetism) {
        magnetismInfluence.Normalize();
        upDir = -magnetismInfluence;
        forwardDir = b2Vec2(-upDir.y, upDir.x);
        mGroundNormal = upDir;
    } else {
        for (int i = 0; i < PROXIMITY_TEST_RAY_COUNT; i++) {
            RayCastCallbackHelper rayCaster(body);
            const Ray& ray = PROXIMITY_TEST_RAYS[i];
            b2Vec2 dir = mProximityRadius * ray.getDirection();
            world->RayCast(&rayCaster, pos, pos + dir);
            if (!rayCaster.contactedFixture) {
                continue;
            }

            // Check if this surface is our new best.
            float dist2 = (pos - rayCaster.contactedPoint).LengthSquared() * ray.distanceScale;
            if (dist2 < bestFixtureDist2) {
                bestFixture = rayCaster.contactedFixture;
                bestFixtureDist2 = dist2;
                bestContactPos = rayCaster.contactedPoint;
                bestContactNormal = rayCaster.contactedNormal;
            }
        }

        if (bestFixture) {
            // We found a surface we can use to orient our movement.
            // The surface normal will be our "up" vector, and its tangent is our "forward".

            // Apply some damping in the direction of gravity.
            forwardDir = b2Vec2(1, 0);
            upDir = b2Vec2(0, -1);

            b2Vec2 normal = bestContactNormal;
            b2Vec2 tangent = b2Vec2(-normal.y, normal.x);
            float tangentGravity = Box2dUtil::dotProduct(tangent, gravityNorm);
            float tangentDamping = (1 - mAntiGravityAmount) * tangentGravity;
            b2Vec2 dampedTangent = tangent - tangentDamping * gravityNorm;
            // Partially normalize it (lerped with controlAntiGravity).
            float tangentLength = dampedTangent.Length();
            dampedTangent *= mAntiGravityAmount + 1 / tangentLength * (1 - mAntiGravityAmount);

            // Dampen its effect as we move away from the surface.
            // Use distance squared.
            float dist = std::min(1.0f,  bestFixtureDist2 / mProximityRadius);
            mGroundNormal = normal;
            // Scale output normal by proximity to the surface.
            mGroundNormal *= 1 - dist;
            forwardDir = (1 - dist) * dampedTangent + dist * forwardDir;
            upDir = mGroundNormal + dist * upDir;
        } else {
            mGroundNormal = b2Vec2(0.0f, 0.0f);
        }
    }

    // Compute our forward direction and speed.
    b2Vec2 directionX = mDirection.x() * forwardDir;
    bool turning = (mDirection.x() >= 0) != (body->GetAngularVelocity() >= 0);
    float forwardSpeed2 = Box2dUtil::dotProduct(directionX, body->GetLinearVelocity());
    float turnBoost = std::max(0.0f, -forwardSpeed2) * mTurnBoost;
    float speedX = mDirection.x() * (mSpeed + turnBoost);
    b2Vec2 direction = speedX * forwardDir + mDirection.y() * upDir;
    float torque = speedX * mTorqueForceRatio;

    // Dampen our acceleration perpendicular to gravity.
    float directionGravity = Box2dUtil::dotProduct(direction, gravityNorm);
    float gravityDamping = (1 - mAntiGravityAmount) * directionGravity;
    direction -= gravityDamping * gravityNorm;

    if (!turning) {
        // Taper off our applied force when we're moving quickly.
        float forwardSpeed2 = fabsf(Box2dUtil::dotProduct(forwardDir, body->GetLinearVelocity()));
        direction *= 1.0f / (1.0f + mSpeedFalloffRatio * forwardSpeed2);
        torque /= 1 + fabsf(body->GetAngularVelocity());
    }

    // Apply forces.
    body->ApplyTorque(torque, true);
    body->ApplyForceToCenter(direction, true);
}
