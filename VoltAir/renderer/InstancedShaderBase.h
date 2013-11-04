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

#ifndef INSTANCEDSHADERBASE_H
#define INSTANCEDSHADERBASE_H

#include "InstancedShader.h"
#include "RendererCommon.h"
#include "ShaderBase.h"

/**
 * @ingroup Renderer
 * @brief Helper class to implement InstancedShader subclasses, by managing a shared Shader.
 *
 * This class creates and manages a shared Shader as a singleton. The singleton Shader is created
 * by a call to createSharedShader, a static method. The default implementation builds the shader
 * using data returned from static methods which must be traits of the subclass @c TShaderImpl.
 * The following traits should exist:
 *
 *   - <tt>std::string TShaderImpl::getVertexShaderCode()</tt>
 *   - <tt>std::string TShaderImpl::getFragmentShaderCode()</tt>
 *   - <tt>AttributeSetPtr TShaderImpl::getAttributeSet()</tt>
 *   - <tt>std::vector<std::string> TShaderImpl::getUniformNames()</tt>
 *
 * Alternatively, the subclass can implement and hide the createSharedShader() static function
 * to manually create a custom shader. The signature should be:
 *
 *   - <tt>ShaderPtr TShaderImpl::createSharedShader()</tt>
 */
template<typename TShaderImpl>
class InstancedShaderBase : public InstancedShader {
public:
    /**
     * @brief Construct this InstancedShader, creating the shared Shader if necessary.
     */
    InstancedShaderBase() : InstancedShader(getSharedShader()) { }

    /**
     * @brief Returns the shared Shader singleton, creating it if necessary.
     *
     * The shared Shader is created through a call to @c TShaderImpl::createSharedShader(). If
     * @c TShaderImpl implements this static method, that implementation will be used. If not,
     * the default implementation in this class will be used.
     */
    static const ShaderPtr& getSharedShader() {
        // To avoid static shared pointers and initialization issues, make this
        // a raw pointer to a shared pointer.
        // Note: It never gets deleted, similarly with our other singletons.
        static ShaderPtr* sSharedShader = nullptr;
        if (!sSharedShader) {
            sSharedShader = new ShaderPtr(TShaderImpl::createSharedShader());
        }
        return *sSharedShader;
    }

protected:
    /**
     * @brief The default implementation of createSharedShader().
     *
     * This method calls static trait methods in @c TShaderImpl to build the shared Shader.
     * @returns A new shader to be used as the shared Shader singleton
     */
    static ShaderPtr createSharedShader() {
        std::string vertexShaderCode(TShaderImpl::getVertexShaderCode());
        std::string fragmentShaderCode(TShaderImpl::getFragmentShaderCode());
        AttributeSetPtr attributeSet(TShaderImpl::getAttributeSet());
        std::vector<std::string> uniformNames(TShaderImpl::getUniformNames());
        ShaderPtr shader = ShaderPtr(new ShaderBase(vertexShaderCode, fragmentShaderCode,
                attributeSet, uniformNames));
        shader->compile();
        return shader;
    }
};

#endif // INSTANCEDSHADERBASE_H
