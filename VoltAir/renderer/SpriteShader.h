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

#ifndef SPRITESHADER_H
#define SPRITESHADER_H

#include "RendererCommon.h"
#include "SingletonInstancedShaderBase.h"

/**
 * @ingroup Renderer
 * @brief Shader use by Renderer to draw textured rectangles (sprites).
 *
 * This Shader can take two transform matrices, a projection and model transform. The projection
 * matrix is set once (usually by Renderer) and is global. The model matrix positions the rectangle
 * in space, potentially rotated. This Shader also allows selection of a source rectangle in the
 * given Texture. This is done by offsetting texture UV coordinates.
 * @note This Shader is not intended to be used for batched rendering of sprites.
 */
class SpriteShader : public SingletonInstancedShaderBase<SpriteShader> {
public:
    /**
     * @brief Sets the projection matrix, which is a global uniform.
     * @note This is usually set by Renderer at the start of frame rendering and does not need to be
     * set manually.
     * @param matrix Matrix to set
     */
    void setGlobalProjectionTransform(const Matrix4& matrix);
    /**
     * @brief Sets the model transform.
     * @param matrix Matrix to set
     */
    void setTransform(const Matrix4& matrix);
    /**
     * @brief Sets the offset to apply to texture coordinates, shifting the source rectangle in the
     * source texture.
     * @param value Amount to offset
     */
    void setTexCoordScale(const Vector2& value);
    /**
     * @brief Sets the scaling factor to apply to texture coordinates, shrinking or expanding the
     * source rectangle in the source texture.
     * @param value Amount to scale
     */
    void setTexCoordOffset(const Vector2& value);
    /**
     * @brief Sets the overall transparency of the rendered texture, with @c 0.0f completely
     * transparent, and @c 1.0f fully opaque.
     *
     * This value is multiplied with the source texture's alpha, if it has an alpha channel, to
     * produce per-pixel alpha.
     * @param value Transparency to set
     */
    void setOpacity(float value);
    /**
     * @brief Sets the source Texture to apply to the drawn rectangle.
     *
     * The source rectangle into the Texture will be transformed by the texture coordinate offset
     * and scale.
     * @param texture Texture to set
     */
    void setTexture(const TexturePtr& texture);

protected:
    /**
     * @brief Implementation of InstancedShader::updateState().
     */
    virtual void updateState() override;

private:
    friend class InstancedShaderBase<SpriteShader>;
    static std::string getVertexShaderCode();
    static std::string getFragmentShaderCode();
    static AttributeSetPtr getAttributeSet();
    static std::vector<std::string> getUniformNames();

    Matrix4 mTransform;
    Vector2 mTexCoordScale = Vector2(1.0f, 1.0f);
    Vector2 mTexCoordOffset = Vector2(0.0f, 0.0f);
    float mOpacity = 1.0f;
    TexturePtr mTexture;

    static const char* VERTEX_SHADER;
    static const char* FRAGMENT_SHADER;
};

#endif // SPRITESHADER_H
