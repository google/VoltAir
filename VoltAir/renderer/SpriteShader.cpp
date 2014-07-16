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

#include "Renderer.h"
#include "SpriteShader.h"

namespace {
    enum class Uniforms {
        TRANSFORM = 0,
        PROJ_TRANSFORM,
        TEX_COORD_SCALE,
        TEX_COORD_OFFSET,
        OPACITY,
        TEXTURE,
    };
}

const char* SpriteShader::VERTEX_SHADER =
        "attribute highp vec4 a_position;\n"
        "attribute mediump vec2 a_texCoord;\n"
        "varying mediump vec2 v_texCoord;\n"
        "uniform highp mat4 u_projTransform;\n"
        "uniform highp mat4 u_transform;\n"
        "uniform mediump vec2 u_texCoordScale;\n"
        "uniform mediump vec2 u_texCoordOffset;\n"
        "void main() {\n"
        "    gl_Position = u_projTransform * (u_transform * vec4(a_position.xy, 0.0, 1.0));\n"
        "    v_texCoord = a_texCoord * u_texCoordScale + u_texCoordOffset;\n"
        "}\n";
const char* SpriteShader::FRAGMENT_SHADER =
        "varying mediump vec2 v_texCoord;\n"
        "uniform lowp float u_opacity;\n"
        "uniform lowp sampler2D s_texture;\n"
        "void main() {\n"
        "    gl_FragColor = texture2D(s_texture, v_texCoord) * u_opacity;\n"
        "}\n";

void SpriteShader::setGlobalProjectionTransform(const Matrix4& matrix) {
    setIndexedUniformMatrix4f(int(Uniforms::PROJ_TRANSFORM), true, GL_FALSE, matrix, nullptr);
}

void SpriteShader::setTransform(const Matrix4& matrix) {
    setIndexedUniformMatrix4f(int(Uniforms::TRANSFORM), false, GL_FALSE, matrix, &mTransform);
}

void SpriteShader::setTexCoordScale(const Vector2& value) {
    setIndexedUniform2f(int(Uniforms::TEX_COORD_SCALE), false, value, &mTexCoordScale);
}

void SpriteShader::setTexCoordOffset(const Vector2& value) {
    setIndexedUniform2f(int(Uniforms::TEX_COORD_OFFSET), false, value, &mTexCoordOffset);
}

void SpriteShader::setOpacity(float value) {
    setIndexedUniform1f(int(Uniforms::OPACITY), false, value, &mOpacity);
}

void SpriteShader::setTexture(const TexturePtr& texture) {
    setIndexedTexture(int(Uniforms::TEXTURE), 0, texture, &mTexture);
}

void SpriteShader::updateState() {
    setIndexedUniformMatrix4f(int(Uniforms::TRANSFORM), false, GL_FALSE, mTransform, nullptr);
    setIndexedUniform2f(int(Uniforms::TEX_COORD_SCALE), false, mTexCoordScale, nullptr);
    setIndexedUniform2f(int(Uniforms::TEX_COORD_OFFSET), false, mTexCoordOffset, nullptr);
    setIndexedUniform1f(int(Uniforms::OPACITY), false, mOpacity, nullptr);
    setIndexedTexture(int(Uniforms::TEXTURE), 0, mTexture, nullptr);
}

std::string SpriteShader::getVertexShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(VERTEX_SHADER);
}

std::string SpriteShader::getFragmentShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(FRAGMENT_SHADER);
}

AttributeSetPtr SpriteShader::getAttributeSet() {
    return AttributeSetPtr(new AttributeSet({
            { "a_position", 2, false, GL_FLOAT },
            { "a_texCoord", 2, false, GL_FLOAT } }));
}

std::vector<std::string> SpriteShader::getUniformNames() {
    return {
            "u_transform",
            "u_projTransform",
            "u_texCoordScale",
            "u_texCoordOffset",
            "u_opacity",
            "s_texture" };
}
