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

#ifndef QMLUTIL_H
#define QMLUTIL_H
#include <QObject>
#include <QString>
#include <QUrl>

/**
 * @ingroup Engine
 * @brief QML accessible versions of the Util functions.
 *
 * This is a singleton class that simply contains a mapping from Util namespace functions to QML.
 */
class QmlUtil : public QObject {
    Q_OBJECT
public:
    /**
     * @brief Returns the platform dependent path for @p assetPath.
     * @param assetPath Path of asset to resolve to filesystem path
     */
    Q_INVOKABLE QString getPathToAsset(const QString& assetPath);

    /**
     * @brief Returns platform dependent path URL to @p assetPath.
     * @param assetPath Path of asset to resolve.
     */
    Q_INVOKABLE QUrl getUrlPathToAsset(const QString& assetPath);

    /**
     * @brief Returns the platform dependent path to the font in @p fontPath.
     * @param fontPath Path of font to resolve
     */
    Q_INVOKABLE QString getPathToFont(const QString& fontPath);

    /**
     * @brief Returns the platform dependent path to the image in @p imagePath.
     * @param imagePath Path of image to resolve
     */
    Q_INVOKABLE QString getPathToImage(const QString& imagePath);

    /**
     * @brief Returns the platform dependent path to the movie in @p moviePath.
     * @param moviePath Path of movie to resolve
     */
    Q_INVOKABLE QString getPathToMovie(const QString& moviePath);

    /**
     * @brief Returns the platform dependent path to the sound in @p soundPath.
     * @param soundPath Path of sound to resolve
     */
    Q_INVOKABLE QString getPathToSound(const QString& soundPath);

    /**
     * @brief Returns @c true if the device on which the game is running has a touch screen.
     */
    Q_INVOKABLE bool deviceHasTouchScreen();

    /**
     * @brief Returns the QmlUtil singleton instance of this object.
     */
    static QmlUtil* getInstance();

private:
    QmlUtil(QObject* parent = nullptr);
    static QmlUtil* sInstance;
};
#endif // QMLUTIL_H
