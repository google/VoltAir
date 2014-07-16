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
// TODO: Remove VoltAir reference.
import VoltAir 1.0

/**
 * @brief Root of the Engine's QML tree that instantiates the basic top-level items needed for a
 * game: a Camera, a level @c Loader, and an InputArea for handling input events.
 */
Rectangle {
    id: root

    // Background must be transparent in order to render our scene behind it.
    color: "transparent"

    Camera {
        id: camera
        objectName: "camera"

        // Control movement of the camera (lookAt and fov) based on locations of PlayerActors
        CameraMovementLogic {
            minFov: 16
        }

        Loader {
            id: levelLoader
            objectName: "levelLoader"

            // This is our translated signal
            signal loadCompleted(bool success)

            asynchronous: true

            onStatusChanged: {
                if (levelLoader.status == Loader.Ready) {
                    loadCompleted(true)
                } else if (levelLoader.status == Loader.Error) {
                    loadCompleted(false)
                }
            }
        }
    }

    InputArea {
        objectName: "inputArea"
        anchors.fill: parent
    }
}
