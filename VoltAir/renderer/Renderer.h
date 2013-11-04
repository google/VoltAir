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

#ifndef RENDERER_H
#define RENDERER_H

#include "MeshInstance.h"
#include "RendererCommon.h"
#include "RenderNode.h"
#include "Shader.h"
#include "Texture.h"

/**
 * @ingroup Renderer
 * @brief Class managing GL state switches and draw calls.
 *
 * This class stores currently selected Texture%s, MeshInstance, and Shader. The @c select family of
 * methods switches these currently selected objects (for example, selectShader()). These internally
 * call @c bind() and @c unbind() (or @c begin() and @c end()) methods as necessary. The @c draw
 * family of methods in this class (for example drawMesh()) in turn use these @c select methods to
 * set up state, and then issue GL draw calls to perform rendering.
 *
 * This class also provides functionality to render basic rectangular sprites. This is done through
 * drawSprite(). Drawing done through this method will be transformed by the current projection
 * matrix (setProjectionMatrix()). Sprites are rendered using SpriteShader. Drawing done through
 * drawMesh() must be transformed manually in the user's Shader.
 *
 * To interleave rendering performed by this class and other renderers, call flush(). This deselects
 * all objects managed by this class putting GL into a clean state.
 *
 * This class also creates and provides a DebugRenderer object which can be used to quickly
 * implement debug shape rendering.
 * @see Shader
 * @see MeshInstance
 * @see Texture
 */
class Renderer {
public:
    Renderer();
    ~Renderer();

    /**
     * @brief Signal the Renderer that the frame has begun.
     *
     * This initializes any internal GL resources if necessary.
     */
    void begin();
    /**
     * @brief Signals that rendering this frame should end.
     *
     * This flushes any draw calls and selected objects. This method does not flush the
     * DebugRenderer.
     */
    void end();
    /**
     * @brief Returns the projection matrix that will be used when rendering sprites.
     */
    const Matrix4& getProjectionMatrix() const { return mProjectionMatrix; }
    /**
     * @brief Sets the projection matrix that will be used when rendering sprites.
     * @param matrix Matrix to set
     */
    void setProjectionMatrix(const Matrix4& matrix);

    /**
     * @brief Draws a rectangular quadrilateral, textured with a Texture.
     *
     * The destination rectangle is in world coordinates and gets rotated by @p rotation and then
     * the Renderer's projection matrix. The source rectangle specifies which part of the source
     * @p texture gets mapped on to the destination rectangle. The source rectangle is in GL texture
     * coordinate space (<tt>(0.0f, 0.0f)</tt> is lower left).
     *
     * These are rendered using SpriteShader.
     * @param texture Texture to draw
     * @param pos Position of the destination rectangle
     * @param width Width of the destination rectangle
     * @param height Height of the destination rectangle
     * @param srcPos Offset of the source rectangle in the source Texture
     * @param srcWidth Width of the source rectangle in the source Texture
     * @param srcHeight Height of the source rectangle in the source Texture
     * @param rotation Rendered sprite rotation in radians
     * @param opacity Rendered sprite transparency, in the range <tt>[0.0f, 1.0f]</tt>
     */
    void drawSprite(const TexturePtr& texture, const Vector2& pos, float width, float height,
            const Vector2& srcPos, float srcWidth, float srcHeight, float rotation, float opacity);
    /**
     * @brief Draw a MeshInstance with a given Shader.
     *
     * The Shader and MeshInstance are bound. The Mesh vertices are then drawn with the set GL
     * primitive type (see MeshInstance::setMode()). If the given Shader does not exactly match the
     * current Shader in the MeshInstance, rendering will still behave correctly if the two
     * Shader%s' AttributeSet%s are equivalent.
     * @param meshInstance Mesh to draw
     * @param shader Shader to draw the @p mesh with
     */
    void drawMesh(const MeshInstancePtr& meshInstance, const ShaderPtr& shader);
    /**
     * @brief Flush GL draw calls and state, and deselect objects.
     *
     * This can be called to signal that GL calls will be issued by code other than this Renderer.
     * It is automatically called by end().
     */
    void flush();

    /**
     * @brief Selects and binds a Texture to a texture @p stage.
     *
     * If @p texture is the current Texture, this method performs no work. If @p texture is
     * @c nullptr this call is equivalent to clearing the current texture for that stage.
     * @param texture Texture to select
     * @param stage %Texture stage to bind the Texture to
     */
    void selectTexture(const TexturePtr& texture, int stage);
    /**
     * @brief Selects and binds a MeshInstance.
     *
     * If @p meshInstance is the current MeshInstance, this method performs no work. If
     * @p meshInstance is @c nullptr this call is equivalent to clearing the current mesh instance.
     * @param meshInstance MeshInstance to select
     */
    void selectMesh(const MeshInstancePtr& meshInstance);
    /**
     * @brief Selects a Shader as current.
     *
     * If @p shader is the current Shader, this method performs no work. If @p shader is @c nullptr
     * this call is equivalent to clearing the current Shader.
     * @param shader Shader to select
     */
    void selectShader(const ShaderPtr& shader);
    /**
     * @brief Unbinds and clears the Texture at the given stage.
     * @param stage texture stage to clear
     */
    void clearTexture(int stage);
    /**
     * @brief Clears all texture stages.
     */
    void clearTextures();
    /**
     * @brief Unbinds and clears the current MeshInstance.
     */
    void clearMesh();
    /**
     * @brief Unbinds and clears the current Shader.
     */
    void clearShader();

    /**
     * @brief Returns the DebugRenderer managed by this Renderer.
     */
    DebugRenderer* getDebugRenderer() const { return mDebugRenderer.get(); }

    /**
     * @brief Prefixes the given shader @p code with code that normalizes shaders across some
     * platforms.
     *
     * For example, some versions of desktop OpenGL do not have or have reserved the precision
     * specifiers highp, mediump, and lowp.
     * @param code Shader code to adjust
     * @returns Adjusted shader code
     */
    static std::string addCompatibilityPrefixToShaderCode(const char* code);

    /**
     * @brief Sets this Renderer as current, allowing it to be retrieved by getCurrent().
     *
     * The Renderer should be set as current before rendering RenderLists and RenderNodes.
     */
    void attachAsCurrent();
    /**
     * @brief Unsets this Renderer as current.
     */
    void detachAsCurrent();
    /**
     * @brief Unsets the current Renderer, if any.
     */
    static void detachCurrent();
    /**
     * @brief Returns the Renderer that was set as current through a call to attachAsCurrent().
     * @returns Current attached Renderer
     */
    static Renderer* getCurrent();
private:
    void init();

    std::vector<TexturePtr> mCurrentTextures;
    MeshInstancePtr mCurrentMeshInstance;
    ShaderPtr mCurrentShader;

    bool mInitialized = false;
    Matrix4 mProjectionMatrix = {
            1.0f, 0.0f, 0.0f, 0.0f,
            0.0f, 1.0f, 0.0f, 0.0f,
            0.0f, 0.0f, 1.0f, 0.0f,
            0.0f, 0.0f, 0.0f, 1.0f };
    MeshInstancePtr mSquareMesh;

    std::unique_ptr<DebugRenderer> mDebugRenderer;

    // TODO: This could be made thread local. C++11 thread_local is not yet supported on many
    // platforms.
    static Renderer* sCurrent;
    static const char* SHADER_COMPATIBILITY_PREFIX;
};

#endif // RENDERER_H
