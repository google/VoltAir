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
 * @brief Simple graphical button that fires an action when released.
 */
KeyNavFocusArea {
    id: root

    /**
     * @brief Source to the graphic that displays when the MenuIcon is not selected.
     */
    property string unselectedIconSource
    /**
     * @brief Source to the graphic that displays when the MenuIcon is selected.
     */
    property string selectedIconSource

    Image {
        id: bgIcon

        anchors.fill: parent
        scale: root.activeFocus ? 1.0 : 0.8

        opacity: root.activeFocus ? 1.0 : 0.50

        source: Util.getPathToImage("UI/hud_bg.png")
    }

    Image {
        id: iconImage

        anchors.centerIn: bgIcon

        scale: bgIcon.scale

        width: 0.5 * parent.width
        height: width * sourceSize.height / sourceSize.width

        source: root.activeFocus ? selectedIconSource : unselectedIconSource
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
            Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_highlight.wav"))
        }
    }

    onReleased: {
        Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_select.wav"))
    }
}
