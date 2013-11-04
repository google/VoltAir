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

// The current location in the FBO.
varying mediump vec2 v_texCoord;
// The FBO sampler.
uniform lowp sampler2D s_texture;
// The specular FBO sampler.
uniform lowp sampler2D s_specularTexture;
// The overall opacity of this effect.
uniform lowp float u_alpha;
// The width of the highlight.
uniform lowp float u_highlightWidthFactor;
// The opacity of the highlight.
uniform lowp float u_highlightAlpha;
// The base water color.
uniform lowp vec4 u_tintColor;

void main() {
    // Get the amount of fake specular lighting, stored in an FBO.
    lowp vec4 sample = texture2D(s_texture, v_texCoord);
    lowp float specLight = texture2D(s_specularTexture, v_texCoord).r;

    // Compute highlight around edge.
    // This takes the particle alpha and puts it through a smoothstep to sharpen it.
    lowp float height = sample.a;
    lowp float highlight = (1.0 - height) * u_highlightWidthFactor;
    highlight = smoothstep(0.0, 1.0, highlight) * u_highlightAlpha;

    // Blend together specular lighting and highlight.
    // Also apply the alpha of the particle texture itself. This alpha is amplified because
    // the original texture is slightly fuzzy, so that we can compute the highlight using
    // its alpha.
    lowp float lightAlpha = (specLight + highlight);
    lowp float baseAlpha = u_tintColor.a;
    lowp float maskAlpha = min(1.0, sample.a * 2.0) * u_alpha;
    lowp vec3 baseColor = u_tintColor.rgb * baseAlpha;
    lowp float auxAlpha = maskAlpha;
    gl_FragColor.rgb = mix(baseColor, vec3(1.0), lightAlpha);
    gl_FragColor.a = (baseAlpha + lightAlpha - baseAlpha * lightAlpha);
    gl_FragColor *= auxAlpha;
}
