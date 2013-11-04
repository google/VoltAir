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

#ifndef CAMERAMOVEMENTLOGIC_H
#define CAMERAMOVEMENTLOGIC_H

#include <Engine/Logic.h>
#include <QMap>

class Camera;
class QRectF;

/**
 * @brief Logic to make the camera follow the bounding box of all Actor::PlayerActor%s.
 *
 * The camera's field of view (fov) adjusts according to the size of the bounding box of all
 * Actor::PlayerActor%s that it must encapsulate. Additionally, an extrapolation of the Camera's
 * future position is used to lead it in the direction that the tracked Actor%s are moving toward.
 *
 * When the Camera's targets are at rest, it will center itself on the center of their bounding box.
 * @note This logic's #parent Actor must be a Camera.
 */
class CameraMovementLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Minimum field of view the Camera will adjust to.
     */
    Q_PROPERTY(float minFov READ getMinFov WRITE setMinFov NOTIFY minFovChanged)
    /**
     * @brief Strength of horizontal force that pull the camera to the center of the bounding box.
     */
    Q_PROPERTY(float xPullFactor READ getXPullFactor WRITE setXPullFactor NOTIFY xPullFactorChanged)
    /**
     * @brief Strength of vertical force that pull the camera to the center of the bounding box.
     */
    Q_PROPERTY(float yPullFactor READ getYPullFactor WRITE setYPullFactor NOTIFY yPullFactorChanged)
    /**
     * @brief Strength of horizontal towing forces that slowly pull the camera to the center of the
     * bounding box.
     */
    Q_PROPERTY(float towedXPullFactor READ getTowedXPullFactor WRITE setTowedXPullFactor NOTIFY
               towedXPullFactorChanged)
    /**
     * @brief Strength of vertical towing forces that slowly pull the camera to the center of the
     * bounding box.
     */
    Q_PROPERTY(float towedYPullFactor READ getTowedYPullFactor WRITE setTowedYPullFactor NOTIFY
               towedYPullFactorChanged)
    /**
     * @brief Extra distance that the camera leads the PlayerActor%s.
     */
    Q_PROPERTY(float lookaheadScale READ getLookaheadScale WRITE setLookaheadScale NOTIFY
               lookaheadScaleChanged)
    /**
     * @brief Speed of adjusting to the correct fov width.
     */
    Q_PROPERTY(float fovPullFactor READ getFovPullFactor WRITE setFovPullFactor NOTIFY
               fovPullFactorChanged)
    /**
     * @brief Extra width added to the bounding box of Actor::PlayerActor%s.
     */
    Q_PROPERTY(float xFovBorder READ getXFovBorder WRITE setXFovBorder NOTIFY xFovBorderChanged)
    /**
     * @brief Extra height added to the bounding box of Actor::PlayerActor%s.
     */
    Q_PROPERTY(float yFovBorder READ getYFovBorder WRITE setYFovBorder NOTIFY yFovBorderChanged)

public:
    /**
     * @brief Returns #minFov.
     */
    float getMinFov() const { return mMinFov; }
    /**
     * @brief Sets #minFov.
     * @param value Float to set #minFov to
     */
    void setMinFov(float value);
    /**
     * @brief Returns #xPullFactor.
     */
    float getXPullFactor() const { return mXPullFactor; }
    /**
     * @brief Sets #xPullFactor.
     * @param value Float to set #xPullFactor to
     */
    void setXPullFactor(float value);
    /**
     * @brief Returns #yPullFactor.
     */
    float getYPullFactor() const { return mYPullFactor; }
    /**
     * @brief Sets #yPullFactor.
     * @param value Float to set #yPullFactor to
     */
    void setYPullFactor(float value);
    /**
     * @brief Returns #towedXPullFactor.
     */
    float getTowedXPullFactor() const { return mTowedXPullFactor; }
    /**
     * @brief Sets #towedXPullFactor.
     * @param value Float to set #towedXPullFactor to
     */
    void setTowedXPullFactor(float value);
    /**
     * @brief Returns #towedYPullFactor.
     */
    float getTowedYPullFactor() const { return mTowedYPullFactor; }
     /**
     * @brief Sets #towedYPullFactor.
     * @param value Float to set #towedYPullFactor to
     */
    void setTowedYPullFactor(float value);
    /**
     * @brief Returns #lookaheadScale.
     */
    float getLookaheadScale() const { return mLookaheadScale; }
     /**
     * @brief Sets #lookaheadScale.
     * @param value Float to set #lookaheadScale to
     */
    void setLookaheadScale(float value);
    /**
     * @brief Returns #fovPullFactor.
     */
    float getFovPullFactor() const { return mFovPullFactor; }
     /**
     * @brief Sets #fovPullFactor.
     * @param value Float to set #fovPullFactor to
     */
    void setFovPullFactor(float value);
    /**
     * @brief Returns #xFovBorder.
     */
    float getXFovBorder() const { return mXFovBorder; }
     /**
     * @brief Sets #xFovBorder
     * @param value Float to set #xFovBorder to
     */
    void setXFovBorder(float value);
    /**
     * @brief Returns #yFovBorder.
     */
    float getYFovBorder() const { return mYFovBorder; }
    /**
     * @brief Sets #yFovBorder.
     * @param value Float to set #yFovBorder to
     */
    void setYFovBorder(float value);
    /**
     * @brief Initializes the parent #actor Camera with parameters for the current scene.
     */
    virtual void init() override;
    /**
     * @brief Updates the parent #actor Camera's properties to follow the constraints from the
     * scene.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #minFov changes.
     */
    void minFovChanged();
    /**
     * @brief Emitted when #xPullFactor changes.
     */
    void xPullFactorChanged();
    /**
     * @brief Emitted when #yPullFactor changes.
     */
    void yPullFactorChanged();
    /**
     * @brief Emitted when #towedXPullFactor changes.
     */
    void towedXPullFactorChanged();
    /**
     * @brief Emitted when #towedYPullFactor changes.
     */
    void towedYPullFactorChanged();
    /**
     * @brief Emitted when #lookaheadScale changes.
     */
    void lookaheadScaleChanged();
    /**
     * @brief Emitted when #fovPullFactor changes.
     */
    void fovPullFactorChanged();
    /**
     * @brief Emitted when #xFovBorder changes.
     */
    void xFovBorderChanged();
    /**
     * @brief Emitted when #yFovBorder changes.
     */
    void yFovBorderChanged();

private:
    /**
     * Returns the BBox of all PlayerActors in the Camera's Level, expanded to include the FOV
     * "buffer" space.
     */
    QRectF getExpandedBBoxOfPlayerActors() const;
    QPointF getExtrapolatedPosition(Actor* actor) const;
    QPointF computeLookAt(const QRectF& actorsBBox) const;
    float computeFov(const QRectF& actorsBBox) const;
    void boundCameraViewport(QPointF* lookAt, float* fov) const;
    void fillCameraViewport(QPointF* lookAt, float* fov) const;

    // Camera whose fov and lookAt is controlled by this logic
    Camera* mCamera = nullptr;
    float mMinFov = 16.0f;
    float mXPullFactor = 0.08f;
    float mYPullFactor = 0.08f;
    float mTowedXPullFactor = 0.04f;
    float mTowedYPullFactor = 0.04f;
    float mLookaheadScale = 1.0f;
    float mFovPullFactor = 1.0f;
    float mXFovBorder = 0.1f;
    float mYFovBorder = 0.1f;
    // Map of points which trail behind camera tracked actors
    QMap<Actor*, QPointF> mTowedControlPoints;
};
Q_DECLARE_METATYPE(CameraMovementLogic*)

#endif // CAMERAMOVEMENTLOGIC_H
