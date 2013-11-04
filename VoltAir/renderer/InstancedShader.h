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

#ifndef INSTANCEDSHADER_H
#define INSTANCEDSHADER_H

#include "RendererCommon.h"
#include "Shader.h"
#include "Texture.h"

/**
 * @ingroup Renderer
 * @brief Shader which has instanced values for uniforms and other GL state.
 *
 * All instances of the same shader share the same underlying shader program, but will upload new
 * values for uniforms specific to that instance when selected for rendering. Because each instance
 * stores a copy of its own state, instanced shaders can effectively be used as simple "materials".
 *
 * @note The @c setIndexed family of methods (many inherited from Shader) are helpers to implement
 * subclasses of InstancedShader%s. The value to set is copied into @c stateValue. This should
 * normally be a member variable of the InstancedShader subclass. If the instance is currently
 * bound, the state change then happens immediately. If the instance is not bound, the saved off
 * value will get set during the next call to begin(). This is implemented by the subclass by
 * overriding updateStates() which is called by begin().
 *
 * @note Global uniforms are those that are uninstanced and shared between all instances. These will
 * always be set immediately, regardless of whether or not they are currently bound. They also do
 * not require that their value be saved off to a member variable. An example of a global uniform
 * might be a projection matrix. There might only ever need to be one value for all instances if
 * there is only one camera. An example of an instanced uniform might be color. All instances of the
 * shader would be able to specify their own unique colors.
 */
class InstancedShader : public Shader {
public:
    /**
     * @brief Create an InstancedShader which references a shader Shader.
     * @param sharedShader Shader that is shared among instances, and that will receive specific
     * uniform values when this instance is bound
     */
    explicit InstancedShader(const ShaderPtr& sharedShader);
    virtual ~InstancedShader();

    /**
     * @brief Returns the Shader that is shared among instances.
     */
    const ShaderPtr& getSharedShader() const { return mSharedShader; }

    /**
     * @brief Returns whether or not this instance is bound.
     */
    virtual bool isCurrent() const override;
    /**
     * @brief Returns whether or not this shader is valid (compiled and linked) and can be used for
     * rendering.
     */
    virtual bool isValid() const override;
    /**
     * @brief Returns whether or not this shader has been processed for compilation.
     *
     * @note This does not indicate whether compilation succeeded. To test for success, use
     * isValid().
     */
    virtual bool isCompiled() const override;
    /**
     * @brief Returns the GL program id for this shader.
     */
    virtual GLuint getProgramId() const override;

    /**
     * @brief Binds this shader, and sets uniforms and other GL state associated with this instance.
     *
     * Shader uniforms and GL state are updated through a call to updateState(). Multiple calls to
     * begin have no effect.
     */
    virtual void begin() override;
    /**
     * @brief Unbinds this shader if bound by a corresponding call to begin().
     *
     * If the shader is not currently selected, this call has no effect.
     */
    virtual void end() override;
    /**
     * @brief Compiles this shader, resulting in the compilation of the shared Shader if necessary.
     */
    virtual void compile() override;
    virtual std::string getErrorLog() const override;

    virtual int getAttributeLocation(int index) const override;
    virtual int getUniformLocation(int index) const override;

    /**
     * @brief Set the indexed texture for this instance at the given @p index.
     *
     * See InstancedShader for details on the @c setIndexed family of methods.
     *
     * @param index Index of the indexed texture
     * @param stage Texture stage to bind the texture to
     * @param value Texture to bind
     * @param stateValue Memory to save off state to, or @c nullptr if state should not be saved
     */
    void setIndexedTexture(int index, int stage, const TexturePtr& value, TexturePtr* stateValue);

protected:
    /**
     * @brief Update state in response to this instance getting bound.
     *
     * Implemented by subclasses. Implementers should update state such as uniforms that have values
     * specific to this instance. The @c setIndexed family of methods can be used, with the
     * @c stateValue parameters set to @c nullptr, and the @c value parameter set to the previously
     * saved off value.
     */
    virtual void updateState();

private:
    ShaderPtr mSharedShader;
    bool mCurrentShader = false;
};

#endif // INSTANCEDSHADER_H
