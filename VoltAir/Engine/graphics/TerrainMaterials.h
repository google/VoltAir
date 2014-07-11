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

#ifndef TERRAINMATERIALS_H
#define TERRAINMATERIALS_H

#include <QSharedPointer>
#include "TerrainMaterialDef.h"

class TerrainMaterial;

/**
 * @ingroup Engine
 * @brief Class managing a collection of TerrainMaterialDef%s.
 *
 * This class loads TerrainMaterialDef%s from a JSON file, and allows them to be looked up by name.
 */
class TerrainMaterials {
public:
    /**
     * @brief Construct a TerrainMaterials object and load TerrainMaterialDef%s from the named file.
     * @param jsonFilePath Absolute path to file to load
     */
    TerrainMaterials(const QString& jsonFilePath);
    ~TerrainMaterials();

    /**
     * @brief Returns a shared pointer to the TerrainMaterialDef%s with the given name, or a null
     * shared pointer if none is found.
     * @param name Name of the material to look up
     */
    QSharedPointer<TerrainMaterialDef> getMaterial(const QString& name) const;
    /**
     * @brief Reloads TerrainMaterialDef%s from the originally specified file, merging the results
     * into currently stored materials.
     *
     * Existing materials will be updated in place (pointers remain unchanged). New materials will
     * be added, and materials that have been removed from the file will be removed from our map.
     */
    void reload();

private:
    QString mJsonFilePath;
    QMap<QString, QSharedPointer<TerrainMaterialDef>> mMaterials;
};

#endif // TERRAINMATERIALS_H
