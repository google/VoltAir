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

#include "SoundManager.h"
#include "utils/Util.h"

#ifdef Q_OS_ANDROID
#include "android/AndroidActivity.h"
#endif

SoundManager::SoundManager(QObject* parent) : QObject(parent) {
    applyVolume();
    connect(&mBGMPlayer, &QMediaPlayer::mediaStatusChanged, this,
            &SoundManager::onBGMMediaStatusChanged, Qt::DirectConnection);
}

SoundEffectInstance SoundManager::getSoundEffect(const QString& path) {
    return SoundEffectInstance(cacheSoundEffect(path, false));
}

void SoundManager::playSoundEffect(const QString& path) {
    // Create a temporary SoundEffectInstance so everything goes through there.
    SoundEffectInstance(cacheSoundEffect(path, false)).play();
}

void SoundManager::clearBGMTrack(BGMPriority priority) {
#ifdef Q_OS_ANDROID
    AndroidActivity::clearBGMTrack(int(priority));
#else
    if (priority != InvalidPriority) {
        mBGMTracks.remove(priority);
        updateCurrentBGMTrack();
    }
#endif
}

void SoundManager::setBGMTrack(BGMPriority priority, const QString& path) {
#ifdef Q_OS_ANDROID
    AndroidActivity::setBGMTrack(int(priority), path);
#else
    if (priority != InvalidPriority) {
        QUrl track = Util::getUrlPathToAsset(path);
        if (track != mBGMTracks[priority]) {
            mBGMTracks[priority] = track;
            updateCurrentBGMTrack();
        }
    }
#endif
}

bool SoundManager::isBGMMuted() const {
#ifdef Q_OS_ANDROID
    return AndroidActivity::isBGMMuted();
#else
    return mBGMMuted;
#endif
}

void SoundManager::setBGMMuted(bool value) {
#ifdef Q_OS_ANDROID
    AndroidActivity::setBGMMuted(value);
#else
    mBGMMuted = value;
    applyVolume();
    emit bgmMutedChanged();
#endif
}

void SoundManager::setPaused(bool value) {
    if (value) {
        pauseAll();
    } else {
        resumeAll();
    }
    emit pausedChanged();
}

void SoundManager::onBGMMediaStatusChanged(QMediaPlayer::MediaStatus status) {
    if ((status == QMediaPlayer::LoadedMedia || status == QMediaPlayer::EndOfMedia) && !mPaused) {
        mBGMPlayer.play();
    }
}

QSharedPointer<QSoundEffect> SoundManager::cacheSoundEffect(const QString& path, bool lookupOnly) {
    // TODO: Consider making case insensitive.
    QSharedPointer<QSoundEffect> soundEffect = mSoundEffectMap.value(path);
    if (soundEffect) {
        return soundEffect;
    }
    if (lookupOnly) {
        // Note: QSharedPointer doesn't support implicit cast from nullptr.
        return QSharedPointer<QSoundEffect>();
    }

    soundEffect.reset(new QSoundEffect());
    mSoundEffectMap[path] = soundEffect;

    soundEffect->setSource(Util::getUrlPathToAsset(path));
    return soundEffect;
}

void SoundManager::updateCurrentBGMTrack() {
    const QUrl& bgmTrack = (!mBGMTracks.isEmpty()) ? mBGMTracks.last() : QUrl();
    if (bgmTrack != mCurrentBGMTrack) {
        mBGMPlayer.setMedia(bgmTrack);
        mCurrentBGMTrack = bgmTrack;
    }
}

void SoundManager::pauseAll() {
    if (mPaused) {
        return;
    }
    mPaused = true;
#ifdef Q_OS_ANDROID
    AndroidActivity::setBGMPaused(true);
#else
    if (mBGMPlayer.state() == QMediaPlayer::PlayingState) {
        mBGMPlayer.stop();
    }
#endif
}

void SoundManager::resumeAll() {
    if (!mPaused) {
        return;
    }
    mPaused = false;
#ifdef Q_OS_ANDROID
    AndroidActivity::setBGMPaused(false);
#else
    if (mBGMPlayer.mediaStatus() == QMediaPlayer::LoadedMedia
            || mBGMPlayer.mediaStatus() == QMediaPlayer::BufferedMedia) {
        mBGMPlayer.play();
    }
#endif
}

void SoundManager::applyVolume() {
    if (mBGMMuted) {
        mBGMPlayer.setVolume(0);
    } else {
        mBGMPlayer.setVolume((int) (BASE_MUSIC_GAIN * QMEDIA_PLAYER_GAIN_FACTOR));
    }
}
