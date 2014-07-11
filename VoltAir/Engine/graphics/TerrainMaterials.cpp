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

#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include "TerrainMaterials.h"

TerrainMaterials::TerrainMaterials(const QString& jsonFilePath) : mJsonFilePath(jsonFilePath) {
    reload();
}

TerrainMaterials::~TerrainMaterials() {
}

QSharedPointer<TerrainMaterialDef> TerrainMaterials::getMaterial(const QString& name) const {
    return mMaterials.value(name, QSharedPointer<TerrainMaterialDef>());
}

void TerrainMaterials::reload() {
    QByteArray jsonData;
    {
        QFile jsonFile(mJsonFilePath);
        if (!jsonFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qDebug() << "Cannot open materials definition file: " << mJsonFilePath << ".";
            return;
        }
        jsonData = jsonFile.readAll();
        jsonFile.close();
    }

    QJsonParseError err;
    QJsonDocument doc = QJsonDocument::fromJson(jsonData, &err);
    if (err.error != QJsonParseError::NoError) {
        qDebug() << "Error parsing materials definition file " << err.errorString();
        return;
    }

    QVariantMap root = doc.toVariant().toMap();
    QVariant materials = root.value("materials");

    QSet<QString> removedSet;
    for (const QString& materialKey : mMaterials.keys()) {
        removedSet.insert(materialKey);
    }

    for (QVariant materialValue : materials.toList()) {
        QVariantMap materialValues = materialValue.toMap();
        QString materialName = materialValues.value("name", "").toString();
        if (materialName.isEmpty()) {
            continue;
        }

        QString materialKey = materialName.trimmed().toLower();
        QSharedPointer<TerrainMaterialDef> material = mMaterials.value(materialKey,
                QSharedPointer<TerrainMaterialDef>());
        if (!material) {
            // Create a new material.
            material.reset(new TerrainMaterialDef());
            mMaterials[materialKey] = material;
        }

        // Merge it.
        material->reset();
        material->mergeFromJson(materialValues);
        removedSet.remove(materialKey);
    }

    // Remove missing materials.
    for (const QString& materialKey : removedSet) {
        mMaterials.remove(materialKey);
    }
}
