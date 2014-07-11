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

package com.google.fpl.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.media.MediaPlayer;
import android.os.Handler;
import android.util.Log;

import java.io.IOException;
import java.lang.Runnable;
import java.util.LinkedList;
import java.util.TreeMap;

/**
 * @brief Controls the background audio tracks that need gapless playback and looping on Android
 * devices.
 *
 * This class implements a subset of the API defined in SoundManager.h related to background music.
 * Specifically, it uses double buffering of Android @c MediaPlayer%s to achieve gapless looping.
 */
public class SoundManager implements MediaPlayer.OnCompletionListener {
    /**
     * @brief Represents an invalid background music priority level and serves as a lower bound on
     * priority.
     */
    public static final int INVALID_PRIORITY = -1;

    private static final String LOG_TAG = SoundManager.class.toString();
    private static final String SOUNDMANAGER_PREFS = "SoundManagerPreferences";
    private static final String BGM_MUTED = "BGMMuted";
    // The number of fixed, quantized steps for volume level between full off and full on.
    // These are used, as suggested by Android convention, for ease of use on a Ui volume slider
    // and are put on a logarithmic scale.
    private static final int NUM_VOLUME_STEPS = 100;
    private static final long BGM_FADE_DURATION = 500;

    /**
     * Helper class to asynchronously fade out from the current track and into a newly
     * specified track.
     */
    private class TransitionBGMTask implements Runnable {
        private String mTrack;

        public TransitionBGMTask(String track) {
            this.mTrack = track;
        }

        @Override
        public void run() {
            if (mCurrentBGMTrack != null) {
                // Are we still fading out?
                if (mCurrentVolumeStep > 0) {
                    updateMediaPlayerVolumes(-1);
                } else {
                    destroyMediaPlayers();
                    if (mTrack == null) {
                        startNextFadeTask();
                        return;
                    }
                }
            } else if (mTrack != null) {
                // Make sure the BGMPlayers have been initialized for the new track.
                if (mBGMPlayer == null || mBGMPlayerBuffered == null) {
                    mBGMPlayer = initMediaPlayer(mTrack);
                    mBGMPlayerBuffered = initMediaPlayer(mTrack);
                    mBGMPlayer.setNextMediaPlayer(mBGMPlayerBuffered);
                    mBGMPlayer.start();
                }

                // Are we still fading in?
                if (mCurrentVolumeStep < NUM_VOLUME_STEPS) {
                    updateMediaPlayerVolumes(1);
                } else {
                    mCurrentBGMTrack = mTrack;
                    startNextFadeTask();
                    return;
                }
            }

            mHandler.postDelayed(this, BGM_FADE_DURATION / NUM_VOLUME_STEPS);
        }
    }

    private final Handler mHandler = new Handler();
    private final TreeMap<Integer, String> mBGMTracks = new TreeMap<Integer, String>();
    private Context mContext = null;
    private String mCurrentBGMTrack = null;
    private MediaPlayer mBGMPlayer = null;
    private MediaPlayer mBGMPlayerBuffered = null;
    private int mCurrentVolumeStep = 0;
    private boolean mBGMMuted = false;
    private final LinkedList<TransitionBGMTask> mTransitionTasks =
            new LinkedList<TransitionBGMTask>();
    private TransitionBGMTask mCurrentTransitionTask = null;

    /**
     * @brief Notifies this SoundManager of the @c onStart activity lifecycle event.
     *
     * This method should be called from the @c onStart method in the main activity.
     * @param context Context to be used for the @c MediaPlayer%s
     */
    public void onStart(Context context) {
        mContext = context;
        SharedPreferences settings = mContext.getSharedPreferences(SOUNDMANAGER_PREFS,
                Context.MODE_PRIVATE);
        mBGMMuted = settings.getBoolean(BGM_MUTED, mBGMMuted);
        updateCurrentBGMTrack();
    }

    /**
     * @brief Notifies this SoundManager of the @c onStop activity lifecycle event.
     *
     * This method should be called from the @c onStop method in the main activity used to create
     * this SoundManager.
     */
    public void onStop() {
        saveSoundManagerSettings();
        destroyMediaPlayers();
        mContext = null;
    }

    /**
     * @brief Clears the audio track of the specified background music priority level.
     *
     * If @p priority was currently the highest priority level with an audio track set, then the
     * background music is transitioned to the next highest priority level for which an audio track
     * is set, or faded out if none are available.
     * @param priority %Background music priority level to clear the audio track for
     */
    public void clearBGMTrack(int priority) {
        if (mContext == null) {
            return;
        }

        if (priority != INVALID_PRIORITY) {
            mBGMTracks.remove(priority);
            updateCurrentBGMTrack();
        }
    }

    /**
     * @brief Returns whether or not the background music is muted.
     */
    public boolean isBGMMuted() {
        return mBGMMuted;
    }

    /**
     * @brief Sets the audio track of the specified background priority level.
     * @param priority %Background music priority level to set the audio track for
     * @param track Audio track asset path to load for the sound effect
     */
    public void setBGMTrack(int priority, String track) {
        if (mContext == null) {
            return;
        }

        if (priority != INVALID_PRIORITY) {
            if (!track.equals(mBGMTracks.get(priority))) {
                mBGMTracks.put(priority, track);
                updateCurrentBGMTrack();
            }
        }
    }

    /**
     * @brief Sets whether or not the background music is muted.
     * @param value @c true to mute the background music
     */
    public void setBGMMuted(boolean value) {
        mBGMMuted = value;
        updateMediaPlayerVolumes(0);
    }

    /**
     * @brief Sets SoundManager paused state.
     *
     * This method will either stop background music from playing or resume it.
     * @param value @c true to pause the background music
     */
    public void setPaused(boolean value) {
        if (mBGMPlayer != null) {
            if (value) {
                mBGMPlayer.pause();
            } else {
                mBGMPlayer.start();
            }
        }
    }

    /**
     * @brief Called when the end of a media source is reached during playback.
     *
     * This callback swaps the internally double buffered @c MediaPlayer%s to achieve gapless
     * playback.
     * @param mp @c MediaPlayer that reached the end of the sample data
     */
    @Override
    public void onCompletion(MediaPlayer mp) {
        destroyMediaPlayer(mBGMPlayer);
        mBGMPlayer = mBGMPlayerBuffered;
        mBGMPlayerBuffered = initMediaPlayer(mCurrentBGMTrack);
        mBGMPlayer.setNextMediaPlayer(mBGMPlayerBuffered);
    }

    private void updateCurrentBGMTrack() {
        int highestPriority = (!mBGMTracks.isEmpty()) ? mBGMTracks.lastKey() : INVALID_PRIORITY;
        String track = mBGMTracks.get(highestPriority);
        if (track != mCurrentBGMTrack) {
            if ((track == null && mCurrentBGMTrack != null) || !track.equals(mCurrentBGMTrack)) {
                queueFadeTask(new TransitionBGMTask(track));
            }
        }
    }

    private MediaPlayer initMediaPlayer(String track) {
        MediaPlayer mp = new MediaPlayer();
        try {
            AssetFileDescriptor afd = mContext.getAssets().openFd(track);
            mp.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
            mp.setOnCompletionListener(this);
            setVolume(mp);
            mp.prepare();
        } catch (IOException ex) {
            Log.e(LOG_TAG, "Could not initialize MediaPlayer", ex);
            mp = null;
        }
        return mp;
    }

    private void destroyMediaPlayers() {
        destroyMediaPlayer(mBGMPlayer);
        mBGMPlayer = null;
        destroyMediaPlayer(mBGMPlayerBuffered);
        mBGMPlayerBuffered = null;
        mCurrentBGMTrack = null;
    }

    private static void destroyMediaPlayer(MediaPlayer mp) {
        if (mp != null) {
            if (mp.isPlaying()) {
                mp.stop();
            }
            mp.release();
        }
    }

    private void updateMediaPlayerVolumes(int numSteps) {
        // Update the current volume step.
        mCurrentVolumeStep += numSteps;
        mCurrentVolumeStep = Math.max(0, Math.min(NUM_VOLUME_STEPS, mCurrentVolumeStep));

        setVolume(mBGMPlayer);
        setVolume(mBGMPlayerBuffered);
    }

    private void setVolume(MediaPlayer mp) {
        // Scale the volume step logarithmically.
        float volume = mBGMMuted
                ? 0.0f : 1.0f - (((float) Math.log(NUM_VOLUME_STEPS - mCurrentVolumeStep)) /
                (float) Math.log(NUM_VOLUME_STEPS));
        volume = Math.max(0.0f, Math.min(1.0f, volume));
        if (mp != null) {
            mp.setVolume(volume, volume);
        }
    }

    private void queueFadeTask(TransitionBGMTask task) {
        mTransitionTasks.addLast(task);
        if (mCurrentTransitionTask == null) {
            startNextFadeTask();
        }
    }

    private void startNextFadeTask() {
        if (!mTransitionTasks.isEmpty()) {
            mCurrentTransitionTask = mTransitionTasks.removeFirst();
            mHandler.post(mCurrentTransitionTask);
        } else {
            mCurrentTransitionTask = null;
        }
    }

    private void saveSoundManagerSettings() {
        SharedPreferences settings = mContext.getSharedPreferences(SOUNDMANAGER_PREFS,
                Context.MODE_PRIVATE);
        settings.edit().putBoolean(BGM_MUTED, mBGMMuted).commit();
    }
}
