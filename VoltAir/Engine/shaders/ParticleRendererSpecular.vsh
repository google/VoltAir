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

attribute highp vec2 a_position;
attribute highp vec2 a_texCoord;
uniform highp mat4 u_transform;
uniform highp mat4 u_texCoordTransform;
varying highp vec2 v_texCoord;

void main() {
    gl_Position = u_transform * vec4(a_position, 0.0, 1.0);
    v_texCoord = (u_texCoordTransform * vec4(a_texCoord, 0.0, 1.0)).xy;
}
