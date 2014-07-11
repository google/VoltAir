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

#include "Camera.h"
#include "Engine.h"
#include "PolygonMesh.h"
#include "TerrainMeshRenderer.h"
#include "TerrainMaterials.h"
#include "TerrainShader.h"
#include "TextureManager.h"
#include "bodies/PolygonBody.h"
#include "renderer/RenderList.h"
#include "renderer/Texture.h"
#include "utils/Util.h"

TerrainMeshRenderer::TerrainMeshRenderer(QQuickItem* parent) : Graphic(parent) {
}

void TerrainMeshRenderer::setMaterial(const QString& value) {
    if (mMaterialName != value) {
        mMaterialName = value;
        mInvalidated = true;
    }
    emit materialChanged();
}

void TerrainMeshRenderer::setBaseMesh(PolygonMesh* value) {
    if (mBaseMesh != value) {
        mBaseMesh = value;
        mInvalidated = true;
    }
    emit baseMeshChanged();
}

void TerrainMeshRenderer::setEdgeMesh(PolygonMesh* value) {
    if (mEdgeMesh != value) {
        mEdgeMesh = value;
        mInvalidated = true;
    }
    emit edgeMeshChanged();
}

void TerrainMeshRenderer::setBevelMesh(PolygonMesh* value) {
    if (mBevelMesh != value) {
        mBevelMesh = value;
        mInvalidated = true;
    }
    emit bevelMeshChanged();
}


void TerrainMeshRenderer::synchronizeForRendering(RenderList* renderList) {
    if (mInvalidated) {
        mInvalidated = false;
        validate();
    }

    RenderParameters renderParams;
    getFlattenedRenderParameters(&renderParams);
    Camera* camera = Engine::getInstance()->getCamera();
    const Matrix4& projTrans = *reinterpret_cast<const Matrix4*>(&camera->getOpenGLViewMatrix());
    Matrix4 transform;
    memcpy(transform, &projTrans, sizeof(Matrix4));
    // TODO: Use matrix multiply.
    transform[12] += projTrans[0] * renderParams.worldPosition.x();
    transform[13] += projTrans[5] * renderParams.worldPosition.y();
    float zDepth = renderParams.zDepth;

    updateRenderNode(transform, zDepth, mBaseRenderMesh, mBaseShader, &mBaseRenderNode, renderList);
    updateRenderNode(transform, zDepth, mEdgeRenderMesh, mEdgeShader, &mEdgeRenderNode, renderList);
    updateRenderNode(transform, zDepth, mBevelRenderMesh, mBevelShader, &mBevelRenderNode,
            renderList);
}

void TerrainMeshRenderer::updateRenderNode(const Matrix4& transform, float zDepth,
        const MeshInstancePtr& mesh, const TerrainShaderPtr& shader, RenderNode* node,
        RenderList* renderList) {
    if (mesh) {
        shader->setTransform(transform);
        node->shader = shader;
        node->mesh = mesh;
        node->zDepth = zDepth;
        renderList->addNode(node);
    }
}

void TerrainMeshRenderer::validate() {
    // Find the material definition.
    TextureManager* textureManager = Engine::getInstance()->getTextureManager();
    QSharedPointer<TerrainMaterialDef> materialDefPtr =
            Engine::getInstance()->getTerrainMaterials()->getMaterial(mMaterialName);
    TerrainMaterialDef materialDef = materialDefPtr ? *materialDefPtr : TerrainMaterialDef();

    // Generate the three parts: Base, Edge, Bevel.
    mBaseShader = createShader(false, false, materialDef.getBlendMode());
    mEdgeShader = createShader(true, mBevelMesh, materialDef.getBlendMode());
    mBevelShader = createShader(false, true, materialDef.getBlendMode());
    mBaseRenderMesh = createRenderMesh(mBaseMesh, mBaseShader);
    mEdgeRenderMesh = createRenderMesh(mEdgeMesh, mEdgeShader);
    mBevelRenderMesh = createRenderMesh(mBevelMesh, mBevelShader);

    TexturePtr baseTexture = textureManager->getTextureImage(materialDef.getBaseTexture());
    TexturePtr edgeTexture = textureManager->getTextureImage(materialDef.getEdgeTexture());
    TexturePtr bevelTexture = textureManager->getTextureImage(materialDef.getBevelTexture());
    // Set filtering and wrapping.
    // Edge and bevel textures need to be clamped vertically. They also need mip-maps disabled
    // to avoid fringing.
    baseTexture->setMagnificationFilter(GL_LINEAR);
    baseTexture->setMinificationFilter(GL_NEAREST_MIPMAP_LINEAR);
    baseTexture->setHorizontalWrapMode(GL_REPEAT);
    baseTexture->setVerticalWrapMode(GL_REPEAT);
    edgeTexture->setMagnificationFilter(GL_LINEAR);
    edgeTexture->setMinificationFilter(GL_LINEAR);
    edgeTexture->setHorizontalWrapMode(GL_REPEAT);
    edgeTexture->setVerticalWrapMode(GL_CLAMP_TO_EDGE);
    bevelTexture->setMagnificationFilter(GL_LINEAR);
    bevelTexture->setMinificationFilter(GL_LINEAR);
    bevelTexture->setHorizontalWrapMode(GL_REPEAT);
    bevelTexture->setVerticalWrapMode(GL_CLAMP_TO_EDGE);

    mBaseShader->setBaseTexture(baseTexture);
    mEdgeShader->setBaseTexture(baseTexture);
    mEdgeShader->setMaskTexture(edgeTexture);
    mEdgeShader->setBlendTexture(bevelTexture);
    mBevelShader->setBaseTexture(baseTexture);
    mBevelShader->setBlendTexture(bevelTexture);
}

TerrainShaderPtr TerrainMeshRenderer::createShader(bool hasEdge, bool hasBevel,
        TerrainMaterialDef::BlendMode blendMode) {
    TerrainShaderKey shaderKey;
    shaderKey.hasEdge = hasEdge;
    shaderKey.hasBevel = hasBevel;
    shaderKey.blendMode = blendMode;
    return TerrainShaderPtr(new TerrainShader(TerrainShader::getSharedShader(shaderKey)));
}

MeshInstancePtr TerrainMeshRenderer::createRenderMesh(PolygonMesh* mesh,
        const TerrainShaderPtr& shader) {
    if (!mesh) {
        return nullptr;
    }

    // Get the vertex attributes for our geometry.
    AttributeSetPtr shaderAttributes = shader->getAttributes();

    // Count vertices.
    int vertexCount = 0;
    bool hadVertexCount = false;
    const QList<PolygonVertexAttributeArray*>& vertexArrays = mesh->getVertexArrays();
    for (PolygonVertexAttributeArray* vertexArray : vertexArrays) {
        const QString& name = vertexArray->getName();
        for (const Attribute& attribute : shaderAttributes->attributes) {
            if (name == attribute.name.c_str()) {
                vertexCount = vertexArray->getValues().size() / attribute.size;
                hadVertexCount = true;
                break;
            }
        }
    }

    if (!hadVertexCount || vertexCount <= 0) {
        return nullptr;
    }

    // Create a mesh.
    MeshInstancePtr renderMesh = MeshInstance::createCompatibleMesh(
            vertexCount, GL_TRIANGLES, shader);

    // Fill our arrays.
    for (PolygonVertexAttributeArray* vertexArray : vertexArrays) {
        std::string name = vertexArray->getName().toStdString();
        AttributeArray<float> array = renderMesh->getMesh()->getAttributeArray<float>(name.c_str());
        if (!array.isValid()) {
            // This shader doesn't use this attribute.
            continue;
        }

        // Validate length.
        const Attribute& attribute = *array.getAttribute();
        int expectedElementCount = attribute.size * vertexCount;
        if (expectedElementCount != vertexArray->getValues().size()) {
            qDebug() << "Invalid vertex array length.";
            return nullptr;
        }

        // Special case for position (we need to invert Y).
        bool isPosition = name == "a_position";

        // Copy elements.
        int elementCount = attribute.size;
        auto srcVertexDataIt = vertexArray->getValues().begin();
        auto dstVertexDataIt = array.begin();
        for (int i = 0; i < vertexCount; i++) {
            int elementScale = 1;
            float* dstElements = &*dstVertexDataIt;
            dstVertexDataIt++;
            for (int j = 0; j < elementCount; j++) {
                *dstElements++ = *srcVertexDataIt++ * elementScale;
                if (isPosition) {
                    elementScale = -elementScale;
                }
            }
        }
    }

    return renderMesh;
}
