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

#ifndef DEBUGRENDERER_H
#define DEBUGRENDERER_H

#include "RendererCommon.h"
#include <vector>

/**
 * @ingroup Renderer
 * @brief A class with helper methods for rendering primitives like lines, for debug visualization.
 *
 * This class stores a list of draw calls and vertices, each double buffered. When shapes are queued
 * for rendering, they are added to these lists. A call to synchronizeForRender() moves currently
 * queued data into the double buffer for rendering. Calls to render() then render this data. This
 * allows shapes to be queued at any time, and rendering to be performed safely on a separate
 * render thread.
 *
 * @note While queuing and rendering can happen on different threads, methods themselves are not
 * thread safe.
 */
class DebugRenderer {
public:
    /**
     * @brief Constructs a DebugRenderer.
     */
    DebugRenderer();
    ~DebugRenderer();

    /**
     * @brief Gets the current projection matrix.
     * @returns The current projection matrix
     */
    const Matrix4& getProjectionMatrix() const { return mProjectionMatrix; }
    /**
     * @brief Sets the current projection matrix.
     *
     * This matrix transforms all shapes queued while it is set. When the matrix changes, subsequent
     * queued shapes will be transformed with the new matrix. This means that multiple matrices can
     * be used within a single frame. This can be useful, for example, when rendering debug shapes
     * for a camera relative scene and then a screen relative UI.
     * @param matrix The matrix to set as current
     */
    void setProjectionMatrix(const Matrix4& matrix);

    /**
     * @brief Queue a colored line segment.
     * @param pos1 First endpoint
     * @param pos2 Second endpoint
     * @param colorRgba Color of the segment
     */
    void queueLine(const Vector2& pos1, const Vector2& pos2, unsigned int colorRgba);
    /**
     * @brief Queue a colored polygon line.
     * @param points List of points forming the polygon
     * @param count Length of @p points
     * @param colorRgba Color of the shape
     */
    void queuePolygon(const Vector2* points, int count, unsigned int colorRgba);
    /**
     * @brief Queue a filled convex polygon shape.
     * @note The polygon is rendered as a triangle fan, and must be convex to render correctly.
     * @param points List of points forming the polygon
     * @param count Length of @p points
     * @param colorRgba Color of the shape
     */
    void queueFilledPolygon(const Vector2* points, int count, unsigned int colorRgba);
    /**
     * @brief Queues a circle centered about a point.
     * @param center Center of circle
     * @param radius Radius of circle
     * @param segments Number of segments to draw
     * @param colorRgba Color of the shape
     */
    void queueCircle(const Vector2& center, float radius, int segments, unsigned int colorRgba);
    /**
     * @brief Queues a filled circle centered about a point.
     * @param center Center of circle
     * @param radius Radius of circle
     * @param segments Number of segments to draw
     * @param colorRgba Color of the shape
     */
    void queueFilledCircle(const Vector2& center, float radius, int segments,
            unsigned int colorRgba);

    /**
     * @brief Flushes the current shape being queued, preventing additional vertices from getting
     * added to that draw call.
     *
     * This is done implicitly as necessary and is not normally necessary.
     */
    void flush();
    /**
     * @brief Flips double buffered data, and clears the current queue.
     *
     * Draw data that was previous queued will be moved to the render queue, and subsequent calls to
     * render() will draw those shapes. This method signals the end of debug drawing for the current
     * frame. Draw calls issued after calling this method will get rendered in the next frame.
     */
    void synchronizeForRendering();
    /**
     * @brief Renders draw calls in the render queue.
     *
     * This method renders shapes that were previously moved on to the render queue by a call to
     * synchronizeForRendering().
     */
    void render();
private:
    struct DebugVertex {
        Vector2 position = Vector2(0.0f, 0.0f);
        unsigned int color = 0x00000000;
    };
    struct DebugDraw {
        int count = 0;
        GLuint mode = GL_LINES;
    };

    DebugVertex* allocateVertices(int count, GLuint mode);
    void flushCurrentDraw();
    void createShader();
    Vector2 transformVertex(const Vector2& point);

    Matrix4 mProjectionMatrix = {
            1.0f, 0.0f, 0.0f, 0.0f,
            0.0f, 1.0f, 0.0f, 0.0f,
            0.0f, 0.0f, 1.0f, 0.0f,
            0.0f, 0.0f, 0.0f, 1.0f };
    bool mHasCurrentDraw = false;
    DebugDraw mCurrentDraw;
    std::vector<DebugVertex> mVertexBuffer;
    std::vector<DebugDraw> mDrawList;
    std::vector<DebugVertex> mRenderVertexBuffer;
    std::vector<DebugDraw> mRenderDrawList;
    MeshPtr mRenderMesh;
    MeshInstancePtr mRenderMeshInstance;
};

#endif // DEBUGRENDERER_H
