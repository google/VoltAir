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
 * @brief Icon for use in handling multi-touch events.
 *
 * The hit area of the icon is defined by @c width and @c height properties, but the look and offset
 * of the icon graphic can be changed through the following properties: #iconWidth, #iconHeight,
 * #iconVerticalOffset, and #iconHorizontalOffset.
 * @note Because MenuIcon%s use @c MouseArea%s which are fundamentally incompatible with
 * @c MultiPointTouchArea%s, this icon was necessary.
 */
Item {
    id: root

    /**
     * @brief Whether or not the button is pressed.
     */
    property bool buttonPressed: false
    /**
     * @brief Source of the icon's graphic.
     */
    property string iconSource
    /**
     * @brief Width of the whole icon graphic.
     *
     * This property merely defines the graphical width, and not the width of the hit area, which is
     * controlled by @c width.
     * @default{width}
     */
    property real iconWidth: width
    /**
     * @brief Height of the whole icon graphic.
     *
     * This property merely defines the graphical height, and not the height of the hit area, which
     * is controlled by @c height.
     * @default{height}
     */
    property real iconHeight: height
    /**
     * @brief Vertical offset of the center of the whole icon graphic.
     * @default{0.0}
     */
    property real iconVerticalOffset: 0.0
    /**
     * @brief Horizontal offset of the center of the whole icon graphic.
     * @default{0.0}
     */
    property real iconHorizontalOffset: 0.0
    /**
     * @brief Vertical offset of the center of the icon image.
     * @default{0.0}
     */
    property real iconImageVerticalOffset: 0.0
    /**
     * @brief Horizontal offset of the center of the icon image.
     * @default{0.0}
     */
    property real iconImageHorizontalOffset: 0.0

    Image {
        width: root.iconWidth
        height: root.iconHeight

        anchors.centerIn: parent
        anchors.verticalCenterOffset: root.iconVerticalOffset
        anchors.horizontalCenterOffset: root.iconHorizontalOffset

        scale: root.buttonPressed ? 1.0 : 0.9
        opacity: root.buttonPressed ? 1.0 : 0.35

        source: Util.getPathToImage("UI/hud_bg.png")

        Image {
            id: iconImage

            anchors.centerIn: parent
            anchors.verticalCenterOffset: root.iconImageVerticalOffset
            anchors.horizontalCenterOffset: root.iconImageHorizontalOffset

            width: 0.6 * parent.width
            height: width * sourceSize.height / sourceSize.width

            source: root.iconSource
        }
    }
}
