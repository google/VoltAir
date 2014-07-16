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
 * @brief Manager for the state of a set of MultiTouchMenuIcon%s.
 *
 * This class defines an area that intercepts multi-touch events and maps these events to changes in
 * MultiTouchMenuIcon#buttonPressed state.
 *
 * To enable use of a MultiTouchMenuIcon, add them first to the MultiTouchMenuIcon's parent and then
 * append it to the #icons set.
 */
MultiPointTouchArea {
    id: root

    /**
     * @brief MultiTouchMenuIcon%s whose MultiTouchMenuIcon#buttonPressed state to manage.
     */
    property var icons: []

    /**
     * @brief Resets the MultiTouchMenuIcon#buttonPressed state for all managed #icons.
     */
    function resetIcons() {
        for (var i = 0; i < icons.length; ++i) {
            icons[i].buttonPressed = false
        }
    }

    /**
     * @brief Returns whether or not @p item is a managed MultiTouchMenuIcon in #icons.
     * @param type:Item item Item to check if it is a managed MultiTouchMenuIcon
     */
    function isIcon(item) {
        // Early exit check.
        if (!item || item == root) {
            return false
        }

        for (var i = 0; i < icons.length; ++i) {
            if (item == icons[i]) {
                return true
            }
        }
        return false
    }

    onPressed: {
        for (var i = 0; i < touchPoints.length; ++i) {
            var touchPoint = touchPoints[i]
            var child = parent.childAt(touchPoint.x, touchPoint.y)
            if (isIcon(child)) {
                child.buttonPressed = true
            }
        }
    }

    onReleased: {
        for (var i = 0; i < touchPoints.length; ++i) {
            var touchPoint = touchPoints[i]
            var child = parent.childAt(touchPoint.x, touchPoint.y)
            if (isIcon(child)) {
                child.buttonPressed = false
            }
        }
    }

    onUpdated: {
        // Note: Devices without a touch screen could still be generating TouchPoint events through
        // use of a mouse, but these TouchPoints will lack "previous" data, so we must reset all
        // states and update based on the current. This works because it is impossible to actually
        // have multiple touch points with a mouse anyway.
        var hasPreviousPosition = Util.deviceHasTouchScreen()
        if (!hasPreviousPosition) {
            resetIcons()
        }

        for (var i = 0; i < touchPoints.length; ++i) {
            var touchPoint = touchPoints[i]
            var curChild = parent.childAt(touchPoint.x, touchPoint.y)
            var prevChild = parent.childAt(touchPoint.previousX, touchPoint.previousY)
            if (isIcon(curChild)) {
                if (curChild.buttonPressed != touchPoint.pressed) {
                    curChild.buttonPressed = touchPoint.pressed
                }
            }
            if (hasPreviousPosition && curChild != prevChild && isIcon(prevChild)) {
                if (prevChild.buttonPressed) {
                    prevChild.buttonPressed = false
                }
            }
        }
    }
}
