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

#ifndef TERRAINSHADER_H
#define TERRAINSHADER_H

#include <memory>
#include "TerrainMaterialDef.h"
#include "renderer/InstancedShader.h"
#include "renderer/RendererCommon.h"

/**
 * @ingroup Engine
 * @brief Selector key which picks the specific terrain shader variant to use.
 * @see TerrainShader::getSharedShader()
 */
struct TerrainShaderKey {
    /**
     * @brief Whether or not this shader renders edges.
     *
     * TerrainShader%s with edges take a mask texture, and additional texture coordinates for that
     * texture.
     */
    bool hasEdge = false;
    /**
     * @brief Whether or not this shader renders a bevel section.
     *
     * TerrainShader%s with bevel sections take a blend texture, and additional texture coordinates
     * for that texture.
     */
    bool hasBevel = false;
    /**
     * @brief How the blend texture should be composited on to the base texture.
     * @note This value has no effect when #hasBevel is @c false.
     */
    TerrainMaterialDef::BlendMode blendMode = TerrainMaterialDef::BlendMode::Add;

    /**
     * @brief Less than operator for use with QMap.
     * @param other TerrainShaderKey to compare
     * @return @c true if @c this is logically less than @p other
     */
    bool operator < (const TerrainShaderKey& other) const;
    /**
     * @brief Construct an empty TerrainShaderKey with default values.
     */
    TerrainShaderKey();
    /**
     * @brief Construct a TerrainShaderKey.
     * @param hasEdge Value for #hasEdge
     * @param hasBevel Value for #hasBevel
     * @param blendMode Value for #blendMode
     */
    TerrainShaderKey(bool hasEdge, bool hasBevel, TerrainMaterialDef::BlendMode blendMode);
};

class TerrainShader;
/**
 * @brief Shared pointer typedef for TerrainShader.
 */
typedef std::shared_ptr<TerrainShader> TerrainShaderPtr;

/**
 * @brief InstancedShader which does a multi-texture blend between up to three Texture%s, to render
 * terrain meshes.
 *
 * As an InstancedShader, each instance is based on a shared Shader object. TerrainShader actually
 * has multiple possible shared Shader%s, each corresponding to a permutation of TerrainShaderKey.
 * This allows the shader code for each permutation to be optimized. For example, if the part of
 * terrain being rendered does not have a mask texture, then that shared Shader will avoid the extra
 * texture sample, and will not blend in the mask alpha.
 *
 * A TerrainShader instance for a given TerrainShaderKey is created by calling getSharedShader()
 * with the shader key, and passing that to the TerrainShader constructor. This instance may then
 * be used to specify exact textures to be applied to that terrain piece. This is managed by
 * TerrainMeshRenderer.
 *
 * The GLSL shader code is implemented in TerrainShader.vsh and TerrainShader.fsh.
 */
class TerrainShader : public InstancedShader {
public:
    /**
     * @brief Construct a TerrainShader based on the given shared Shader.
     * @param sharedShader Shared shader to use, retrieved from getSharedShader()
     */
    explicit TerrainShader(const ShaderPtr& sharedShader);

    /**
     * @brief Returns the base Texture.
     */
    const TexturePtr& getBaseTexture() const { return mBaseTexture; }
    /**
     * @brief Sets the base Texture.
     * @see TerrainMaterialDef
     * @param value Shared pointer to the Texture to set
     */
    void setBaseTexture(const TexturePtr& value);
    /**
     * @brief Returns the mask Texture.
     */
    const TexturePtr& getMaskTexture() const { return mMaskTexture; }
    /**
     * @brief Sets the mask Texture.
     * @note This usually corresponds to the mask texture.
     * @see TerrainMaterialDef
     * @param value Shared pointer to the Texture to set
     */
    void setMaskTexture(const TexturePtr& value);
    /**
     * @brief Returns the blend Texture.
     */
    const TexturePtr& getBlendTexture() const { return mBlendTexture; }
    /**
     * @brief Sets the blend Texture.
     * @note This usually corresponds to the bevel texture.
     * @see TerrainMaterialDef
     * @param value Shared pointer to the Texture to set
     */
    void setBlendTexture(const TexturePtr& value);

    /**
     * @brief Sets the transform to apply to vertices rendered with this Shader.
     * @param matrix Matrix transform to set
     */
    void setTransform(const Matrix4& matrix);

    /**
     * @brief Returns the uninstanced (shared) Shader which can render the traits in the specified
     * TerrainShaderKey.
     * @note The Shader for a key is only created once and then cached.
     * @param shaderKey TerrainShaderKey used to select the shader
     * @return Shared pointer to the Shader
     */
    static const ShaderPtr& getSharedShader(const TerrainShaderKey& shaderKey);

protected:
    /**
     * @brief Implementation of InstancedShader::updateState().
     */
    virtual void updateState() override;

private:
    static void addShaderCodeDefines(const TerrainShaderKey& shaderKey, std::string& code);
    static void initializeShaderMap();
    static ShaderPtr createSharedShader(const TerrainShaderKey& shaderKey);

    static bool sShaderMapInitialized;
    // Note: The data in this map is intentionally leaked. Used very late in rendering.
    static QMap<TerrainShaderKey, ShaderPtr> sShaderMap;

    TexturePtr mBaseTexture;
    TexturePtr mMaskTexture;
    TexturePtr mBlendTexture;
    Matrix4 mTransform;

    static const char* TERRAIN_SHADER_UNIFORMS[];
    static const char* VERTEX_SHADER_PATH;
    static const char* FRAGMENT_SHADER_PATH;
};

#endif // TERRAINSHADER_H
