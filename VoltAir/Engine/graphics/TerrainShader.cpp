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

#include <QSharedPointer>
#include "Game.h"
#include "TerrainShader.h"
#include "renderer/RenderNode.h"
#include "renderer/Renderer.h"
#include "renderer/ShaderBase.h"
#include "renderer/InstancedShaderBase.h"
#include "utils/Util.h"

namespace {
    enum class Uniforms {
        TRANSFORM = 0,
        TEXTURE,
        MASK_TEXTURE,
        BLEND_TEXTURE,
    };
    enum class TextureStages {
        BASE_TEXTURE = 0,
        MASK_TEXTURE,
        BLEND_TEXTURE,
    };
}

const char* TerrainShader::TERRAIN_SHADER_UNIFORMS[] = {
        "u_transform", "s_texture", "s_maskTexture", "s_blendTexture", };
const char* TerrainShader::VERTEX_SHADER_PATH = "Engine/shaders/TerrainShader.vsh";
const char* TerrainShader::FRAGMENT_SHADER_PATH = "Engine/shaders/TerrainShader.fsh";
bool TerrainShader::sShaderMapInitialized = false;
QMap<TerrainShaderKey, ShaderPtr> TerrainShader::sShaderMap;


TerrainShader::TerrainShader(const ShaderPtr& sharedShader) : InstancedShader(sharedShader) {
}

void TerrainShader::setBaseTexture(const TexturePtr& value) {
    setIndexedTexture(int(Uniforms::TEXTURE), int(TextureStages::BASE_TEXTURE), value,
            &mBaseTexture);
}

void TerrainShader::setMaskTexture(const TexturePtr& value) {
    setIndexedTexture(int(Uniforms::MASK_TEXTURE), int(TextureStages::MASK_TEXTURE), value,
            &mMaskTexture);
}

void TerrainShader::setBlendTexture(const TexturePtr& value) {
    setIndexedTexture(int(Uniforms::BLEND_TEXTURE), int(TextureStages::BLEND_TEXTURE), value,
            &mBlendTexture);
}

void TerrainShader::setTransform(const Matrix4& matrix) {
    setIndexedUniformMatrix4f(int(Uniforms::TRANSFORM), false, false, matrix, &mTransform);
}

void TerrainShader::updateState() {
    setIndexedUniformMatrix4f(int(Uniforms::TRANSFORM), false, false, mTransform, nullptr);
    setIndexedTexture(int(Uniforms::TEXTURE), int(TextureStages::BASE_TEXTURE), mBaseTexture,
            nullptr);
    setIndexedTexture(int(Uniforms::MASK_TEXTURE), int(TextureStages::MASK_TEXTURE), mMaskTexture,
            nullptr);
    setIndexedTexture(int(Uniforms::BLEND_TEXTURE), int(TextureStages::BLEND_TEXTURE),
            mBlendTexture, nullptr);
}

void TerrainShader::addShaderCodeDefines(const TerrainShaderKey& shaderKey, std::string& code) {
    std::string prefix;
    if (shaderKey.hasEdge) {
        prefix += "#define HAS_EDGE\n";
    }
    if (shaderKey.hasBevel) {
        prefix += "#define HAS_BEVEL\n";

        switch (shaderKey.blendMode) {
        case TerrainMaterialDef::BlendMode::Add:
            prefix += "#define BLEND_MODE_ADD\n";
            break;
        case TerrainMaterialDef::BlendMode::Multiply:
            prefix += "#define BLEND_MODE_MULTIPLY\n";
            break;
        case TerrainMaterialDef::BlendMode::Overlay:
            prefix += "#define BLEND_MODE_OVERLAY\n";
            break;
        default:
        case TerrainMaterialDef::BlendMode::Blend:
            prefix += "#define BLEND_MODE_BLEND\n";
            break;
        }
    }
    code = Renderer::addCompatibilityPrefixToShaderCode((prefix + code).c_str());
}

const ShaderPtr& TerrainShader::getSharedShader(const TerrainShaderKey& shaderKey) {
    initializeShaderMap();
    Q_ASSERT(sShaderMap.contains(shaderKey));
    return sShaderMap[shaderKey];
}

void TerrainShader::initializeShaderMap() {
    if (sShaderMapInitialized) {
        return;
    }
    sShaderMapInitialized = true;

    // Generate all permutations.
    // TODO: A lot of these permutations generate the exact same shader, and also many are never
    // used. We can optimize this.
    for (int edgeIndex = 0; edgeIndex < 2; edgeIndex++) {
        bool hasEdge = edgeIndex > 0;
        for (int bevelIndex = 0; bevelIndex < 2; bevelIndex++) {
            bool hasBevel = bevelIndex > 0;
            int blendModeCount = (int) TerrainMaterialDef::BlendMode::Count;
            for (int blendMode = 0; blendMode < blendModeCount; blendMode++) {
                // Create shader.
                TerrainShaderKey shaderKey;
                shaderKey.hasEdge = hasEdge;
                shaderKey.hasBevel = hasBevel;
                shaderKey.blendMode = (TerrainMaterialDef::BlendMode) blendMode;
                ShaderPtr shader = createSharedShader(shaderKey);
                shader->compile();
                sShaderMap[shaderKey] = shader;
            }
        }
    }
}

ShaderPtr TerrainShader::createSharedShader(const TerrainShaderKey& shaderKey) {
    // Set up vertex attributes.
    std::vector<Attribute> attributeList;

    // Add a_position.
    attributeList.push_back({ "a_position", 2, false, GL_FLOAT });
    // Add a_texCoord.
    attributeList.push_back({ "a_texCoord", 2, false, GL_FLOAT });
    // Add a_maskTexCoord.
    if (shaderKey.hasEdge) {
        attributeList.push_back({ "a_maskTexCoord", 2, false, GL_FLOAT });
    }
    // Add a_blendTexCoord.
    if (shaderKey.hasBevel) {
        attributeList.push_back({ "a_blendTexCoord", 2, false, GL_FLOAT });
    }

    AttributeSetPtr attributes(new AttributeSet(attributeList));

    // Set up shader.
    std::string vertexShaderCode = Util::readFileAsStdString(
            Util::getPathToAsset(VERTEX_SHADER_PATH));
    std::string fragmentShaderCode = Util::readFileAsStdString(
            Util::getPathToAsset(FRAGMENT_SHADER_PATH));
    addShaderCodeDefines(shaderKey, vertexShaderCode);
    addShaderCodeDefines(shaderKey, fragmentShaderCode);

    ShaderBasePtr shader = ShaderBasePtr(new ShaderBase(
            vertexShaderCode.c_str(),
            fragmentShaderCode.c_str(),
            attributes,
            std::vector<std::string>(TERRAIN_SHADER_UNIFORMS, TERRAIN_SHADER_UNIFORMS
                    + sizeof(TERRAIN_SHADER_UNIFORMS) / sizeof(TERRAIN_SHADER_UNIFORMS[0]))));
    shader->compile();
    return shader;
}

bool TerrainShaderKey::operator < (const TerrainShaderKey& other) const {
    if (hasEdge != other.hasEdge) {
        return hasEdge;
    }
    if (hasBevel != other.hasBevel) {
        return hasBevel;
    }
    int blendModeDiff = (int) blendMode - (int) other.blendMode;
    return blendModeDiff < 0;
}

TerrainShaderKey::TerrainShaderKey() {
}

TerrainShaderKey::TerrainShaderKey(bool hasEdge, bool hasBevel,
        TerrainMaterialDef::BlendMode blendMode)
        : hasEdge(hasEdge), hasBevel(hasBevel), blendMode(blendMode) {
}
