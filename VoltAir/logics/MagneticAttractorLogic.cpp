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

#include <Box2D/Box2D.h>
#include <Engine/Body.h>
#include <Engine/Engine.h>
#include <Engine/audio/SoundManager.h>
#include <Engine/utils/Box2dUtil.h>
#include <QtMath>
#include "MagneticAttractorLogic.h"
#include "MagneticHighlightLogic.h"

// Amount to decrease magnet strength, when attenuation softness (linearity) is maximum.
const float MagneticAttractorLogic::SOFTEN_STRENGTH = 1.0f;

MagneticAttractorLogic::MagneticAttractorLogic() {
    connect(this, &MagneticAttractorLogic::activeChanged, this,
            &MagneticAttractorLogic::onActiveChanged);
}

void MagneticAttractorLogic::setHasTargetInRange(bool value) {
    if (mHasTargetInRange == value) {
        return;
    }

    mHasTargetInRange = value;
    emit hasTargetInRangeChanged();
}

void MagneticAttractorLogic::setOn(bool value) {
    mOn = value;
    emit onChanged();
}

void MagneticAttractorLogic::setStrength(float value) {
    mStrength = value;
    emit strengthChanged();
}

void MagneticAttractorLogic::setSoftness(float value) {
    mSoftness = value;
    emit softnessChanged();
}

void MagneticAttractorLogic::setSensorBody(Body* value) {
    mSensorBody = value;
    emit sensorBodyChanged();
}

void MagneticAttractorLogic::setActiveSound(const QString& value) {
    mActiveSound = value;
    mActiveSoundInstance.reset(Engine::getInstance()->getSoundManager()->getSoundEffect(value));
    mActiveSoundInstance.setLooped(true);
    emit activeSoundChanged();
}

void MagneticAttractorLogic::init() {
    Logic::init();
}

QPointF MagneticAttractorLogic::getCurrentMagneticForce() const {
    return Box2dUtil::toQPointF(mCurrentMagneticForce);
}

void MagneticAttractorLogic::update() {
    Actor* actor = getActor();
    Q_ASSERT(actor);

    Body* body = actor->getBody();
    Q_ASSERT(body);

    Body* sensorBody = getEffectiveSensorBody();
    Q_ASSERT(sensorBody);

    // Notify magnetic actors that they are within range of our attractor field.
    bool hadTarget = false;
    for (Body* otherBody : sensorBody->getContactedBodies()) {
        if (!otherBody->isMagnetic()) {
            continue;
        }

        Engine::getInstance()->forEach<MagneticHighlightLogic>(otherBody->getActor(),
                [&hadTarget] (MagneticHighlightLogic* highlightLogic) {
                    highlightLogic->notifyInAttractorRange();
                    hadTarget = true;
                });
    }
    // Also update our own status.
    setHasTargetInRange(hadTarget);

    // Compute and apply forces if magnet is on.
    if (!mOn && mOn == mWasOn) {
        return;
    }

    bool turnedOn = mOn && !mWasOn;
    bool turnedOff = !mOn && mWasOn;

    b2Vec2 forceBody(0.0f, 0.0f);
    b2Vec2 nonDynamicForceBody(0.0f, 0.0f);
    bool hadNonDynamicForce = false;
    for (Body* otherBody : sensorBody->getContactedBodies()) {
        if (!otherBody->isMagnetic() || body->getActor() == otherBody->getActor()) {
            continue;
        }

        // Compute attenuation factors.
        b2Vec2 delta = body->getBody()->GetPosition() - otherBody->getBody()->GetPosition();
        float squareAttenuation = delta.LengthSquared();
        float linearAttenuation = sqrtf(squareAttenuation);
        float attenuation = squareAttenuation * (1 - mSoftness) +
                linearAttenuation * mSoftness * SOFTEN_STRENGTH;
        float forceStrength = mStrength * otherBody->getMagneticStrength() / attenuation;
        b2Vec2 forceOtherBody = forceStrength * delta;

        // Kinematic and Static bodies have 0 mass so skip them
        if (otherBody->getBodyType() == Body::DynamicBody) {
            forceOtherBody *= otherBody->getBody()->GetMass();
        }

        // Apply this force to the attracted body.
        otherBody->applyForceToCenter(QPointF(forceOtherBody.x, forceOtherBody.y));
        forceBody -= forceOtherBody;

        if (otherBody->getBodyType() != Body::DynamicBody) {
            nonDynamicForceBody -= forceOtherBody;
            hadNonDynamicForce = true;
        }
    }

    if (hadNonDynamicForce && !turnedOff) {
        if (body->getGravityScale() != 0.0f) {
            mCachedGravityScale = body->getGravityScale();
            // Disable gravity
            body->setGravityScale(0.0f);
        }
    } else if (mCachedGravityScale != 0.0f) {
        // Enable gravity if magnetism has just been disabled or actor has moved out of range.
        body->setGravityScale(mCachedGravityScale);
    }

    // Apply this force to our body.
    body->applyForceToCenter(Box2dUtil::toQPointF(forceBody));
    mCurrentMagneticForce = nonDynamicForceBody;

    // Do sound effects.
    if (turnedOn) {
        mActiveSoundInstance.play();
        mCachedMagnetism = body->isMagnetic();
        // Force the body to be magnetic.
        body->setMagnetic(true);
    } else if (turnedOff) {
        mActiveSoundInstance.stop();
        // Return the body to its original magnetism.
        body->setMagnetic(mCachedMagnetism);
        mCurrentMagneticForce.Set(0.0f, 0.0f);
    }

    mWasOn = mOn;
}

void MagneticAttractorLogic::onActiveChanged() {
    mActiveSoundInstance.stop();
}

Body* MagneticAttractorLogic::getEffectiveSensorBody() const {
    return mSensorBody ? mSensorBody : getActor()->getBody();
}
