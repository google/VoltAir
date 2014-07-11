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

#ifndef PARTICLERENDERERITEM_H
#define PARTICLERENDERERITEM_H

#include <memory>
#include "Graphic.h"
#include "renderer/PointerDeclarations.h"
#include "renderer/RenderNode.h"

struct ParticleRendererItemFboDesc;
class b2ParticleSystem;
struct b2AABB;

/**
 * @ingroup Engine
 * @brief Structure holding the state for shaders used in ParticleRenderItem.
 *
 * Some shaders may use only use a subset of these states.
 */
struct ParticleShaderParams {
    /**
     * @brief Subsection of the frame buffer and viewport which needs to get rendered.
     */
    QRectF updateRegion;
    /**
     * @brief Aspect ratio of the viewport.
     */
    float aspectRatio = 0.0f;
    /**
     * @brief Overall transparency of the rendered effect.
     */
    float alpha = 0.0f;
    /**
     * @brief Amount of zoom relative to a reference zoom amount.
     */
    float zoomFactor = 0.0f;
    /**
     * @brief Width of the highlight produced by the inner bevel effect.
     *
     * 0.0f gives no highlight, and larger values give wider highlights. The width of the highlight
     * approaches a limit non-linearly.
     */
    float highlightWidth = 0.0f;
    /**
     * @brief Transparency of the highlight effect.
     */
    float highlightAlpha = 0.0f;
    /**
     * @brief Base color of the inner shadow effect, which tints colors beneath this effect.
     */
    QColor tintColor;
    /**
     * @brief Offset of the inner shadow in world coordinates.
     */
    QPointF shadowOffset;
    /**
     * @brief Transparency of the inner shadow effect.
     */
    float shadowAlpha = 0.0f;
    /**
     * @brief Color of the shadowed parts of the inner shadow effect.
     */
    QColor shadowColor;
    /**
     * @brief Texture referencing the main FBO.
     */
    TexturePtr texture;
    /**
     * @brief Texture referencing the secondary FBO containing the fake specular lighting.
     */
    TexturePtr specularTexture;
};

/**
 * @brief Graphic which renders LiquidFun particles as blobs with a variety of effects.
 *
 * GL frame buffers are used to render particles offscreen, then blend them into the current scene.
 * The effect contains three components:
 *   1. Highlight around particles
 *   2. Fake specular lighting
 *   3. Inner shadow effect
 *
 * Both (1) and (2) are accomplished using an inner bevel effect. This is implemented in
 * ParticleRendererInnerBevel.fsh. The inner shadow effect is implemented in
 * ParticleRendererInnerShadow.fsh. To render both of these effects, particles are first rendered
 * to an FBO of size #FBO_SIZE. This generates an approximate "height map", with the centers of
 * particles being the highest points, and the edges of particles being lowest points. From that we
 * can then compute edges and gradient vectors used for highlights and fake lighting.
 *
 * For efficiency, these two effects are combined when possible into a single shader. This is
 * implemented in ParticleRendererCombined.fsh, and currently requires the GL extension
 * GL_EXT_shader_framebuffer_fetch.
 *
 * @note Currently particles are rendered to our offscreen frame buffer during the synchronization
 * phase. This means that we lose the benefits of having a render thread for that process.
 */
class ParticleRendererItem : public Graphic, private RenderableInterface {
    Q_OBJECT
public:
    /**
     * @brief Width and height of the main frame buffer object used to render particles to.
     */
    constexpr static const int FBO_SIZE = 1024;
    /**
     * @brief Width and height of the secondary frame buffer object used to render fake specular
     * lighting to.
     */
    constexpr static const int AUX_FBO_SIZE = 384;
    /**
     * @brief Visual size of particles, relative to their physical size.
     *
     * When drawing particles, we overdraw them. That is, the square that represents each particle
     * is significantly bigger than the particle itself. This is to allow smoother transitions
     * between particles, and to prevent unwanted gaps between groups of particles at rest. This
     * constant controls how much overdraw we perform.
     */
    static const float PARTICLE_SCALE;

    virtual ~ParticleRendererItem();

protected:
    /**
     * @brief Implementation of RenderableInterface blending our frame buffers onto the current
     * scene.
     * @param node RenderNode being rendered
     */
    virtual void render(RenderNode* node) override;
    /**
     * @brief Synchronize and queue RenderNode%s for rendering.
     * @note This method currently also renders particles to our FBOs.
     * @param renderList RenderList to add RenderNode%s to
     */
    virtual void synchronizeForRendering(RenderList* renderList) override;

private:
    constexpr static const float NORMAL_ZOOM_FOV = 8.0f;
    constexpr static const int FBO_COUNT = 2;

    void synchronize();
    void renderFboContents();
    void renderParticleSystem(b2ParticleSystem* psystem, float scale, const QRectF& worldCullBounds,
            b2AABB* worldUpdateRegion);
    void createParticleShader();
    static void checkExtensions();

    float mZoomFactor = 0.0f;
    float mAspectRatio = 1.0f;
    bool mUpdateRegionEmpty = false;
    QRectF mUpdateRegion;
    int mFboIds[FBO_COUNT];
    int mFboTextureIds[FBO_COUNT];
    TexturePtr mFboTextures[FBO_COUNT];

    ShaderPtr mParticleShader;
    ShaderPtr mAuxFboSpecularShader;
    MeshInstancePtr mSquareFboToScreenMesh;
    TexturePtr mParticleTexture;
    RenderNode mRenderNode;
    ParticleShaderParams mRenderParams;

    static const ParticleRendererItemFboDesc FBO_DEFINITIONS[];
    // Whether or not the current GPU supports extensions allowing us to use the combined shader
    // rather than multiple stages for performance.
    static bool sParticleRendererUseCombinedShader;
};
Q_DECLARE_METATYPE(ParticleRendererItem*)

#endif // PARTICLERENDERERITEM_H
