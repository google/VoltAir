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

#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QSet>
#include <QString>

class Actor;

/**
 * @ingroup Engine
 * @brief Frequently used constants.
 *
 * These constants are defined globally so they can be used when a return by reference is needed.
 */
namespace Constants {

/**
 * @brief Empty set of actors.
 */
extern const QSet<Actor*> EMPTY_ACTOR_SET;

/**
 * @brief Name (and version number) to use for importing the Qt Quick module.
 */
extern const QString QQUICK_MODULE_NAME;

} // namespace Constants

#endif // CONSTANTS_H
