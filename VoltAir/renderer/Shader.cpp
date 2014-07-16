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

#include "Shader.h"
#include <memory.h>

Shader::Shader(const AttributeSetPtr& attributes, const std::vector<std::string>& uniformNames)
            : mAttributes(attributes),
              mUniformNames(uniformNames) {
}

Shader::~Shader() {
}

void Shader::setIndexedUniform1f(int index, bool global, float value, float* stateValue) {
    if (stateValue) {
        *stateValue = value;
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniform1f(getUniformLocation(index), value);
}

void Shader::setIndexedUniform2f(int index, bool global, const Vector2& value,
        Vector2* stateValue) {
    if (stateValue) {
        *stateValue = value;
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniform2f(getUniformLocation(index), value.x, value.y);
}

void Shader::setIndexedUniform3f(int index, bool global, float value1, float value2, float value3,
        float* stateValue) {
    if (stateValue) {
        stateValue[0] = value1;
        stateValue[1] = value2;
        stateValue[2] = value3;
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniform3f(getUniformLocation(index), value1, value2, value3);
}

void Shader::setIndexedUniform4f(int index, bool global, float value1, float value2, float value3,
        float value4, float* stateValue) {
    if (stateValue) {
        stateValue[0] = value1;
        stateValue[1] = value2;
        stateValue[2] = value3;
        stateValue[3] = value4;
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniform4f(getUniformLocation(index), value1, value2, value3, value4);
}

void Shader::setIndexedUniform1i(int index, bool global, int value, int* stateValue) {
    if (stateValue) {
        *stateValue = value;
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniform1i(getUniformLocation(index), value);
}

void Shader::setIndexedUniformMatrix4f(int index, bool global, bool transpose,
        const Matrix4& value, Matrix4* stateValue) {
    if (stateValue) {
        memcpy(*stateValue, value, sizeof(Matrix4));
    }
    if (global) {
        if (!isCurrent()) {
            // Bind our program so we can set it.
            // Note: Doing this is dangerous, so setting global uniforms must be done carefully.
            assert(isValid());
            glUseProgram(getProgramId());
        }
    } else if (!isCurrent()) {
        return;
    }
    glUniformMatrix4fv(getUniformLocation(index), 1, transpose, value);
}
