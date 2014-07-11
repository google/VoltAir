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

#include "PolygonVertexAttributeArray.h"

PolygonVertexAttributeArray::PolygonVertexAttributeArray(QObject* parent) : QObject(parent) {
}

void PolygonVertexAttributeArray::setName(const QString& value) {
    if (mName == value) {
        return;
    }
    mName = value;
    emit nameChanged();
}

void PolygonVertexAttributeArray::setValues(const QList<float>& values) {
    mValues = values;
    emit valuesChanged();
}

QVariantList PolygonVertexAttributeArray::getValuesAsVariantList() const {
    QVariantList variants;
    for (float value : mValues) {
        variants.push_back(value);
    }
    return variants;
}

void PolygonVertexAttributeArray::setValuesFromVariantList(const QVariantList& variants) {
    mValues.clear();
    for (const QVariant& variant : variants) {
        mValues.append(variant.toFloat());
    }
    emit valuesChanged();
}

QString PolygonVertexAttributeArray::getValuesAsBase64Binary() const {
    QByteArray array;
    for (float value : mValues) {
        unsigned int intValue = *reinterpret_cast<unsigned int*>(&value);
        unsigned char b1 = (intValue >> 0) & 0xFF;
        unsigned char b2 = (intValue >> 8) & 0xFF;
        unsigned char b3 = (intValue >> 16) & 0xFF;
        unsigned char b4 = (intValue >> 24) & 0xFF;
        array.append(b1);
        array.append(b2);
        array.append(b3);
        array.append(b4);
    }
    return array.toBase64();
}

void PolygonVertexAttributeArray::setValuesFromBase64Binary(const QString& base64Str) {
    mValues.clear();
    QByteArray array = QByteArray::fromBase64(base64Str.toLatin1());
    int length = array.size() / sizeof(float);
    mValues.reserve(length);
    const char* dataPtr = array.data();
    for (int i = 0; i < length; i++) {
        unsigned char b1 = *dataPtr++;
        unsigned char b2 = *dataPtr++;
        unsigned char b3 = *dataPtr++;
        unsigned char b4 = *dataPtr++;
        unsigned int intValue =
                (static_cast<unsigned int>(b1) << 0)
                | (static_cast<unsigned int>(b2) << 8)
                | (static_cast<unsigned int>(b3) << 16)
                | (static_cast<unsigned int>(b4) << 24);
        float value = *reinterpret_cast<float*>(&intValue);
        mValues.append(value);
    }
    emit valuesChanged();
}
