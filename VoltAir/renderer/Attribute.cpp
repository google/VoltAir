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

#include "Attribute.h"

Attribute::Attribute() {
}

Attribute::Attribute(const std::string& name, GLuint size, GLboolean normalized, GLuint type)
        : name(name), size(size), normalized(normalized), type(type) {
}

int Attribute::getComponentSizeStatic(GLuint type) {
    switch (type) {
    // TODO: Expand.
    case GL_INT: return sizeof(GLint);
    case GL_SHORT: return sizeof(GLshort);
    case GL_BYTE: return sizeof(GLbyte);
    case GL_UNSIGNED_INT: return sizeof(GLuint);
    case GL_UNSIGNED_SHORT: return sizeof(GLushort);
    case GL_UNSIGNED_BYTE: return sizeof(GLubyte);
    case GL_FLOAT: return sizeof(GLfloat);
    default: return 0;
    }
}
