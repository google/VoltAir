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
 * @brief Screen that displays a looping animation until the next level has loaded.
 */
UiComponent {
    id: root

    states: [
        State { name: "HIDDEN" },
        State { name: "SHOWING" }
    ]

    showState: "SHOWING"
    hideState: "HIDDEN"

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "SHOWING"
            SequentialAnimation {
                ScriptAction { script: loadingAnim.start() }
                PropertyAnimation {
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
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 0.0
                    duration: showDuration
                }
                ScriptAction { script: loadingAnim.stop() }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    Image {
        id: background
        anchors.fill: parent
        source: Util.getPathToImage("title_bg.jpg")
    }

    Image {
        id: loading

        property int frame: 1

        width: 0.5 * parent.width
        height: width * sourceSize.height / sourceSize.width
        anchors.top: parent.top
        anchors.topMargin: -0.1 * height
        anchors.horizontalCenter: parent.horizontalCenter

        source: Util.getPathToImage("UI/Loading/Load00"
                + ((frame < 10) ? "0" + frame : frame) + ".png")
    }

    Timer {
        id: loadingAnim

        property int numFrames: 10

        // This gives us 20 FPS for the animation.
        interval: 50
        repeat: true
        onTriggered: {
            if (loading.frame >= numFrames) {
                loading.frame = 1
            } else {
                loading.frame++
            }
        }
    }

    VoltAirText {
        anchors.centerIn: loading
        anchors.verticalCenterOffset: 0.4 * loading.height

        width: loading.width
        height: 0.25 * loading.height

        textElement.text: "Loading"
    }
}
