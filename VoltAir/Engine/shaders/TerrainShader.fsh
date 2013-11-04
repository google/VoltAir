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

varying mediump vec2 v_texCoord;
uniform lowp sampler2D s_texture;

#ifdef HAS_EDGE
varying mediump vec2 v_maskTexCoord;
uniform lowp sampler2D s_maskTexture;
#endif
#ifdef HAS_BEVEL
varying mediump vec2 v_blendTexCoord;
uniform lowp sampler2D s_blendTexture;
#endif

// Blend up to three textures, using the given blend mode.
//
// The base texture provides a tiled basic look.
// The edge mask texture masks out sections, and also provides anti-aliasing.
// The bevel texture allows rim lighting-like effects, or adding detail inset around the edge.
void main() {
    // Sample textures as necessary.
    lowp vec4 baseColor = texture2D(s_texture, v_texCoord);
    lowp float maskAlpha = 1.0;
#ifdef HAS_EDGE
    maskAlpha = texture2D(s_maskTexture, fract(v_maskTexCoord)).a;
#endif
#ifdef HAS_BEVEL
    lowp vec4 blendColor = texture2D(s_blendTexture, v_blendTexCoord);
#endif

    // QQuick always gives us premultiplied alpha.
    // Blend using premultiplied alpha.
    lowp vec3 blendedColor;
#if !defined(HAS_BEVEL)
    // We have no bevel, and so we don't blend.
    blendedColor = baseColor.rgb;
#elif defined(BLEND_MODE_ADD)
    // Apply additive blend.
    blendedColor = baseColor.rgb + blendColor.rgb;
#elif defined(BLEND_MODE_MULTIPLY)
    // Apply multiplicitive blend.
    blendedColor = baseColor.rgb * (1.0 - blendColor.a) + baseColor.rgb * blendColor.rgb;
#elif defined(BLEND_MODE_OVERLAY)
    // Apply overlay blend.
    blendedColor = baseColor.rgb * (1.0 - blendColor.a) + 2.0 * baseColor.rgb * blendColor.rgb;
#else
    // Apply source-over blend.
    blendedColor = baseColor.rgb * (1.0 - blendColor.a) + blendColor.rgb;
#endif

    gl_FragColor = vec4(blendedColor, baseColor.a * maskAlpha);
    // QQuick expects premultiplied alpha.
    // When the texture was loaded, it was already premultiplied with the base texture's alpha,
    // so only multiply in the part we're adding.
    gl_FragColor.rgb *= maskAlpha;
}
