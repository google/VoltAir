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

#extension GL_NV_shader_framebuffer_fetch : enable
// TODO: Support GL_EXT_shader_framebuffer_fetch as well.

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
// The offset to apply to the shadow.
uniform mediump vec2 u_shadowOffset;
// The strength of the shadow.
uniform lowp float u_shadowAlpha;
// The color tint of the shadow.
uniform lowp vec3 u_shadowColor;

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
    lowp float maskAlpha = min(1.0, sample.a * 2.0) * u_alpha;
    lowp float innerBevelAlpha = (specLight + highlight) * maskAlpha;

    // Then compute and blend in inner shadow.
    // TODO: Get rid of dependent texture read by moving computation to vertex shader.
    lowp vec4 offsetSample = texture2D(s_texture, v_texCoord + u_shadowOffset);
    lowp float innerShadow = offsetSample.r;
    lowp float innerShadowAlpha = ((1.0 - innerShadow) * 1.5 - 0.5) * sample.a
            * u_alpha * u_shadowAlpha;
    lowp vec4 innerShadowColor =
            vec4(mix(vec3(1.0), u_shadowColor, innerShadowAlpha), innerShadowAlpha);

    // Blend together specular lighting and highlight.
    // Also apply the alpha of the particle texture itself. This alpha is amplified because
    // the original texture is slightly fuzzy, so that we can compute the highlight using
    // its alpha.
    lowp float baseAlpha = u_tintColor.a * maskAlpha;
    lowp vec3 baseColor = u_tintColor.rgb;

    // Mix with frame buffer's color.
    gl_FragColor = vec4(gl_LastFragColor.rgb * innerShadowColor.rgb, 1.0);
    gl_FragColor = vec4(mix(gl_FragColor.rgb, baseColor, baseAlpha), 1.0);
    gl_FragColor = vec4(mix(gl_FragColor.rgb, vec3(1.0), innerBevelAlpha), 1.0);
}
