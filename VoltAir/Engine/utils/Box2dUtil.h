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

#ifndef BOX2DUTIL_H
#define BOX2DUTIL_H

#include <Box2D/Box2D.h>
#include <QColor>
#include <QPointF>
#include <QRectF>

/**
 * @ingroup Engine
 * @brief Namespace containing frequently used static helper functions related to Box2D.
 */
namespace Box2dUtil {

/**
 * @brief Returns the computed inner product between two Box2D vectors.
 * @param v1 First vector for the inner product calculation
 * @param v2 Second vector for the inner product calculation
 */
static inline float dotProduct(const b2Vec2& v1, const b2Vec2& v2) {
    return v1.x * v2.x + v1.y * v2.y;
}

/**
 * @brief Returns a @c b2Vec2 converted to a QPointF.
 * @param vec @c b2Vec2 to convert
 */
static inline QPointF toQPointF(const b2Vec2& vec) {
    return QPointF(vec.x, vec.y);
}

/**
 * @brief Returns a QPointF converted to a @c b2Vec2.
 * @param vec QPointF to convert
 */
static inline b2Vec2 toB2Vec2(const QPointF& vec) {
    return b2Vec2(vec.x(), vec.y());
}

/**
 * @brief Returns a @c b2AABB converted to a QRectF.
 * @param aabb @c b2AABB to convert
 */
static inline QRectF toQRectF(const b2AABB& aabb) {
    return QRectF(toQPointF(aabb.lowerBound), toQPointF(aabb.upperBound));
}

/**
 * @brief Returns a QRectF converted to a @c b2AABB.
 * @param rect QRectF to convert
 */
static inline b2AABB toB2AABB(const QRectF& rect) {
    return { toB2Vec2(rect.topLeft()), toB2Vec2(rect.bottomRight()) };
}

/**
 * @brief Returns a @c b2ParticleColor converted to a QColor.
 * @param color @c b2ParticleColor to convert
 */
static inline QColor toQColor(const b2ParticleColor& color) {
    return QColor::fromRgbF(color.r, color.g, color.b, color.a);
}

/**
 * @brief Returns a QColor converted to a @c b2ParticleColor.
 * @param color QColor to convert
 */
static inline b2ParticleColor toB2ParticleColor(const QColor& color) {
    return b2ParticleColor(color.redF(), color.greenF(), color.blueF(), color.alphaF());
}

}

#endif // BOX2DUTIL_H
