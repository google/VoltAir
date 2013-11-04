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

attribute highp vec4 a_position;
attribute mediump vec2 a_texCoord;
varying mediump vec2 v_texCoord;
uniform highp mat4 u_transform;

#ifdef HAS_EDGE
attribute mediump vec2 a_maskTexCoord;
varying mediump vec2 v_maskTexCoord;
#endif
#ifdef HAS_BEVEL
varying mediump vec2 v_blendTexCoord;
attribute mediump vec2 a_blendTexCoord;
#endif

void main() {
    gl_Position = u_transform * vec4(a_position.xy, 0.0, 1.0);
    v_texCoord = a_texCoord;
#ifdef HAS_EDGE
    v_maskTexCoord = a_maskTexCoord;
#endif
#ifdef HAS_BEVEL
    v_blendTexCoord = a_blendTexCoord;
#endif
}
