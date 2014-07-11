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
// The offset to apply to the shadow.
uniform mediump vec2 u_shadowOffset;
// The strength of the shadow.
uniform lowp float u_shadowAlpha;
// The color tint of the shadow.
uniform lowp vec3 u_shadowColor;

void main() {

    lowp vec4 sample = texture2D(s_texture, v_texCoord);
    lowp vec4 offsetSample = texture2D(s_texture, v_texCoord + u_shadowOffset);
    lowp float innerShadow = offsetSample.r;
    gl_FragColor.a = ((1.0 - innerShadow) * 1.5 - 0.5) * sample.a * u_shadowAlpha;
    gl_FragColor.rgb = mix(vec3(1.0), u_shadowColor, gl_FragColor.a);
}
