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
#include "PolygonBody.h"
#include "Camera.h"
#include "third_party/poly2tri/poly2tri/poly2tri.h"
#include "utils/Util.h"

// Weld tolerances to avoid degenerate triangles in Box2D.
// Value from b2PolygonShape.cpp, plus some extra tolerance (matching editor).
// Formula from:
// https://github.com/google/liquidfun/blob/master/
//         liquidfun/Box2D/Box2D/Collision/Shapes/b2PolygonShape.cpp#L142
const float PolygonBody::WELD_TOLERANCE = 0.5f * b2_linearSlop + 0.0001f;

PolygonBody::PolygonBody(QObject* parent) : Body(parent) {
}

void PolygonBody::setVertices(const QList<QPointF>& value) {
    mVertices = value;
    invalidateFixtures();
    emit verticesChanged();
}

void PolygonBody::setVerticesFromVariantList(const QVariantList& value) {
    setVertices(Util::toList<QPointF>(value));
}

const QList<QPointF>& PolygonBody::getVertices() const {
    return mVertices;
}

QVariantList PolygonBody::getVerticesAsVariantList() const {
    return Util::toVariantList(mVertices);
}

const QList<QPolygonF>& PolygonBody::getTriangles() {
    if (mTrianglesDirty) {
        triangulate();
    }
    return mTriangles;
}

void PolygonBody::forEachShape(const std::function<void(b2Shape*)>& func) {
    const QList<QPolygonF>& qTriangles = getTriangles();
    for (const QPolygonF& qTriangle : qTriangles) {
        b2Vec2 b2Triangle[3];
        for (int i = 0; i < 3; ++i) {
            b2Triangle[i] = b2Vec2(qTriangle[i].x(), qTriangle[i].y());
        }
        b2PolygonShape shape;
        shape.Set(b2Triangle, 3);
        func(&shape);
    }
}

void PolygonBody::triangulate() {
    int count = mVertices.count();

    // Weld vertices, and copy to a temporary buffer.
    // Note: This replicates Box2D's behavior, and avoids degenerate polygons.
    // Since Box2D welds our vertices anyways, this doesn't change the resulting shape's behavior.
    std::vector<p2t::Point> buffer;
    buffer.reserve(count);
    for (int i = 0; i < count; ++i) {
        p2t::Point pt(mVertices[i].x(), mVertices[i].y());
        // Reject this point if it is within welding distance of another point.
        bool unique = true;
        for (const p2t::Point& otherPt : buffer) {
            p2t::Point delta = pt - otherPt;
            float dist2 = delta.x * delta.x + delta.y * delta.y;
            if (dist2 < WELD_TOLERANCE) {
                unique = false;
                break;
            }
        }
        if (unique) {
            buffer.push_back(pt);
        }
    }

    // Grab pointers to points in the filled buffer.
    int retainedCount = buffer.size();
    std::vector<p2t::Point*> points(retainedCount);
    for (int i = 0; i < retainedCount; ++i) {
        points[i] = &buffer[i];
    }

    // Triangulate, and output result.
    mTriangles.clear();
    if (points.size() >= 3) {
        p2t::CDT triangulator(points);
        triangulator.Triangulate();
        std::vector<p2t::Triangle*> triangles = triangulator.GetTriangles();
        mTriangles.reserve(triangles.size());
        for (p2t::Triangle* triangle : triangles) {
            QPolygonF qTriangle(3);
            for (int i = 0; i < 3; ++i) {
                p2t::Point* p = triangle->GetPoint(i);
                qTriangle[i] = QPointF((float) p->x, (float) p->y);
            }
            mTriangles.push_back(qTriangle);
        }
    }
    mTrianglesDirty = false;
}
