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

#include <QColor>
#include <QtGui/QOpenGLShaderProgram>
#include <QtGui/QOpenGLContext>
#include "Camera.h"
#include "LiquidFunDebugDraw.h"
#include "renderer/DebugRenderer.h"
#include "renderer/Renderer.h"
#include "utils/Util.h"

static unsigned int b2ColorToRgba(const b2Color& color, int alpha) {
    return
        (qMax(0, qMin(0xFF, (int) (color.r * 0xFF))) << 0) |
        (qMax(0, qMin(0xFF, (int) (color.g * 0xFF))) << 8) |
        (qMax(0, qMin(0xFF, (int) (color.b * 0xFF))) << 16) |
        (qMax(0, qMin(0xFF, alpha)) << 24);
}

static unsigned int b2ColorToRgba(const b2ParticleColor& color, int alpha) {
    return
        (qMax(0, qMin(0xFF, (int) color.r)) << 0) |
        (qMax(0, qMin(0xFF, (int) color.g)) << 8) |
        (qMax(0, qMin(0xFF, (int) color.b)) << 16) |
        (qMax(0, qMin(0xFF, alpha)) << 24);
}

LiquidFunDebugDraw::LiquidFunDebugDraw() {
    SetFlags(b2Draw::e_shapeBit | b2Draw::e_jointBit | b2Draw::e_centerOfMassBit
            | b2Draw::e_particleBit);
}

LiquidFunDebugDraw::~LiquidFunDebugDraw() {
}

void LiquidFunDebugDraw::DrawPolygon(const b2Vec2* vertices, int32 vertexCount,
        const b2Color& color) {
    Renderer::getCurrent()->getDebugRenderer()->queuePolygon(vertices, vertexCount,
            b2ColorToRgba(color, 0xFF));
}

void LiquidFunDebugDraw::DrawSolidPolygon(const b2Vec2* vertices, int32 vertexCount,
        const b2Color& color) {
    Renderer::getCurrent()->getDebugRenderer()->queueFilledPolygon(vertices, vertexCount,
            b2ColorToRgba(color, 0x60));
    Renderer::getCurrent()->getDebugRenderer()->queuePolygon(vertices, vertexCount,
            b2ColorToRgba(color, 0xFF));
}

void LiquidFunDebugDraw::DrawCircle(const b2Vec2& center, float32 radius, const b2Color& color) {
    Renderer::getCurrent()->getDebugRenderer()->queueCircle(center, radius, CIRCLE_SEGMENTS,
            b2ColorToRgba(color, 0xFF));
}

void LiquidFunDebugDraw::DrawSolidCircle(const b2Vec2& center, float32 radius, const b2Vec2& axis,
        const b2Color& color) {
    Renderer::getCurrent()->getDebugRenderer()->queueFilledCircle(center, radius, CIRCLE_SEGMENTS,
            b2ColorToRgba(color, 0x60));
    Renderer::getCurrent()->getDebugRenderer()->queueCircle(center, radius, CIRCLE_SEGMENTS,
            b2ColorToRgba(color, 0xFF));
    DrawSegment(center, center + radius * axis, color);
}

void LiquidFunDebugDraw::DrawParticles(const b2Vec2* centers, float32 radius,
        const b2ParticleColor* colors, int32 count) {
    DebugRenderer* debugRenderer = Renderer::getCurrent()->getDebugRenderer();
    for (int i = 0; i < count; ++i) {
        debugRenderer->queueCircle(centers[i], radius, PARTICLE_CIRCLE_SEGMENTS,
                b2ColorToRgba(colors[i], 0xFF));
    }
}

void LiquidFunDebugDraw::DrawSegment(const b2Vec2& p1, const b2Vec2& p2, const b2Color& color) {
    Renderer::getCurrent()->getDebugRenderer()->queueLine(p1, p2, b2ColorToRgba(color, 0xFF));
}

void LiquidFunDebugDraw::DrawTransform(const b2Transform& xf) {
    static const float32 AXIS_SCALE = 0.4f;
    DrawSegment(xf.p, xf.p + AXIS_SCALE * xf.q.GetXAxis(), b2Color(1.0f, 0.0f, 0.0f));
    DrawSegment(xf.p, xf.p + AXIS_SCALE * xf.q.GetYAxis(), b2Color(0.0f, 1.0f, 0.0f));
}
