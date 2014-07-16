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

#include "DebugRenderer.h"
#include "Renderer.h"
#include "SingletonInstancedShaderBase.h"
#include <memory.h>

namespace {

class DebugShapeShader;
typedef std::shared_ptr<DebugShapeShader> DebugShapeShaderPtr;

/**
 * Shader for rendering colored debug shapes.
 */
class DebugShapeShader : public SingletonInstancedShaderBase<DebugShapeShader> {
private:
    friend class InstancedShaderBase<DebugShapeShader>;
    static std::string getVertexShaderCode();
    static std::string getFragmentShaderCode();
    static AttributeSetPtr getAttributeSet();
    static std::vector<std::string> getUniformNames();

    static const char* VERTEX_SHADER;
    static const char* FRAGMENT_SHADER;
};

const char* DebugShapeShader::VERTEX_SHADER =
        "attribute highp vec2 a_position;\n"
        "attribute lowp vec4 a_color;\n"
        "varying lowp vec4 v_color;\n"
        "void main() {\n"
        "    gl_Position = vec4(a_position.xy, 0.0, 1.0);\n"
        "    v_color = vec4(a_color.rgb * a_color.a, a_color.a);\n"
        "}\n";
const char* DebugShapeShader::FRAGMENT_SHADER =
        "varying lowp vec4 v_color;\n"
        "void main() {\n"
        "    gl_FragColor = v_color;\n"
        "}\n";

std::string DebugShapeShader::getVertexShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(VERTEX_SHADER);
}

std::string DebugShapeShader::getFragmentShaderCode() {
    return Renderer::addCompatibilityPrefixToShaderCode(FRAGMENT_SHADER);
}

AttributeSetPtr DebugShapeShader::getAttributeSet() {
    return AttributeSetPtr(new AttributeSet({
            { "a_position", 2, false, GL_FLOAT },
            { "a_color", 4, true, GL_UNSIGNED_BYTE } }));
}

std::vector<std::string> DebugShapeShader::getUniformNames() {
    return {};
}

} // namespace


DebugRenderer::DebugRenderer() {
}

DebugRenderer::~DebugRenderer() {
}

void DebugRenderer::setProjectionMatrix(const Matrix4& matrix) {
    memcpy(mProjectionMatrix, matrix, sizeof(Matrix4));
}

void DebugRenderer::queueLine(const Vector2& pos1, const Vector2& pos2, unsigned int colorRgba) {
    DebugVertex* vertices = allocateVertices(2, GL_LINES);
    vertices[0].position = transformVertex(pos1);
    vertices[0].color = colorRgba;
    vertices[1].position = transformVertex(pos2);
    vertices[1].color = colorRgba;
}

void DebugRenderer::queuePolygon(const Vector2* points, int count, unsigned int colorRgba) {
    if (count <= 0) {
        return;
    }
    DebugVertex* vertices = allocateVertices(count * 2, GL_LINES);
    Vector2 prevPoint = transformVertex(points[count - 1]);
    for (int i = 0; i < count; ++i) {
        const Vector2& point = transformVertex(points[i]);
        vertices->position = prevPoint;
        vertices->color = colorRgba;
        vertices++;
        vertices->position = point;
        vertices->color = colorRgba;
        vertices++;
        prevPoint = point;
    }
}

void DebugRenderer::queueFilledPolygon(const Vector2* points, int count, unsigned int colorRgba) {
    if (count <= 0) {
        return;
    }
    flushCurrentDraw();
    DebugVertex* vertices = allocateVertices(count, GL_TRIANGLE_FAN);
    for (int i = 0; i < count; ++i) {
        const Vector2& point = transformVertex(points[i]);
        vertices->position = point;
        vertices->color = colorRgba;
        vertices++;
    }
}

void DebugRenderer::queueCircle(const Vector2& center, float radius, int segments,
        unsigned int colorRgba) {
    flushCurrentDraw();
    DebugVertex* vertices = allocateVertices(segments * 2, GL_LINES);

    Vector2 prevPoint = transformVertex(center + Vector2(radius, 0.0f));
    for (int i = 0; i < segments; ++i) {
        float angle = M_PI * 2 * (i + 1) / (float) segments;
        Vector2 point = transformVertex(center + Vector2(cosf(angle), sinf(angle)) * radius);
        vertices[i * 2].position = prevPoint;
        vertices[i * 2].color = colorRgba;
        vertices[i * 2 + 1].position = point;
        vertices[i * 2 + 1].color = colorRgba;
        prevPoint = point;
    }
}

void DebugRenderer::queueFilledCircle(const Vector2& center, float radius, int segments,
        unsigned int colorRgba) {
    flushCurrentDraw();
    DebugVertex* vertices = allocateVertices(segments + 2, GL_TRIANGLE_FAN);

    vertices[0].position = transformVertex(center);
    vertices[0].color = colorRgba;
    for (int i = 0; i < segments + 1; ++i) {
        float angle = M_PI * 2 * i / (float) segments;
        vertices[i + 1].position = transformVertex(center
                + Vector2(cosf(angle), sinf(angle)) * radius);
        vertices[i + 1].color = colorRgba;
    }
}

Vector2 DebugRenderer::transformVertex(const Vector2& point) {
    return Vector2(
            mProjectionMatrix[0 + 4 * 0] * point.x
            + mProjectionMatrix[0 + 4 * 1] * point.y
            + mProjectionMatrix[0 + 4 * 3],
            mProjectionMatrix[1 + 4 * 0] * point.x
            + mProjectionMatrix[1 + 4 * 1] * point.y
            + mProjectionMatrix[1 + 4 * 3]);
}

void DebugRenderer::flush() {
    flushCurrentDraw();
}

void DebugRenderer::synchronizeForRendering() {
    flush();
    mRenderVertexBuffer.clear();
    mRenderDrawList.clear();
    std::swap(mVertexBuffer, mRenderVertexBuffer);
    std::swap(mDrawList, mRenderDrawList);
}

void DebugRenderer::render() {
    if (!mRenderDrawList.empty()) {
        // Select shader.
        createShader();
        DebugShapeShaderPtr shader = DebugShapeShader::getInstance();
        Renderer* renderer = Renderer::getCurrent();
        Mesh* mesh = mRenderMeshInstance->getMesh().get();

        auto vertexIt = mRenderVertexBuffer.begin();
        for (const DebugDraw& draw : mRenderDrawList) {
            // Draw primitives.
            DebugVertex* drawVertices = vertexIt.base();
            mRenderMeshInstance->setMode(draw.mode);
            mesh->setBuffer(drawVertices, draw.count);
            renderer->clearMesh();
            renderer->drawMesh(mRenderMeshInstance, shader);
            vertexIt += draw.count;
        }

        // TODO: Cleanup.
    }

    mRenderVertexBuffer.clear();
    mRenderDrawList.clear();
}

DebugRenderer::DebugVertex* DebugRenderer::allocateVertices(int count, GLuint mode) {
    if (count <= 0) {
        return nullptr;
    }
    if (mHasCurrentDraw && mCurrentDraw.mode != mode) {
        flushCurrentDraw();
    }
    mHasCurrentDraw = true;
    mCurrentDraw.mode = mode;
    mCurrentDraw.count += count;
    // Note: some implementations of fill-style vector::insert don't return an iterator as expected,
    // so compute it manually.
    mVertexBuffer.insert(mVertexBuffer.end(), count, DebugVertex());
    auto it = mVertexBuffer.end() - count;
    return it.base();
}

void DebugRenderer::flushCurrentDraw() {
    if (!mHasCurrentDraw) {
        return;
    }
    mDrawList.push_back(mCurrentDraw);
    mHasCurrentDraw = false;
    mCurrentDraw = DebugDraw();
}

void DebugRenderer::createShader() {
    mRenderMeshInstance = MeshInstance::createCompatibleMesh(0, GL_LINES,
            DebugShapeShader::getInstance());
}
