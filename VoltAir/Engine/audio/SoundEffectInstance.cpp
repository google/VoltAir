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

#include <QSoundEffect>
#include "SoundEffectInstance.h"

SoundEffectInstance::SoundEffectInstance() {
}

SoundEffectInstance::SoundEffectInstance(const QSharedPointer<QSoundEffect>& soundEffect) :
        mSoundEffect(soundEffect) {
}

SoundEffectInstance::~SoundEffectInstance() {
    reset();
}

SoundEffectInstance::SoundEffectInstance(SoundEffectInstance&& other) {
    *this = std::move(other);
}

SoundEffectInstance& SoundEffectInstance::operator=(SoundEffectInstance&& other) {
    std::swap(mSoundEffect, other.mSoundEffect);
    std::swap(mLooped, other.mLooped);
    std::swap(mPlayingLooped, other.mPlayingLooped);
    std::swap(mVolume, other.mVolume);
    return *this;
}

void SoundEffectInstance::reset() {
    if (mSoundEffect) {
        // Release our reference.
        // We need to stop looped sounds when we release.
        stopIfNecessary(true);
        mSoundEffect.reset();
    }
}

void SoundEffectInstance::reset(SoundEffectInstance&& other) {
    reset();
    swap(other);
}

void SoundEffectInstance::swap(SoundEffectInstance& other) {
    *this = std::move(other);
}

void SoundEffectInstance::setLooped(bool value) {
    mLooped = value;
    if (mSoundEffect) {
        mSoundEffect->setLoopCount(mLooped ? QSoundEffect::Infinite : 0);
    }
}

void SoundEffectInstance::setVolume(float value) {
    mVolume = value;
    updateVolume();
}

bool SoundEffectInstance::isPlaying() const {
    if (mSoundEffect) {
        return mSoundEffect->isPlaying();
    } else {
        return false;
    }
}

void SoundEffectInstance::play() {
    applyPlay();
}

void SoundEffectInstance::stop() {
    // Note: Stopping a sound effect currently interferes with other instances.
    applyStop();
}

void SoundEffectInstance::stopIfNecessary(bool isStopped) {
    // Check if we should stop a currently looping sound.
    bool shouldStop = isStopped || !mLooped;
    if (shouldStop && mPlayingLooped) {
        applyStop();
    }
}

void SoundEffectInstance::updateVolume() {
    if (!mSoundEffect) {
        return;
    }

    // Update sound volume.
    // We only update looped sound effects. We cannot tell if we were the last instance to
    // launch one-shot sounds, and so changing volume may affect other instances.
    if (mPlayingLooped) {
        mSoundEffect->setVolume(mVolume);
    }
}

void SoundEffectInstance::applyPlay() {
    if (!mSoundEffect) {
        return;
    }

    // We need to explicitly stop the sound effect, otherwise on Android, there is a small chance
    // the QSoundEffect will fail to play, and continue failing for every single future call to
    // play.
    mSoundEffect->stop();
    mSoundEffect->setLoopCount(mLooped ? QSoundEffect::Infinite : 0);
    mPlayingLooped = mLooped;
    mSoundEffect->play();
    mSoundEffect->setVolume(mVolume);
}

void SoundEffectInstance::applyStop() {
    if (!mSoundEffect) {
        return;
    }

    mPlayingLooped = false;
    mSoundEffect->stop();
}
