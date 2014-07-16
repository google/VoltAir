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

#include "DebugRenderer.h"
#include "Renderer.h"
#include "SpriteShader.h"
#include <memory.h>

const char* Renderer::SHADER_COMPATIBILITY_PREFIX =
        "#ifdef GL_ES\n"
        "#ifndef GL_FRAGMENT_PRECISION_HIGH\n"
        "#define highp mediump\n"
        "#endif\n"
        "#else\n"
        "#define lowp\n"
        "#define mediump\n"
        "#define highp\n"
        "#define precision\n"
        "#endif\n";

Renderer* Renderer::sCurrent = nullptr;

Renderer::Renderer() : mDebugRenderer(new DebugRenderer()) {
}

Renderer::~Renderer() {
}

void Renderer::init() {
    SpriteShaderPtr spriteShader = SpriteShader::getInstance();
    mSquareMesh = MeshInstance::createCompatibleMesh(4, GL_TRIANGLE_FAN, spriteShader);
    MeshPtr mesh = mSquareMesh->getMesh();

    AttributeArray<Vector2> meshPositions = mesh->getAttributeArray<Vector2>("a_position");
    AttributeArray<Vector2> meshTexCoords = mesh->getAttributeArray<Vector2>("a_texCoord");
    meshPositions[0] = Vector2(-1.0f, -1.0f);
    meshTexCoords[0] = Vector2(0.0f, 0.0f);
    meshPositions[1] = Vector2(-1.0f, 1.0f);
    meshTexCoords[1] = Vector2(0.0f, 1.0f);
    meshPositions[2] = Vector2(1.0f, 1.0f);
    meshTexCoords[2] = Vector2(1.0f, 1.0f);
    meshPositions[3] = Vector2(1.0f, -1.0f);
    meshTexCoords[3] = Vector2(1.0f, 0.0f);
}

void Renderer::begin() {
    if (!mInitialized) {
        mInitialized = true;
        init();
    }
}

void Renderer::end() {
    flush();
}

void Renderer::setProjectionMatrix(const Matrix4& matrix) {
    memcpy(mProjectionMatrix, matrix, sizeof(Matrix4));
    SpriteShader::getInstance()->setGlobalProjectionTransform(matrix);
}

void Renderer::drawSprite(const TexturePtr& texture, const Vector2& pos, float width, float height,
        const Vector2& srcPos, float srcWidth, float srcHeight, float rotation, float opacity) {
    if (opacity <= 0.0f) {
        return;
    }

    const SpriteShaderPtr& shader = SpriteShader::getInstance();
    shader->setTexture(texture);

    // Build a transform that takes our square to our rotated destination rectangle.
    float rotCos = cosf(rotation);
    float rotSin = sinf(rotation);
    Matrix4 matrix = {
        width * rotCos, width * rotSin, 0.0f, 0.0f,
        height * -rotSin, height * rotCos, 0.0f, 0.0f,
        0.0f, 0.0f, 1.0f, 0.0f,
        pos.x, pos.y, 0.0f, 1.0f,
    };
    shader->setTransform(matrix);
    shader->setTexCoordOffset(srcPos);
    shader->setTexCoordScale(Vector2(srcWidth, srcHeight));
    shader->setOpacity(opacity);
    drawMesh(mSquareMesh, shader);
}

void Renderer::drawMesh(const MeshInstancePtr& meshInstance, const ShaderPtr& shader) {
    Mesh* mesh = !meshInstance ? nullptr : meshInstance->getMesh().get();
    if (mesh) {
        selectShader(shader);
        selectMesh(meshInstance);
        glDrawArrays(meshInstance->getMode(), 0, mesh->getDrawVertexCount());
    }
}

void Renderer::flush() {
    clearShader();
    clearMesh();
    clearTextures();
}

void Renderer::selectTexture(const TexturePtr& texture, int stage) {
    if (int(mCurrentTextures.size()) < stage + 1) {
        mCurrentTextures.resize(stage + 1);
    }

    const TexturePtr& oldTexture = mCurrentTextures[stage];
    if (texture != oldTexture) {
        glActiveTexture(GL_TEXTURE0 + stage);
        if (oldTexture) {
            oldTexture->unbind();
        }
        if (texture) {
            texture->bind();
        }
    }
    mCurrentTextures[stage] = texture;
}

void Renderer::selectMesh(const MeshInstancePtr& meshInstance) {
    if (meshInstance == mCurrentMeshInstance) {
        return;
    }
    if (mCurrentMeshInstance) {
        mCurrentMeshInstance->unbind();
    }
    if (meshInstance) {
        meshInstance->bind();
    }
    mCurrentMeshInstance = meshInstance;
}

void Renderer::selectShader(const ShaderPtr& shader) {
    if (shader == mCurrentShader) {
        return;
    }
    if (mCurrentShader) {
        mCurrentShader->end();
    }
    if (shader) {
        shader->begin();
    }
    mCurrentShader = shader;
}

void Renderer::clearTextures() {
    int textureCount = mCurrentTextures.size();
    for (int i = 0; i < textureCount; i++) {
        const TexturePtr& oldTexture = mCurrentTextures[i];
        if (oldTexture) {
            glActiveTexture(GL_TEXTURE0 + i);
            oldTexture->unbind();
        }
    }
    mCurrentTextures.clear();
    glActiveTexture(GL_TEXTURE0);
}

void Renderer::clearMesh() {
    if (mCurrentMeshInstance) {
        mCurrentMeshInstance->unbind();
        mCurrentMeshInstance.reset();
    }
}

void Renderer::clearShader() {
    if (mCurrentShader) {
        mCurrentShader->end();
        mCurrentShader.reset();
    }
}

std::string Renderer::addCompatibilityPrefixToShaderCode(const char* code) {
    return std::string(SHADER_COMPATIBILITY_PREFIX) + code;
}

void Renderer::attachAsCurrent() {
    sCurrent = this;
}

void Renderer::detachAsCurrent() {
    assert(getCurrent() == this);
    detachCurrent();
}

void Renderer::detachCurrent() {
    sCurrent = nullptr;
}

Renderer* Renderer::getCurrent() {
    assert(sCurrent);
    return sCurrent;
}
