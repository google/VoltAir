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

#ifndef QMLCONSTANTS_H
#define QMLCONSTANTS_H

#include <QObject>

/**
 * @brief This class defines constants to be used in Qml.
 */
class QmlConstants : public QObject {
    Q_OBJECT
public:
    /**
     * @brief Defines different modes for handling "back" navigation through different key presses.
     */
    Q_ENUMS(BackNavigationMode)
    enum BackNavigationMode {
        /**
         * Only accept InputArea::Key_Button_B as back.
         */
        BackNavigation_GamepadOnlyMode = 0,
        /**
         * Only accept explicit back / esc keys as back.
         */
        BackNavigation_BackButtonOnlyMode,
        /**
         * Accept any key supported in another BackNavigationMode as back.
         */
        BackNavigation_AnyMode,
    };
};
Q_DECLARE_METATYPE(QmlConstants*)

#endif // QMLCONSTANTS_H
