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

#include "InstancedShader.h"
#include "Renderer.h"

InstancedShader::InstancedShader(const ShaderPtr& sharedShader)
        : Shader(sharedShader->getAttributes(), sharedShader->getUniformNames()),
          mSharedShader(sharedShader) {
}

InstancedShader::~InstancedShader() {
}

void InstancedShader::begin() {
    assert(mSharedShader && !mCurrentShader);
    if (!mSharedShader || mCurrentShader) {
        return;
    }
    mCurrentShader = true;
    mSharedShader->begin();
    updateState();
}

void InstancedShader::end() {
    assert(mSharedShader && mCurrentShader);
    if (!mSharedShader || !mCurrentShader) {
        return;
    }
    mCurrentShader = false;
    mSharedShader->end();
}

bool InstancedShader::isCurrent() const {
    return mCurrentShader;
}

bool InstancedShader::isValid() const {
    return mSharedShader->isValid();
}

bool InstancedShader::isCompiled() const {
    return mSharedShader->isCompiled();
}

GLuint InstancedShader::getProgramId() const {
    assert(mSharedShader && mSharedShader->isValid());
    return mSharedShader->getProgramId();
}

void InstancedShader::compile() {
    mSharedShader->compile();
}

std::string InstancedShader::getErrorLog() const {
    return mSharedShader->getErrorLog();
}

int InstancedShader::getAttributeLocation(int index) const {
    assert(mSharedShader && mSharedShader->isValid());
    return mSharedShader->getAttributeLocation(index);
}

int InstancedShader::getUniformLocation(int index) const {
    assert(mSharedShader && mSharedShader->isValid());
    return mSharedShader->getUniformLocation(index);
}

void InstancedShader::updateState() {
}

void InstancedShader::setIndexedTexture(int index, int stage, const TexturePtr& value,
        TexturePtr* stateValue) {
    setIndexedUniform1i(index, false, stage, nullptr);
    if (stateValue) {
        *stateValue = value;
    }
    if (!isCurrent()) {
        return;
    }
    Renderer::getCurrent()->selectTexture(value, stage);
}
