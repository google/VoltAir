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

#ifndef CAMERA_H
#define CAMERA_H

#include <QMatrix4x4>
#include <QPointF>
#include <QQuickItem>
#include <QSGNode>
#include <memory>

/**
 * @ingroup Engine
 * @ingroup QQuickItem
 * @brief QQuickItem which represents the Camera into the game world.
 *
 * The game camera is a 2D orthographic projection, with special mechanisms to perform parallax
 * scrolling (ParallaxTransformItem). The viewport is centered around a world position (#lookAt),
 * and has a certain zoom level (#fov).
 *
 * In a game's Item hierarchy, you will find all of the game's graphical items under the Camera
 * node. This is because this node is actually providing the transform from the "world" in which
 * the game items live onto the screen.
 *
 * Updates to these properties are applied to the transform in updateTransform() and
 * applyTransform().
 */
class Camera : public QQuickItem {
    Q_OBJECT

    /**
     * @brief Zoom level of the Camera, as a field of view.
     *
     * The field of view is set to the width of the viewport in world coordinates. For example, a
     * value of @c 1.0f means the Camera can see exactly @c 1.0f unit (in world coordinates) across.
     * A value of @c 5.0f means the Camera can see @c 5.0f units across. The amount that can be seen
     * vertically is determined by the viewport's aspect ratio (#aspectRatio).
     */
    Q_PROPERTY(float fov READ getFov WRITE setFov NOTIFY fovChanged)
    /**
     * @brief Point in world coordinates that the Camera is centered around.
     *
     * Changes to this property get applied in updateTransform() and applyTransform().
     */
    Q_PROPERTY(QPointF lookAt READ getLookAt WRITE setLookAt NOTIFY lookAtChanged)
    /**
     * @brief Read only property containing the aspect ratio of the viewport.
     */
    Q_PROPERTY(float aspectRatio READ getAspectRatio)

public:
    /**
     * @brief Construct a Camera.
     * @param parent Parent item
     */
    explicit Camera(QQuickItem* parent = 0);
    virtual ~Camera();

    /**
     * @brief Returns #fov.
     */
    float getFov() const { return mFov; }
    /**
     * @brief Sets #fov.
     * @param fov Float to set #fov to
     */
    void setFov(float fov);
    /**
     * @brief Returns #lookAt.
     */
    QPointF getLookAt() const { return mLookAt; }
    /**
     * @brief Sets #lookAt.
     * @param lookAt QPointF to set #lookAt to
     */
    void setLookAt(const QPointF& lookAt);
    /**
     * @brief Returns #aspectRatio.
     */
    float getAspectRatio() const;

    /**
     * @brief Returns the current parallax origin.
     * @note This is set by Level.
     * @see ParallaxTransformItem
     */
    QPointF getParallaxOrigin() const { return mParallaxOrigin; }
    /**
     * @brief Sets the current parallax origin.
     * @note This is set by Level.
     * @param value Point in world coordinates to set as the parallax origin
     * @see ParallaxTransformItem
     */
    void setParallaxOrigin(const QPointF& value);
    /**
     * @brief Returns the Camera's offset from the parallax origin.
     * @note This is used to compute parallax scrolling offsets.
     * @see ParallaxTransformItem
     */
    QPointF getParallaxOffset() const { return mParallaxOffset; }
    /**
     * @brief Returns the matrix transform used to project world coordinates into normalized device
     * coordinates.
     */
    const QMatrix4x4& getOpenGLViewMatrix() const { return mAppliedGlViewMatrix; }
    /**
     * @brief Get the viewport rectangle in world space coordinates.
     *
     * Points within the rectangle are visible to the Camera.
     */
    const QRectF& getViewportWorldBounds() const { return mViewportWorldBounds; }
    /**
     * @brief Gets the world space rectangle encompassing the viewport, outside of which objects
     * should be culled.
     *
     * This rectangle is the viewport rectangle expanded by a padding margin.
     */
    const QRectF& getWorldCullBounds() const { return mWorldCullBounds; }

    /**
     * @brief Computes new transforms, but does not move @c Item%s visually, or update the GL
     * transform.
     */
    void updateTransform();
    /**
     * @brief Copies the computed transforms, updating @c Item%s visually and updates the GL
     * transform.
     */
    void applyTransform();

signals:
    /**
     * @brief Emitted when #fov changes.
     */
    void fovChanged();
    /**
     * @brief Emitted when #lookAt changes.
     */
    void lookAtChanged();
    /**
     * @brief Signals the current frame's update is complete and that the camera's transform now
     * points at its new location, in response to applyTransform().
     */
    void transformApplied();

protected:
    /**
     * @brief Override of QQuickItem::updatePaintNode() which forces Qt's renderer to continue
     * rendering.
     *
     * This is necessary because otherwise Qt can sometimes detect that no QQuickItem%s require
     * updating, causing the renderer to pause. Because we have visual elements moving outside of
     * Qt's QML item tree (i.e. objects in the game world, rendered through our game-specific
     * renderer), we need to force Qt to repaint.
     * @param oldNode Previous QSGNode for this QQuickItem
     * @param data Data describing update
     * @return Updated QSGNode
     */
    virtual QSGNode* updatePaintNode(QSGNode* oldNode, UpdatePaintNodeData* data) override;

private:
    QPointF toWorldSpace(const QPointF& point) const;
    void updateOpenGLViewMatrix();

    float mFov = 1.0f;
    QPointF mLookAt = QPointF(0.0f, 0.0f);
    float mTransformScale = 1.0f;
    QPointF mTransformTranslate;
    QPointF mParallaxOrigin;
    QPointF mParallaxOffset;
    QRectF mViewportWorldBounds;
    QRectF mWorldCullBounds;
    QMatrix4x4 mGlViewMatrix;
    QMatrix4x4 mAppliedGlViewMatrix;
    std::unique_ptr<QSGNode> mPaintNode;

    // The distance, in world coordinates, from the edges of the camera that objects should be
    // culled.
    constexpr static const float VIEWPORT_CULL_PADDING = 0.5f;
};
Q_DECLARE_METATYPE(Camera*)

#endif // CAMERA_H
