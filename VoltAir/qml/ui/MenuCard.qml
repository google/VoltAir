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
 * @brief A playing card shaped graphical button that fires an action when released.
 * @note A sound effect will play when the action fires.
 */
KeyNavFocusArea {
    id: root

    /**
     * @brief Whether or not the MenuCard will fire an action when released.
     *
     * The MenuCard will be rendered in grayscale and have a padlock overlaying it when @c true.
     */
    property bool locked: false
    /**
     * @brief Whether or not the title is displayed when the MenuCard is @c locked.
     */
    property bool hideTitleWhenLocked: false
    /**
     * @brief Path to the background graphic.
     */
    property string backgroundImagePath
    /**
     * @brief Optional title to display on the top of the MenuCard.
     */
    property string titleText

    /**
     * @brief Emitted when the MenuCard is released.
     */
    signal actionFired()

    scale: 0.9

    Behavior on scale {
        NumberAnimation { duration: 50 }
    }

    Item {
        id: disableableItem

        anchors.fill: parent
        enabled: !locked

        Item {
            id: wholeCard
            anchors.fill: parent

            Item {
                width: parent.width
                height: 0.9 * parent.height
                anchors.bottom: parent.bottom

                Image {
                    id: backgroundImage
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: Util.getPathToImage(backgroundImagePath)
                }

                Image {
                    id: glowImage
                    width: backgroundImage.width
                    height: backgroundImage.height
                    source: Util.getPathToImage("UI/card_glow.png")
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
                    sourceItem: backgroundImage
                    maskItem: maskImage
                }

                MaskShaderEffect {
                    id: glow
                    anchors.fill: parent
                    sourceItem: glowImage
                    maskItem: maskImage
                }

                Image {
                    height: 0.7 * parent.height
                    width : height * sourceSize.width / sourceSize.height
                    anchors.centerIn: parent
                    visible: root.locked
                    source: Util.getPathToImage("UI/lock.png")
                }
            }

            BorderImage {
                id: title
                anchors.top: parent.top
                anchors.topMargin: 0.2 * height
                anchors.horizontalCenter: parent.horizontalCenter
                width: 0.8 * parent.width
                height: 0.2 * parent.height
                border { left: 35; top: 35; right: 35; bottom: 35 }
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode: BorderImage.Stretch
                visible: !(root.locked && root.hideTitleWhenLocked)
                source: Util.getPathToImage("UI/buttonBlue.png")

                VoltAirText {
                    id: text

                    // Translucent black for when background is lighter.
                    property color activeColor: "#AA000000"
                    // Dark, translucent blue for when background is darker.
                    property color inactiveColor: "#88000088"

                    width: parent.width - 2.0 * title.border.left
                    height: parent.height - 1.2 * title.border.top

                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: -0.08 * height

                    textElement.text: titleText
                    dropShadow.color: inactiveColor
                }
            }
        }

        GrayscaleShaderEffect {
            id: grayscaleFx

            anchors.fill: parent
            sourceItem: wholeCard
            ratio: (root.locked) ? 1.0 : 0.0
        }
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            root.focus = true
            root.pressed()
        }

        // onClicked requires the button to be pressed and released inside the button.
        onClicked: {
            if (!locked) {
                root.actionFired()
            }
        }
    }

    onActiveFocusChanged: {
        if (activeFocus) {
            root.scale = 1.0
            frame.source = Util.getPathToImage("UI/dialog_frame_highlight.png")
            title.source = Util.getPathToImage("UI/buttonhighlight.png")
            text.dropShadow.color = text.activeColor
            Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_highlight.wav"))
        } else {
            text.dropShadow.color = text.inactiveColor
            root.scale = 0.9
            frame.source = Util.getPathToImage("UI/dialogFrame.png")
            title.source = Util.getPathToImage("UI/buttonBlue.png")
        }
    }

    onReleased: {
        if (!locked) {
            root.actionFired()
        }
    }

    onActionFired: {
        Engine.getSoundManager().playSoundEffect(Util.getPathToSound("btn_select.wav"))
    }
}
