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
 * @brief Item that renders on top of all others and presents information for debugging.
 *
 * This display shows dynamic text and enables wireframe renderings of the physics simulation.
 * @note In most cases, this @c Item should not be visible in the released application.
 */
Item {
    // Explicitly marking this as visible for easy changes
    visible: false

    /**
     * @brief Enables the wireframe rendering of the physics simulation.
     * @note The wireframe rendering is not rendered by this @c Item.  Therefore, the wireframe will
     * still render if #debugRendererVisible is @c true even if the @c visible property is @c false.
     */
    property bool debugRendererVisible: false
    /**
     * @brief type:string Name of the current level.
     */
    property alias levelName: levelNameReporter.text

    // Debug FPS Counter Display
    Text {
        id: fpsReporter

        // Put on the top left of the UI
        anchors.left: parent.left
        anchors.top: parent.top

        color: "white"
        font.pixelSize: 0.05 * root.height
    }

    Text {
        id: memoryUsageReporter

        anchors.left: parent.left
        anchors.top: fpsReporter.bottom

        color: "white"
        font.pixelSize: 0.05 * root.height
    }

    Text {
        id: levelNameReporter

        anchors.left: parent.left
        anchors.top: memoryUsageReporter.bottom

        color: "white"
        font.pixelSize: 0.05 * root.height
    }

    DebugMetricsMonitor {
        objectName: "debugMetricsMonitor"

        loggingMetrics: true

        fpsRefreshIntervalMs: 50
        memoryUsageRefreshIntervalMs: 1000

        onFpsChanged:  {
            fpsReporter.text = fps.toFixed(2) + ' (' + instantFps.toFixed(2) + ') FPS'
        }

        onMemoryUsageChanged: {
            memoryUsageReporter.text = (memoryUsage / 1000000.0).toFixed(2) + ' MB'
        }
    }
}
