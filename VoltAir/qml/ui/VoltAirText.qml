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
 * @brief Container for text with default style settings and a drop shadow.
 */
Item {
    id: root

    /**
     * @brief type:Text Reference to the internal @c Text element that is used by this VoltAirText.
     */
    property alias textElement: text
    /**
     * @brief type:DropShadow Reference to the internal @c DropShadow element that is used by this VoltAirText.
     */
    property alias dropShadow: dropShadow

    FontLoader {
        id: voltAirFont
        source: Util.getPathToFont("Lilita.ttf")
    }

    Text {
        id: text

        anchors.fill: parent

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        color: "white"

        fontSizeMode: Text.Fit
        font.family: voltAirFont.name
        // Max font pixel size.
        font.pixelSize: 256
    }

    DropShadow {
        id: dropShadow

        anchors.fill: text
        source: text

        horizontalOffset: 1
        verticalOffset: 2
        radius: 6.0
        spread: 0.6
        samples: 16
        color: "black"
    }
}
