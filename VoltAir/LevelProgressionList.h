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

#ifndef LEVELPROGRESSIONLIST_H
#define LEVELPROGRESSIONLIST_H

#include <QObject>
#include <QQmlListProperty>

class LevelProgression;

/**
 * @brief Collection of LevelProgression%s.
 *
 * This class provides functionality for grouping LevelProgression%s together and searching through
 * them by name.
 */
class LevelProgressionList : public QObject {
    Q_OBJECT

    /**
     * @brief QML mutable list of LevelProgression%s that are contained in this collection.
     */
    Q_PROPERTY(QQmlListProperty<LevelProgression> progressions READ getProgressionsListProperty
            NOTIFY progressionsChanged)

public:
    /**
     * @brief Constructs a LevelProgressionList.
     * @param parent Parent object
     */
    explicit LevelProgressionList(QObject* parent = nullptr);

    /**
     * @brief Returns #progressions.
     */
    QQmlListProperty<LevelProgression> getProgressionsListProperty();
    /**
     * @brief Returns #progressions as a QList.
     */
    QList<LevelProgression*>& getProgressions() { return mProgressions; }
    /**
     * @brief Returns #progressions as a @c const QList.
     */
    const QList<LevelProgression*>& getProgressions() const { return mProgressions; }

    /**
     * @brief Returns child LevelProgression identified by @p name.
     * @param name Name of LevelProgression to search for
     */
    Q_INVOKABLE LevelProgression* getLevelProgressionByName(const QString& name) const;

signals:
    /**
     * @brief Emitted when #progressions changes.
     */
    void progressionsChanged();

private:
    QList<LevelProgression*> mProgressions;
};
Q_DECLARE_METATYPE(LevelProgressionList*)

#endif // LEVELPROGRESSIONLIST_H
