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
 * @brief Progress bar that shows the proportion of Orb%s attained out of the total possible.
 *
 * Additionally, a portal graphic will indicate how many Orb%s are needed to pass a level.
 */
Item {
    id: root

    /**
     * @brief How many Orb%s are collected by the player.
     */
    property real orbsCollected: 0.0
    /**
     * @brief How many Orb%s are needed to pass the current level.
     */
    property real threshold: 0.0
    /**
     * @brief How many Orb%s could be collected to completely fill the bar.
     */
    property real totalOrbs: 0.0
    /**
     * @brief type:point Point at the center of the right edge of the fill bar.
     */
    property alias fillPoint: bar.fillPoint

    Image {
        id: portalBack
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.18 * parent.height
        width: height * sourceSize.width / sourceSize.height
        x: (root.threshold / root.totalOrbs) * root.width - width / 2.0
        source: (root.orbsCollected >= root.threshold)
                ? Util.getPathToImage("UI/portalBackOn.png")
                : Util.getPathToImage("UI/portalBackOff.png")
    }

    SimpleFillBar {
        id: bar

        width: parent.width
        height: 0.5 * parent.height
        anchors.centerIn: parent

        amountFilled: root.orbsCollected
        capacity: root.totalOrbs
        fillColor: (amountFilled >= root.threshold) ? "defaultActivated" : "default"
    }

    Image {
        anchors.fill: portalBack
        anchors.bottomMargin: 0.075 * portalBack.height
        anchors.topMargin: 0.05 * portalBack.height

        x: portalBack.x
        source: (root.orbsCollected >= root.threshold)
                ? Util.getPathToImage("UI/portalFrontOn.png")
                : Util.getPathToImage("UI/portalFrontOff.png")
    }

    Image {
        id: starsReached

        property int frame: 1

        visible: starsReachedAnim.running

        height: 3.0 * portalBack.height
        width: height * sourceSize.width / sourceSize.height

        x: portalBack.x + 0.2 * portalBack.width - width / 2.0
        y: portalBack.y - height / 2.0

        source: Util.getPathToImage("UI/StarsReached/full_"
                + ((frame < 10) ? "0" + frame : frame) + ".png")
    }

    Timer {
        id: starsReachedAnim

        // Stores whether or not the animation has played for this fill sequence.
        property bool hasRun: false
        property int numFrames: 11

        function startAnim() {
            hasRun = true
            starsReached.frame = 1
            start()
        }

        // This gives us 20 FPS for the animation.
        interval: 50

        onTriggered: {
            if (starsReached.frame < numFrames) {
                starsReached.frame++
                start()
            }
        }
    }

    onOrbsCollectedChanged: {
        if (orbsCollected >= threshold && !starsReachedAnim.hasRun) {
            starsReachedAnim.startAnim()
        } else if (orbsCollected < threshold) {
            starsReachedAnim.hasRun = false
        }
    }
}
