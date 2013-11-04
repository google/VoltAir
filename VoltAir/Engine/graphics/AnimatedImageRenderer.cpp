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

#include "AnimatedImageRenderer.h"
#include "Engine.h"

AnimatedImageRenderer::AnimatedImageRenderer(QQuickItem* parent) : ImageRenderer(parent) {
}

void AnimatedImageRenderer::setPaused(bool value) {
    mPaused = value;
    emit pausedChanged();
}

void AnimatedImageRenderer::setLooped(bool value) {
    mLooped = value;
    emit loopedChanged();
}

void AnimatedImageRenderer::setUseGameTime(bool value) {
    mUseGameTime = value;
    emit useGameTimeChanged();
}

void AnimatedImageRenderer::setFrameDelay(float value) {
    mFrameDelay = value;
    emit frameDelayChanged();
}

void AnimatedImageRenderer::setFrameCount(int value) {
    mFrameCount = value;
    if (mFrameCount > 0) {
        // Note: Not numerically stable, but better than doing divides every frame change and works
        // all right for small frame counts.
        mNormalizedInvFrameCount = 1.0f / mFrameCount;
    } else {
        mNormalizedInvFrameCount = 1.0f;
    }
    emit frameCountChanged();
}

void AnimatedImageRenderer::setCurrentFrame(int value) {
    int nextFrame = value;
    if (mFrameCount > 0) {
        nextFrame = value % mFrameCount;
    }
    moveCurrentFrame(nextFrame);
}

void AnimatedImageRenderer::setCurrentPosition(float value) {
    int nextFrame = 0;
    if (mFrameCount > 0) {
        nextFrame = qMax(0, qMin(mFrameCount - 1, int(floorf(value * mFrameCount))));
    }
    moveCurrentFrame(nextFrame);
}

void AnimatedImageRenderer::setPauseWhenHidden(bool value) {
    mPauseWhenHidden = value;
    emit pauseWhenHiddenChanged();
}

void AnimatedImageRenderer::synchronizeForRendering(RenderList* renderList) {
    // Update our animation.
    // TODO: Note, this is bad manners to do in a renderer sync.
    if (!(mPauseWhenHidden && (isCulled() || !isVisible()))) {
        updateAnimation();
    }

    return ImageRenderer::synchronizeForRendering(renderList);
}

void AnimatedImageRenderer::computeDestTextureSize(QSizeF* textureSize) const {
    textureSize->setHeight(textureSize->height() * mNormalizedInvFrameCount);
}

void AnimatedImageRenderer::computeSourceTextureRect(QRectF* textureSubRect) const {
    float frameHeight = textureSubRect->height() * mNormalizedInvFrameCount;
    float offset = frameHeight * mCurrentFrame;
    textureSubRect->setHeight(frameHeight);
    textureSubRect->moveBottom(textureSubRect->bottom() + offset);
}

void AnimatedImageRenderer::moveCurrentFrame(int frame) {
    mCurrentFrame = frame;
    mCurrentPosition = frame * mNormalizedInvFrameCount;
    markSourceTextureRectDirty();
}

void AnimatedImageRenderer::updateAnimation() {
    bool isPausedFromGame = mUseGameTime && Engine::getInstance()->isPaused();
    if (isPaused() || mFrameCount <= 0 || isPausedFromGame) {
        return;
    }

    mFrameTimer += Engine::TIME_STEP_S;
    if (mFrameTimer > mFrameDelay) {
        int oldFrame = mCurrentFrame;
        int nextFrame = oldFrame;
        int frameSteps = int(mFrameTimer / mFrameDelay);
        mFrameTimer -= frameSteps * mFrameDelay;
        nextFrame += frameSteps;

        bool reachedEnd = false;
        if (nextFrame >= mFrameCount) {
            reachedEnd = true;
            if (isLooped()) {
                nextFrame %= mFrameCount;
            } else {
                nextFrame = mFrameCount - 1;
            }
        }

        if (nextFrame != oldFrame) {
            moveCurrentFrame(nextFrame);
        }
        if (reachedEnd != mAtEnd) {
            mAtEnd = reachedEnd;
            if (mAtEnd) {
                emit animationReachedEnd();
            }
        }
    }
}
