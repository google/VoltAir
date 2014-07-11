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

#ifndef SOUNDEFFECTINSTANCE_H
#define SOUNDEFFECTINSTANCE_H

#include <QSharedPointer>

class QSoundEffect;

/**
 * @ingroup Engine
 * @brief An instance of a sound effect.
 *
 * Separate instances of a sound effect can have different properties (i.e. volume, looped, etc.)
 * but share the same sample data (i.e. the same wave file, etc.). This class also automatically
 * stops looped sound effects when destroyed.
 * @note With the current implementation, multiple instances of the same sound effect cannot be
 * played concurrently. That is, only once instance can be heard at a time. The last instance to
 * play will override all other instances, silencing them. Instances referencing different sound
 * effect sources can still be played simultaneously.
 */
class SoundEffectInstance {
public:
    /**
     * @brief Create a SoundEffectInstance referencing nothing.
     * @note Playing this empty SoundEffectInstance has no effect.
     */
    SoundEffectInstance();
    /**
     * @brief Create a SoundEffectInstance referencing a shared @c QSoundEffect.
     *
     * When this SoundEffectInstance is destroyed, it stops @p soundEffect, if the sound is looped,
     * and then releases its reference to @p soundEffect.
     * @param soundEffect Shared @c QSoundEffect to reference
     */
    explicit SoundEffectInstance(const QSharedPointer<QSoundEffect>& soundEffect);
    /**
     * @brief Move-constructs a SoundEffectInstance instance, making it use the same shared @c
     * QSoundEffect reference that @p other was using.
     * @param other SoundEffectInstance to move into @c this
     */
    SoundEffectInstance(SoundEffectInstance&& other);
    /**
     * @brief Deleted copy constructor.
     * @param other SoundEffectInstance to copy
     */
    SoundEffectInstance(const SoundEffectInstance& other) = delete;

    ~SoundEffectInstance();

    /**
     * @brief Move assigns @p other to this SoundEffectInstance instance.
     * @param other SoundEffectInstance to move into this
     * @returns Reference to @c this
     */
    SoundEffectInstance& operator=(SoundEffectInstance&& other);
    /**
     * @brief Deleted copy and assign.
     * @param other SoundEffectInstance to copy and assign
     * @return Reference to @c this
     */
    SoundEffectInstance& operator=(const SoundEffectInstance& other) = delete;

    /**
     * @brief Releases the reference to the shared @c QSoundEffect, stopping it if necessary.
     */
    void reset();
    /**
     * @brief Releases the current @c QSoundEffect reference, replacing it with another from @p
     * other using a move operation.
     * @param other SoundEffectInstance whose shared @c QSoundEffect reference should be moved
     */
    void reset(SoundEffectInstance&& other);
    /**
     * @brief Swaps @c QSoundEffect references and parameters with another SoundEffectInstance.
     * @param other SoundEffectInstance to swap into @c this
     */
    void swap(SoundEffectInstance& other);

    /**
     * @brief Sets property to play looped or as a one-shot sound effect.
     * @note Sounds changing from looped to one-shot will be stopped if necessary.
     * @param value @c true if the SoundEffectInstance should play looped
     */
    void setLooped(bool value);
    /**
     * @brief Sets play volume property.
     *
     * @c 0.0f is silent, @c 1.0f is max volume, and values in between are linear gain factors.
     * @note Currently only the volume of looped sounds can be changed while playing.
     * @param value Volume level <tt>[0.0f, 1.0f]</tt> to set for the sound effect
     */
    void setVolume(float value);

    /**
     * @brief Returns whether or not this sample is currently playing.
     */
    bool isPlaying() const;

    /**
     * @brief Starts playing this instance of the sound effect.
     *
     * If the sound effect is already playing, it will relaunch it at the start of the sample.
     * One-shot sounds will play once, and looped samples will loop until this instance is
     * destroyed, or stop() is called.
     */
    void play();
    /**
     * @brief Stops the sample if it is currently playing.
     *
     * @note For one-shot sounds, because the current implementation cannot tell whether this is the
     * currently playing instance, this method has no effect. For looped sounds, this method assumes
     * it is the currently playing instance and stops it.
     */
    void stop();

private:
    /**
     * Stops a looping sound effect if it is either not looping anymore, or we are disposing our
     * instance.
     */
    void stopIfNecessary(bool isStopped);
    /**
     * Update sound effect volume. Currently only affects looped sounds so we don't interfere
     * with other instances.
     */
    void updateVolume();
    /**
     * Play the underlying QSoundEffect.
     */
    void applyPlay();
    /**
     * Stop the underlying QSoundEffect.
     */
    void applyStop();

    QSharedPointer<QSoundEffect> mSoundEffect;
    bool mLooped = false;
    float mVolume = 1.0f;

    // Indicates if this instance is currently playing, and is looped.
    bool mPlayingLooped = false;
};

#endif // SOUNDEFFECTINSTANCE_H
