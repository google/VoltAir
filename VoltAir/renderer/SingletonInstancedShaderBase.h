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

#ifndef SINGLETONINSTANCEDSHADERBASE_H
#define SINGLETONINSTANCEDSHADERBASE_H

#include "RendererCommon.h"
#include "InstancedShaderBase.h"

/**
 * @ingroup Renderer
 * @brief A helper to define singletons for InstancedShader%s.
 *
 * While treating an instanced shader as a singleton means that you can no longer create instances
 * of that shader, it benefits from being able to use some extra functionality from InstancedShader
 * and InstancedShaderBase.
 */
template<typename TShaderImpl>
class SingletonInstancedShaderBase : public InstancedShaderBase<TShaderImpl> {
public:
    /**
     * @brief Helper typedef for a shared pointer to a @c TShaderImpl.
     */
    typedef std::shared_ptr<TShaderImpl> TShaderImplPtr;
    /**
     * @brief Helper typedef for a weak shared pointer to a @c TShaderImpl.
     */
    typedef std::weak_ptr<TShaderImpl> TShaderImplWeakPtr;

    /**
     * @brief Returns the singleton instance of this shader, creating it if necessary.
     */
    static TShaderImplPtr getInstance() {
        // To avoid static shared pointers and initialization issues, make this a raw pointer to a
        // shared pointer.
        // Note: It never gets deleted, similarly with our other singletons.
        static TShaderImplPtr* sInstance = nullptr;
        if (!sInstance) {
            sInstance = new TShaderImplPtr(new TShaderImpl());
        }
        return *sInstance;
    }
};

#endif // SINGLETONINSTANCEDSHADERBASE_H
