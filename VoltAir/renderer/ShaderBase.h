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

#ifndef SHADERBASE_H
#define SHADERBASE_H

#include "AttributeSet.h"
#include "RendererCommon.h"
#include "Shader.h"
#include <assert.h>
#include <string>
#include <vector>

/**
 * @ingroup Renderer
 * @brief Implementation of Shader which compiles itself from shader code.
 *
 * Vertex and fragment shader code is passed to ShaderBase's constructor, along with attributes
 * and uniforms (as expected by the base class, Shader). The shader code is stored, and compiled
 * by a call to compile(), or the first time it is selected by a call to begin().
 *
 * @note This class does not currently restore GL resources on context change.
 */
class ShaderBase : public Shader {
public:
    /**
     * @brief Constructs a ShaderBase with the given code for its vertex and fragment shader.
     *
     * The GLSL shader code provided to this function will be stored for compilation. Compilation is
     * performed by a call to compile(), or the first call to begin().
     * @param vertexShaderCode GLSL vertex shader code
     * @param fragmentShaderCode GLSL fragment shader code
     * @param attributes AttributeSet containing the list of indexed attributes for this shader
     * @param uniformNames List of indexed uniforms
     */
    ShaderBase(const std::string& vertexShaderCode, const std::string& fragmentShaderCode,
            const AttributeSetPtr& attributes, const std::vector<std::string>& uniformNames);
    virtual ~ShaderBase();

    virtual bool isCurrent() const override;
    virtual bool isValid() const override;
    virtual bool isCompiled() const override;
    virtual GLuint getProgramId() const override;

    /**
     * @brief Binds this shader, compiling if necessary.
     */
    virtual void begin() override;
    virtual void end() override;
    /**
     * @brief Compiles this Shader's GLSL code and links it into a GL program.
     *
     * This method is automatically called by begin() as necessary. After the first compile attempt,
     * isCompiled() returns @c true and isValid() will return whether compilation and linking was
     * successful. Subsequent calls to compile() have no effect.
     */
    virtual void compile() override;
    virtual std::string getErrorLog() const override;
    /**
     * @brief Destroys GL resources that were allocated for this ShaderBase.
     */
    void dispose();

    virtual int getAttributeLocation(int index) const override;
    virtual int getUniformLocation(int index) const override;

protected:
    /**
     * @brief Compiles and initializes the GL shader program from shader code.
     * @note This method is virtual and can be overriden by subclasses to perform additional
     * initialization on compilation.
     */
    virtual void performCompile();

private:
    void checkCompile();
    void compileCode();
    void bindLocations();

    bool mCurrentShader = false;
    bool mValid = false;
    bool mCompiled = false;
    bool mProgramCreated = false;
    GLuint mProgramId = 0;
    bool mVertexShaderCreated = false;
    GLuint mVertexShaderId = 0;
    bool mFragmentShaderCreated = false;
    GLuint mFragmentShaderId = 0;
    std::string mVertexShaderCode;
    std::string mFragmentShaderCode;
    std::vector<int> mAttributeLocations;
    std::vector<int> mUniformLocations;
};

#endif // SHADERBASE_H
