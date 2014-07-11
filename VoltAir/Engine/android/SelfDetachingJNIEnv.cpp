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

#include "SelfDetachingJNIEnv.h"

#ifdef Q_OS_ANDROID

#include <QDebug>

SelfDetachingJNIEnv::SelfDetachingJNIEnv(JavaVM* vm, JNIEnv* jni, bool attached)
        : mVM(vm),
          mJNI(jni),
          mAttached(attached) {
}

SelfDetachingJNIEnv::SelfDetachingJNIEnv(SelfDetachingJNIEnv&& value)
        : mVM(value.mVM),
          mJNI(value.mJNI),
          mAttached(value.mAttached) {
    value.mVM = nullptr;
    value.mJNI = nullptr;
    value.mAttached = false;
}

SelfDetachingJNIEnv& SelfDetachingJNIEnv::operator=(SelfDetachingJNIEnv&& value) {
    std::swap(mVM, value.mVM);
    std::swap(mJNI, value.mJNI);
    std::swap(mAttached, value.mAttached);
    return *this;
}

SelfDetachingJNIEnv::~SelfDetachingJNIEnv() {
    if (mAttached) {
        mVM->DetachCurrentThread();
    }
}

JNIEnv* SelfDetachingJNIEnv::getJNIEnv() const {
    Q_ASSERT(mJNI);
    return mJNI;
}
JNIEnv& SelfDetachingJNIEnv::operator*() {
    Q_ASSERT(mJNI);
    return *mJNI;
}
const JNIEnv& SelfDetachingJNIEnv::operator*() const {
    Q_ASSERT(mJNI);
    return *mJNI;
}

JNIEnv* SelfDetachingJNIEnv::operator->() {
    Q_ASSERT(mJNI);
    return mJNI;
}

const JNIEnv* SelfDetachingJNIEnv::operator->() const {
    Q_ASSERT(mJNI);
    return mJNI;
}

SelfDetachingJNIEnv SelfDetachingJNIEnv::fromJVM(JavaVM* vm) {
    if (!vm) {
        qDebug() << "No JavaVM provided.";
        return SelfDetachingJNIEnv();
    }

    JNIEnv* jni = nullptr;
    jint getEnvResult = vm->GetEnv((void**) &jni, JNI_VERSION_1_6);
    if (getEnvResult == JNI_EDETACHED) {
        if (vm->AttachCurrentThread(&jni, nullptr) != JNI_OK) {
            qDebug() << "AttachCurrentThread has failed."
                     << "Thread is likely already attached to another JVM instance";
            return SelfDetachingJNIEnv();
        }
        return SelfDetachingJNIEnv(vm, jni, true);
    } else if (getEnvResult != JNI_OK) {
        qDebug() << "Failed to locate JNI environment.";
        return SelfDetachingJNIEnv();
    } else {
        return SelfDetachingJNIEnv(vm, jni, false);
    }
}

#endif // Q_OS_ANDROID
