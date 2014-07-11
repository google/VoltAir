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

#include <QMetaType>
#include "Engine.h"
#include "InterpolationLogic.h"
#include "audio/SoundManager.h"
#include "utils/Util.h"

const QSet<int> InterpolationLogic::sValidPrimitiveTypes({
            QMetaType::Bool,
            QMetaType::Double,
            QMetaType::Float,
            QMetaType::Int,
    });

const QSet<int> InterpolationLogic::sValidNonPrimitiveTypes({
            QMetaType::QPointF,
            // TODO: Support QColor, QPoint, QRect, QRectF, QVector3D, QVector4D?
    });

InterpolationLogic::InterpolationLogic(QObject* parent) : Logic(parent) {
}

void InterpolationLogic::resolveTargetAndProperty() {
    QStringList toks = mUnresolvedTargetProperty.split(".");
    mTarget = mUnresolvedTarget;

    // Loop over each token.
    while (toks.size() != 0) {
        mTargetProperty = toks.front();
        toks.pop_front();

        QVariant subTargetVariant = mTarget->property(mTargetProperty.toUtf8());

        // If the target is a QObject, just keep advancing.
        QObject* subTarget = subTargetVariant.value<QObject*>();
        if (subTarget) {
            mTarget = subTarget;
        } else {
            // If the target is not an object, either it's a valid primitive type, valid
            // non-primitive type, or it's illegal (in which case we set the target to null so it
            // will be ignored later).
            if (sValidPrimitiveTypes.contains(subTargetVariant.userType())) {
                Q_ASSERT(toks.isEmpty());
            } else if (sValidNonPrimitiveTypes.contains(subTargetVariant.userType())) {
                Q_ASSERT(toks.size() == 1);
                mTargetNonPrimitiveProperty = toks.front();
            } else {
                qDebug() << "Property" << mTargetProperty << "on object" << mTarget->objectName()
                        << "of type" << subTargetVariant.type() << "is invalid.";
                mTarget = nullptr;
                mTargetProperty.clear();
                mTargetNonPrimitiveProperty.clear();
            }
            return;
        }
    }
    // We should never hit this point, but in case we do, consider it a failure.
    mTarget = nullptr;
}

void InterpolationLogic::init() {
    resolveTargetAndProperty();
    if (!mTarget) {
        return;
    }
    if (!mBeginValue.isValid()) {
        mBehavior = ForwardOnly;
        mBeginValue = mTarget->property(mTargetProperty.toUtf8());
    }
    if (!mEndValue.isValid()) {
        mBehavior = BackwardOnly;
        mEndValue = mTarget->property(mTargetProperty.toUtf8());
    }
}

void InterpolationLogic::update() {
    if (mState == Paused) {
        return;
    }
    if (!mTarget) {
        return;
    }
    if (mTargetProperty.isNull() || mTargetProperty.isEmpty()) {
        qDebug() << "Target property is null or empty";
        return;
    }

    float sign = (mState == Forward ? 1 : -1);
    float duration = (mState == Forward ? mForwardDuration : mBackwardDuration);
    float step = (duration == 0.0f ? 1.0f : Engine::TIME_STEP_S / duration);
    mTime = qMin(1.0f, qMax(0.0f, mTime +  sign * step));
    mTarget->setProperty(mTargetProperty.toUtf8(), getInterpolatedValue());
    if (mTime == 0 || mTime == 1) {
        setState(Paused);
    }
}

QVariant InterpolationLogic::getInterpolatedValue() {
    auto meta = mTarget->metaObject();
    auto propType = meta->property(meta->indexOfProperty(mTargetProperty.toUtf8())).userType();
    if (mTargetNonPrimitiveProperty.isEmpty()) {
        return getInterpolatedValue(propType);
    } else {
        switch(propType) {
        case QMetaType::QPointF: {
            QPointF point = mTarget->property(mTargetProperty.toUtf8()).toPointF();
            if (mTargetNonPrimitiveProperty == "x") {
                point.setX(getInterpolatedValue(QMetaType::Float).toFloat());
            } else if (mTargetNonPrimitiveProperty == "y") {
                point.setY(getInterpolatedValue(QMetaType::Float).toFloat());
            } else {
                qDebug() << mTargetNonPrimitiveProperty << "is not a property of QPointF.";
            }
            return point;
        }
        default:
            qDebug() << "QMetaType" << propType << "is not supported for interpolation.";
            return getInterpolatedValue(propType);
        }
    }
}

QVariant InterpolationLogic::getInterpolatedValue(int primitiveType) {
    float t = mTime;
    if (mHasSmoothing) {
        t = Util::smoothstep(t) * mSmoothing + t * (1 - mSmoothing);
    }
    switch (primitiveType) {
    case QMetaType::Double:
        return mBeginValue.toDouble() * (1 - t) + mEndValue.toDouble() * t;
    case QMetaType::Float:
        return mBeginValue.toFloat() * (1 - t) + mEndValue.toFloat() * t;
    case QMetaType::Int:
        return qRound(mBeginValue.toFloat() * (1 - t) + mEndValue.toFloat() * t);
    case QMetaType::Bool:
        return t < 0.5f ? mBeginValue : mEndValue;
    default:
        qDebug() << "QMetaType" << primitiveType << "not supported as primitive type.";
        return t < 0.5f ? mBeginValue : mEndValue;
    }
}

void InterpolationLogic::setTarget(QObject* value) {
    mUnresolvedTarget = value;
    emit targetChanged();
}

void InterpolationLogic::setTargetProperty(const QString& value) {
    mUnresolvedTargetProperty = value;
    emit targetPropertyChanged();
}

void InterpolationLogic::setBeginValue(QVariant value) {
    mBeginValue = value;
    emit beginValueChanged();
}

void InterpolationLogic::setEndValue(QVariant value) {
    mEndValue = value;
    emit endValueChanged();
}

void InterpolationLogic::setForwardDuration(float value) {
    mForwardDuration = value;
    emit forwardDurationChanged();
}

void InterpolationLogic::setBackwardDuration(float value) {
    mBackwardDuration = value;
    emit backwardDurationChanged();
}

void InterpolationLogic::setSmoothing(float value) {
    mSmoothing = value;
    mHasSmoothing = value != 0.0f;
    emit smoothingChanged();
}

void InterpolationLogic::setState(State value) {
    if ((value == Backward && mBehavior == ForwardOnly)
            || (value == Forward && mBehavior == BackwardOnly)) {
        return;
    }
    mState = value;
    updateInterpolatingSound();
    emit stateChanged();
}

void InterpolationLogic::setInterpolatingSound(const QString& value) {
    mInterpolatingSound = value;
    if (!value.isEmpty())  {
        mInterpolatingSoundInstance.reset(Engine::getInstance()->getSoundManager()->getSoundEffect(
                value));
    } else {
        mInterpolatingSoundInstance.reset();
    }
    emit interpolatingSoundChanged();
}

void InterpolationLogic::updateInterpolatingSound() {
    if (!mInterpolatingSoundInstance.isPlaying() && mState != Paused) {
        mInterpolatingSoundInstance.setLooped(true);
        mInterpolatingSoundInstance.play();
    } else if (mInterpolatingSoundInstance.isPlaying() && mState == Paused) {
        // We let the SoundEffect finish playing instead of hard stopping it.
        // NOTE: Long sound effects may continue for a while after interpolation has stopped,
        // as a result, short sound effects are recommended.
        mInterpolatingSoundInstance.setLooped(false);
    }
}
