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

#ifndef ATTRIBUTE_H
#define ATTRIBUTE_H

#include "RendererCommon.h"
#include <string>

/**
 * @ingroup Renderer
 * @brief The definition of a vertex attribute, such as a position vector, or a texture coordinate.
 *
 * Vertex attributes are defined by their name, and the type of data they contain. For example, 2D
 * texture coordinates are float vectors of width two. Attributes are associated with shaders and
 * meshes. They determine how the data in a mesh should be read by the shader.
 */
struct Attribute {
    /**
     * @brief Name of the attribute, as specified in the shader code.
     */
    std::string name;
    /**
     * @brief Number of components per vertex attribute.
     */
    GLuint size = 0;
    /**
     * @brief Specifies whether certain types should be normalized before accessed by shaders.
     */
    GLboolean normalized = GL_FALSE;
    /**
     * @brief GL type of each component in the array.
     */
    GLuint type = GL_FLOAT;

    /**
     * @brief Constructor creating an empty attribute definition.
     */
    Attribute();
    /**
     * @brief Constructor creating an attribute with the properties.
     * @param name Name of the attribute
     * @param size Number of components per vertex attribute
     * @param normalized Specifies whether certain types should be normalized before accessed
     * @param type GL type of each component in the array
     */
    Attribute(const std::string& name, GLuint size, GLboolean normalized, GLuint type);

    /**
     * @brief Computes the number of bytes per component.
     * @returns Number of bytes per component
     */
    int getComponentSize() const {
        return getComponentSizeStatic(type);
    }

    /**
     * @brief Computes the number of bytes per component for a given GL type.
     * @param type GL type to get the size of
     * @returns Number of bytes per component
     */
    static int getComponentSizeStatic(GLuint type);
};

#endif // ATTRIBUTE_H
