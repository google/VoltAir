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

#ifndef MAGNETICATTRACTORLOGIC_H
#define MAGNETICATTRACTORLOGIC_H

#include <Box2D/Box2D.h>
#include <Engine/Logic.h>
#include <Engine/audio/SoundEffectInstance.h>

class Body;

/**
 * @brief Logic which pulls its parent #actor in the direction of magnetic Body%s and also
 * attracting them towards our Body.
 *
 * The magnet is controlled by its #on, #strength, and #softness properties. See these properties
 * for their behavior. The magnet can also use a separate sensor Body. Body%s in contact with that
 * sensor Body will be considered in range of the magnet, but the attractive force will be applied
 * to the magnet's parent #actor's Body.
 *
 * While affected by the pull of a non-dynamic magnetic Body, the parent #actor will ignore the
 * world's gravity. Gravity will be enabled when magnetism is no longer pulling on the #actor.
 *
 * A rotation offset also provides a way for the parent #actor to smoothly orient its Graphic%s
 * towards the most potent force affecting it.
 */
class MagneticAttractorLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Whether or not a magnetic Body is within range of this magnet.
     *
     * A Body is in range if it is in contact with this #actor's Body, or #sensorBody if it is set.
     */
    Q_PROPERTY(bool hasTargetInRange READ hasTargetInRange WRITE setHasTargetInRange
            NOTIFY hasTargetInRangeChanged)
    /**
     * @brief Whether or not this magnet is on, and should attract magnetic Body%s.
     *
     * This should be set in response to player input to turn the magnet on and off. This property
     * is distinct from the Logic#active property.
     */
    Q_PROPERTY(bool on READ isOn WRITE setOn NOTIFY onChanged)
    /**
     * @brief Overall strength of the magnet.
     */
    Q_PROPERTY(float strength READ getStrength WRITE setStrength NOTIFY strengthChanged)
    /**
     * @brief Amount of softness (linearity) of the magnet's attraction.
     *
     * This should be set to a value between @c 0.0f and @c 1.0f. @c 0.0f applies inverse square
     * distance attenuation, which is physically real. @c 1.0f applies inverse linear distance
     * attenuation, which feels slightly softer and less jarring but less physically accurate.
     */
    Q_PROPERTY(float softness READ getSoftness WRITE setSoftness NOTIFY softnessChanged)
    /**
     * @brief Body to use as a sensor for this magnet.
     *
     * If this is @c nullptr, this Logic's #actor's Body will be used instead. Body%s in contact
     * with the current sensor Body will be considered within range of this magnet.
     */
    Q_PROPERTY(Body* sensorBody READ getSensorBody WRITE setSensorBody NOTIFY sensorBodyChanged)
    /**
     * @brief Path to sound to play looped while the magnet is on.
     */
    Q_PROPERTY(QString activeSound READ getActiveSound WRITE setActiveSound
            NOTIFY activeSoundChanged)
public:
    /**
     * @brief Construct a MagneticAttractorLogic.
     */
    MagneticAttractorLogic();

    /**
     * @brief Returns #hasTargetInRange.
     */
    bool hasTargetInRange() const { return mHasTargetInRange; }
    /**
     * @brief Sets #hasTargetInRange.
     * @param value Boolean to set #hasTargetInRange to
     */
    void setHasTargetInRange(bool value);
    /**
     * @brief Returns #on.
     */
    bool isOn() const { return mOn; }
    /**
     * @brief Sets #on.
     * @param value Boolean to set #on to
     */
    void setOn(bool value);
    /**
     * @brief Returns #strength.
     */
    float getStrength() const { return mStrength; }
    /**
     * @brief Sets #strength.
     * @param value Float to set #strength to
     */
    void setStrength(float value);
    /**
     * @brief Returns #softness.
     */
    float getSoftness() const { return mSoftness; }
    /**
     * @brief Sets #softness.
     * @param value Float to set #softness to
     */
    void setSoftness(float value);
    /**
     * @brief Returns #sensorBody.
     */
    Body* getSensorBody() const { return mSensorBody; }
    /**
     * @brief Sets #sensorBody.
     * @param value Body to set #sensorBody to
     */
    void setSensorBody(Body* value);
    /**
     * @brief Returns #activeSound.
     */
    const QString& getActiveSound() const { return mActiveSound; }
    /**
     * @brief Sets #activeSound.
     * @param value QString to set #activeSound to
     */
    void setActiveSound(const QString& value);

    /**
     * @brief Returns the sum of magnetic forces currently being exerted by this magnet.
     */
    Q_INVOKABLE QPointF getCurrentMagneticForce() const;

    /**
     * @brief Implements Logic::init() to perform additional initialization.
     */
    virtual void init() override;
    /**
     * @brief Computes and exerts forces on magnetic objects, if #on is @c true.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #hasTargetInRange changed.
     */
    void hasTargetInRangeChanged();
    /**
     * @brief Emitted when #on changed.
     */
    void onChanged();
    /**
     * @brief Emitted when #strength changed.
     */
    void strengthChanged();
    /**
     * @brief Emitted when #softness changed.
     */
    void softnessChanged();
    /**
     * @brief Emitted when #sensorBody changed.
     */
    void sensorBodyChanged();
    /**
     * @brief Emitted when #activeSound changed.
     */
    void activeSoundChanged();

private slots:
    void onActiveChanged();

private:
    Body* getEffectiveSensorBody() const;

    bool mHasTargetInRange = false;
    bool mOn = false;
    float mStrength = 20.0f;
    float mSoftness = 1.0f;
    Body* mSensorBody = nullptr;
    QString mActiveSound;

    bool mWasOn = false;
    float mCachedGravityScale = 1.0f;
    bool mCachedMagnetism = false;
    b2Vec2 mCurrentMagneticForce = b2Vec2(0.0f, 0.0f);
    SoundEffectInstance mActiveSoundInstance;

    static const float SOFTEN_STRENGTH;
};
Q_DECLARE_METATYPE(MagneticAttractorLogic*)

#endif // MAGNETICATTRACTORLOGIC_H
