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

#ifndef POLYGONVERTEXATTRIBUTEARRAY_H
#define POLYGONVERTEXATTRIBUTEARRAY_H

#include <QObject>
#include <QVariant>

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Class storing the values in a vertex attribute array, instantiable from QML.
 *
 * Values are stored as raw lists of @c float%s, and must be interpretted by the consumer. For
 * example, if this vertex attribute is actually a 2D float vector, the consumer must de-interleave
 * the list into vectors.
 *
 * TerrainMeshRenderer converts each of these into an AttributeArray, which are used to fill a Mesh.
 * @see PolygonMesh
 */
class PolygonVertexAttributeArray : public QObject {
    Q_OBJECT
    /**
     * @brief Name of the attribute represented by this array, mapping it to the corresponding
     * attribute in the Shader (in this case, TerrainShader) used for rendering.
     */
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    /**
     * @brief List of floats contained in this array, as a QVariantList.
     */
    Q_PROPERTY(QVariantList values READ getValuesAsVariantList WRITE setValuesFromVariantList
            NOTIFY valuesChanged)
    /**
     * @brief List of floats contained in this array, encoded as a base64 string.
     *
     * Data is encoded as follows:
     *   - float values are treated as a packed array of single precision IEEE floats
     *   - that array is then reinterpreted as a byte array
     *   - the byte array is in turn encoded as base64
     *
     * Decoding reverses the process.
     *
     * @note This property is used for initialization (i.e. level load) efficiency. #values can
     * also be used, but it requires excessive QVariant creation and copying, as well as
     * significantly more text processing.
     */
    Q_PROPERTY(QString valuesAsBase64Binary READ getValuesAsBase64Binary
            WRITE setValuesFromBase64Binary)
public:
    /**
     * @brief Construct a PolygonVertexAttributeArray.
     * @param parent Parent object
     */
    explicit PolygonVertexAttributeArray(QObject* parent = nullptr);

    /**
     * @brief Returns #name.
     */
    const QString& getName() const { return mName; }
    /**
     * @brief Sets #name.
     * @param value QString to set #name to
     */
    void setName(const QString& value);
    /**
     * @brief Returns #values as a QList of @c float%s.
     */
    const QList<float>& getValues() const { return mValues; }
    /**
     * @brief Sets #values from a QList of @c float%s.
     * @param values QList of @c float values to set #values to
     */
    void setValues(const QList<float>& values);

    /**
     * @brief Returns #values as a QVariantList.
     */
    QVariantList getValuesAsVariantList() const;
    /**
     * @brief Sets #values from a QVariantList.
     * @param variants QVariantList to interpret as a list of @c float%s to set #values to
     */
    void setValuesFromVariantList(const QVariantList& variants);
    /**
     * @brief Returns #valuesAsBase64Binary.
     */
    QString getValuesAsBase64Binary() const;
    /**
     * @brief Sets #valuesAsBase64Binary.
     * @param base64Str Base64 encoded array of @c float%s
     */
    void setValuesFromBase64Binary(const QString& base64Str);

signals:
    /**
     * @brief Emitted when #name changes.
     */
    void nameChanged();
    /**
     * @brief Emitted when #values changes.
     */
    void valuesChanged();

private:
    QString mName;
    QList<float> mValues;
};
Q_DECLARE_METATYPE(PolygonVertexAttributeArray*)

#endif // POLYGONVERTEXATTRIBUTEARRAY_H
