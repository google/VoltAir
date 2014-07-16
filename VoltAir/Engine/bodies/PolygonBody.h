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

#ifndef POLYGONBODY_H
#define POLYGONBODY_H

#include <QPolygonF>
#include "Body.h"

/**
 * @ingroup Engine
 * @brief A QObject container for a Box2D @c b2Body that represents a polygon.
 */
class PolygonBody : public Body {
    Q_OBJECT

    /**
     * @brief The vertices defining the PolygonBody.
     */
    Q_PROPERTY(QVariantList vertices READ getVerticesAsVariantList
               WRITE setVerticesFromVariantList NOTIFY verticesChanged)

public:

    /**
     * @brief Constructs a PolygonBody.
     */
    explicit PolygonBody(QObject* parent = nullptr);

    /**
     * @brief Returns #vertices as a QList<QPointF>.
     */
    const QList<QPointF>& getVertices() const;

    /**
     * @brief Returns #vertices as a QVariantList.
     */
    QVariantList getVerticesAsVariantList() const;

    /**
     * @brief Sets #vertices.
     * @param value QList<QPointF> to set #vertices to
     */
    void setVertices(const QList<QPointF>& value);

    /**
     * @brief Sets #vertices.
     * @param value QVariantList to set #vertices to
     */
    void setVerticesFromVariantList(const QVariantList& value);

    /**
     * @brief Returns a QList<QPolygonF> of this PolygonBody's triangles.
     * @note This function re-triangulates the PolygonBody's polygon, if necessary.
     */
    const QList<QPolygonF>& getTriangles();

signals:
    /**
     * @brief Emitted when #vertices changes.
     */
    void verticesChanged();

protected:
    /**
     * @brief Calls @p func on the @c b2Shape%s that represents this PolygonBody.
     * @param func Function to call, which receives the @c b2Shape as an argument
     */
    virtual void forEachShape(const std::function<void(b2Shape*)>& func) override;

private:
    void triangulate();

    QList<QPointF> mVertices = {
        QPointF(-1.0f, -1.0f), QPointF(1.0f, -1.0f), QPointF(1.0f, 1.0f), QPointF(-1.0f, 1.0f) };
    QList<QPolygonF> mTriangles;
    bool mTrianglesDirty = true;

    static const float WELD_TOLERANCE;
};
Q_DECLARE_METATYPE(PolygonBody*)

#endif // POLYGONBODY_H
