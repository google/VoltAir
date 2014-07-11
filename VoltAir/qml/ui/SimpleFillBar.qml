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
 * @brief Progress bar that shows the proportion of #amountFilled out of the total #capacity.
 */
Item {
    id: root

    /**
     * @brief Quantity that has been filled.
     */
    property real amountFilled: 0.0
    /**
     * @brief Maximum value that #amountFilled can reach.
     */
    property real capacity: 0.0
    /**
     * @brief type:point Point at the center of the right edge of the fill bar.
     */
    property alias fillPoint: bar.fillPoint
    /**
     * @brief Color theme for this bar to use.
     */
    property string fillColor: "default"

    BorderImage {
        id: background

        property real borderThickness: 8.0

        anchors.fill: parent

        border { left: 20; top: 20; right: 20; bottom: 20 }
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch

        source: Util.getPathToImage("UI/meterBg.png")
    }

    BorderImage {
        id: bar

        property real maxWidth: background.width - 2 * x
        property point fillPoint: Qt.point(width + x, height / 2.0 + y)

        x: background.borderThickness
        y: background.borderThickness

        height: parent.height - 2 * y
        width: maxWidth * root.amountFilled / root.capacity

        border { left: 8; right: 8 }
        horizontalTileMode: BorderImage.Stretch

        source: Util.getPathToImage("UI/meterBar_" + root.fillColor + ".png")
    }

    SequentialAnimation {
        id: pulseAnimation
        loops: Animation.Infinite
        PropertyAnimation { target: bar; property: "opacity"; to: 0.3; duration: 1000 }
        PauseAnimation { duration: 250 }
        PropertyAnimation { target: bar; property: "opacity"; to: 1.0; duration: 1000 }
        PauseAnimation { duration: 250 }
    }

    onAmountFilledChanged: {
        if (amountFilled >= capacity) {
            pulseAnimation.running = true
        } else {
            pulseAnimation.running = false
            bar.opacity = 1.0
        }
    }
}
