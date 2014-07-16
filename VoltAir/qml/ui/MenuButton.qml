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

import QtGraphicalEffects 1.0
import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief A selectable text button that fires an action when released.
 * @note A sound effect will play when the action fires.
 */
KeyNavFocusArea {
    id: root

    /**
     * @brief Text that is displayed on the button, describing what action the button fires.
     */
    property string buttonText

    BorderImage {
        id: menuItem

        anchors.fill: parent
        scale: 0.9

        border { left: 35; top: 35; right: 35; bottom: 35 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: Util.getPathToImage("UI/buttonBlue.png")

        VoltAirText {
            id: text

            // Translucent black for when background is lighter.
            property color activeColor: "#AA000000"
            // Dark, translucent blue for when background is darker.
            property color inactiveColor: "#88000088"

            width: menuItem.width - 2.0 * menuItem.border.left
            height: menuItem.height - 1.2 * menuItem.border.top
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.08 * height
            textElement.text: buttonText
            dropShadow.color: inactiveColor
        }
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            root.focus = true
            root.pressed()
        }

        // onClicked requires the button to be pressed and released inside the button.
        onClicked: {
            root.released()
        }
    }

    onActiveFocusChanged: {
        if (activeFocus) {
            menuItem.scale = 1.0
            menuItem.source = Util.getPathToImage("UI/buttonhighlight.png")
            text.dropShadow.color = text.activeColor
            Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_highlight.wav"))
        } else {
            menuItem.source = Util.getPathToImage("UI/buttonBlue.png")
            menuItem.scale = 0.9
            text.dropShadow.color = text.inactiveColor
        }
    }

    onReleased: {
        Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_select.wav"))
    }
}
