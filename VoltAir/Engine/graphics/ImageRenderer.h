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

#ifndef IMAGERENDERER_H
#define IMAGERENDERER_H

#include <memory>
#include "Graphic.h"
#include "renderer/RenderNode.h"
#include "renderer/Texture.h"

class Actor;
class Body;
class QSGTexture;

/**
 * @ingroup QQuickItem
 * @brief Graphic which displays a texture as an image.
 *
 * The texture is loaded and cached using TextureManager. This class also performs a crude scissor
 * test to cull images from view, reducing the load on the geometry batch merger freeing up CPU
 * time.
 */
class ImageRenderer : public Graphic, public RenderableInterface {
    Q_OBJECT

    /**
     * @brief Override of QQuickItem's visible property to set visibility.
     * @note This is done to preserve the convention of using @c visible to control visibility.
     * Internally we set @c QQuickItem's @c visible property, and @c visible is not @c virtual, so
     * we cannot override it in the C++ sense. Instead we hide it.
     */
    Q_PROPERTY(bool visible READ isVisible WRITE setVisible NOTIFY visibleChanged)
    /**
     * @brief Width of this image, in world coordinates.
     */
    Q_PROPERTY(float sizeScale READ getSizeScale WRITE setSizeScale NOTIFY sizeScaleChanged)
    /**
     * @brief Height of this image, as a ratio of the width.
     */
    Q_PROPERTY(float aspectRatio READ getAspectRatio WRITE setAspectRatio NOTIFY aspectRatioChanged)
    /**
     * @brief Path to the source texture.
     */
    Q_PROPERTY(QString source READ getSource WRITE setSource NOTIFY sourceChanged)
    /**
     * @brief Controls whether or not the position, rotation, opacity, and z-depth are cached on
     * first render, and cached copies are used subsequently.
     *
     * This improves performance, but creates stale data if the Actor is moving or transforming.
     * @see Graphic::RenderParameters
     */
    Q_PROPERTY(bool cacheRenderParams READ getCacheRenderParams WRITE setCacheRenderParams
            NOTIFY cacheRenderParamsChanged)
    /**
     * @brief Controls whether or not the Actor's associated Body's Body#active property is linked
     * to this image's visibility.
     *
     * If this property is @c true, when this image is culled or its #visible is set to @c false,
     * the associated Body will be deactivated. The Body is found through the Actor#body property.
     */
    Q_PROPERTY(bool cullingControlsBodyActive READ getCullingControlsBodyActive
            WRITE setCullingControlsBodyActive NOTIFY cullingControlsBodyActiveChanged)
public:
    /**
     * @brief Construct an ImageRenderer.
     * @param parent Parent item
     */
    explicit ImageRenderer(QQuickItem* parent = nullptr);
    virtual ~ImageRenderer();

    /**
     * @brief Returns #visible.
     */
    bool isVisible() const { return mVisible; }
    /**
     * @brief Sets #visible.
     * @param value Boolean to set #visible to
     */
    void setVisible(bool value);
    /**
     * @brief Returns #sizeScale.
     */
    float getSizeScale() const { return mSizeScale; }
    /**
     * @brief Sets #sizeScale.
     * @param value Float to set #sizeScale to
     */
    void setSizeScale(float value);
    /**
     * @brief Returns #aspectRatio.
     */
    float getAspectRatio() const { return mAspectRatio; }
    /**
     * @brief Sets #aspectRatio.
     * @param value Float to set #aspectRatio to
     */
    void setAspectRatio(float value);
    /**
     * @brief Returns #source.
     */
    const QString& getSource() const { return mSource; }
    /**
     * @brief Sets #source.
     * @param value @c QString to set #source to
     */
    void setSource(const QString& value);
    /**
     * @brief Returns #cacheRenderParams.
     */
    bool getCacheRenderParams() const { return mCacheRenderParams; }
    /**
     * @brief Sets #cacheRenderParams.
     * @param value Boolean to set #cacheRenderParams to
     */
    void setCacheRenderParams(bool value);
    /**
     * @brief Returns #cullingControlsBodyActive.
     */
    bool getCullingControlsBodyActive() const { return mCullingControlsBodyActive; }
    /**
     * @brief Sets #cullingControlsBodyActive.
     * @param value Boolean to set #cullingControlsBodyActive to
     */
    void setCullingControlsBodyActive(bool value);

    /**
     * @brief Returns whether or not this image has been culled because it is off screen.
     */
    bool isCulled() const { return mCulled; }

signals:
    /**
     * @brief Emitted when #visible changes.
     */
    void visibleChanged();
    /**
     * @brief Emitted when #sizeScale changes.
     */
    void sizeScaleChanged();
    /**
     * @brief Emitted when #aspectRatio changes.
     */
    void aspectRatioChanged();
    /**
     * @brief Emitted when #source changes.
     */
    void sourceChanged();
    /**
     * @brief Emitted when #cacheRenderParams changes.
     */
    void cacheRenderParamsChanged();
    /**
     * @brief Emitted when #cullingControlsBodyActive changes.
     */
    void cullingControlsBodyActiveChanged();

protected:
    virtual void synchronizeForRendering(RenderList* renderList) override;
    virtual void render(RenderNode *node) override;
    /**
     * @brief Post-initialization that checks for the existence of a parent Actor and the parent
     * Actor's Body, caching the results for use in rendering.
     */
    virtual void componentComplete() override;
    /**
     * @brief Computes the size to treat the source Texture, for purposes of computing destination
     * rectangle size.
     *
     * The actual texture size is passed in as @c textureSize. The desired texture size should be
     * written back to @c textureSize.
     * @note This can be used in conjunction with computeSourceTextureRect() to select a
     * subrectangle of the source texture for rendering.
     * @note The default implementation leaves @c textureSize unmodified.
     * @param textureSize Actual texture size, also receiving desired texture size
     */
    virtual void computeDestTextureSize(QSizeF* textureSize) const;
    /**
     * @brief Computes the subrectangle within the source Texture to render.
     *
     * @c textureSubRect initially contains a unit rectangle from <tt>(0.0f, 0.0f)</tt> to
     * <tt>(1.0f, 1.0f)</tt>. The desired subrectangle should be written to @c textureSubRect by
     * this function.
     * @note This can be used in conjunction with computeDestTextureSize() to select a
     * subrectangle of the source texture for rendering.
     * @note The default implementation leaves @c textureSubRect unmodified.
     * @param textureSubRect
     */
    virtual void computeSourceTextureRect(QRectF* textureSubRect) const;
    /**
     * @brief Marks the texture rectangle as dirty, making ImageRenderer update.
     */
    void markSourceTextureRectDirty();

private:
    void reloadTexture();
    void updateLocalBoundingBox();
    void setCulled(bool value);
    void updateVisibility();
    void checkBody();

    bool mVisible = true;
    bool mWasVisible = true;
    bool mCacheRenderParams = false;
    bool mCullingControlsBodyActive = false;
    Actor* mActor = nullptr;
    Body* mBody = nullptr;
    float mSizeScale = 1.0f;
    float mAspectRatio = 1.0f;
    QRectF mLocalBoundingBox;
    float mTextureAspectRatio = 1.0f;
    QString mSource;
    bool mCulled = false;
    bool mSourceDirty = false;
    bool mTransformDirty = true;
    TexturePtr mTexture;
    bool mHasCachedRenderParams = false;
    RenderParameters mCachedRenderParams;
    // Double buffered data for threaded rendering.
    RenderNode mRenderNode;
    TexturePtr mRenderTexture;
    QPointF mRenderPos;
    QRectF mRenderTextureSubRect;
    QSizeF mRenderSize;
    float mRenderRotation = 0.0f;
    float mRenderOpacity = 1.0f;
};
Q_DECLARE_METATYPE(ImageRenderer*)

#endif // IMAGERENDERER_H
