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
import "../graphics"

/**
 * @ingroup QQuickItem
 * @brief A stylized window that typically holds other UI components.
 */
Item {
    id: root

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

        anchors.fill: parent

        border { left: 50; top: 56; right: 50; bottom: 56 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch

        source: Util.getPathToImage("UI/dialog_cutout.png")
    }

    MaskShaderEffect {
        id: background

        anchors.fill: parent

        opacity: 0.6

        sourceItem: backgroundImage
        maskItem: maskImage
    }
}
