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
 * @brief Ui element item that defines a multi-touch based VirtualController for use in VoltAir.
 *
 * @note TouchScreenButtonController is only visible (and thus functional as a VirtualController)
 * when the device has a touch screen input device.
 */
TouchScreenButtonController {
    id: root

    /**
     * Emitted when the player requests a pause through the pause button.
     */
    signal pauseRequested()

    // Only useful as a controller when the device has a touch screen input device.
    visible: Util.deviceHasTouchScreen()

    MultiTouchMenuIconManager {
        id: touchArea

        anchors.fill: parent

        icons: [leftButton, rightButton, magnetButton, pauseButton]
    }

    MultiTouchMenuIcon {
        id: pauseButton

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 0.01 * parent.height
        anchors.leftMargin: 0.01 * parent.width

        width: 0.09 * parent.width
        height: width

        iconSource: Util.getPathToImage("UI/pause_h.png")

        onButtonPressedChanged: {
            if (buttonPressed) {
                root.pauseRequested()
            }
        }
    }

    MultiTouchMenuIcon {
        id: leftButton

        property int keyCode: Qt.Key_Left

        anchors.bottom: parent.bottom
        anchors.left: parent.left

        width: 0.165 * parent.width
        height: 0.35 * parent.height

        iconWidth: 0.15 * parent.width
        iconHeight: iconWidth
        iconHorizontalOffset: 0.5 * (width - iconWidth)
        iconVerticalOffset: 0.5 * height - 0.5 * iconHeight - 0.01 * parent.height

        iconImageHorizontalOffset: -0.05 * width
        iconSource: Util.getPathToImage("UI/hud_arrow_left.png")

        onButtonPressedChanged: {
            if (buttonPressed) {
                root.onKeyDown(keyCode)
            } else {
                root.onKeyUp(keyCode)
            }
        }
    }

    MultiTouchMenuIcon {
        id: rightButton

        property int keyCode: Qt.Key_Right

        anchors.bottom: parent.bottom
        anchors.left: leftButton.right

        width: 0.2 * parent.width
        height: 0.35 * parent.height

        iconWidth: leftButton.iconWidth
        iconHeight: leftButton.iconHeight
        iconHorizontalOffset: -0.5 * (width - iconWidth)
        iconVerticalOffset: 0.5 * height - 0.5 * iconHeight - 0.01 * parent.height

        iconImageHorizontalOffset: 0.05 * width
        iconSource: Util.getPathToImage("UI/hud_arrow_right.png")

        onButtonPressedChanged: {
            if (buttonPressed) {
                root.onKeyDown(keyCode)
            } else {
                root.onKeyUp(keyCode)
            }
        }
    }

    MultiTouchMenuIcon {
        id: magnetButton

        property int keyCode: Qt.Key_Down

        anchors.bottom: parent.bottom
        anchors.right: parent.right

        width: 0.25 * parent.width
        height: 0.35 * parent.height

        iconWidth: leftButton.iconWidth
        iconHeight: leftButton.iconHeight

        iconHorizontalOffset: -0.06 * width
        iconVerticalOffset: 0.5 * height - 0.5 * iconHeight - 0.01 * parent.height
        iconSource: Util.getPathToImage("UI/magnet.png")

        onButtonPressedChanged: {
            if (buttonPressed) {
                root.onKeyDown(keyCode)
            } else {
                root.onKeyUp(keyCode)
            }
        }
    }

    onEnabledChanged: {
        if (!enabled) {
            touchArea.resetIcons()
        }
    }
}
