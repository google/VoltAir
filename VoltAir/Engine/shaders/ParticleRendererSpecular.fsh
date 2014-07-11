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
// The sampling offset used for finite differences.
uniform mediump float u_sampleOffset;

// The direction of the light to be used for fake specular lighting.
uniform lowp vec2 u_lightDir;
// The radius from the center of particles that appears to "plateau".
uniform mediump float u_specularCenterFalloff;
// The sharpness of the "plateau" at the center of particles.
uniform mediump float u_specularCenterStrength;
// The glossiness of specular lighting.
uniform mediump float u_specularGloss;
// The brightness of specular lighting.
uniform mediump float u_specularStrength;

void main() {
    // Compute fake specular lighting amount, by treating the gradient of the height map as
    // the normal of the surface. The height map is stored in the red channel of the FBO.
    //
    // The gradient vector is computed using finite differences.
    //
    // Finite differences samples at offsets, and subtracts the two to estimate the
    // derrivative at that point. A combination of forward and backward differences is used
    // (samples right, down, and center). Central differences is more accurate but requires
    // additional texture samples.
    mediump float offset = u_sampleOffset;
    lowp float sample = texture2D(s_texture, v_texCoord).r;
    lowp float sampleRight = texture2D(s_texture, v_texCoord + vec2(offset, 0)).r;
    lowp float sampleDown = texture2D(s_texture, v_texCoord + vec2(0, -offset)).r;
    // Create a plateau around the center of particles.
    lowp float heightCenter = min(0.6, sample);
    lowp float heightRight = min(0.6, sampleRight);
    lowp float heightDown = min(0.6, sampleDown);
    // Compute finite differences.
    mediump vec2 grad = vec2(heightRight - heightCenter, heightCenter - heightDown);
    // Normalize gradient vector, avoiding division by zero.
    mediump float gradLength = length(grad);
    grad /= max(0.05, gradLength);
    // Compute specular lighting using the fake light source.
    // The lighting falls off at the center of particles to give a smoother look.
    mediump float specCenterFalloff =
            smoothstep(1.0, 0.0, (sample - u_specularCenterFalloff) * u_specularCenterStrength);
    mediump float specLight = dot(grad, u_lightDir) * specCenterFalloff;
    specLight = clamp((specLight - u_specularGloss) * u_specularStrength, 0.0, 1.0);
    specLight *= specLight;

    gl_FragColor = vec4(specLight);
}
