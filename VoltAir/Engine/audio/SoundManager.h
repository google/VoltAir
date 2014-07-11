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

#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include <QMediaPlayer>
#include <QObject>
#include <QSoundEffect>
#include <QString>
#include <QUrl>
#include "SoundEffectInstance.h"

/**
 * @ingroup Engine
 * @brief Controls the sound effects and background music (BGM) audio tracks needed to be played
 * during the game.
 *
 * The SoundManager defines methods for:
 *   - Retrieving and loading SoundEffectInstance%s from cached @c QSoundEffect data
 *   - Defining different priority levels for BGM and methods to set audio tracks for those levels
 *   - Playing the BGM track with the highest priority level
 *
 * @note Currently, true gapless looping and track change fading are only implemented on Android.
 */
class SoundManager : public QObject {
    Q_OBJECT

    /**
     * @brief Whether or not the background music is currently muted.
     */
    Q_PROPERTY(bool bgmMuted READ isBGMMuted WRITE setBGMMuted NOTIFY bgmMutedChanged)
    /**
     * @brief Whether or not the SoundManager is currently paused (i.e. not playing audio).
     * @note Currently, the paused state only affects background music and not
     * SoundEffectInstance%s.
     */
    Q_PROPERTY(bool paused READ isPaused WRITE setPaused NOTIFY pausedChanged)

public:
    /**
     * @brief Ordered priority levels for background music tracks.
     *
     * Audio tracks of higher priority should automatically take precedence for playing.
     */
    Q_ENUMS(BGMPriority)
    enum BGMPriority {
        /**
         * @brief Represents an invalid priority level and serves as a lower bound on priority.
         */
        InvalidPriority = -1,
        /**
         * @brief Represents a priority level for audio playing on menus.
         */
        MenuPriority,
        /**
         * @brief Represents a priority level for audio playing in game Environment%s.
         */
        EnvironmentalPriority,
        /**
         * @brief Represents the highest priority level an audio track can have.
         */
        MaxPriority
    };

    /**
     * @brief Constructs a SoundManager.
     * @note It is expected that there will only ever exist one instance of SoundManager at a time.
     * @param parent Parent object
     */
    explicit SoundManager(QObject* parent = nullptr);

    /**
     * @brief Returns #bgmMuted.
     */
    bool isBGMMuted() const;
    /**
     * @brief Sets #bgmMuted.
     * @param value Boolean to set #bgmMuted to
     */
    void setBGMMuted(bool value);
    /**
     * @brief Returns #paused.
     */
    bool isPaused() const { return mPaused; }
    /**
     * @brief Sets #paused.
     *
     * This method will either stop background music from playing or resume it.
     * @note This method currently has no effect on SoundEffectInstance%s.
     * @param value Boolean to set #paused to
     */
    void setPaused(bool value);

    /**
     * @brief Loads a sound effect with sample data obtained from @p file.
     * @note Actual file IO happens in the background.
     * @note This method caches sound effect data of @p file for reuse.
     * @note Only 44.1kHz wav files have been extensively tested. Other formats may encounter odd
     * issues.
     * @param path Sound file asset path to load for the sound effect
     * @returns A SoundEffectInstance of the loaded sound effect
     */
    SoundEffectInstance getSoundEffect(const QString& path);
    /**
     * @brief Plays a one-shot sound effect.
     * @note This method caches sound effect data of @p file for reuse.
     * @note Only 44.1kHz wav files have been extensively tested. Other formats may encounter odd
     * issues.
     * @param path Sound file asset path to play for the sound effect
     */
    Q_INVOKABLE void playSoundEffect(const QString& path);

    /**
     * @brief Clears the audio track of the specified background music priority level.
     *
     * If @p priority was currently the highest priority level with an audio track set, then the
     * background music is transitioned to the next highest priority level for which an audio track
     * is set, or faded out if none are available.
     * @param priority Background music priority level to clear the audio track for
     */
    Q_INVOKABLE void clearBGMTrack(BGMPriority priority);
    /**
     * @brief Sets the audio track of the specified background priority level.
     * @param priority Background music priority level to set the audio track for
     * @param path Audio track asset path to load for the sound effect
     */
    Q_INVOKABLE void setBGMTrack(BGMPriority priority, const QString& path);

signals:
    /**
     * @brief Emitted when #bgmMuted changes.
     */
    void bgmMutedChanged();
    /**
     * @brief Emitted when #paused changes.
     */
    void pausedChanged();

private slots:
    void onBGMMediaStatusChanged(QMediaPlayer::MediaStatus status);

private:
    void updateCurrentBGMTrack();
    void pauseAll();
    void resumeAll();
    void applyVolume();
    QSharedPointer<QSoundEffect> cacheSoundEffect(const QString& path, bool lookupOnly);

    QMediaPlayer mBGMPlayer;
    QMap<BGMPriority, QUrl> mBGMTracks;
    QUrl mCurrentBGMTrack;
    QMap<QString, QSharedPointer<QSoundEffect>> mSoundEffectMap;

    bool mBGMMuted = false;
    bool mPaused = true;

    constexpr static const float BASE_MUSIC_GAIN = 0.30f;
    constexpr static const int QMEDIA_PLAYER_GAIN_FACTOR = 100;
};
Q_DECLARE_METATYPE(SoundManager*)

#endif // SOUNDMANAGER_H
