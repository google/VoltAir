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

#include "ShaderBase.h"

ShaderBase::ShaderBase(const std::string& vertexShaderCode, const std::string& fragmentShaderCode,
        const AttributeSetPtr& attributes, const std::vector<std::string>& uniformNames)
            : Shader(attributes, uniformNames),
              mVertexShaderCode(vertexShaderCode),
              mFragmentShaderCode(fragmentShaderCode),
              mAttributeLocations(attributes->attributes.size()),
              mUniformLocations(uniformNames.size()) {
}

ShaderBase::~ShaderBase() {
    dispose();
}

bool ShaderBase::isCurrent() const {
    return mCurrentShader;
}

bool ShaderBase::isValid() const {
    return mValid;
}

bool ShaderBase::isCompiled() const {
    return mCompiled;
}

GLuint ShaderBase::getProgramId() const {
    return mProgramId;
}

void ShaderBase::begin() {
    checkCompile();
    if (!isValid()) {
        glUseProgram(0);
        return;
    }
    mCurrentShader = true;
    glUseProgram(mProgramId);
}

void ShaderBase::end() {
    if (!isValid()) {
        return;
    }
    mCurrentShader = false;
}

void ShaderBase::compile() {
    if (isCompiled()) {
        return;
    }
    performCompile();
}

std::string ShaderBase::getErrorLog() const {
    if (!isCompiled() || isValid()) {
        return std::string();
    }

    std::unique_ptr<char> strBuffer;
    std::string logStr;
    int vertexShaderLogLen = 0;
    int fragmentShaderLogLen = 0;
    int programLogLen = 0;

    // Get the vertex shader log.
    glGetShaderiv(mVertexShaderId, GL_INFO_LOG_LENGTH, &vertexShaderLogLen);
    strBuffer.reset(new char[vertexShaderLogLen + 1]);
    glGetShaderInfoLog(mVertexShaderId, vertexShaderLogLen + 1, nullptr, strBuffer.get());
    logStr += strBuffer.get();

    // Get the fragment shader log.
    glGetShaderiv(mFragmentShaderId, GL_INFO_LOG_LENGTH, &fragmentShaderLogLen);
    strBuffer.reset(new char[fragmentShaderLogLen + 1]);
    glGetShaderInfoLog(mFragmentShaderId, fragmentShaderLogLen + 1, nullptr, strBuffer.get());
    logStr += strBuffer.get();

    // Get the program log.
    glGetProgramiv(mProgramId, GL_INFO_LOG_LENGTH, &programLogLen);
    strBuffer.reset(new char[programLogLen + 1]);
    glGetProgramInfoLog(mProgramId, programLogLen + 1, nullptr,strBuffer.get());
    logStr += strBuffer.get();

    return logStr;
}

void ShaderBase::dispose() {
    if (mProgramCreated) {
        glDeleteShader(mProgramId);
        mProgramCreated = false;
        mProgramId = 0;
    }
    if (mVertexShaderCreated) {
        glDeleteShader(mVertexShaderId);
        mVertexShaderCreated = false;
        mVertexShaderId = 0;
    }
    if (mFragmentShaderCreated) {
        glDeleteShader(mFragmentShaderId);
        mFragmentShaderCreated = false;
        mFragmentShaderId = 0;
    }
}

int ShaderBase::getAttributeLocation(int index) const {
    assert(index >= 0 && size_t(index) < mAttributeLocations.size());
    return mAttributeLocations[index];
}

int ShaderBase::getUniformLocation(int index) const {
    assert(index >= 0 && size_t(index) < mUniformLocations.size());
    return mUniformLocations[index];
}

void ShaderBase::performCompile() {
    compileCode();
    bindLocations();
}

void ShaderBase::checkCompile() {
    if (isCompiled()) {
        return;
    }
    performCompile();
}

void ShaderBase::compileCode() {
    mVertexShaderId = glCreateShader(GL_VERTEX_SHADER);
    mVertexShaderCreated = true;
    GLint vertexShaderLengths[] = { GLint(mVertexShaderCode.length()) };
    const GLchar* vertexShaderCodes[] = { mVertexShaderCode.c_str() };
    glShaderSource(mVertexShaderId, 1, vertexShaderCodes, vertexShaderLengths);
    glCompileShader(mVertexShaderId);

    mFragmentShaderId = glCreateShader(GL_FRAGMENT_SHADER);
    mFragmentShaderCreated = true;
    GLint fragmentShaderLengths[] = { GLint(mFragmentShaderCode.length()) };
    const GLchar* fragmentShaderCodes[] = { mFragmentShaderCode.c_str() };
    glShaderSource(mFragmentShaderId, 1, fragmentShaderCodes, fragmentShaderLengths);
    glCompileShader(mFragmentShaderId);


    mProgramId = glCreateProgram();
    mProgramCreated = true;
    glAttachShader(mProgramId, mVertexShaderId);
    glAttachShader(mProgramId, mFragmentShaderId);
    glLinkProgram(mProgramId);

    mCompiled = true;

    GLint status = 0;
    glGetProgramiv(mProgramId, GL_LINK_STATUS, &status);
    mValid = status != 0;
    if (!mValid) {
        printf("ShaderBase failed to compile.");
    }
}

void ShaderBase::bindLocations() {
    mAttributeLocations.clear();
    mUniformLocations.clear();
    const AttributeSetPtr& attributes = getAttributes();
    const int attributeCount = attributes->attributes.size();
    const std::vector<std::string>& uniformNames = getUniformNames();
    const int uniformCount = uniformNames.size();
    mAttributeLocations.resize(attributeCount, -1);
    mUniformLocations.resize(uniformCount, -1);
    if (isValid()) {
        GLuint programId = getProgramId();
        for (int i = 0; i < attributeCount; ++i) {
            int location = glGetAttribLocation(programId, attributes->attributes[i].name.c_str());
            mAttributeLocations[i] = location;
        }
        for (int i = 0; i < uniformCount; ++i) {
            int location = glGetUniformLocation(programId, uniformNames[i].c_str());
            mUniformLocations[i] = location;
        }
    }
}
