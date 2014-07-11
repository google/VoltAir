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

#ifndef SELFDETACHINGJNIENV_H
#define SELFDETACHINGJNIENV_H

#include <QObject>

#if defined(Q_OS_ANDROID)

#include <jni.h>

/**
 * @ingroup Engine
 * @brief Smart wrapper around JNIEnv which retains information of how the environment was loaded.
 *
 * If the current thread has attached to a JavaVM, then this wrapper will detach the current thread
 * from the same JavaVM when the wrapper is deleted.
 */
class SelfDetachingJNIEnv {
public:
    /**
     * @brief Move-constructs a SelfDetachingJNIEnv instance, making it use the same JNIEnv that
     * @p value was using.
     * @param value SelfDetachingJNIEnv instance to move into this
     */
    SelfDetachingJNIEnv(SelfDetachingJNIEnv&& value);
    /**
     * @brief Deleted copy constructor.
     * @param value SelfDetachingJNIEnv to copy
     */
    SelfDetachingJNIEnv(SelfDetachingJNIEnv& value) = delete;
    /**
     * @brief Deleted copy constructor.
     * @param value SelfDetachingJNIEnv to copy
     */
    SelfDetachingJNIEnv(const SelfDetachingJNIEnv& value) = delete;

    virtual ~SelfDetachingJNIEnv();

    /**
     * @brief Returns underlying JNIEnv pointer.
     */
    JNIEnv* getJNIEnv() const;
    /**
     * @brief Returns the dereferenced JNIEnv pointer.
     * @note If the wrapped pointer is null, behavior is undefined.
     */
    JNIEnv& operator*();
    /**
     * @brief Returns a const reference to the JNIEnv pointer.
     * @note If the wrapped pointer is null, behavior is undefined.
     */
    const JNIEnv& operator*() const;
    /**
     * @brief Returns the underlying JNIEnv pointer to provide access to its members.
     */
    JNIEnv* operator->();
    /**
     * @brief Returns ther underlying JNIEnv pointer to provide access to its const members.
     */
    const JNIEnv* operator->() const;
    /**
     * @brief Move assigns @p value to this SelfDetachingJNIEnv instance.
     * @param value SelfDetachingJNIEnv instance to move into this
     * @returns Reference to @c this
     */
    SelfDetachingJNIEnv& operator=(SelfDetachingJNIEnv&& value);
    /**
     * @brief Deleted copy and assign operator.
     * @param value SelfDetachingJNIEnv to copy and assign
     * @return Reference to @c this
     */
    SelfDetachingJNIEnv& operator=(SelfDetachingJNIEnv& value) = delete;
    /**
     * @brief Deleted copy and assign operator.
     * @param value SelfDetachingJNIEnv to copy and assign
     * @return Reference to @c this
     */
    SelfDetachingJNIEnv& operator=(const SelfDetachingJNIEnv& value) = delete;
    /**
     * @brief Returns @c true if the wrapped JNIEnv is not null.
     */
    operator bool() const { return mJNI; }

    /**
     * @brief Returns a SelfDetachingJNIEnv wrapper around the current JNIEnv.
     *
     * This method first tries to load the current JVM environment.  If that fails, this method will
     * try attaching to the current JVM thread to load the environment if the @p vm is non-null.
     * @note This method follows a similar model documented <a href=
     * "http://www.coderanch.com/t/274379/java/java/JNIEnv-valid-call-javaVM-GetEnv">here</a>.
     */
    static SelfDetachingJNIEnv fromJVM(JavaVM* vm);

private:
    SelfDetachingJNIEnv() { }
    SelfDetachingJNIEnv(JavaVM* vm, JNIEnv* jni, bool attached);

    JavaVM* mVM = nullptr;
    JNIEnv* mJNI = nullptr;
    bool mAttached = false;
};

#endif // Q_OS_ANDROID
#endif // SELFDETACHINGJNIENV_H
