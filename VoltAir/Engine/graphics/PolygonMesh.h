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

#ifndef POLYGONMESH_H
#define POLYGONMESH_H

#include <QObject>
#include <QQmlListProperty>
#include "PolygonVertexAttributeArray.h"

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Class storing a renderable mesh, instantiable from QML.
 *
 * The mesh is composed of possibly multiple vertex attribute arrays. Each attribute describes an
 * aspect of a vertex, for example: Position, texture coordinates, vertex color, etc.
 *
 * TerrainMeshRenderer takes these and converts them to Mesh objects for rendering.
 */
class PolygonMesh : public QObject {
    Q_OBJECT

    /**
     * @brief QML mutable list of PolygonVertexAttributeArray%s, each representing a vertex
     * attribute array of this mesh.
     */
    Q_PROPERTY(QQmlListProperty<PolygonVertexAttributeArray> attributes
            READ getAttributeListProperty NOTIFY vertexArraysChanged)

public:
    /**
     * @brief Constructs a PolygonMesh.
     * @param parent Parent object
     */
    explicit PolygonMesh(QObject* parent = nullptr);

    /**
     * @brief Returns #attributes as a QList of PolygonVertexAttributeArray%s.
     */
    const QList<PolygonVertexAttributeArray*>& getVertexArrays() const { return mVertexArrays; }
    /**
     * @brief Sets #attributes from a QList of PolygonVertexAttributeArray%s.
     * @param value List of PolygonVertexAttributeArray%s
     */
    void setVertexArrays(const QList<PolygonVertexAttributeArray*>& value);
    /**
     * @brief Returns #attributes.
     */
    QQmlListProperty<PolygonVertexAttributeArray> getAttributeListProperty();

signals:
    /**
     * @brief Emitted when #attributes changes.
     */
    void vertexArraysChanged();

private:
    QList<PolygonVertexAttributeArray*> mVertexArrays;
};
Q_DECLARE_METATYPE(PolygonMesh*)

#endif // POLYGONMESH_H
