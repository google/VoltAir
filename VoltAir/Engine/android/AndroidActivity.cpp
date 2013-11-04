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

#include "AndroidActivity.h"

#if defined(Q_OS_ANDROID)

#include <GameInput/ControllerEvent.h>
#include <GameInput/routers/GamepadRouter.h>
#include <GameInput/routers/KeyboardRouter.h>
#include <GameInput/routers/TouchNavigationRouter.h>
#include <QDebug>
#include <QGuiApplication>
#include <QKeyEvent>
#include <QQuickWindow>
#include <android/input.h>
#include <cassert>
#include <cmath>
#include "Engine.h"
// TODO: remove references to Game from this module.
#include "Game.h"
#include "LevelProgression.h"
#include "UiInternal.h"
#include "audio/SoundManager.h"
#include "inputs/InputArea.h"

#define JAVA_PACKAGE_PREFIX "com/google/fpl/"

QMap<int, JoystickAxisCode> AndroidActivity::sGamepadJoystickAxisConversionMap({
            { AMOTION_EVENT_AXIS_X, LEFT_ANALOG_X },
            { AMOTION_EVENT_AXIS_Y, LEFT_ANALOG_Y },
            { AMOTION_EVENT_AXIS_Z, RIGHT_ANALOG_X },
            { AMOTION_EVENT_AXIS_RZ, RIGHT_ANALOG_Y },
        });
QMap<int, TriggerAxisCode> AndroidActivity::sGamepadTriggerAxisConversionMap({
            { AMOTION_EVENT_AXIS_LTRIGGER, LEFT_TRIGGER },
            { AMOTION_EVENT_AXIS_RTRIGGER, RIGHT_TRIGGER },
            { AMOTION_EVENT_AXIS_BRAKE, LEFT_TRIGGER },
            { AMOTION_EVENT_AXIS_GAS, RIGHT_TRIGGER },
        });
QMap<int, JoystickAxisCode> AndroidActivity::sTouchNavigationJoystickAxisConversionMap({
            { AMOTION_EVENT_AXIS_X, TOUCH_NAVIGATION_X },
            { AMOTION_EVENT_AXIS_Y, TOUCH_NAVIGATION_Y },
        });

QMap<KeyCode, int> AndroidActivity::sKeycodeConversionMap({
            { KEYCODE_BUTTON_A, Qt::Key_Enter },
            { KEYCODE_BUTTON_B, InputArea::Key_Button_B },
            { KEYCODE_ESCAPE, Qt::Key_Escape },
        });

QMap<int, QEvent::Type> AndroidActivity::sActionConversionMap({
            { AMOTION_EVENT_ACTION_DOWN, QEvent::KeyPress },
            { AMOTION_EVENT_ACTION_UP, QEvent::KeyRelease },
        });

QSet<KeyCode> AndroidActivity::sUnmappableKeycodes({
            KEYCODE_BACK,
            KEYCODE_ESCAPE,
        });

jobject AndroidActivity::sActivity = nullptr;

jclass AndroidActivity::sActivityClass = nullptr;
jclass AndroidActivity::sSoundManagerClass = nullptr;
jclass AndroidActivity::sMotionEventClass = nullptr;
jclass AndroidActivity::sKeyEventClass = nullptr;
jclass AndroidActivity::sInputDeviceClass = nullptr;
jclass AndroidActivity::sMotionRangeClass = nullptr;
jclass AndroidActivity::sDebugClass = nullptr;

JavaVM* AndroidActivity::sJavaVM = nullptr;

SelfDetachingJNIEnv AndroidActivity::getEnv(JavaVM* vm) {
    if (vm) {
        sJavaVM = vm;
    }
    return SelfDetachingJNIEnv::fromJVM(sJavaVM);
}

void AndroidActivity::onCreate(JNIEnv* jni, jobject activity) {
    qDebug() << "In Native onCreate";

    if (!sActivity) {
        sActivity = jni->NewGlobalRef(activity);
    }

    Engine* engine = Engine::getInstance(false);
    if (engine) {
        engine->onDeviceCreate();
    }
}

void AndroidActivity::onStart() {
    qDebug() << "In Native onStart";
    Engine* engine = Engine::getInstance(false);
    if (engine) {
        engine->onDeviceStart();
    }
}

void AndroidActivity::onResume() {
    qDebug() << "In Native onResume";
    Engine* engine = Engine::getInstance(false);
    if (engine) {
        // TODO: turn this into a signal/slot somehow.
        engine->onDeviceResume();
    }
}

void AndroidActivity::onPause() {
    qDebug() << "In Native onPause";
    Engine* engine = Engine::getInstance(false);
    if (engine) {
        // TODO: turn this into a signal/slot somehow.
        engine->onDevicePause();
    }
}

void AndroidActivity::onStop() {
    qDebug() << "In Native onStop";

    Engine* engine = Engine::getInstance(false);
    if (engine) {
        engine->onDeviceStop();
    }
}

void AndroidActivity::onDestroy(JNIEnv* jni, jobject) {
    qDebug() << "In Native onDestroy";

    // Must delete reference to Android Activity to make sure it doesn't leak.
    if (sActivity) {
        jni->DeleteGlobalRef(sActivity);
        sActivity = nullptr;
    }

    Engine* engine = Engine::getInstance(false);
    if (engine) {
        engine->onDeviceDestroy();
    }
}

void AndroidActivity::onControllerDisconnect(JNIEnv*, jobject, int deviceId) {
    TouchNavigationRouter::getInstance()->onControllerDisconnect(deviceId);
    GamepadRouter::getInstance()->onControllerDisconnect(deviceId);
    KeyboardRouter::getInstance()->onControllerDisconnect(deviceId);
}

bool AndroidActivity::onGamepadMotionEvent(JNIEnv* jni, jobject, jobject motionEvent) {
    ControllerEvent controllerEvent(getMotionEventDeviceId(jni, motionEvent));

    for (auto it = sGamepadJoystickAxisConversionMap.begin();
            it != sGamepadJoystickAxisConversionMap.end(); ++it) {
        controllerEvent.setJoystickAxisValue(it.value(), getAxisValue(jni, motionEvent, it.key()));
    }

    for (auto it = sGamepadTriggerAxisConversionMap.begin();
            it != sGamepadTriggerAxisConversionMap.end(); ++it) {
        controllerEvent.setTriggerAxisValue(it.value(), getAxisValue(jni, motionEvent, it.key()));
    }

    float dpadX = getAxisValue(jni, motionEvent, AMOTION_EVENT_AXIS_HAT_X);
    float dpadY = getAxisValue(jni, motionEvent, AMOTION_EVENT_AXIS_HAT_Y);

    // Gamepad (at least all the ones we are using) handle DPad as a Joystick, even though the
    // values are stuck to -1, 0, 1.
    controllerEvent.setKeyState(KEYCODE_DPAD_LEFT, dpadX < 0);
    controllerEvent.setKeyState(KEYCODE_DPAD_RIGHT, dpadX > 0);
    controllerEvent.setKeyState(KEYCODE_DPAD_UP, dpadY < 0);
    controllerEvent.setKeyState(KEYCODE_DPAD_DOWN, dpadY > 0);

    GamepadRouter::getInstance()->routeControllerEvent(&controllerEvent);
    return shouldConsumeTranslatedEvents();
}

bool AndroidActivity::onGamepadKeyEvent(JNIEnv* jni, jobject, jobject keyEvent) {
    // Process the KeyEvent into a ControllerEvent, and route it for Gamepads if it is an event
    // that we should not ignore.
    ControllerEvent controllerEvent;
    if (onKeyEvent(jni, keyEvent, &controllerEvent)) {
        GamepadRouter::getInstance()->routeControllerEvent(&controllerEvent);
        return shouldConsumeTranslatedEvents();
    } else {
        return false;
    }
}

bool AndroidActivity::onTouchNavigationMotionEvent(JNIEnv* jni, jobject, jobject motionEvent) {
    jclass motionEventClass = getMotionEventClass(jni, motionEvent);
    jmethodID getActionMaskedMethod = jni->GetMethodID(motionEventClass, "getActionMasked", "()I");
    int action = jni->CallIntMethod(motionEvent, getActionMaskedMethod);

    ControllerEvent controllerEvent(getMotionEventDeviceId(jni, motionEvent));

    for (auto it = sTouchNavigationJoystickAxisConversionMap.begin();
            it != sTouchNavigationJoystickAxisConversionMap.end(); ++it) {
        float touchNavigationAxisValue = 0.0f;
        if (action != AMOTION_EVENT_ACTION_UP) {
            touchNavigationAxisValue = getNormalizedJoystickAxisValue(jni, motionEvent, it.key());
            // TODO: To address this we could use a better smoothing function.
            if (touchNavigationAxisValue < 0) {
                touchNavigationAxisValue = -1.0f;
            } else if (touchNavigationAxisValue > 0) {
                touchNavigationAxisValue = 1.0f;
            }
        }
        controllerEvent.setJoystickAxisValue(it.value(), touchNavigationAxisValue);
    }

    TouchNavigationRouter::getInstance()->routeControllerEvent(&controllerEvent);
    return shouldConsumeTranslatedEvents();
}

bool AndroidActivity::onTouchNavigationKeyEvent(JNIEnv* jni, jobject, jobject keyEvent) {
    // Process the KeyEvent into a ControllerEvent, and route it for touch navigation devices if
    // it is an event that we should not ignore.
    ControllerEvent controllerEvent;
    if (onKeyEvent(jni, keyEvent, &controllerEvent)) {
        TouchNavigationRouter::getInstance()->routeControllerEvent(&controllerEvent);
        return shouldConsumeTranslatedEvents();
    } else {
        return false;
    }
}

bool AndroidActivity::onKeyboardKeyEvent(JNIEnv* jni, jobject, jobject keyEvent) {
    ControllerEvent controllerEvent;
    if (onKeyEvent(jni, keyEvent, &controllerEvent)) {
        KeyboardRouter::getInstance()->routeControllerEvent(&controllerEvent);
        return shouldConsumeTranslatedEvents();
    } else {
        return false;
    }
}

void AndroidActivity::onSignedIntoCloudChanged(JNIEnv*, jobject, bool signedIntoCloud) {
    // Signal Engine. If we manage to fail to sign in very quickly after starting our activity (ie.
    // WiFi is off) we might not even have a Engine instance yet.
    Engine* engine = Engine::getInstance(false);
    if (engine) {
        engine->onSignedIntoCloudChanged(signedIntoCloud);
    }
}

void AndroidActivity::onCloudDataLoaded(JNIEnv* jni, jobject, int statusCode, jstring javaData) {
    QString data;
    if (javaData) {
        const char* nativeData = jni->GetStringUTFChars(javaData, nullptr);
        data = QString::fromUtf8(nativeData);
        jni->ReleaseStringUTFChars(javaData, nativeData);
    }
    Engine::getInstance()->onCloudDataLoaded(statusCode, data);
}

jstring AndroidActivity::onCloudDataConflict(JNIEnv* jni, jobject, jstring javaLocalData,
        jstring javaCloudData) {
    QString localData;
    if (javaLocalData) {
        const char* nativeLocalData = jni->GetStringUTFChars(javaLocalData, nullptr);
        localData = QString::fromUtf8(nativeLocalData);
        jni->ReleaseStringUTFChars(javaLocalData, nativeLocalData);
    }
    QString cloudData;
    if (javaCloudData) {
        const char* nativeCloudData = jni->GetStringUTFChars(javaCloudData, nullptr);
        cloudData = QString::fromUtf8(nativeCloudData);
        jni->ReleaseStringUTFChars(javaCloudData, nativeCloudData);
    }
    QString resolvedData = Game::getInstance()->onCloudDataConflict(localData,
            cloudData);
    std::string nativeResolvedData = resolvedData.toStdString();
    return jni->NewStringUTF(nativeResolvedData.c_str());
}

bool AndroidActivity::isSignedIntoCloud() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID isSignedIntoCloudMethod = jni->GetMethodID(activityClass, "isSignedIntoCloud", "()Z");
    return jni->CallBooleanMethod(getActivity(), isSignedIntoCloudMethod);
}

bool AndroidActivity::cloudSignInFailed() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID cloudSignInFailedMethod = jni->GetMethodID(activityClass, "cloudSignInFailed", "()Z");
    return jni->CallBooleanMethod(getActivity(), cloudSignInFailedMethod);
}

void AndroidActivity::signIntoCloud() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID signIntoCloudMethod = jni->GetMethodID(activityClass, "signIntoCloud", "()V");
    jni->CallVoidMethod(getActivity(), signIntoCloudMethod);
}

void AndroidActivity::signOutOfCloud() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID signOutOfCloudMethod = jni->GetMethodID(activityClass, "signOutOfCloud", "()V");
    jni->CallVoidMethod(getActivity(), signOutOfCloudMethod);
}

bool AndroidActivity::ensureCloudSync() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID ensureCloudSyncMethod = jni->GetMethodID(activityClass, "ensureCloudSync", "()Z");
    return jni->CallBooleanMethod(getActivity(), ensureCloudSyncMethod);
}

void AndroidActivity::saveToCloud(const QString& data) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID saveCloudDataMethod = jni->GetMethodID(activityClass, "saveToCloud",
            "(Ljava/lang/String;)V");
    std::string nativeData = data.toStdString();
    jstring javaData = jni->NewStringUTF(nativeData.c_str());
    jni->CallVoidMethod(getActivity(), saveCloudDataMethod, javaData);
    jni->DeleteLocalRef(javaData);
}

void AndroidActivity::clearCloudData() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID clearCloudDataMethod = jni->GetMethodID(activityClass, "clearCloudData", "()V");
    jni->CallVoidMethod(getActivity(), clearCloudDataMethod);
}

bool AndroidActivity::revealAchievement(const QString& name) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID revealAchievementMethod = jni->GetMethodID(activityClass, "revealAchievement",
            "(Ljava/lang/String;)Z");
    std::string nativeName = name.toStdString();
    jstring javaName = jni->NewStringUTF(nativeName.c_str());
    bool ret = jni->CallBooleanMethod(getActivity(), revealAchievementMethod, javaName);
    jni->DeleteLocalRef(javaName);
    return ret;
}

bool AndroidActivity::unlockAchievement(const QString& name) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID unlockAchievementMethod = jni->GetMethodID(activityClass, "unlockAchievement",
            "(Ljava/lang/String;)Z");
    std::string nativeName = name.toStdString();
    jstring javaName = jni->NewStringUTF(nativeName.c_str());
    bool ret = jni->CallBooleanMethod(getActivity(), unlockAchievementMethod, javaName);
    jni->DeleteLocalRef(javaName);
    return ret;
}

bool AndroidActivity::incrementAchievement(const QString& name, int numSteps) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID incrementAchievementMethod = jni->GetMethodID(activityClass, "incrementAchievement",
            "(Ljava/lang/String;I)Z");
    std::string nativeName = name.toStdString();
    jstring javaName = jni->NewStringUTF(nativeName.c_str());
    bool ret = jni->CallBooleanMethod(getActivity(), incrementAchievementMethod, javaName,
            numSteps);
    jni->DeleteLocalRef(javaName);
    return ret;
}

bool AndroidActivity::setAchievementSteps(const QString& name, int minSteps) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID setAchievementStepsMethod = jni->GetMethodID(activityClass, "setAchievementSteps",
            "(Ljava/lang/String;I)Z");
    std::string nativeName = name.toStdString();
    jstring javaName = jni->NewStringUTF(nativeName.c_str());
    bool ret = jni->CallBooleanMethod(getActivity(), setAchievementStepsMethod, javaName, minSteps);
    jni->DeleteLocalRef(javaName);
    return ret;
}

void AndroidActivity::showAchievementsRequested() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID showAchievementsRequestedMethod = jni->GetMethodID(activityClass,
            "showAchievementsRequested", "()V");
    jni->CallVoidMethod(getActivity(), showAchievementsRequestedMethod);
}

void AndroidActivity::resetAchievementsRequested() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID resetAchievementsRequestedMethod = jni->GetMethodID(activityClass,
            "resetAchievementsRequested", "()V");
    jni->CallVoidMethod(getActivity(), resetAchievementsRequestedMethod);
}

QString AndroidActivity::getVersionName() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return QString();
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID getVersionNameMethod = jni->GetMethodID(activityClass, "getVersionName",
            "()Ljava/lang/String;");
    jstring javaVersionName = reinterpret_cast<jstring>(jni->CallObjectMethod(getActivity(),
            getVersionNameMethod));
    if (!javaVersionName) {
        return QString();
    }
    const char* nativeVersionName = jni->GetStringUTFChars(javaVersionName, nullptr);
    QString versionName = QString::fromUtf8(nativeVersionName);
    jni->ReleaseStringUTFChars(javaVersionName, nativeVersionName);
    jni->DeleteLocalRef(javaVersionName);
    return versionName;
}

long AndroidActivity::getMemoryUsed() {
    auto jni = getEnv();
    if (!jni) {
        return 0;
    }
    jclass debugClass = getDebugClass(jni.getJNIEnv());
    jmethodID getNativeHeapAllocatedSizeMethod = jni->GetStaticMethodID(debugClass,
            "getNativeHeapAllocatedSize", "()J");
    return jni->CallStaticLongMethod(debugClass, getNativeHeapAllocatedSizeMethod, -1);
}

int AndroidActivity::getTouchScreenDeviceId() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return -1;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID getTouchScreenDeviceIdMethod = jni->GetMethodID(activityClass,
            "getTouchScreenDeviceId","()I");
    return jni->CallIntMethod(getActivity(), getTouchScreenDeviceIdMethod);
}

jobject AndroidActivity::getSoundManager() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return nullptr;
    }
    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID getSoundManagerMethod = jni->GetMethodID(activityClass, "getSoundManager",
            "()L" JAVA_PACKAGE_PREFIX "utils/SoundManager;");
    return jni->CallObjectMethod(getActivity(), getSoundManagerMethod);
}

void AndroidActivity::clearBGMTrack(int priority) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jobject soundManager = getSoundManager();
    jclass soundManagerClass = getSoundManagerClass(jni.getJNIEnv(), soundManager);
    jmethodID clearBGMTrackMethod = jni->GetMethodID(soundManagerClass, "clearBGMTrack", "(I)V");
    jni->CallVoidMethod(soundManager, clearBGMTrackMethod, priority);
    jni->DeleteLocalRef(soundManager);
}

void AndroidActivity::setBGMTrack(int priority, const QString &track) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jobject soundManager = getSoundManager();
    jclass soundManagerClass = getSoundManagerClass(jni.getJNIEnv(), soundManager);
    jmethodID setBGMTrackMethod = jni->GetMethodID(soundManagerClass, "setBGMTrack",
            "(ILjava/lang/String;)V");
    std::string nativeTrack = track.toStdString();
    jstring javaTrack = jni->NewStringUTF(nativeTrack.c_str());
    jni->CallVoidMethod(soundManager, setBGMTrackMethod, priority, javaTrack);
    jni->DeleteLocalRef(javaTrack);
    jni->DeleteLocalRef(soundManager);
}

bool AndroidActivity::isBGMMuted() {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return false;
    }
    jobject soundManager = getSoundManager();
    jclass soundManagerClass = getSoundManagerClass(jni.getJNIEnv(), soundManager);
    jmethodID isBGMMutedMethod = jni->GetMethodID(soundManagerClass, "isBGMMuted", "()Z");
    bool isBGMMuted = jni->CallBooleanMethod(soundManager, isBGMMutedMethod);
    jni->DeleteLocalRef(soundManager);
    return isBGMMuted;
}

void AndroidActivity::setBGMMuted(bool value) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jobject soundManager = getSoundManager();
    jclass soundManagerClass = getSoundManagerClass(jni.getJNIEnv(), soundManager);
    jmethodID setBGMMutedMethod = jni->GetMethodID(soundManagerClass, "setBGMMuted", "(Z)V");
    jni->CallVoidMethod(soundManager, setBGMMutedMethod, value);
    jni->DeleteLocalRef(soundManager);
}

void AndroidActivity::setBGMPaused(bool value) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }
    jobject soundManager = getSoundManager();
    jclass soundManagerClass = getSoundManagerClass(jni.getJNIEnv(), soundManager);
    jmethodID setPausedMethod = jni->GetMethodID(soundManagerClass, "setPaused", "(Z)V");
    jni->CallVoidMethod(soundManager, setPausedMethod, value);
    jni->DeleteLocalRef(soundManager);
}

void AndroidActivity::setTrackerScreenName(const QString& screenName, bool sendScreenView) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }

    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID setTrackerScreenNameMethod = jni->GetMethodID(activityClass, "setTrackerScreenName",
            "(Ljava/lang/String;Z)V");

    std::string nativeScreenName = screenName.toStdString();
    jstring javaScreenName = jni->NewStringUTF(nativeScreenName.c_str());
    jni->CallVoidMethod(getActivity(), setTrackerScreenNameMethod, javaScreenName, sendScreenView);
    jni->DeleteLocalRef(javaScreenName);
}

void AndroidActivity::sendTrackerEvent(const QString& category, const QString& action) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }

    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID sendTrackerEventMethod = jni->GetMethodID(activityClass, "sendTrackerEvent",
            "(Ljava/lang/String;Ljava/lang/String;)V");

    std::string nativeCategory = category.toStdString();
    std::string nativeAction = action.toStdString();
    jstring javaCategory = jni->NewStringUTF(nativeCategory.c_str());
    jstring javaAction = jni->NewStringUTF(nativeAction.c_str());

    jni->CallVoidMethod(getActivity(), sendTrackerEventMethod, javaCategory, javaAction);
    jni->DeleteLocalRef(javaCategory);
    jni->DeleteLocalRef(javaAction);
}

void AndroidActivity::sendTrackerEvent(const QString& category, const QString& action,
        const QString& label) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }

    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID sendTrackerEventMethod = jni->GetMethodID(activityClass, "sendTrackerEvent",
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");

    std::string nativeCategory = category.toStdString();
    std::string nativeAction = action.toStdString();
    std::string nativeLabel = label.toStdString();
    jstring javaCategory = jni->NewStringUTF(nativeCategory.c_str());
    jstring javaAction = jni->NewStringUTF(nativeAction.c_str());
    jstring javaLabel = jni->NewStringUTF(nativeLabel.c_str());

    jni->CallVoidMethod(getActivity(), sendTrackerEventMethod, javaCategory, javaAction, javaLabel);
    jni->DeleteLocalRef(javaCategory);
    jni->DeleteLocalRef(javaAction);
    jni->DeleteLocalRef(javaLabel);
}

void AndroidActivity::sendTrackerEvent(const QString& category, const QString& action,
        const QString& label, long value) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }

    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID sendTrackerEventMethod = jni->GetMethodID(activityClass, "sendTrackerEvent",
            "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V");

    std::string nativeCategory = category.toStdString();
    std::string nativeAction = action.toStdString();
    std::string nativeLabel = label.toStdString();
    jstring javaCategory = jni->NewStringUTF(nativeCategory.c_str());
    jstring javaAction = jni->NewStringUTF(nativeAction.c_str());
    jstring javaLabel = jni->NewStringUTF(nativeLabel.c_str());

    jni->CallVoidMethod(getActivity(), sendTrackerEventMethod, javaCategory, javaAction, javaLabel,
            value);
    jni->DeleteLocalRef(javaCategory);
    jni->DeleteLocalRef(javaAction);
    jni->DeleteLocalRef(javaLabel);
}

void AndroidActivity::sendTrackerEvent(const QString& category, const QString& action, long value) {
    auto jni = getEnv();
    if (!jni || !getActivity()) {
        return;
    }

    jclass activityClass = getActivityClass(jni.getJNIEnv());
    jmethodID sendTrackerEventMethod = jni->GetMethodID(activityClass, "sendTrackerEvent",
            "(Ljava/lang/String;Ljava/lang/String;J)V");

    std::string nativeCategory = category.toStdString();
    std::string nativeAction = action.toStdString();
    jstring javaCategory = jni->NewStringUTF(nativeCategory.c_str());
    jstring javaAction = jni->NewStringUTF(nativeAction.c_str());

    jni->CallVoidMethod(getActivity(), sendTrackerEventMethod, javaCategory, javaAction, value);
    jni->DeleteLocalRef(javaCategory);
    jni->DeleteLocalRef(javaAction);
}

KeyCode AndroidActivity::getKeyCode(JNIEnv* jni, jobject keyEvent) {
    jclass keyEventClass = getKeyEventClass(jni, keyEvent);
    jmethodID getKeyCodeMethod = jni->GetMethodID(keyEventClass, "getKeyCode", "()I");
    return static_cast<KeyCode>(jni->CallIntMethod(keyEvent, getKeyCodeMethod));
}

int AndroidActivity::getKeyAction(JNIEnv* jni, jobject keyEvent) {
    jclass keyEventClass = getKeyEventClass(jni, keyEvent);
    jmethodID getActionMethod = jni->GetMethodID(keyEventClass, "getAction", "()I");
    return jni->CallIntMethod(keyEvent, getActionMethod);
}

bool AndroidActivity::onKeyEvent(JNIEnv* jni, jobject keyEvent,
        ControllerEvent* controllerEvent) {
    int action = getKeyAction(jni, keyEvent);

    // Ignore repeated events.
    if (action == AKEY_EVENT_ACTION_MULTIPLE) {
        return false;
    }

    KeyCode keyCode = getKeyCode(jni, keyEvent);

    // QtActivity is able to convert *most* KeyEvents into corresponding QKeyEvents.
    // However, QtActivity is unable to understand Gamepad buttons, converting them to
    // Qt::Key_Unknown, so we must workaround and capture all key events we know will fail Qt's
    // translation and translate and post ourselves.
    Engine* engine = Engine::getInstance(false);
    if (engine && engine->isInitialized()) {
        QKeyEvent* translatedKeyEvent = convertAndroidKeyEvent(action, keyCode);
        if (translatedKeyEvent) {
            QGuiApplication::postEvent(engine->getRoot()->window(), translatedKeyEvent);
        }
    }

    // Skip over keys which cannot be mapped. For example, the events that are needed to activate
    // the Ui (see "shouldConsumeTranslatedEvents").
    if (sUnmappableKeycodes.contains(keyCode)) {
        return false;
    }

    controllerEvent->setDeviceId(getKeyEventDeviceId(jni, keyEvent));
    controllerEvent->setKeyState(keyCode, action == AKEY_EVENT_ACTION_DOWN);
    return true;
}

jclass AndroidActivity::getActivityClass(JNIEnv* jni, jobject activity)  {
    if (!sActivityClass) {
        // TODO: remove voltAir reference.
        sActivityClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (activity) ? jni->GetObjectClass(activity)
                           : jni->FindClass(JAVA_PACKAGE_PREFIX "voltair/VoltAirActivity")));
        assert(sActivityClass);
    }
    return sActivityClass;
}

jclass AndroidActivity::getSoundManagerClass(JNIEnv* jni, jobject soundManager) {
    if (!sSoundManagerClass) {
        sSoundManagerClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (soundManager) ? jni->GetObjectClass(soundManager)
                               : jni->FindClass(JAVA_PACKAGE_PREFIX "utils/SoundManager")));
    }
    return sSoundManagerClass;
}

jclass AndroidActivity::getMotionEventClass(JNIEnv* jni, jobject motionEvent) {
    if (!sMotionEventClass) {
        sMotionEventClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (motionEvent) ? jni->GetObjectClass(motionEvent)
                              : jni->FindClass("android/view/MotionEvent")));
    }
    return sMotionEventClass;
}

jclass AndroidActivity::getKeyEventClass(JNIEnv* jni, jobject keyEvent) {
    if (!sKeyEventClass && keyEvent) {
        sKeyEventClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (keyEvent) ? jni->GetObjectClass(keyEvent)
                           : jni->FindClass("android/view/KeyEvent")));
    }
    return sKeyEventClass;
}

jclass AndroidActivity::getInputDeviceClass(JNIEnv* jni, jobject inputDevice) {
    if (!sInputDeviceClass && inputDevice) {
        sInputDeviceClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (inputDevice) ? jni->GetObjectClass(inputDevice)
                              : jni->FindClass("android/view/InputDevice")));
    }
    return sInputDeviceClass;
}

jclass AndroidActivity::getMotionRangeClass(JNIEnv* jni, jobject motionRange) {
    if (!sMotionRangeClass && motionRange) {
        sMotionRangeClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                (motionRange) ? jni->GetObjectClass(motionRange)
                              : jni->FindClass("android/view/InputDevice$MotionRange")));
    }
    return sMotionRangeClass;
}

jclass AndroidActivity::getDebugClass(JNIEnv *jni) {
    if (!sDebugClass) {
        sDebugClass = reinterpret_cast<jclass>(jni->NewGlobalRef(
                jni->FindClass("android/os/Debug")));
    }
    return sDebugClass;
}

// NOTE: The following two functions could be combined into one by using jni->IsInstanceOf
// but they were separated into two methods for better performance

int AndroidActivity::getMotionEventDeviceId(JNIEnv* jni, jobject motionEvent) {
    jclass motionEventClass = getMotionEventClass(jni, motionEvent);
    jmethodID getDeviceIdMethod = jni->GetMethodID(motionEventClass, "getDeviceId", "()I" );
    return jni->CallIntMethod(motionEvent, getDeviceIdMethod);
}

int AndroidActivity::getKeyEventDeviceId(JNIEnv* jni, jobject keyEvent) {
    jclass keyEventClass = getKeyEventClass(jni, keyEvent);
    jmethodID getDeviceIdMethod = jni->GetMethodID(keyEventClass, "getDeviceId", "()I" );
    return jni->CallIntMethod(keyEvent, getDeviceIdMethod);
}

jobject AndroidActivity::getInputDevice(JNIEnv* jni, jobject motionEvent) {
    jclass motionEventClass = getMotionEventClass(jni, motionEvent);
    jmethodID getDeviceMethod = jni->GetMethodID(motionEventClass, "getDevice",
            "()Landroid/view/InputDevice;");
    return jni->CallObjectMethod(motionEvent, getDeviceMethod);
}

jobject AndroidActivity::getMotionRange(JNIEnv* jni, jobject motionEvent, int axis) {
    // We are "leaking" this local reference, however this should be automatically freed since this
    // function is only called on the Java Activity thread (i.e. we did not AttachCurrentThread).
    // http://developer.android.com/training/articles/perf-jni.html#local_and_global_references
    jobject device = getInputDevice(jni, motionEvent);
    jclass deviceClass = getInputDeviceClass(jni, device);
    jmethodID getMotionRangeMethod = jni->GetMethodID(deviceClass, "getMotionRange",
            "(I)Landroid/view/InputDevice$MotionRange;");
    return jni->CallObjectMethod(device, getMotionRangeMethod, axis);
}

float AndroidActivity::getAxisValue(JNIEnv* jni, jobject motionEvent, int axis, float* flatOut,
        float* minOut, float* rangeOut) {
    jclass motionEventClass = getMotionEventClass(jni, motionEvent);
    jmethodID getAxisValueMethod = jni->GetMethodID(motionEventClass, "getAxisValue", "(I)F");
    float axisValue = jni->CallFloatMethod(motionEvent, getAxisValueMethod, axis);

    // We are "leaking" this local reference, however this should be automatically freed since this
    // function is only called on the Java Activity thread (i.e. we did not AttachCurrentThread).
    // http://developer.android.com/training/articles/perf-jni.html#local_and_global_references
    jobject motionRange = getMotionRange(jni, motionEvent, axis);
    // If no motion range, we have to make assumptions and return "defaults".
    if (motionRange != nullptr) {
        jclass motionRangeClass = getMotionRangeClass(jni, motionRange);

        jmethodID getFlatMethod = jni->GetMethodID(motionRangeClass, "getFlat", "()F");
        float flat = jni->CallFloatMethod(motionRange, getFlatMethod);
        if (flatOut) {
            *flatOut = flat;
        } else if (fabsf(axisValue) < flat) {
            axisValue = 0.0f;
        }

        if (minOut) {
            jmethodID getMinMethod = jni->GetMethodID(motionRangeClass, "getMin", "()F");
            *minOut = jni->CallFloatMethod(motionRange, getMinMethod);
        }

        if (rangeOut) {
            jmethodID getRangeMethod = jni->GetMethodID(motionRangeClass, "getRange", "()F");
            *rangeOut = jni->CallFloatMethod(motionRange, getRangeMethod);
        }
    }

    return axisValue;
}

float AndroidActivity::getNormalizedJoystickAxisValue(JNIEnv* jni, jobject motionEvent, int axis) {
    // Assume [-1,1] for default.
    float flat = 0.005f;
    float min = -1.0f;
    float range = 2.0f;
    float axisValue = getAxisValue(jni, motionEvent, axis, &flat, &min, &range);

    if (fabsf(axisValue) < flat) {
        axisValue = 0.0f;
    }

    return (((axisValue - min) / range) - 0.5f) * 2.0f;
}

bool AndroidActivity::shouldConsumeTranslatedEvents() {
    // We should accept the event if the Ui is not active.  This is to avoid Qt translating the
    // event into a QEvent and causing us to create a secondary controller during gameplay. If the
    // UI is active, we have translated but not consumed the event, assuming Qt will then convert
    // the event and give it to the appropriate Qt Widget for use.
    return !Game::getInstance()->isUiActive();
}

QKeyEvent* AndroidActivity::convertAndroidKeyEvent(int action, KeyCode keyCode) {
    if (!sActionConversionMap.contains(action) || !sKeycodeConversionMap.contains(keyCode)) {
        return nullptr;
    }

    QEvent::Type translatedAction = sActionConversionMap[action];
    int translatedKeyCode = sKeycodeConversionMap[keyCode];

    // TODO: Make this conform better by translating the text as well.
    return new QKeyEvent(translatedAction, translatedKeyCode, Qt::NoModifier);
}

#endif // Q_OS_ANDROID
