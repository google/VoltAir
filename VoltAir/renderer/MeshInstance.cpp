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

#include "MeshInstance.h"

MeshInstance::MeshInstance() {
}

MeshInstance::MeshInstance(GLuint mode, const MeshPtr& mesh, const ShaderPtr& shader)
        : mMesh(mesh),
          mShader(shader),
          mMode(mode) {
}

MeshInstance::~MeshInstance() {
}

void MeshInstance::setMode(GLenum value) {
    mMode = value;
}

void MeshInstance::setMesh(const MeshPtr& mesh) {
    if (mMesh == mesh) {
        return;
    }
    mMesh = mesh;
    invalidateAttributes();
}

void MeshInstance::setShader(const ShaderPtr& shader) {
    if (mShader == shader) {
        return;
    }
    mShader = shader;
    invalidateAttributes();
}

// Shader must already be bound.
void MeshInstance::bind() {
    assert(mMesh && mShader);
    if (!checkAttributes()) {
        return;
    }

    mMesh->bind();

    Shader* shader = mShader.get();
    AttributeSet* attributes = mMesh->getAttributes().get();
    int attributeCount = mAttributeIndexes.size();
    for (int i = 0; i < attributeCount; ++i) {
        int attributeIndex = mAttributeIndexes[i];
        if (attributeIndex >= 0) {
            const Attribute& attribute = attributes->attributes[attributeIndex];
            int offset = attributes->attributeOffsets[attributeIndex];
            int location = shader->getAttributeLocation(i);
            glEnableVertexAttribArray(location);
            glVertexAttribPointer(location, attribute.size, attribute.type, attribute.normalized,
                    attributes->vertexStride, (GLvoid*)(long) offset);
        }
    }
}

void MeshInstance::unbind() {
    if (!mMesh || !areAttributesReady()) {
        return;
    }

    mMesh->unbind();

    Shader* shader = mShader.get();
    int attributeCount = mAttributeIndexes.size();
    for (int i = 0; i < attributeCount; ++i) {
        int attributeIndex = mAttributeIndexes[i];
        if (attributeIndex >= 0) {
            int location = shader->getAttributeLocation(i);
            glDisableVertexAttribArray(location);
        }
    }
}

bool MeshInstance::checkAttributes() {
    if (areAttributesReady()) {
        return true;
    }
    if (!mShader->isValid()) {
        return false;
    }
    mAttributesInvalid = false;

    const ShaderPtr& shader = mShader;
    const AttributeSetPtr& shaderAttributes = shader->getAttributes();
    const AttributeSetPtr& attributes = mMesh->getAttributes();
    for (const Attribute& shaderAttribute : shaderAttributes->attributes) {
        const std::string& attributeName = shaderAttribute.name;
        int attributeIndex = -1;
        int attributeCount = attributes->attributes.size();
        for (int j = 0; j < attributeCount; ++j) {
            if (attributeName == attributes->attributes[j].name) {
                attributeIndex = j;
                break;
            }
        }
        mAttributeIndexes.push_back(attributeIndex);
    }
    return true;
}

void MeshInstance::invalidateAttributes() {
    mAttributesInvalid = true;
}

bool MeshInstance::areAttributesReady() const {
    return !mAttributesInvalid;
}

MeshInstancePtr MeshInstance::createCompatibleMesh(int vertexCount, GLenum mode,
        const ShaderPtr& shader) {
    return MeshInstancePtr(new MeshInstance(mode, MeshPtr(new Mesh(vertexCount,
            shader->getAttributes())), shader));
}
