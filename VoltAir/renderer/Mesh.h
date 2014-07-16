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

#ifndef MESH_H
#define MESH_H

#include "Attribute.h"
#include "AttributeArray.h"
#include "AttributeSet.h"
#include "RendererCommon.h"

/**
 * @ingroup Renderer
 * @brief Mesh composed of vertices, and attributes for each vertex.
 *
 * This class manages a GL buffer object, which is used to store vertex data. This data can be
 * bound and read as inputs to Shader vertex attributes. MeshInstance is used to store the mapping
 * between a particular Mesh and Shader pair. Data is uploaded as a GL_STATIC_DRAW GL_ARRAY_BUFFER
 * object. Indexed primitives are currently not supported.
 *
 * @note This class does not currently restore GL resources on context change.
 */
class Mesh {
public:
    /**
     * @brief Construct a mesh with the given vertex attributes and vertex count.
     *
     * The vertex buffer is allocated and managed by this object using a call to allocateBuffer().
     * This buffer, and any GL resources are freed when this Mesh is destroyed. A custom buffer can
     * be provided using setBuffer(). This frees the managed buffer and treats the provided buffer
     * as this Mesh's vertex data.
     *
     * @param vertexCount Number of vertices to allocate
     * @param attributes Attribute%s to store for each vertex
     */
    Mesh(int vertexCount, const AttributeSetPtr& attributes);
    ~Mesh();

    /**
     * @brief Returns the length of the current vertex buffer, in number of vertices.
     */
    int getVertexCount() const { return mVertexCount; }

    /**
     * @brief Bind this vertex buffer, uploading it if necessary.
     */
    void bind();
    /**
     * @brief Unbinds this vertex buffer.
     */
    void unbind();
    /**
     * @brief Uploads the current vertex buffer's data into a GL buffer object.
     *
     * If no GL buffer object has been allocated, a new one is created.
     */
    void upload();
    /**
     * @brief Frees this Mesh's managed buffer, and GL buffer object, if allocated.
     */
    void dispose();
    /**
     * @brief Returns whether or not an associated GL buffer object exists and contains uploaded
     * data.
     *
     * @note This method does not indicate if the data that was uploaded is up to date.
     */
    bool isUploaded() const { return mBufferValid; }

    /**
     * @brief Returns the list of vertex Attribute%s as an AttributeSet.
     */
    const AttributeSetPtr& getAttributes() const { return mAttributes; }
    /**
     * @brief Returns whether or not vertices in this Mesh have an Attribute of the given @p name.
     * @param name Name of the Attribute to check
     */
    bool hasAttributeArray(const char* name) const;
    /**
     * @brief Returns the Attribute definition with the given @p name, or an empty Attribute if
     * it does not exist.
     * @param name Name of the Attribute to get
     */
    const Attribute& getAttribute(const char* name) const;
    /**
     * @brief Returns the index of the Attribute with the given name.
     * @param name Name of the Attribute to get
     * @returns Index of the given Attribute, or -1 if it was not found
     */
    int findAttributeIndex(const char* name) const;
    /**
     * @brief Returns a raw pointer to the current vertex buffer.
     */
    void* getBuffer() const { return mBuffer; }
    /**
     * @brief Sets the current vertex buffer to be a user managed buffer.
     *
     * This frees the Mesh managed buffer if allocated. This method also resets the number of
     * vertices to draw to the total vertex count using setDrawVertexCount().
     *
     * @param buffer Pointer to the user managed buffer
     * @param vertexCount Number of vertices in the buffer
     */
    void setBuffer(void* buffer, int vertexCount);
    /**
     * @brief Sets the current buffer to be a Mesh managed buffer.
     *
     * The old Mesh managed buffer is freed if allocated, and a new one created. This method also
     * resets the number of vertices to draw to the total vertex count using setDrawVertexCount().
     *
     * @param vertexCount Number of vertices to allocate
     */
    void allocateBuffer(int vertexCount);
    /**
     * @brief Returns the number of vertices that will be drawn when this Mesh is rendered.
     * @see setDrawVertexCount()
     */
    int getDrawVertexCount() const { return mDrawVertexCount; }
    /**
     * @brief Sets the number of vertices to draw when this Mesh is rendered.
     *
     * This number must be less than or equal to the total number of vertices in the buffer. This
     * method allows the user to preallocate a buffer of some length, and then using it as a
     * variable length buffer up to that maximum length.
     *
     * @param drawVertexCount Number of vertices to draw
     */
    void setDrawVertexCount(int drawVertexCount);

    /**
     * @brief Returns the values of the vertex Attribute with the given name as an AttributeArray.
     *
     * The data is returned as an iterable AttributeArray of the given type @c T. This allows the
     * attribute values for all vertices to be treated as an array, without worrying about vertex
     * stride.
     *
     * @note If the Attribute was not found, the returned AttributeArray will be invalid, and its
     * AttributeArray::isValid() method will return @c false.
     * @returns AttributeArray which interprets the vertex Attribute as the given type @c T
     */
    template<typename T> const AttributeArray<T> getAttributeArray(const char* name) const {
        return getAttributeGenericArray(name).getAsType<T>();
    }
    /**
     * @brief Returns the values of the vertex Attribute with the given name as a mutable
     * AttributeArray.
     *
     * The data is returned as an iterable AttributeArray of the given type @c T. This allows the
     * attribute values for all vertices to be treated as an array, without worrying about vertex
     * stride. This allows for convenient filling of vertex attributes.
     *
     * @note If the Attribute was not found, the returned AttributeArray will be invalid, and its
     * AttributeArray::isValid() method will return @c false.
     * @returns AttributeArray which interprets the vertex Attribute as the given type @c T
     */
    template<typename T> AttributeArray<T> getAttributeArray(const char* name) {
        return getAttributeGenericArray(name).getAsType<T>();
    }

private:
    void checkUpload();
    void uploadData();
    const AttributeArray<void*> getAttributeGenericArray(const char* name) const;
    AttributeArray<void*> getAttributeGenericArray(const char* name);

    std::unique_ptr<GLbyte> mOwnedBuffer;
    int mVertexCount = 0;
    int mDrawVertexCount = 0;
    bool mBufferValid = false;
    bool mBufferUploaded = false;
    GLuint mBufferId = 0;
    void* mBuffer = nullptr;
    AttributeSetPtr mAttributes;
};

#endif // MESH_H
