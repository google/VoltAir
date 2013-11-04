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

import QtMultimedia 5.0
import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Video that is skipped by valid player input.
 */
UiComponent {
    id: root

    /**
     * @brief type:string Source video for the Cinematic.
     */
    property alias source: video.source

    /**
     * @brief Pauses the video when the device pauses.
     */
    function onDevicePause() {
        if (state == "SHOWING") {
            video.pause()
        }
    }

    /**
     * @brief Resumes video playback when the device resumes.
     */
    function onDeviceResume() {
        if (state == "SHOWING") {
            video.play()
        }
    }

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
            PropertyAnimation { target: root; property: "opacity"; to: 1.0; duration: showDuration }
            ScriptAction { script: video.play() }
        },
        Transition {
            from: "SHOWING"
            to: "HIDDEN"
            SequentialAnimation {
                PropertyAnimation {
                    target: root
                    property: "opacity"
                    to: 0.0
                    duration: hideDuration
                }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    captureBackNavigation: true

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Video {
        id: video

        function complete() {
            if (video.playing) {
                video.stop()
            }
            root.showCompleted()
        }

        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectFit

        onStopped: {
            complete()
        }
    }

    MultiPointTouchArea {
        anchors.fill: parent
        focus: true
        onPressed: {
            video.complete()
        }
    }

    onEscaped: {
        video.complete()
    }

    onReleased: {
        video.complete()
    }
}
