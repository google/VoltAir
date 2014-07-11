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

import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Item that handles focus navigation.
 *
 * This base class is used to deploy UI elements that are navigated by directional pad interfaces.
 * It defines what Items gain focus when the user presses in a cardinal direction.
 */
FocusScope {
    id: root

    /**
     * @brief @c Item to transfer focus to upon an "up" press.
     */
    property Item focusUp
    /**
     * @brief @c Item to transfer focus to upon an "down" press.
     */
    property Item focusDown
    /**
     * @brief @c Item to transfer focus to upon an "left" press.
     */
    property Item focusLeft
    /**
     * @brief @c Item to transfer focus to upon an "right" press.
     */
    property Item focusRight
    /**
     * @brief Whether or not the back button event is handled.
     */
    property bool captureBackNavigation: false
    /**
     * @brief Mode that determines what keys behave as back buttons.
     */
    property int backNavigationMode: QmlConstants.BackNavigation_AnyMode

    /**
     * @brief Emitted when this area receives a button press.
     */
    signal pressed()
    /**
     * @brief Emitted when this area receives a button release.
     */
    signal released()
    /**
     * @brief Emitted when a back navigation event occurs.
     */
    signal escaped()

    Keys.onPressed: {
        if (event.key == Qt.Key_Up && focusUp && focusUp.enabled) {
            event.accepted = true
            focusUp.focus = true
        } else if (event.key == Qt.Key_Down && focusDown && focusDown.enabled) {
            event.accepted = true
            focusDown.focus = true
        } else if (event.key == Qt.Key_Left && focusLeft && focusLeft.enabled) {
            event.accepted = true
            focusLeft.focus = true
        } else if (event.key == Qt.Key_Right && focusRight && focusRight.enabled) {
            event.accepted = true
            focusRight.focus = true
        } else if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
            event.accepted = true
            root.pressed()
        }
    }

    Keys.onReleased: {
        var isBackNavigationKey = false
        var keysToUseForBackNavigation = d.backKeyNavigationSets[backNavigationMode]
        for (var i = 0; i < keysToUseForBackNavigation.length; ++i) {
            if (event.key == keysToUseForBackNavigation[i]) {
                isBackNavigationKey = true
                break
            }
        }

        if (isBackNavigationKey) {
            if (captureBackNavigation) {
                event.accepted = true
                root.escaped()
            }
        } else if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter) {
            event.accepted = true
            root.released()
        }
    }

    QtObject {
        id: d

        property variant backKeyNavigationSets: generateBackKeyNavigationSets()

        // This function is necessary since keys cannot be explicitly defined using enums.
        function generateBackKeyNavigationSets() {
            var map = {}
            map[QmlConstants.BackNavigation_GamepadOnlyMode] = [InputArea.Key_Button_B]
            map[QmlConstants.BackNavigation_BackButtonOnlyMode] = [Qt.Key_Back, Qt.Key_Escape]
            map[QmlConstants.BackNavigation_AnyMode] = [Qt.Key_Back, Qt.Key_Escape,
                    InputArea.Key_Button_B]
            return map
        }
    }
}
