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
 * @brief A shader effect that renders an item in grayscale.
 */
Item {
    id: root

    /**
     * @brief Item to be rendered in grayscale.
     */
    property Item sourceItem
    /**
     * @brief type:real Proportion between the original colors and greyscale to output.
     *
     * @note @c 0.0 indicates no grayscaling.  @c 1.0 is completly monochrome.
     */
    property alias ratio: effect.ratio

    ShaderEffect {
        id: effect

        property variant src: ShaderEffectSource {
            sourceItem: root.sourceItem
            hideSource: true
            recursive: true
        }

        property real ratio: 1.0

        anchors.fill: parent

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform sampler2D src;
            uniform lowp float qt_Opacity;
            uniform highp float ratio;
            void main() {
                lowp vec4 tex = texture2D(src, qt_TexCoord0);
                lowp float gray = dot(tex.rgb, vec3(0.2126, 0.7152, 0.0722));
                gl_FragColor = vec4(mix(tex.rgb, vec3(gray), ratio), tex.a) * qt_Opacity;
            }"
    }
}
