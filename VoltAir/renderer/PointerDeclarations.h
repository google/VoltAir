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

#ifndef POINTERDECLARATIONS_H
#define POINTERDECLARATIONS_H

#include <memory>

/**
 * @ingroup Renderer
 * @file PointerDeclarations.h
 * @brief File containing forward declarations for renderer types and smart pointers.
 *
 * The convention used for smart pointer typedefs is to prefix @c std::shared_ptr types with @c Ptr,
 * and @c std::weak_ptr types with @c WeakPtr.
 */

struct Attribute;
template<typename T> class AttributeArray;
struct AttributeSet;
class DebugRenderer;
class DirectTexture;
class InstancedShader;
template<typename TShaderImpl> class InstancedShaderBase;
class Mesh;
class MeshInstance;
class RenderList;
struct RenderNode;
class Renderer;
class Shader;
class ShaderBase;
template<typename TShaderImpl> class SingletonInstancedShaderBase;
class SpriteShader;
class Texture;

/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for Attribute.
 */
typedef std::shared_ptr<Attribute> AttributePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for Attribute.
 */
typedef std::weak_ptr<Attribute> AttributeWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for AttributeSet.
 */
typedef std::shared_ptr<AttributeSet> AttributeSetPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for AttributeSet.
 */
typedef std::weak_ptr<AttributeSet> AttributeSetWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for DebugRenderer.
 */
typedef std::shared_ptr<DebugRenderer> DebugRendererPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for DebugRenderer.
 */
typedef std::weak_ptr<DebugRenderer> DebugRendererWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for DirectTexture.
 */
typedef std::shared_ptr<DirectTexture> DirectTexturePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for DirectTexture.
 */
typedef std::weak_ptr<DirectTexture> DirectTextureWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for InstancedShader.
 */
typedef std::shared_ptr<InstancedShader> InstancedShaderPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for InstancedShader.
 */
typedef std::weak_ptr<InstancedShader> InstancedShaderWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for Mesh.
 */
typedef std::shared_ptr<Mesh> MeshPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for Mesh.
 */
typedef std::weak_ptr<Mesh> MeshWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for MeshInstance.
 */
typedef std::shared_ptr<MeshInstance> MeshInstancePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for MeshInstance.
 */
typedef std::weak_ptr<MeshInstance> MeshInstanceWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for RenderList.
 */
typedef std::shared_ptr<RenderList> RenderListPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for RenderList.
 */
typedef std::weak_ptr<RenderList> RenderListWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for RenderNode.
 */
typedef std::shared_ptr<RenderNode> RenderNodePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for RenderNode.
 */
typedef std::weak_ptr<RenderNode> RenderNodeWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for Shader.
 */
typedef std::shared_ptr<Shader> ShaderPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for Shader.
 */
typedef std::weak_ptr<Shader> ShaderWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for ShaderBase.
 */
typedef std::shared_ptr<ShaderBase> ShaderBasePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for ShaderBase.
 */
typedef std::weak_ptr<ShaderBase> ShaderBaseWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for SpriteShader.
 */
typedef std::shared_ptr<SpriteShader> SpriteShaderPtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for SpriteShader.
 */
typedef std::weak_ptr<SpriteShader> SpriteShaderWeakPtr;
/**
 * @ingroup Renderer
 * @brief Shared pointer typedef for Texture.
 */
typedef std::shared_ptr<Texture> TexturePtr;
/**
 * @ingroup Renderer
 * @brief Weak shared pointer typedef for Texture.
 */
typedef std::weak_ptr<Texture> TextureWeakPtr;

#endif // POINTERDECLARATIONS_H
