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

#ifndef SHADER_H
#define SHADER_H

#include "AttributeSet.h"
#include "RendererCommon.h"
#include <assert.h>
#include <string>
#include <vector>

/**
 * @ingroup Renderer
 * @brief Shader program abstract base class.
 *
 * This class is a wrapper around a GL program, with the added concept of indexed attributes and
 * uniforms. Indexed attributes and uniforms allow attributes and uniforms to be referenced by
 * index, rather than name, for efficient lookups. The index of an attribute or uniform is
 * determined by its index into the list of attributes and uniforms passed into Shader's
 * constructor. For example, if you provide the list of uniforms, <tt>"color", "offset",
 * "direction"</tt>, the uniform @c color would have index 0, @c offset index 1, and @c direction
 * index 2. These indices can be provided to functions like getAttributeLocation(),
 * getUniformLocation(), and the @c setIndexed family of functions such as
 * setIndexedUniformMatrix4f().
 *
 * See InstancedShader for the details on how to use the @c setIndexed family of methods to
 * implement an instanced shader.
 *
 * Shader%s can either be used on their own as wrappers around GL programs and managers of their
 * state or in conjunction with Renderer. If used with Renderer, begin() and end() will be called as
 * needed when selected.
 */
class Shader {
public:
    /**
     * @brief Construct a Shader with the given list of attributes and uniforms.
     * @param attributes AttributeSet containing the list of indexed attributes for this shader
     * @param uniformNames List of indexed uniforms
     */
    Shader(const AttributeSetPtr& attributes, const std::vector<std::string>& uniformNames);
    virtual ~Shader();

    /**
     * @brief Returns whether or not this shader is bound.
     */
    virtual bool isCurrent() const = 0;
    /**
     * @brief Returns whether or not this shader is valid (compiled and linked) and can be used for
     * rendering.
     */
    virtual bool isValid() const = 0;
    /**
     * @brief Returns whether or not this shader has been processed for compilation.
     *
     * @note This does not indicate whether compilation succeeded. To test for success, use
     * isValid().
     */
    virtual bool isCompiled() const = 0;
    /**
     * @brief Returns the GL program id for this shader.
     */
    virtual GLuint getProgramId() const = 0;

    /**
     * @brief Binds this shader, updating state as necessary.
     */
    virtual void begin() = 0;
    /**
     * @brief Unbinds this shader if bound by a corresponding call to begin().
     */
    virtual void end() = 0;
    /**
     * @brief Compiles this shader, if not already compiled.
     */
    virtual void compile() = 0;
    /**
     * @brief Retrieves the string describing compilation errors, if the call to compile() failed
     * and isValid() is @c false.
     * @return String describing compilation errors
     */
    virtual std::string getErrorLog() const = 0;

    /**
     * @brief Returns the list of indexed Attribute%s for this shader, as an AttributeSet.
     */
    const AttributeSetPtr& getAttributes() const { return mAttributes; }
    /**
     * @brief Returns the list of indexed uniforms.
     */
    const std::vector<std::string>& getUniformNames() const { return mUniformNames; }
    /**
     * @brief Returns the location of an indexed Attribute.
     *
     * Indexed attributes are those that are named in the AttributeSet provided to the shader's
     * constructor.
     *
     * @param index Index into the list of attributes
     */
    virtual int getAttributeLocation(int index) const = 0;
    /**
     * @brief Returns the location of an indexed uniform.
     *
     * Indexed uniforms are those that are named in the list of uniforms provided to the shader's
     * constructor.
     *
     * @param index Index into the list of uniforms
     */
    virtual int getUniformLocation(int index) const = 0;

    // TODO: This list of methods needs to be expanded.
    /**
     * @brief Set the value of a float scalar uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     *
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param value Scalar value to set
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniform1f(int index, bool global, float value, float* stateValue);
    /**
     * @brief Set the value of a 2D float vector uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     *
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param value Vector2 to set
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniform2f(int index, bool global, const Vector2& value, Vector2* stateValue);
    /**
     * @brief Set the value of a 3D float vector uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     *
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param value1 First vector element
     * @param value2 Second vector element
     * @param value3 Third vector element
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniform3f(int index, bool global, float value1, float value2, float value3,
            float* stateValue);
    /**
     * @brief Set the value of a 4D float vector uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     *
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param value1 First vector element
     * @param value2 Second vector element
     * @param value3 Third vector element
     * @param value4 Fourth vector element
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniform4f(int index, bool global, float value1, float value2, float value3,
            float value4, float* stateValue);
    /**
     * @brief Set the value of an integer scalar uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param value Scalar value to set
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniform1i(int index, bool global, int value, int* stateValue);
    /**
     * @brief Set the value of a 4x4 float matrix uniform at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     * @note This method currently differs from @c glUniformMatrix4fv() in that only one matrix,
     * not an array of matrices, can be uploaded.
     * @param index Index of the uniform to set
     * @param global Whether or not this uniform is global and should be set even if the shader is
     * not bound
     * @param transpose Whether or not to upload this matrix transposed
     * @param value Matrix to set
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedUniformMatrix4f(int index, bool global, bool transpose, const Matrix4& value,
            Matrix4* stateValue);

private:
    AttributeSetPtr mAttributes;
    std::vector<std::string> mUniformNames;
};

#endif // SHADER_H
