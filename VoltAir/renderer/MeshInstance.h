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

#ifndef MESHINSTANCE_H
#define MESHINSTANCE_H

#include "Mesh.h"
#include "RendererCommon.h"
#include "Shader.h"
#include <vector>

/**
 * @ingroup Renderer
 * @brief Mesh bound to a specific Shader.
 *
 * This class stores the mapping of vertex Attribute%s in a Mesh to vertex Attribute%s in a Shader
 * for efficient binding and rendering.
 *
 * MeshInstance%s can either be used on their own as wrappers around GL buffers or in conjunction
 * with Renderer. If used with Renderer, bind() and unbind() will be called as needed when selected.
 */
class MeshInstance {
public:
    /**
     * @brief Construct an empty MeshInstance.
     */
    MeshInstance();
    /**
     * @brief Construct a MeshInstance which binds the given Mesh to the given Shader.
     * @param mode GL primitive type to draw (i.e. GL_TRIANGLES)
     * @param mesh Mesh to store and read attributes from
     * @param shader Shader to bind the Mesh to
     */
    MeshInstance(GLenum mode, const MeshPtr& mesh, const ShaderPtr& shader);
    ~MeshInstance();

    /**
     * @brief Returns the GL primitive type to draw (i.e. GL_TRIANGLES).
     */
    GLenum getMode() const { return mMode; }
    /**
     * @brief Sets the kind of GL primitive to draw.
     * @param value GL primitive type to draw
     */
    void setMode(GLenum value);
    /**
     * @brief Returns the current Mesh.
     */
    const MeshPtr& getMesh() const { return mMesh; }
    /**
     * @brief Sets the current Mesh, rebinding vertex Attribute locations.
     * @param mesh Mesh to set
     */
    void setMesh(const MeshPtr& mesh);
    /**
     * @brief Returns the current Shader to which the current Mesh is bound to.
     */
    const ShaderPtr& getShader() const { return mShader; }
    /**
     * @brief Sets the current shader, rebinding vertex Attribute locations.
     * @param shader Shader to set
     */
    void setShader(const ShaderPtr& shader);

    /**
     * @brief Binds the Mesh, and its vertex attribute arrays to the attribute locations in this
     * instance's Shader.
     *
     * Attribute locations are computed and cached. The Mesh is bound and uploaded if necessary.
     * Vertex attribute arrays in the Mesh are then enabled and bound in preparation for rendering.
     * @note This method does not bind the associated Shader.
     */
    void bind();
    /**
     * @brief Reverses a call to bind(), unbinding the Mesh and disabling vertex attribute arrays.
     * @note This method does not unbind the associated Shader.
     */
    void unbind();

    /**
     * @brief Creates a Mesh that contains all of the vertex Attribute%s in a given Shader, also
     * creating a MeshInstance that binds the two.
     * @param vertexCount Number of vertices the Mesh will contain
     * @param mode GL primitive type to draw
     * @param shader Shader to read vertex Attribute%s from
     * @returns MeshInstance binding the new Mesh and the given Shader
     */
    static MeshInstancePtr createCompatibleMesh(int vertexCount, GLenum mode,
            const ShaderPtr& shader);
private:
    void invalidateAttributes();
    bool checkAttributes();
    bool areAttributesReady() const;

    MeshPtr mMesh;
    ShaderPtr mShader;
    GLenum mMode = GL_TRIANGLES;
    bool mAttributesInvalid = true;
    std::vector<int> mAttributeIndexes;
};

#endif // MESHINSTANCE_H
