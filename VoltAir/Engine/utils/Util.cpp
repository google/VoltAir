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

#include <QCoreApplication>
#include <QDir>
#include <QObject>
#include <QMetaObject>
#include <QMetaMethod>
#include <QTextStream>
#include <QTouchEvent>
#include <QUrl>
#include <QWindow>
#include <algorithm>
#include "Util.h"

#ifdef Q_OS_ANDROID
#include "android/AndroidActivity.h"
#endif

QString Util::getPathToAsset(const QString& assetPath) {
    // Note: Adapted from QtQuick2ApplicationViewerPrivate::adjustPath.
#if defined(Q_OS_MAC)
    if (!QDir::isAbsolutePath(assetPath))
        return QString::fromLatin1("%1/../Resources/%2")
                .arg(QCoreApplication::applicationDirPath(), assetPath);
#elif defined(Q_OS_ANDROID)
    // This part differs from QtQuick2ApplicationViewerPrivate::adjustPath.
    return QString::fromLatin1("assets:/%1").arg(assetPath);
#elif defined(Q_OS_LINUX)
    if (!QDir::isAbsolutePath(assetPath))
        return QString::fromLatin1("%1/%2")
                .arg(QCoreApplication::applicationDirPath(), assetPath);
#endif
    return assetPath;
}

QUrl Util::getUrlPathToAsset(const QString& assetPath) {
    // Note: Adapted from QtQuick2ApplicationViewerPrivate::adjustPath.
#if defined(Q_OS_MAC)
    if (!QDir::isAbsolutePath(assetPath))
        return QString::fromLatin1("file://%1/../Resources/%2")
                .arg(QCoreApplication::applicationDirPath(), assetPath);
#elif defined(Q_OS_ANDROID)
    // This part differs from QtQuick2ApplicationViewerPrivate::adjustPath.
    return QString::fromLatin1("assets:/%1").arg(assetPath);
#elif defined(Q_OS_LINUX)
    if (!QDir::isAbsolutePath(assetPath))
        return QString::fromLatin1("file://%1/%2")
                .arg(QCoreApplication::applicationDirPath(), assetPath);
#endif
    return assetPath;
}

QString Util::getPathToFont(const QString& fontPath) {
    return Util::getPathToAsset(QString("assets/fonts/%1").arg(fontPath));
}

QString Util::getPathToImage(const QString& imagePath) {
    return Util::getPathToAsset(QString("assets/images/%1").arg(imagePath));
}

QString Util::getPathToMovie(const QString& moviePath) {
    return Util::getPathToAsset(QString("assets/movies/%1").arg(moviePath));
}

QString Util::getPathToLevel(const QString& levelPath) {
    return Util::getPathToAsset(QString("assets/levels/%1").arg(levelPath));
}

QString Util::getPathToSound(const QString& soundPath) {
    return QString("assets/sounds/%1").arg(soundPath);
}

QString Util::getPathToData(const QString& dataPath) {
    return Util::getPathToAsset(QString("assets/data/%1").arg(dataPath));
}

QString Util::readFileAsQString(const QString& filePath) {
    QFile codeFile(filePath);
    codeFile.open(QFile::ReadOnly | QFile::Text);
    return QTextStream(&codeFile).readAll();
}

std::string Util::readFileAsStdString(const QString& filePath) {
    QFile codeFile(filePath);
    codeFile.open(QFile::ReadOnly | QFile::Text);
    return QTextStream(&codeFile).readAll().toStdString();
}

QRectF Util::united(const QRectF& rect, const QPointF& point) {
    QRectF united;
    united.setLeft(std::min(rect.left(), point.x()));
    united.setRight(std::max(rect.right(), point.x()));
    united.setBottom(std::min(rect.bottom(), point.y()));
    united.setTop(std::max(rect.top(), point.y()));
    return united;
}

// This is a work-around for a bug in QMetaObject in which a javascript
// function defined in an Item directly is not returned via QMetaObject::indexOfMethod();
bool Util::javaScriptFuncExists(QObject* object, const char* method) {
    const QMetaObject* m = object->metaObject();
    for (int i = 0 ; i < m->methodCount() ; i++ ) {
        if (m->method(i).name() == method) {
            return true;
        }
    }
    return false;
}

bool Util::deviceHasTouchScreen() {
    return getDeviceTouchScreenDeviceId() >= 0;
}

int Util::getDeviceTouchScreenDeviceId() {
#ifdef Q_OS_ANDROID
    return AndroidActivity::getTouchScreenDeviceId();
#else
    // TODO: Determine touch screen device id on other devices.
    return -1;
#endif
}
