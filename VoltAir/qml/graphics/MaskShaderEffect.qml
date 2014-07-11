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
 * @brief A shader effect that masks one texture with another.
 */
Item {
    id: root

    /**
     * @brief Item that is masked by #maskItem.
     */
    property Item sourceItem
    /**
     * @brief Item that masks #sourceItem.
     */
    property Item maskItem

    ShaderEffect {
        id: effect

        property variant src: ShaderEffectSource {
            sourceItem: root.sourceItem
            // Take a center clipping.
            sourceRect: Qt.rect(sourceItem.width / 2.0 - effect.width / 2.0,
                    sourceItem.height / 2.0 - effect.height / 2.0, effect.width, effect.height)
            hideSource: true
            recursive: true
        }

        property variant mask: ShaderEffectSource {
            sourceItem: root.maskItem
            // Take a center clipping.
            sourceRect: Qt.rect(sourceItem.width / 2.0 - effect.width / 2.0,
                    sourceItem.height / 2.0 - effect.height / 2.0, effect.width, effect.height)
            hideSource: true
            recursive: true
        }

        anchors.fill: parent

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform sampler2D src;
            uniform sampler2D mask;
            uniform lowp float qt_Opacity;
            void main() {
                lowp vec4 tex = texture2D(src, qt_TexCoord0);
                lowp float texMask = texture2D(mask, qt_TexCoord0).a;
                gl_FragColor = tex * qt_Opacity * texMask;
            }"
    }
}
