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

#ifndef TERRAINMESHRENDERER_H
#define TERRAINMESHRENDERER_H

#include <memory>
#include "Graphic.h"
#include "TerrainMaterialDef.h"
#include "renderer/RenderNode.h"
#include "renderer/RendererCommon.h"

class PolygonMesh;
class QSGTexture;
class TerrainShader;
typedef std::shared_ptr<TerrainShader> TerrainShaderPtr;

/**
 * @ingroup Engine
 * @ingroup QQuickItem
 * @brief Graphic which performs rendering of a terrain mesh.
 *
 * A terrain mesh is composed of three parts: Base, Edge, and Bevel. These are each represented
 * by a PolygonMesh. These are converted to MeshInstance%s for rendering through Renderer. A
 * TerrainMaterialDef defines the look of the terrain. For example, it defines which textures to
 * apply. The material is named by its name (setMaterial()). The Shader for these materials is
 * implemented in TerrainShader. The TerrainShaderKey selecting the TerrainShader variant to use is
 * constructed based on the requirements from TerrainMaterialDef.
 */
class TerrainMeshRenderer : public Graphic {
    Q_OBJECT

    /**
     * @brief Name of the TerrainMaterialDef to apply to this terrain mesh.
     *
     * Corresponds to the name of a TerrainMaterialDef stored in the global TerrainMaterials object
     * in Engine (Engine::getTerrainMaterials()).
     */
    Q_PROPERTY(QString material READ getMaterial WRITE setMaterial NOTIFY materialChanged)
    /**
     * @brief PolygonMesh containing vertex data for the base mesh.
     */
    Q_PROPERTY(PolygonMesh* baseMesh READ getBaseMesh WRITE setBaseMesh NOTIFY baseMeshChanged)
    /**
     * @brief PolygonMesh containing vertex data for the edge mesh.
     */
    Q_PROPERTY(PolygonMesh* edgeMesh READ getEdgeMesh WRITE setEdgeMesh NOTIFY edgeMeshChanged)
    /**
     * @brief PolygonMesh containing vertex data for the bevel mesh.
     */
    Q_PROPERTY(PolygonMesh* bevelMesh READ getBevelMesh WRITE setBevelMesh NOTIFY bevelMeshChanged)

public:
    /**
     * @brief Construct a TerrainMeshRenderer.
     * @param parent Parent item
     */
    explicit TerrainMeshRenderer(QQuickItem* parent = nullptr);

    /**
     * @brief Returns #material.
     */
    const QString& getMaterial() const { return mMaterialName; }
    /**
     * @brief Sets the value of #material.
     * @param value QString to set #material to
     */
    void setMaterial(const QString& value);
    /**
     * @brief Returns the value of #baseMesh.
     */
    PolygonMesh* getBaseMesh() const { return mBaseMesh; }
    /**
     * @brief Sets the value of #baseMesh.
     * @param value PolygonMesh pointer to set #baseMesh to
     */
    void setBaseMesh(PolygonMesh* value);
    /**
     * @brief Returns the value of #edgeMesh.
     */
    PolygonMesh* getEdgeMesh() const { return mEdgeMesh; }
    /**
     * @brief Sets the value of #edgeMesh.
     * @param value PolygonMesh pointer to set #edgeMesh to
     */
    void setEdgeMesh(PolygonMesh* value);
    /**
     * @brief Returns the value of #bevelMesh.
     */
    PolygonMesh* getBevelMesh() const { return mBevelMesh; }
    /**
     * @brief Sets the value of #bevelMesh.
     * @param value PolygonMesh pointer to set #bevelMesh to
     */
    void setBevelMesh(PolygonMesh* value);

signals:
    /**
     * @brief Emitted when #material changes.
     */
    void materialChanged();
    /**
     * @brief Emitted when #baseMesh changes.
     */
    void baseMeshChanged();
    /**
     * @brief Emitted when #edgeMesh changes.
     */
    void edgeMeshChanged();
    /**
     * @brief Emitted when #bevelMesh changes.
     */
    void bevelMeshChanged();

protected:
    virtual void synchronizeForRendering(RenderList* renderList) override;

private:
    void validate();
    void updateRenderNode(const Matrix4& transform, float zDepth, const MeshInstancePtr& mesh,
            const TerrainShaderPtr& shader, RenderNode* node, RenderList* renderList);
    TerrainShaderPtr createShader(bool hasEdge, bool hasBevel,
            TerrainMaterialDef::BlendMode blendMode);
    MeshInstancePtr createRenderMesh(PolygonMesh* mesh, const TerrainShaderPtr& shader);

    QString mMaterialName;
    bool mInvalidated = true;
    PolygonMesh* mBaseMesh = nullptr;
    PolygonMesh* mEdgeMesh = nullptr;
    PolygonMesh* mBevelMesh = nullptr;
    MeshInstancePtr mBaseRenderMesh;
    MeshInstancePtr mEdgeRenderMesh;
    MeshInstancePtr mBevelRenderMesh;
    TerrainShaderPtr mBaseShader;
    TerrainShaderPtr mEdgeShader;
    TerrainShaderPtr mBevelShader;
    RenderNode mBaseRenderNode;
    RenderNode mEdgeRenderNode;
    RenderNode mBevelRenderNode;
    QPointF mRenderPos;
    float mRenderRotation = 0.0f;
};
Q_DECLARE_METATYPE(TerrainMeshRenderer*)

#endif // TERRAINMESHRENDERER_H
