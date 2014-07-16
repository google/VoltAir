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

import QtQuick 2.0
import VoltAir 1.0

/**
 * @brief Simple popup that fades in and out after a set duration.
 */
UiComponent {
    id: root

    /**
     * @brief type:Text Reference to the @c Text element that is used by this Toast.
     */
    property alias textElement: message.textElement
    /**
     * @brief type:int How long, in seconds, the Toast is shown.
     */
    property alias duration: fadeOutTimer.interval

    showState: "SHOWING"
    hideState: "HIDDEN"
    shouldGainFocus: false

    state: hideState

    states: [
        State { name: "SHOWING" },
        State { name: "HIDDEN" }
    ]

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "SHOWING"
            SequentialAnimation {
                NumberAnimation {
                    target: root
                    property: "opacity"
                    to: 1.0
                    duration: showDuration
                }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            from: "SHOWING"
            to: "HIDDEN"
            SequentialAnimation {
                NumberAnimation {
                    target: root
                    property: "opacity"
                    to: 0.0
                    duration: hideDuration
                }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    Rectangle {
        id: backgroundImage
        anchors.fill: parent
        color: "black"
    }

    BorderImage {
        id: frame

        anchors.fill: parent

        border { left: 50; top: 56; right: 50; bottom: 56 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: Util.getPathToImage("UI/dialogFrame.png")
    }

    BorderImage {
        id: maskImage

        anchors.fill: frame

        border { left: 50; top: 56; right: 50; bottom: 56 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        source: Util.getPathToImage("UI/dialog_cutout.png")
    }

    MaskShaderEffect {
        id: background

        anchors.fill: frame

        opacity: 0.6
        sourceItem: backgroundImage
        maskItem: maskImage
    }

    VoltAirText {
        id: message

        anchors.fill: frame
        anchors.leftMargin: frame.border.left
        anchors.rightMargin: frame.border.right
    }

    Timer {
        id: fadeOutTimer

        interval: 5000

        onTriggered: {
            root.hide(hideDuration)
        }
    }

    onShowCompleted: {
        fadeOutTimer.start()
    }
}
