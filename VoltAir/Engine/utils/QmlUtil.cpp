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

#include "utils/QmlUtil.h"
#include "utils/Util.h"

QmlUtil* QmlUtil::sInstance = nullptr;

QmlUtil::QmlUtil(QObject* parent) : QObject(parent) {
}

QString QmlUtil::getPathToAsset(const QString& assetPath) {
    return Util::getPathToAsset(assetPath);
}

QUrl QmlUtil::getUrlPathToAsset(const QString& assetPath) {
    return Util::getUrlPathToAsset(assetPath);
}

QString QmlUtil::getPathToFont(const QString& fontPath) {
    return Util::getPathToFont(fontPath);
}

QString QmlUtil::getPathToImage(const QString& imagePath) {
    return Util::getPathToImage(imagePath);
}

QString QmlUtil::getPathToMovie(const QString& moviePath) {
    return Util::getPathToMovie(moviePath);
}

QString QmlUtil::getPathToSound(const QString& soundPath) {
    return Util::getPathToSound(soundPath);
}

bool QmlUtil::deviceHasTouchScreen() {
    return Util::deviceHasTouchScreen();
}

QmlUtil* QmlUtil::getInstance() {
    if (!sInstance) {
        sInstance = new QmlUtil();
    }
    return sInstance;
}
