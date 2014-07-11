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

#include <qmath.h>
#include "Actor.h"
#include "Body.h"
#include "Camera.h"
#include "Engine.h"
#include "ImageRenderer.h"
#include "TextureManager.h"
#include "renderer/RenderList.h"
#include "renderer/Renderer.h"
#include "utils/Util.h"

ImageRenderer::ImageRenderer(QQuickItem* parent) : Graphic(parent) {
    setFlag(ItemHasContents, true);
    mRenderNode.callback = this;
    setCulled(true);
}

ImageRenderer::~ImageRenderer() {
}

void ImageRenderer::setVisible(bool value) {
    mVisible = value;
    updateVisibility();
    emit visibleChanged();
}

void ImageRenderer::setSizeScale(float value) {
    mSizeScale = value;
    mTransformDirty = true;
    emit sizeScaleChanged();
}

void ImageRenderer::setAspectRatio(float value) {
    mAspectRatio = value;
    mTransformDirty = true;
    emit aspectRatioChanged();
}

void ImageRenderer::setSource(const QString& value) {
    bool sourceChanging = value != mSource;
    mSource = value;
    if (sourceChanging) {
        mSourceDirty = true;
    }
    emit sourceChanged();
}

void ImageRenderer::setCacheRenderParams(bool value) {
    mCacheRenderParams = value;
    emit cacheRenderParamsChanged();
}

void ImageRenderer::setCullingControlsBodyActive(bool value) {
    mCullingControlsBodyActive = value;
    emit cullingControlsBodyActiveChanged();
}

void ImageRenderer::reloadTexture() {
    mTexture = Engine::getInstance()->getTextureManager()->getTexture(mSource);
    mTransformDirty = true;
    update();
}

void ImageRenderer::updateLocalBoundingBox() {
    QRectF bounds;
    float textureAspectRatio = 1.0f;
    if (mTexture) {
        QSizeF textureSize = QSizeF(mTexture->getWidth(), mTexture->getHeight());
        computeDestTextureSize(&textureSize);
        textureAspectRatio = textureSize.height() / (float) textureSize.width();
        float scale = mSizeScale;
        float aspectRatio = mAspectRatio;
        float scaleX = scale;
        float scaleY = scale * aspectRatio;

        bounds = QRectF(-scaleX / 2, -scaleY / 2, scaleX, scaleY);
    }

    mLocalBoundingBox = bounds;
    mTextureAspectRatio = textureAspectRatio;
}

void ImageRenderer::render(RenderNode*) {
    Engine::getInstance()->getRenderer()->drawSprite(
            mRenderTexture,
            Vector2(mRenderPos.x(), mRenderPos.y()),
            mRenderSize.width(), mRenderSize.height(),
            Vector2(mRenderTextureSubRect.x(), mRenderTextureSubRect.y()),
            mRenderTextureSubRect.width(), mRenderTextureSubRect.height(),
            mRenderRotation,
            mRenderOpacity);
}

void ImageRenderer::synchronizeForRendering(RenderList* renderList) {
    // Update our texture.
    if (mSourceDirty) {
        mSourceDirty = false;
        reloadTexture();
    }
    if (mTransformDirty) {
        mTransformDirty = false;
        updateLocalBoundingBox();
    }

    // Because most objects will be off screen, cull using the object's origin. This lets us
    // check one point, instead of four.
    RenderParameters renderParams;
    if (!mCacheRenderParams || !mHasCachedRenderParams) {
        getFlattenedRenderParameters(&renderParams);
        if (mCacheRenderParams) {
            mCachedRenderParams = renderParams;
            mHasCachedRenderParams = true;
        }
    } else {
        renderParams = mCachedRenderParams;
    }
    Camera* camera = Engine::getInstance()->getCamera();
    QPointF worldPos = renderParams.worldPosition;
    const QRectF& cullBounds = camera->getWorldCullBounds();

    // The maximum extent of beyond the origin when this object is rotated is SQRT(2) / 2 times the
    // longest dimension (ie. when the object is at 45 degree rotation). As an approximation, we'll
    // just use the longest dimension since that is even longer.
    float sizeX = mLocalBoundingBox.width();
    float sizeY = mLocalBoundingBox.height();
    float majorAxisLength = qMax(fabsf(sizeX), fabsf(sizeY * mTextureAspectRatio));
    bool isCulled = (worldPos.x() + majorAxisLength) < cullBounds.left()
            || (worldPos.x() - majorAxisLength) > cullBounds.right()
            || (worldPos.y() + majorAxisLength) < cullBounds.top()
            || (worldPos.y() - majorAxisLength) > cullBounds.bottom();

    // TODO: If this object has not been culled yet, we could perform a more precise test using the
    // image's bounding box, but we would have to account for rotation and scaling.

    if (isCulled) {
        // Hide node.
        setCulled(true);
    } else {
        // Transform node.
        if (!QQuickItem::isVisible()) {
            setCulled(false);
        }

        if (!mCulled && mVisible && parentItem()->isVisible() && opacity() > 0.0f) {
            QPointF renderPos = worldPos;

            // For non-square textures, anchor their bottoms to the square centered at the pivot,
            // of the width of the texture.
            // TODO: This is a legacy thing. When we fixed the editor to support non-square
            // textures, we did it in a funny way. We should consider fixing these
            // (difficult).
            float offsetAmount = (1.0f - mTextureAspectRatio) * 0.5f * mSizeScale * mAspectRatio;
            if (offsetAmount != 0.0f) {
                // The offset we apply needs to be rotated from the y-axis into rotated space.
                float angleCos = renderParams.rotation == 0.0f ? 1.0f : qCos(renderParams.rotation);
                float angleSin = renderParams.rotation == 0.0f ? 0.0f : qSin(renderParams.rotation);
                renderPos += QPointF(offsetAmount * -angleSin, offsetAmount * angleCos);
            }

            // Copy double buffered data.
            mRenderPos = renderPos;
            mRenderSize = QSizeF(sizeX * 0.5f, sizeY * 0.5f * mTextureAspectRatio);
            mRenderRotation = renderParams.rotation;
            mRenderOpacity = renderParams.opacity;
            mRenderNode.zDepth = renderParams.zDepth;
            mRenderTextureSubRect = QRectF(0.0f, 0.0f, 1.0f, 1.0f);
            computeSourceTextureRect(&mRenderTextureSubRect);
            renderList->addNode(&mRenderNode);
        }
    }

    // Always update texture to avoid dangling pointers. Avoid excessive shared pointer copies
    // though because the texture usually changes infrequently.
    if (mTexture != mRenderTexture) {
        mRenderTexture = mTexture;
    }
}

void ImageRenderer::componentComplete() {
    Graphic::componentComplete();
    checkBody();
}

void ImageRenderer::checkBody() {
    if (mBody) {
        return;
    }
    mActor = Util::findParentOfType<Actor>(this);
    if (mActor) {
        mBody = mActor->getBody();
    }
}

void ImageRenderer::computeDestTextureSize(QSizeF*) const {
    // Default implementation does nothing.
}

void ImageRenderer::computeSourceTextureRect(QRectF*) const {
    // Default implementation does nothing.
}

void ImageRenderer::markSourceTextureRectDirty() {
    mTransformDirty = true;
}

void ImageRenderer::setCulled(bool value) {
    mCulled = value;
    updateVisibility();
}

void ImageRenderer::updateVisibility() {
    // We hid QQuickItem::setVisible, but we can still explicitly access it. Use it to hide our
    // node.
    bool visible = !mCulled && mVisible;
    if (visible != mWasVisible) {
        mWasVisible = visible;
        QQuickItem::setVisible(visible);
        if (mCullingControlsBodyActive) {
            checkBody();
            if (mBody) {
                mBody->setActive(visible);
            }
        }
    }
}
