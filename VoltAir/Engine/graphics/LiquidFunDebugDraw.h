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

#ifndef LIQUIDFUNDEBUGDRAW_H
#define LIQUIDFUNDEBUGDRAW_H

#include <Box2D/Box2D.h>

/**
 * @ingroup Engine
 * @brief Implementation of @c b2Draw which renders objects (body fixtures, particles, etc.) using
 * DebugRenderer.
 *
 * @c b2Draw receives callbacks from @c b2World when @c b2World::DrawDebugData() is called. This
 * class then in turn queues up those shapes in DebugRenderer for later rendering. This allows
 * rendering to occur later in the render thread, and queuing to occur in the main thread, keeping
 * debug shapes visually in sync with physics.
 *
 * @note It is expected that a valid Renderer be attached when b2World::DrawDebugData() is called,
 * so that Renderer::getDebugRenderer() can be called.
 */
class LiquidFunDebugDraw : public b2Draw {
public:
    /**
     * @brief Constructs a LiquidFunDebugDraw.
     */
    LiquidFunDebugDraw();
    virtual ~LiquidFunDebugDraw();

    /**
     * @brief Draw a closed polygon line.
     * @param vertices List of vertices
     * @param vertexCount Length of list @p vertices
     * @param color Color to draw the polygon
     */
    virtual void DrawPolygon(const b2Vec2* vertices, int32 vertexCount,
            const b2Color& color) override;
    /**
     * @brief Draw a filled polygon.
     * @note The polygon is expected to be convex.
     * @param vertices List of vertices
     * @param vertexCount Length of list @p vertices
     * @param color Color to fill the polygon
     */
    virtual void DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount,
            const b2Color& color) override;
    /**
     * @brief Draw a circle.
     * @param center Center of the circle
     * @param radius Radius of the circle
     * @param color Color to draw the circle
     */
    virtual void DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) override;
    /**
     * @brief Draw a filled circle.
     * @param center Center of the circle
     * @param radius Radius of the circle
     * @param axis Rotational axis of the circle, to indicate rotation
     * @param color Color to fill the circle
     */
    virtual void DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis,
            const b2Color& color) override;
    /**
     * @brief Draw a list of particles as circles.
     * @param centers List of particle centers
     * @param radius Radius of circles
     * @param colors List of particle colors
     * @param count Length of @p centers and @p colors
     */
    virtual void DrawParticles(const b2Vec2* centers, float32 radius,
            const b2ParticleColor* colors, int32 count) override;
    /**
     * @brief Draw a line segment.
     * @param p1 First end point
     * @param p2 Second end point
     * @param color Color to draw the line segment
     */
    virtual void DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color) override;
    /**
     * @brief Draw a two dimensional transform.
     *
     * This method visualizes the transform by drawing two colored lines along the transform's
     * x and y axes.
     * @param xf Transform to draw
     */
    virtual void DrawTransform(const b2Transform& xf) override;

private:
    static const int CIRCLE_SEGMENTS = 16;
    static const int PARTICLE_CIRCLE_SEGMENTS = 8;
};

#endif // LIQUIDFUNDEBUGDRAW_H
