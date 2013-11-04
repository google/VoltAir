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

#include "Mesh.h"
#include <stdlib.h>
#include <string.h>

static const Attribute EMPTY_ATTRIBUTE;

Mesh::Mesh(int vertexCount, const AttributeSetPtr& attributes)
        : mVertexCount(vertexCount),
          mAttributes(attributes) {
    allocateBuffer(vertexCount);
}

Mesh::~Mesh() {
    dispose();
}

void Mesh::bind() {
    checkUpload();
    if (!isUploaded()) {
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        return;
    }
    glBindBuffer(GL_ARRAY_BUFFER, mBufferId);
}

void Mesh::unbind() {
    glBindBuffer(GL_ARRAY_BUFFER, 0);
}

void Mesh::upload() {
    if (!isUploaded()) {
        checkUpload();
    } else {
        uploadData();
    }
}

bool Mesh::hasAttributeArray(const char* name) const {
    return findAttributeIndex(name) >= 0;
}

const Attribute& Mesh::getAttribute(const char* name) const {
    int index = findAttributeIndex(name);
    const AttributeSet* attributes = mAttributes.get();
    return index < 0 ? EMPTY_ATTRIBUTE : attributes->attributes[index];
}

int Mesh::findAttributeIndex(const char* name) const {
    const AttributeSet* const attributes = mAttributes.get();
    if (attributes) {
        int attributeCount = attributes->attributes.size();
        for (int i = 0; i < attributeCount; ++i) {
            const Attribute& attribute = attributes->attributes[i];
            if (strcmp(attribute.name.c_str(), name) == 0) {
                return i;
            }
        }
    }
    return -1;
}

const AttributeArray<void*> Mesh::getAttributeGenericArray(const char* name) const {
    int index = findAttributeIndex(name);
    const AttributeSet* const attributes = mAttributes.get();
    GLbyte* bufferBase = (GLbyte*) mBuffer;
    return index < 0 ? AttributeArray<void*>() : AttributeArray<void*>(
            mVertexCount,
            bufferBase + attributes->attributeOffsets[index],
            attributes->vertexStride,
            &attributes->attributes[index]);
}

AttributeArray<void*> Mesh::getAttributeGenericArray(const char* name) {
    int index = findAttributeIndex(name);
    const AttributeSet* const attributes = mAttributes.get();
    GLbyte* bufferBase = (GLbyte*) mBuffer;
    return index < 0 ? AttributeArray<void*>() : AttributeArray<void*>(
            mVertexCount,
            bufferBase + attributes->attributeOffsets[index],
            attributes->vertexStride,
            &attributes->attributes[index]);
}

void Mesh::setBuffer(void* buffer, int vertexCount) {
    assert(vertexCount >= 0);
    mBuffer = buffer;
    mVertexCount = vertexCount;
    mDrawVertexCount = vertexCount;
    mBufferUploaded = false;
}

void Mesh::allocateBuffer(int vertexCount) {
    assert(vertexCount >= 0);
    mOwnedBuffer.reset(new GLbyte[mAttributes->vertexStride * vertexCount]);
    setBuffer(mOwnedBuffer.get(), vertexCount);
}

void Mesh::setDrawVertexCount(int drawVertexCount) {
    assert(drawVertexCount >= 0 || drawVertexCount <= mVertexCount);
    mDrawVertexCount = std::max(0, std::min(mVertexCount, drawVertexCount));
}

void Mesh::checkUpload() {
    if (!mBufferValid) {
        glGenBuffers(1, &mBufferId);
        mBufferValid = true;
    }
    if (!mBufferUploaded) {
        uploadData();
        mBufferUploaded = true;
    }
}

void Mesh::uploadData() {
    if (!mBufferValid) {
        return;
    }
    glBindBuffer(GL_ARRAY_BUFFER, mBufferId);
    glBufferData(GL_ARRAY_BUFFER, mVertexCount * mAttributes->vertexStride, mBuffer,
            GL_STATIC_DRAW);
}

void Mesh::dispose() {
    if (mBufferValid) {
        glDeleteBuffers(1, &mBufferId);
        mBufferValid = false;
        mBufferId = 0;
    }
    mOwnedBuffer.reset();
    mBuffer = nullptr;
}
