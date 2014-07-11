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
 * @brief Progress bar that shows the proportion of Snowflake%s attained out of the total needed.
 */
Item {
    id: root

    /**
     * @brief How many Snowflake%s were collected by this bar's player.
     */
    property real snowflakesCollected: 0.0
    /**
     * @brief How many Snowflake%s should've been collected to completely fill the bar.
     */
    property real totalSnowflakes: 0.0
    /**
     * @brief Color theme for this bar to use.
     */
    property string fillColor: "red"

    Image {
        id: graphics

        anchors.verticalCenter: parent.verticalCenter
        height: 0.9 * parent.height
        width: height * sourceSize.width / sourceSize.height

        source: Util.getPathToImage("droidling_" + root.fillColor + ".png")
    }

    SimpleFillBar {
        height: parent.height
        anchors.left: graphics.right
        anchors.right: parent.right

        amountFilled: root.snowflakesCollected
        capacity: root.totalSnowflakes

        fillColor: root.fillColor
    }
}
