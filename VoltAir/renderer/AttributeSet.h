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

#ifndef ATTRIBUTESET_H
#define ATTRIBUTESET_H

#include "Attribute.h"
#include "RendererCommon.h"
#include <initializer_list>
#include <vector>

/**
 * @ingroup Renderer
 * @brief A list of vertex attributes.
 *
 * Used by shaders and meshes. The attributes of a mesh determine what data it stores in its
 * vertices. The attributes of a shader describe which attributes it reads as inputs.
 *
 * @note This class also stores additional information including the offsets of each attribute.
 * These are computed automatically by the constructors taking lists. To compute these manually,
 * call computeAttributeOffsets().
 */
struct AttributeSet {
    /**
     * @brief List of attribute definitions.
     */
    std::vector<Attribute> attributes;
    /**
     * @brief Number of bytes between vertices.
     *
     * This is computed by computeAttributeOffsets().
     */
    int vertexStride = 0;
    /**
     * @brief Number of bytes from the beginning of a vertex for each attribute.
     *
     * This is computed by computeAttributeOffsets().
     */
    std::vector<int> attributeOffsets;

    /**
     * @brief Constructs an empty attribute set.
     */
    AttributeSet();
    /**
     * @brief Constructs an attribute set from an initializer list.
     *
     * This constructor calls computeAttributeOffsets() to compute this object's metadata.
     * @param list Initializer list containing attributes to add to this set
     */
    explicit AttributeSet(std::initializer_list<Attribute> list);
    /**
     * @brief Constructs an attribute set from a vector of attributes.
     *
     * This constructor calls computeAttributeOffsets() to compute this object's metadata.
     * @param list List of attributes to add to this set
     */
    explicit AttributeSet(const std::vector<Attribute>& list);

    /**
     * @brief Computes and fills in this attribute set's attribute offsets and vertex stride.
     */
    void computeAttributeOffsets();
};

#endif // ATTRIBUTESET_H
