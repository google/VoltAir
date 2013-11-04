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

#ifndef INTERPOLATIONLOGIC_H
#define INTERPOLATIONLOGIC_H

#include <QSet>
#include <memory>
#include <queue>
#include "Logic.h"
#include "audio/SoundEffectInstance.h"

class TriggerEvent;

/**
 * @ingroup QmlQObject
 * @brief Interpolates #target's #targetProperty value between #beginValue and #endValue.
 * @note Currently, InterpolationLogic supports the following types for interpolation:
 *   - @c QMetaType::Bool
 *   - @c QMetaType::Double
 *   - @c QMetaType::Float
 *   - @c QMetaType::Int
 *   - @c QMetaType::QPointF
 */
class InterpolationLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Target object whose #targetProperty value will be interpolated.
     */
    Q_PROPERTY(QObject* target READ getTarget WRITE setTarget NOTIFY targetChanged)
    /**
     * @brief @c Q_PROPERTY of #target whose value will be interpolated.
     */
    Q_PROPERTY(QString targetProperty READ getTargetProperty WRITE setTargetProperty
               NOTIFY targetPropertyChanged)
    /**
     * @brief Value at which to start the interpolation of #target's #targetProperty.
     */
    Q_PROPERTY(QVariant beginValue READ getBeginValue WRITE setBeginValue NOTIFY beginValueChanged)
    /**
     * @brief Value at which to end the interpolation of #target's #targetProperty.
     */
    Q_PROPERTY(QVariant endValue READ getEndValue WRITE setEndValue NOTIFY endValueChanged)
    /**
     * @brief Time, in seconds, over which to perform the InterpolationLogic::Forward interpolation.
     */
    Q_PROPERTY(float forwardDuration READ getForwardDuration WRITE setForwardDuration
            NOTIFY forwardDurationChanged)
    /**
     * @brief Time, in seconds, over which to perform the InterpolationLogic::Backward
     * interpolation.
     */
    Q_PROPERTY(float backwardDuration READ getBackwardDuration WRITE setBackwardDuration
            NOTIFY backwardDurationChanged)
    /**
     * @brief Factor between linear and smooth interpolation.
     *
     * @c 0.0f is entirely linear interpolation, and @c 1.0f is entirely smooth (achieved via
     * Util::smoothstep()), which gives the interpolation the strongest easing-in and out.
     */
    Q_PROPERTY(float smoothing READ getSmoothing WRITE setSmoothing
            NOTIFY smoothingChanged)
    /**
     * @brief Current state of the interpolation.
     */
    Q_PROPERTY(State state READ getState WRITE setState NOTIFY stateChanged)
    /**
     * @brief Name of sound asset to play and loop while interpolating.
     */
    Q_PROPERTY(QString interpolatingSound READ getInterpolatingSound WRITE setInterpolatingSound
            NOTIFY interpolatingSoundChanged)
public:
    /**
     * @brief State of the interpolation.
     */
    Q_ENUMS(State)
    enum State {
        /**
         * @brief Interpolation is currently paused, not changing #targetProperty on update().
         */
        Paused = 0,
        /**
         * @brief Currently interpolating #targetProperty from #beginValue to #endValue.
         */
        Forward,
        /**
         * @brief Currently interpolating #targetProperty from #endValue to #beginValue.
         */
        Backward,
    };

    /**
     * @brief Constructs an InterpolationLogic.
     * @param parent Parent object
     */
    explicit InterpolationLogic(QObject* parent = nullptr);

    /**
     * @brief Returns #target.
     */
    QObject* getTarget() const { return mUnresolvedTarget; }
    /**
     * @brief Sets #target.
     * @param value Object to set #target to
     */
    void setTarget(QObject* value);
    /**
     * @brief Returns #targetProperty.
     */
    const QString& getTargetProperty() const { return mUnresolvedTargetProperty; }
    /**
     * @brief Sets #targetProperty.
     * @param value String to set #targetProperty to
     */
    void setTargetProperty(const QString& value);
    /**
     * @brief Returns #beginValue.
     */
    QVariant getBeginValue() const { return mBeginValue; }
    /**
     * @brief Sets #beginValue.
     * @param value Value to set #beginValue to
     */
    void setBeginValue(QVariant value);
    /**
     * @brief Returns #endValue.
     */
    QVariant getEndValue() const { return mEndValue; }
    /**
     * @brief Sets #endValue.
     * @param value Value to set #endValue to
     */
    void setEndValue(QVariant value);
    /**
     * @brief Returns #forwardDuration.
     */
    float getForwardDuration() const { return mForwardDuration; }
    /**
     * @brief Sets #forwardDuration.
     * @param value Seconds to set #forwardDuration to
     */
    void setForwardDuration(float value);
    /**
     * @brief Returns #backwardDuration.
     */
    float getBackwardDuration() const { return mBackwardDuration; }
    /**
     * @brief Sets #backwardDuration.
     * @param value Seconds to set #backwardDuration to
     */
    void setBackwardDuration(float value);
    /**
     * @brief Returns #smoothing.
     */
    float getSmoothing() const { return mSmoothing; }
    /**
     * @brief Sets #smoothing.
     * @param value Factor to set #smoothing to
     */
    void setSmoothing(float value);
    /**
     * @brief Returns #state.
     */
    State getState() const { return mState; }
    /**
     * @brief Sets #state.
     * @param value State to set #state to
     */
    void setState(State value);
    /**
     * @brief Returns #interpolatingSound.
     */
    const QString& getInterpolatingSound() const { return mInterpolatingSound; }
    /**
     * @brief Sets #interpolatingSound.
     * @param value String to set #interpolatingSound to
     */
    void setInterpolatingSound(const QString& value);

    /**
     * @brief Resolves #target and #targetProperty.
     *
     * Specifically, if #targetProperty is of the form where it's prefixed by a period-separated
     * list of sub-@c QObject%s (e.g. <tt>target: actor15</tt>, <tt>property: body.width</tt>), this
     * module makes the appropriate transformation to where it is no longer implicitly referencing
     * these sub-@c QObject%s (e.g. <tt>target: actor15.body</tt>, <tt>property: width</tt>.
     * Furthermore, this function also compensates for the fact that #targetProperty may have a
     * non-@c QObject, non-primitive element of the list that needs to be part of the
     * #targetProperty. For instance, <tt>target: actor15</tt>, <tt>property: body.linearVelocity.x
     * </tt> would be parsed to <tt>actor15.body</tt>, <tt>property: linearVelocity</tt>, with
     * special handling for @c x sub-component.
     */
    virtual void init() override;
    /**
     * @brief Performs an Engine::TIME_STEP_S based step in the interpolation if #state is not
     * InterpolationLogic::Paused.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #target changes.
     */
    void targetChanged();
    /**
     * @brief Emitted when #targetProperty changes.
     */
    void targetPropertyChanged();
    /**
     * @brief Emitted when #beginValue changes.
     */
    void beginValueChanged();
    /**
     * @brief Emitted when #endValue changes.
     */
    void endValueChanged();
    /**
     * @brief Emitted when #forwardDuration changes.
     */
    void forwardDurationChanged();
    /**
     * @brief Emitted when #backwardDuration changes.
     */
    void backwardDurationChanged();
    /**
     * @brief Emitted when #smoothing changes.
     */
    void smoothingChanged();
    /**
     * @brief Emitted when #state changes.
     */
    void stateChanged();
    /**
     * @brief Emitted when #interpolatingSound changes.
     */
    void interpolatingSoundChanged();

private:
    enum Behavior {
        Bidirectional = 0,
        ForwardOnly,
        BackwardOnly,
    };

    void resolveTargetAndProperty();
    QVariant getInterpolatedValue();
    QVariant getInterpolatedValue(int primitiveType);
    void updateInterpolatingSound();

    QObject* mUnresolvedTarget = nullptr;
    QString mUnresolvedTargetProperty;
    QObject* mTarget = nullptr;
    QString mTargetProperty;
    QString mTargetNonPrimitiveProperty;
    QVariant mBeginValue;
    QVariant mEndValue;
    float mForwardDuration = 1.0f;
    float mBackwardDuration = 1.0f;
    bool mHasSmoothing = false;
    float mSmoothing = 0.0f;
    State mState = Paused;
    Behavior mBehavior = Bidirectional;
    float mTime = 0.0f;
    QString mInterpolatingSound;
    SoundEffectInstance mInterpolatingSoundInstance;

    const static QSet<int> sValidPrimitiveTypes;
    const static QSet<int> sValidNonPrimitiveTypes;
};
Q_DECLARE_METATYPE(InterpolationLogic*)

#endif // INTERPOLATIONLOGIC_H
