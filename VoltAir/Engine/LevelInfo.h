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

#ifndef LEVELINFO_H
#define LEVELINFO_H

#include <QObject>
#include <QString>

class Environment;

/**
 * @brief Metadata for a Level.
 *
 * The information contained in LevelInfo can be used to load and display a Level.
 */
class LevelInfo : public QObject {
    Q_OBJECT

    /**
     * @brief Human-readable name of the Level.
     */
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    /**
     * @brief Name of QML level file to be used for loading the Level.
     */
    Q_PROPERTY(QString fileName READ getFileName WRITE setFileName NOTIFY fileNameChanged)
    /**
     * @brief Whether or not the Level is a tutorial level.
     */
    Q_PROPERTY(bool tutorial READ isTutorial WRITE setTutorial NOTIFY tutorialChanged)
    /**
     * @brief Name of image asset file for the Level screenshot / thumbnail.
     */
    Q_PROPERTY(QString screenshotFileName READ getScreenshotFileName WRITE setScreenshotFileName
            NOTIFY screenshotFileNameChanged)
    /**
     * @brief Environment to which this LevelInfo belongs, or @c null if defined out of the context
     * of an Environment.
     */
    Q_PROPERTY(Environment* environment READ getEnvironment)

public:
    /**
     * @brief Constructs a LevelInfo.
     * @param parent Parent object
     */
    explicit LevelInfo(QObject* parent = nullptr);

    /**
     * @brief Returns #name.
     */
    const QString& getName() const { return mName; }
    /**
     * @brief Sets #name.
     * @param value String to set #name to
     */
    void setName(const QString& value);
    /**
     * @brief Returns #fileName.
     */
    const QString& getFileName() const { return mFileName; }
    /**
     * @brief Sets #fileName.
     * @param value String to set #fileName to
     */
    void setFileName(const QString& value);
    /**
     * @brief Returns #tutorial.
     */
    bool isTutorial() const { return mTutorial; }
    /**
     * @brief Sets #tutorial.
     * @param value Boolean to set #tutorial to
     */
    void setTutorial(bool value);
    /**
     * @brief Returns #screenshotFileName.
     */
    const QString& getScreenshotFileName() const { return mScreenshotFileName; }
    /**
     * @brief Sets #screenshotFileName.
     * @param value String to set #screenshotFileName to
     */
    void setScreenshotFileName(const QString& value);
    /**
     * @brief Returns #environment.
     */
    Environment* getEnvironment() const;

signals:
    /**
     * @brief Emitted when #name changes.
     */
    void nameChanged();
    /**
     * @brief Emitted when #fileName changes.
     */
    void fileNameChanged();
    /**
     * @brief Emitted when #tutorial changes.
     */
    void tutorialChanged();
    /**
     * @brief Emitted when #screenshotFileName changes.
     */
    void screenshotFileNameChanged();

private:
    QString mName;
    QString mFileName;
    bool mTutorial = false;
    QString mScreenshotFileName;
    mutable Environment* mEnvironment = nullptr;
};
Q_DECLARE_METATYPE(LevelInfo*)

#endif // LEVELINFO_H
