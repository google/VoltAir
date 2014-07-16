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

#include <Box2D/Box2D.h>
#include <QOpenGLFunctions>
#include <QQuickWindow>
#include "Camera.h"
#include "Engine.h"
#include "ParticleRendererItem.h"
#include "TextureManager.h"
#include "renderer/Attribute.h"
#include "renderer/AttributeSet.h"
#include "renderer/DirectTexture.h"
#include "renderer/RenderList.h"
#include "renderer/Renderer.h"
#include "renderer/ShaderBase.h"
#include "renderer/SingletonInstancedShaderBase.h"
#include "renderer/Texture.h"
#include "utils/GraphicsUtil.h"
#include "utils/Util.h"

/**
 * Definition of an FBO that will get created.
 */
struct ParticleRendererItemFboDesc {
    int size;
    GLenum format;
};

// Fudge factor to align radial guassian ramp texture to particle radius.
const float ParticleRendererItem::PARTICLE_SCALE = 2.0f;

/**
 * Definitions for FBOs that will get created. These are indexed by values in FboIndexes.
 */
const ParticleRendererItemFboDesc ParticleRendererItem::FBO_DEFINITIONS[] = {
    { ParticleRendererItem::FBO_SIZE, GL_RGBA },
    { ParticleRendererItem::AUX_FBO_SIZE, GL_LUMINANCE },
};

namespace {

/**
 * Indexes of FBOs in our arrays. Needs to match FBO_DEFINITIONS.
 */
enum class FboIndexes {
    HEIGHT = 0,
    SPECULAR,
};

/**
 * Indexed attributes for the particle shader.
 */
enum class ParticleShaderAttributes {
    POSITION = 0,
};

/**
 * Indexed uniforms for the particle shader.
 */
enum class ParticleShaderUniforms {
    TRANSFORM = 0,
    POINT_SIZE,
    TEXTURE,
};

/**
 * Indexed attributes for the fake specular shader.
 */
enum class ParticleSpecularShaderAttributes {
    POSITION = 0,
    TEX_COORD,
};

/**
 * Indexed uniforms for the fake specular shader.
 */
enum class ParticleSpecularShaderUniforms {
    TRANSFORM = 0,
    TEX_COORD_TRANSFORM,
    SAMPLE_OFFSET,
    LIGHT_DIR,
    SPECULAR_CENTER_FALLOFF,
    SPECULAR_CENTER_STRENGTH,
    SPECULAR_GLOSS,
    SPECULAR_STRENGTH,
    TEXTURE,
};

static std::string readShaderCodeFromAsset(const char* filePath) {
    return Renderer::addCompatibilityPrefixToShaderCode(
            Util::readFileAsStdString(Util::getPathToAsset(filePath)).c_str());
}

static const Matrix4& toMatrix4(const QMatrix4x4& matrix) {
    return *reinterpret_cast<const Matrix4*>(matrix.data());
}

} // namespace

bool ParticleRendererItem::sParticleRendererUseCombinedShader = false;

/**
 * Helper method which computes the transform matrices which take a normalized square
 * (SQUARE_VERTEX_BUFFER) and shrink it down to only cover the specified update region.
 *
 * The normalized square has two sets of coordinates, positions and texture coordinates. The
 * positions essentially specify where in the destination to write pixels to, and the texture
 * coordinates specify where to read from. When the aspect ratios of the input and output are
 * different, we need to apply a correction to one of them. The viewportAspectRatio parameter does
 * this.
 */
static void computeCopyTransforms(const QRectF& updateRegion, float viewportAspectRatio,
        QMatrix4x4* copyTransform, QMatrix4x4* copyTexCoordTransform);

/**
 * Base class for shaders which render FBOs to the screen. These include the inner bevel and inner
 * shadow shaders.
 *
 * Each of these shaders has a subset of a common set of uniforms. They also all share the same
 * vertex attributes. The base class attempts to bind all of these, and silently ignores the ones
 * that the shader does not have.
 */
template<typename TShaderImpl>
class ParticleFboToScreenShaderBase : public SingletonInstancedShaderBase<TShaderImpl> {
public:
    // This is the list of all uniforms in the bevel and inner shadow shaders. Ones that don't
    // exist are silently ignored. The order must match those returned by getUniformNames().
    enum class Uniforms {
        TRANSFORM = 0,
        TEX_COORD_TRANSFORM,
        ALPHA,
        HIGHLIGHT_WIDTH_FACTOR,
        HIGHLIGHT_ALPHA,
        TINT_COLOR,
        SHADOW_OFFSET,
        SHADOW_ALPHA,
        SHADOW_COLOR,
        TEXTURE,
        SPECULAR_TEXTURE,
    };
    enum class Textures {
        TEXTURE = 0,
        SPECULAR_TEXTURE,
    };

    virtual void begin() override;

    void setGlobalParams(const ParticleShaderParams& params);
private:
    friend class InstancedShaderBase<TShaderImpl>;

    static std::string getVertexShaderCode();
    static std::string getFragmentShaderCode();
    static AttributeSetPtr getAttributeSet();
    static std::vector<std::string> getUniformNames();
};

template<typename TShaderImpl>
void ParticleFboToScreenShaderBase<TShaderImpl>::begin() {
    SingletonInstancedShaderBase<TShaderImpl>::begin();
    if (TShaderImpl::BLEND_ENABLED) {
        glEnable(GL_BLEND);
    } else {
        glDisable(GL_BLEND);
    }
    glBlendFunc(TShaderImpl::BLEND_FUNC_SOURCE_FACTOR, TShaderImpl::BLEND_FUNC_DESTINATION_FACTOR);
}

template<typename TShaderImpl>
void ParticleFboToScreenShaderBase<TShaderImpl>::setGlobalParams(
        const ParticleShaderParams& params) {
    this->setIndexedTexture(int(Textures::TEXTURE), int(Textures::TEXTURE), params.texture,
            nullptr);
    this->setIndexedTexture(int(Uniforms::SPECULAR_TEXTURE), int(Textures::SPECULAR_TEXTURE),
            params.specularTexture, nullptr);

    float zoomFactor = params.zoomFactor;
    this->setIndexedUniform1f(int(Uniforms::ALPHA), true, params.alpha, nullptr);
    this->setIndexedUniform1f(int(Uniforms::HIGHLIGHT_WIDTH_FACTOR), true,
            params.highlightWidth * 8.0f, nullptr);
    this->setIndexedUniform1f(int(Uniforms::HIGHLIGHT_ALPHA), true, params.highlightAlpha, nullptr);
    this->setIndexedUniform4f(int(Uniforms::TINT_COLOR), true, params.tintColor.redF(),
            params.tintColor.greenF(), params.tintColor.blueF(), params.tintColor.alphaF(),
            nullptr);
    this->setIndexedUniform2f(int(Uniforms::SHADOW_OFFSET), true,
            Vector2(params.shadowOffset.x() * zoomFactor, params.shadowOffset.y() * zoomFactor),
            nullptr);
    this->setIndexedUniform1f(int(Uniforms::SHADOW_ALPHA), true, params.shadowAlpha, nullptr);
    this->setIndexedUniform3f(int(Uniforms::SHADOW_COLOR), true, params.shadowColor.redF(),
            params.shadowColor.greenF(), params.shadowColor.blueF(), nullptr);

    // Set our update region.
    const QRectF& updateRegion = params.updateRegion;
    QMatrix4x4 copyTransform;
    QMatrix4x4 copyTexCoordTransform;
    float aspectRatio = params.aspectRatio;
    computeCopyTransforms(updateRegion, aspectRatio, &copyTransform, &copyTexCoordTransform);

    this->setIndexedUniformMatrix4f(int(Uniforms::TRANSFORM), true, false,
            toMatrix4(copyTransform), nullptr);
    this->setIndexedUniformMatrix4f(int(Uniforms::TEX_COORD_TRANSFORM), true, false,
            toMatrix4(copyTexCoordTransform), nullptr);
}

template<typename TShaderImpl>
std::string ParticleFboToScreenShaderBase<TShaderImpl>::getVertexShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(Util::readFileAsStdString(
            Util::getPathToAsset(TShaderImpl::VERTEX_SHADER_PATH)).c_str());
}

template<typename TShaderImpl>
std::string ParticleFboToScreenShaderBase<TShaderImpl>::getFragmentShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(Util::readFileAsStdString(
            Util::getPathToAsset(TShaderImpl::FRAGMENT_SHADER_PATH)).c_str());
}

template<typename TShaderImpl>
AttributeSetPtr ParticleFboToScreenShaderBase<TShaderImpl>::getAttributeSet() {
    return AttributeSetPtr(new AttributeSet({
            { "a_position", 2, false, GL_FLOAT },
            { "a_texCoord", 2, false, GL_FLOAT } }));
}

template<typename TShaderImpl>
std::vector<std::string> ParticleFboToScreenShaderBase<TShaderImpl>::getUniformNames() {
    // List of uniforms, ordered to match enum class Uniforms so they can be referenced by index.
    // TODO: Find a better way to make these associated with enum class Uniforms.
    return {
            "u_transform",
            "u_texCoordTransform",
            "u_alpha",
            "u_highlightWidthFactor",
            "u_highlightAlpha",
            "u_tintColor",
            "u_shadowOffset",
            "u_shadowAlpha",
            "u_shadowColor",
            "s_texture",
            "s_specularTexture" };
}


class ParticleInnerBevelShader : public ParticleFboToScreenShaderBase<ParticleInnerBevelShader> {
private:
    friend class ParticleFboToScreenShaderBase<ParticleInnerBevelShader>;
    constexpr static const bool BLEND_ENABLED = true;
    constexpr static const GLenum BLEND_FUNC_SOURCE_FACTOR = GL_ONE;
    constexpr static const GLenum BLEND_FUNC_DESTINATION_FACTOR = GL_ONE_MINUS_SRC_ALPHA;
    constexpr static const char* VERTEX_SHADER_PATH =
            "Engine/shaders/ParticleRendererFboToScreen.vsh";
    constexpr static const char* FRAGMENT_SHADER_PATH =
            "Engine/shaders/ParticleRendererInnerBevel.fsh";
};

class ParticleInnerShadowShader : public ParticleFboToScreenShaderBase<ParticleInnerShadowShader> {
private:
    friend class ParticleFboToScreenShaderBase<ParticleInnerShadowShader>;
    constexpr static const bool BLEND_ENABLED = true;
    constexpr static const GLenum BLEND_FUNC_SOURCE_FACTOR = GL_DST_COLOR;
    constexpr static const GLenum BLEND_FUNC_DESTINATION_FACTOR = GL_ZERO;
    constexpr static const char* VERTEX_SHADER_PATH =
            "Engine/shaders/ParticleRendererFboToScreen.vsh";
    constexpr static const char* FRAGMENT_SHADER_PATH =
            "Engine/shaders/ParticleRendererInnerShadow.fsh";
};

class ParticleCombinedShader : public ParticleFboToScreenShaderBase<ParticleCombinedShader> {
private:
    friend class ParticleFboToScreenShaderBase<ParticleCombinedShader>;
    constexpr static const bool BLEND_ENABLED = false;
    constexpr static const GLenum BLEND_FUNC_SOURCE_FACTOR = GL_ONE;
    constexpr static const GLenum BLEND_FUNC_DESTINATION_FACTOR = GL_ZERO;
    constexpr static const char* VERTEX_SHADER_PATH =
            "Engine/shaders/ParticleRendererFboToScreen.vsh";
    constexpr static const char* FRAGMENT_SHADER_PATH =
            "Engine/shaders/ParticleRendererCombined.fsh";
};


ParticleRendererItem::~ParticleRendererItem() {
    if (mParticleShader) {
        // TODO: Fix up the rest of the QOpenGLFunctions.
        glDeleteTextures(FBO_COUNT, (GLuint*) mFboTextureIds);
        glDeleteFramebuffers(FBO_COUNT, (GLuint*) mFboIds);
    }
}

void ParticleRendererItem::synchronize() {
    // TODO: If we end up threading rendering, copy contents of Splash2D buffers into our own
    // buffers.
}

void ParticleRendererItem::renderFboContents() {
    b2World* world = Engine::getInstance()->getWorld();
    if (!world) {
        return;
    }

    createParticleShader();
    QOpenGLFunctions* glFuncs = GraphicsUtil::getOpenGLFunctions();

    // Select our main framebuffer.
    glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, mFboIds[int(FboIndexes::HEIGHT)]);
    glViewport(0, 0, FBO_SIZE, FBO_SIZE);
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT);

    // Only use whatever portion of our FBO matches our window's aspect ratio, to keep particles
    // square.
    // TODO: Like the original renderer, this doesn't work for windows which are taller than wide.
    Camera* camera = Engine::getInstance()->getCamera();
    float windowWidth = window()->width();
    float windowHeight = window()->height();
    float invAspectRatio = windowHeight / windowWidth;
    float aspectRatio = windowWidth / windowHeight;
    float scaleX = 1.0f;
    float scaleY = invAspectRatio;
    float aspectCorrection = 1.0f - invAspectRatio;
    mAspectRatio = aspectRatio;

    QMatrix4x4 viewTransform = camera->getOpenGLViewMatrix();
    QMatrix4x4 transform = viewTransform;
    QRectF worldCullBounds = camera->getWorldCullBounds();
    transform.scale(QVector3D(scaleX, scaleY, 1.0f));
    // Also scale y translation.
    transform.data()[3 * 4 + 1] *= scaleY;

    mParticleShader->begin();
    glActiveTexture(GL_TEXTURE0);
    mParticleTexture->bind();
    mParticleShader->setIndexedUniformMatrix4f(int(ParticleShaderUniforms::TRANSFORM),
            false, false, toMatrix4(transform), nullptr);
    mParticleShader->setIndexedUniform1i(int(ParticleShaderUniforms::TEXTURE),
            false, 0, nullptr);

    glEnable(GL_BLEND);
#if !defined(Q_OS_ANDROID)
    glEnable(GL_POINT_SPRITE);
    glEnable(GL_VERTEX_PROGRAM_POINT_SIZE);
#endif

    glFuncs->glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE, GL_ONE, GL_ONE);
    glFuncs->glEnableVertexAttribArray(mParticleShader->getAttributeLocation(
            int(ParticleShaderAttributes::POSITION)));

    // Draw all particles in each particle system.
    float particleScale = FBO_SIZE * fabsf(transform(1, 1));
    b2ParticleSystem* psystem = world->GetParticleSystemList();

    b2AABB worldUpdateRegion = { b2Vec2(FLT_MAX, FLT_MAX), b2Vec2(-FLT_MAX, -FLT_MAX) };
    while (psystem) {
        renderParticleSystem(psystem, particleScale, worldCullBounds, &worldUpdateRegion);
        psystem = psystem->GetNext();
    }

    glFuncs->glDisableVertexAttribArray(mParticleShader->getAttributeLocation(
            int(ParticleShaderAttributes::POSITION)));
    mParticleShader->end();
    mParticleTexture->unbind();

    // Compute our update region, which contains all of the particles on screen.
    // Also adjust for aspect ratio, since our FBOs are square.
    mUpdateRegion = viewTransform.mapRect(QRectF(
            worldUpdateRegion.lowerBound.x, worldUpdateRegion.lowerBound.y,
            worldUpdateRegion.upperBound.x - worldUpdateRegion.lowerBound.x,
            worldUpdateRegion.upperBound.y - worldUpdateRegion.lowerBound.y));
    mUpdateRegion.moveLeft(mUpdateRegion.x() * 0.5f + 0.5f);
    mUpdateRegion.moveTop(mUpdateRegion.y() * 0.5f * invAspectRatio + 0.5f);
    mUpdateRegion.setWidth(mUpdateRegion.width() * 0.5f);
    mUpdateRegion.setHeight(mUpdateRegion.height() * 0.5f * invAspectRatio);
    mUpdateRegion.setLeft(qMax(0.0f, (float) mUpdateRegion.left()));
    mUpdateRegion.setRight(qMin(1.0f, (float) mUpdateRegion.right()));
    mUpdateRegion.setTop(qMax(aspectCorrection * 0.5f, (float) mUpdateRegion.top()));
    mUpdateRegion.setBottom(qMin(1.0f - aspectCorrection * 0.5f, (float) mUpdateRegion.bottom()));

    mUpdateRegionEmpty = mUpdateRegion.left() >= mUpdateRegion.right()
            || mUpdateRegion.top() >= mUpdateRegion.bottom();

    if (mUpdateRegionEmpty) {
        // We have no particles in view.
        // Perform the minimal amount of work possible.
        mUpdateRegion = QRectF();

        // Return GL to its old state.
        glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, 0);
        glViewport(0, 0, windowWidth, windowHeight);
        return;
    }

    glDisable(GL_BLEND);
#if !defined(Q_OS_ANDROID)
    glDisable(GL_POINT_SPRITE);
    glDisable(GL_VERTEX_PROGRAM_POINT_SIZE);
#endif

    // Compute fake specular highlight at downsampled size.
    QMatrix4x4 copyTransform;
    QMatrix4x4 copyTexCoordTransform;
    QRectF updateRegion = mUpdateRegion;

    // Pad our update region so that we clear the pixels around the border. This is so that when we
    // filter, we don't read in stale data.
    float updateRegionPadding = 1.0f / AUX_FBO_SIZE;
    updateRegion.adjust(-updateRegionPadding, -updateRegionPadding, updateRegionPadding * 2.0f,
            updateRegionPadding * 2.0f);
    computeCopyTransforms(updateRegion, 1.0f, &copyTransform, &copyTexCoordTransform);

    mAuxFboSpecularShader->begin();
    mSquareFboToScreenMesh->bind();

    mAuxFboSpecularShader->setIndexedUniformMatrix4f(
            int(ParticleSpecularShaderUniforms::TRANSFORM), false, false, toMatrix4(copyTransform),
            nullptr);
    mAuxFboSpecularShader->setIndexedUniformMatrix4f(
            int(ParticleSpecularShaderUniforms::TEX_COORD_TRANSFORM), false, false,
            toMatrix4(copyTexCoordTransform), nullptr);
    mAuxFboSpecularShader->setIndexedUniform1f(
            int(ParticleSpecularShaderUniforms::SAMPLE_OFFSET), false, 1.0f / AUX_FBO_SIZE,
            nullptr);
    mAuxFboSpecularShader->setIndexedUniform2f(
            int(ParticleSpecularShaderUniforms::LIGHT_DIR), false,
            Vector2(0.70710665f, -0.70710665f), nullptr);
    mAuxFboSpecularShader->setIndexedUniform1f(
            int(ParticleSpecularShaderUniforms::SPECULAR_CENTER_FALLOFF), false, 1.0f - 0.75f,
            nullptr);
    mAuxFboSpecularShader->setIndexedUniform1f(
            int(ParticleSpecularShaderUniforms::SPECULAR_CENTER_STRENGTH), false,
            1.0f + 8.0f * (1.0f - 0.95f), nullptr);
    mAuxFboSpecularShader->setIndexedUniform1f(
            int(ParticleSpecularShaderUniforms::SPECULAR_GLOSS), false, 0.8f, nullptr);
    mAuxFboSpecularShader->setIndexedUniform1f(
            int(ParticleSpecularShaderUniforms::SPECULAR_STRENGTH), false,
            0.765f * (1.0f / (1.0f - 0.8f)), nullptr);
    mAuxFboSpecularShader->setIndexedUniform1i(
            int(ParticleSpecularShaderUniforms::TEXTURE), false, 0, nullptr);

    glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, mFboIds[int(FboIndexes::SPECULAR)]);
    glViewport(0, 0, AUX_FBO_SIZE, AUX_FBO_SIZE);
    mFboTextures[int(FboIndexes::HEIGHT)]->bind();

    // TODO: On forward renderers we should avoid clearing, while on tile-based GPUs we should
    // clear.
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);

    // Return GL to its old state.
    mAuxFboSpecularShader->end();
    mSquareFboToScreenMesh->unbind();
    glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(0, 0, windowWidth, windowHeight);
}

void ParticleRendererItem::renderParticleSystem(b2ParticleSystem* psystem, float scale,
        const QRectF& worldCullBounds, b2AABB* worldUpdateRegion) {
    int particleCount = psystem->GetParticleCount();
    if (particleCount <= 0) {
        return;
    }
    const b2Vec2* positionBuffer = psystem->GetPositionBuffer();

    // Compute our update region.
    b2AABB updateRegion = { b2Vec2(FLT_MAX, FLT_MAX), b2Vec2(-FLT_MAX, -FLT_MAX) };
    for (int i = 0; i < particleCount; i++) {
        const b2Vec2& position = positionBuffer[i];
        if (worldCullBounds.contains(position.x, position.y)) {
            updateRegion.lowerBound.x = qMin(updateRegion.lowerBound.x, position.x);
            updateRegion.upperBound.x = qMax(updateRegion.upperBound.x, position.x);
            updateRegion.lowerBound.y = qMin(updateRegion.lowerBound.y, position.y);
            updateRegion.upperBound.y = qMax(updateRegion.upperBound.y, position.y);
        }
    }

    if (updateRegion.lowerBound.x > updateRegion.upperBound.x ||
            updateRegion.lowerBound.y > updateRegion.upperBound.y) {
        // There are no particles in view.
        return;
    }

    // Resize update region and add to global region.
    float particleSize = psystem->GetRadius();
    float particleWorldSize = PARTICLE_SCALE * particleSize;
    float size = particleWorldSize * scale;
    updateRegion.lowerBound -= b2Vec2(particleWorldSize, particleWorldSize);
    updateRegion.upperBound += b2Vec2(particleWorldSize, particleWorldSize);
    worldUpdateRegion->Combine(updateRegion);

    // Render our particles.
    // We could cull particles outside of our view, but rendering those are cheap, and there aren't
    // that many of them because we freeze off screen particle emitters.
    glVertexAttribPointer(
            mParticleShader->getAttributeLocation(int(ParticleShaderAttributes::POSITION)),
            2,
            GL_FLOAT,
            GL_FALSE,
            mParticleShader->getAttributes()->vertexStride,
            positionBuffer);
    mParticleShader->setIndexedUniform1f(
            int(ParticleShaderUniforms::POINT_SIZE), false, size, nullptr);

    // Draw points.
    glDrawArrays(GL_POINTS, 0, particleCount);
}

void ParticleRendererItem::createParticleShader() {
    if (mParticleShader) {
        return;
    }

    checkExtensions();
    QOpenGLFunctions* glFuncs = GraphicsUtil::getOpenGLFunctions();

    AttributeSetPtr particleAttributes = AttributeSetPtr(new AttributeSet({
            Attribute("a_position", 2, GL_FALSE, GL_FLOAT)}));
    mParticleShader = ShaderPtr(new ShaderBase(
            readShaderCodeFromAsset("Engine/shaders/ParticleRendererParticlePoint.vsh"),
#if defined(Q_OS_MAC)
            // Required on OSX for gl_PointCoord.
            std::string("#version 120\n") +
#endif
            readShaderCodeFromAsset("Engine/shaders/ParticleRendererParticlePoint.fsh"),
            particleAttributes,
            { "u_transform", "u_pointSize", "s_texture" }));
    mParticleShader->compile();

    if (!mParticleShader->isValid()) {
        qDebug() << mParticleShader->getErrorLog().c_str();
    }

    AttributeSetPtr specularAttributes = AttributeSetPtr(new AttributeSet({
            Attribute("a_position", 2, GL_FALSE, GL_FLOAT),
            Attribute("a_texCoord", 2, GL_FALSE, GL_FLOAT)}));
    mAuxFboSpecularShader = ShaderPtr(new ShaderBase(
            readShaderCodeFromAsset("Engine/shaders/ParticleRendererSpecular.vsh"),
            readShaderCodeFromAsset("Engine/shaders/ParticleRendererSpecular.fsh"),
            specularAttributes,
            { "u_transform", "u_texCoordTransform", "u_sampleOffset", "u_lightDir",
                    "u_specularCenterFalloff", "u_specularCenterStrength", "u_specularGloss",
                    "u_specularStrength", "s_texture" }));
    mAuxFboSpecularShader->compile();

    if (!mAuxFboSpecularShader->isValid()) {
        qDebug() << mAuxFboSpecularShader->getErrorLog().c_str();
    }

    // Compile FBO to screen shaders.
    ShaderPtr fboToScreenShader;
    if (sParticleRendererUseCombinedShader) {
        ParticleCombinedShader::getInstance()->compile();
        fboToScreenShader = ParticleCombinedShader::getInstance();
    } else {
        ParticleInnerBevelShader::getInstance()->compile();
        ParticleInnerShadowShader::getInstance()->compile();
        fboToScreenShader = ParticleInnerBevelShader::getInstance();
    }

    // Load textures.
    TexturePtr texture =
            Engine::getInstance()->getTextureManager()->getTextureImage("water_particle.png");
    mParticleTexture = texture;
    Q_ASSERT(mParticleTexture);

    // Create our FBOs.
    glFuncs->glGenFramebuffers(FBO_COUNT, (GLuint*) mFboIds);
    glGenTextures(FBO_COUNT, (GLuint*) mFboTextureIds);

    for (int i = 0; i < FBO_COUNT; i++) {
        // Generate an FBO of the requested format.
        const ParticleRendererItemFboDesc& desc = FBO_DEFINITIONS[i];
        bool canRetry = true;
        GLint fboFormat = desc.format;
        int fboSize = desc.size;

        // Begin trying this format out.
        while (true) {
            glBindTexture(GL_TEXTURE_2D, mFboTextureIds[i]);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
            glTexImage2D(GL_TEXTURE_2D, 0, fboFormat, fboSize, fboSize, 0, fboFormat,
                    GL_UNSIGNED_BYTE, nullptr);
            glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, mFboIds[i]);
            glFuncs->glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D,
                    mFboTextureIds[i], 0);
            mFboTextures[i] = TexturePtr(new DirectTexture(mFboTextureIds[i]));
            mFboTextures[i]->setMagnificationFilter(GL_LINEAR);
            mFboTextures[i]->setMinificationFilter(GL_LINEAR);
            mFboTextures[i]->setHorizontalWrapMode(GL_CLAMP_TO_EDGE);
            mFboTextures[i]->setVerticalWrapMode(GL_CLAMP_TO_EDGE);

            GLenum fboComplete = glFuncs->glCheckFramebufferStatus(GL_FRAMEBUFFER);
            if (fboComplete != GL_FRAMEBUFFER_COMPLETE) {
                if (canRetry) {
                    // Retry with RGBA.
                    fboFormat = GL_RGBA;
                    canRetry = false;
                } else {
                    qDebug() << "Unable to create framebuffer:" << fboComplete;
                    break;
                }
            } else {
                break;
            }
        }
    }

    glBindTexture(GL_TEXTURE_2D, 0);
    glFuncs->glBindFramebuffer(GL_FRAMEBUFFER, 0);

    // Create a mesh compatible with FBO to screen shaders.
    mSquareFboToScreenMesh = MeshInstance::createCompatibleMesh(4, GL_TRIANGLE_FAN,
            fboToScreenShader);
    MeshPtr mesh = mSquareFboToScreenMesh->getMesh();

    AttributeArray<Vector2> meshPositions = mesh->getAttributeArray<Vector2>("a_position");
    AttributeArray<Vector2> meshTexCoords = mesh->getAttributeArray<Vector2>("a_texCoord");
    meshPositions[0] = Vector2(-1.0f, -1.0f);
    meshTexCoords[0] = Vector2(0.0f, 0.0f);
    meshPositions[1] = Vector2(-1.0f, 1.0f);
    meshTexCoords[1] = Vector2(0.0f, 1.0f);
    meshPositions[2] = Vector2(1.0f, 1.0f);
    meshTexCoords[2] = Vector2(1.0f, 1.0f);
    meshPositions[3] = Vector2(1.0f, -1.0f);
    meshTexCoords[3] = Vector2(1.0f, 0.0f);
}

void ParticleRendererItem::checkExtensions() {
    const char* extensionsStr = (const char*) glGetString(GL_EXTENSIONS);
    sParticleRendererUseCombinedShader =
            strcasestr(extensionsStr, "GL_NV_shader_framebuffer_fetch") != nullptr;
}

void ParticleRendererItem::render(RenderNode*) {
    if (sParticleRendererUseCombinedShader) {
        // Set uniforms.
        auto shader = ParticleCombinedShader::getInstance();
        Renderer::getCurrent()->selectShader(shader);
        shader->setGlobalParams(mRenderParams);

        // Render.
        Renderer::getCurrent()->drawMesh(mSquareFboToScreenMesh, shader);
    } else {
        // Render pass 1.
        auto shader1 = ParticleInnerShadowShader::getInstance();
        Renderer::getCurrent()->selectShader(shader1);
        shader1->setGlobalParams(mRenderParams);

        Renderer::getCurrent()->drawMesh(mSquareFboToScreenMesh, shader1);

        // Render pass 2.
        auto shader2 = ParticleInnerBevelShader::getInstance();
        Renderer::getCurrent()->selectShader(shader2);
        shader2->setGlobalParams(mRenderParams);

        Renderer::getCurrent()->drawMesh(mSquareFboToScreenMesh, shader2);
    }

    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
}

void ParticleRendererItem::synchronizeForRendering(RenderList* renderList) {
    createParticleShader();

    // Compute current z-depth and zoom factor.
    RenderParameters renderParams;
    getFlattenedRenderParameters(&renderParams);
    QMatrix4x4 transform = Engine::getInstance()->getCamera()->getOpenGLViewMatrix();
    mZoomFactor = NORMAL_ZOOM_FOV * transform(0, 0);

    // TODO: For now, render our particles during synchronization. This avoids the need to double
    // buffer. This also is how Qt was handling our painting of its FBO, so it changes nothing.
    // Fix this up later though.
    renderFboContents();

    // Cull ourselves if necessary.
    if (mUpdateRegionEmpty) {
        return;
    }

    // Set up our node.
    mRenderNode.zDepth = renderParams.zDepth;
    mRenderNode.callback = this;
    renderList->addNode(&mRenderNode);

    // Double buffer our render data.
    float zoomFactor = mZoomFactor / FBO_SIZE;
    mRenderParams.updateRegion = mUpdateRegion;
    mRenderParams.aspectRatio = mAspectRatio;
    mRenderParams.alpha = 1.0f;
    mRenderParams.zoomFactor = zoomFactor;
    mRenderParams.highlightWidth= 0.0775f;
    mRenderParams.highlightAlpha = 1.0f;
    mRenderParams.tintColor = QColor::fromRgbF(0.9490196f, 0.30588236f, 0.8235294f, 0.23529412f);
    mRenderParams.shadowOffset = QPointF(18.0f, -30.0f);
    mRenderParams.shadowAlpha = 0.31f;
    mRenderParams.shadowColor = QColor::fromRgbF(0.4627451f, 0.65882355f, 1.0f);
    mRenderParams.texture = mFboTextures[int(FboIndexes::HEIGHT)];
    mRenderParams.specularTexture = mFboTextures[int(FboIndexes::SPECULAR)];
}

static void computeCopyTransforms(const QRectF& updateRegion, float viewportAspectRatio,
        QMatrix4x4* copyTransform, QMatrix4x4* copyTexCoordTransform) {
    // When our inputs and outputs are different aspect ratios (ie. the screen is non-square but
    // our FBO is square) we need to stretch the output coordinates to get the right positions.
    float aspectCorrection = viewportAspectRatio - 1.0f;

    // Positions are in normalized device coordinates (-1.0f to 1.0f). To scale and translate them,
    // we need to translate them into the [0.0f, 1.0f] space, scale and translate them, and then
    // translate them back. We will also apply a stretch, and adjust our origin if we are correcting
    // for some aspect difference.
    copyTransform->translate(-1.0f, -1.0f - aspectCorrection);
    copyTransform->translate(updateRegion.x() * 2.0f,
            updateRegion.y() * 2.0f * viewportAspectRatio);
    copyTransform->scale(updateRegion.width(), updateRegion.height());
    copyTransform->translate(1.0f, 1.0f + aspectCorrection);
    copyTransform->scale(1.0f, viewportAspectRatio);

    // Since texture coordinates are from 0.0f to 1.0f, we can use a simpler set of transformations.
    copyTexCoordTransform->translate(updateRegion.x(), updateRegion.y());
    copyTexCoordTransform->scale(updateRegion.width(), updateRegion.height());
}
