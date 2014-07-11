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

import QtQuick 2.0
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief Scrollable list that contains @c Item%s.
 */
UiComponent {
    id: root

    /**
     * @brief Width of @c Item%s held in this SimpleListMenu.
     */
    property real listItemWidth: parent.width / 3.5
    /**
     * @brief Height of @c Item%s held in this SimpleListMenu.
     */
    property real listItemHeight: 0.6 * parent.height
    /**
     * @brief type:ListView ListView which holds the @c Item%s and provides scrolling functionality.
     * @note This is exposed to allow for the customization of properties on the @c ListView,
     * most importantly @c listView.model.
     */
    property alias listView: listView
    /**
     * @brief Number of @c Item%s visible at any time.
     * @note Fractions of @c Item%s may be visible while scrolling, but the total @c Item visible
     * area should remain about the same.
     */
    property real visibleItemCount: 3.0

    /**
     * @brief Forces #listView to refresh each of the contained @c Item%s.
     *
     * This function looks for and invokes a @c refresh() function dynamically defined on each of
     * the contained @c Item%s and invokes them as necessary.
     */
    function refresh() {
        // Currently can only iterate the items of a ListView by using currentIndex.
        var savedCurrentIndex = listView.currentIndex
        for (var i = 0; i < listView.count; ++i) {
            listView.currentIndex = i
            if (listView.currentItem.refresh) {
                listView.currentItem.refresh()
            }
        }
        listView.currentIndex = savedCurrentIndex
    }

    showState: "SHOWING"
    hideState: "HIDDEN"

    states: [
        State { name: "SHOWING" },
        State { name: "HIDDEN" }
    ]

    transitions: [
        Transition {
            from: "HIDDEN"
            to: "SHOWING"
            SequentialAnimation {
                NumberAnimation {
                    target: root
                    property: "opacity"
                    to: 1
                    duration: showDuration
                }
                ScriptAction { script: root.showCompleted() }
            }
        },
        Transition {
            from: "SHOWING"
            to: "HIDDEN"
            SequentialAnimation {
                NumberAnimation {
                    target: root
                    property: "opacity"
                    to: 0
                    duration: hideDuration
                }
                ScriptAction { script: root.hideCompleted() }
            }
        }
    ]

    ListView {
        id: listView

        focus: true

        // Center the menu on the screen
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        orientation: ListView.Horizontal

        spacing: 20

        width: (orientation == ListView.Horizontal)
                ? (root.listItemWidth + spacing) * Math.min(count, root.visibleItemCount)
                : root.listItemWidth
        height: (orientation == ListView.Vertical)
                ? (root.listItemHeight + spacing) * Math.min(count, root.visibleItemCount)
                : root.listItemHeight

        clip: true

        boundsBehavior: (count <= root.visibleItemCount)
                ? Flickable.StopAtBounds : Flickable.DragOverBounds

        highlightMoveDuration: (count <= root.visibleItemCount) ? 0 : 250
        highlightResizeDuration: 0
    }
}
