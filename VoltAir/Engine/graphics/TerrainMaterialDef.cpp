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

#include "TerrainMaterialDef.h"

static const QMap<QString, TerrainMaterialDef::BlendMode> BLEND_MODE_NAME_MAP = {
    { "Add", TerrainMaterialDef::BlendMode::Add },
    { "Multiply", TerrainMaterialDef::BlendMode::Multiply },
    { "Overlay", TerrainMaterialDef::BlendMode::Overlay },
    { "Blend", TerrainMaterialDef::BlendMode::Blend },
};


TerrainMaterialDef::TerrainMaterialDef() {
}

void TerrainMaterialDef::setName(const QString& value) {
    mName = value;
}

void TerrainMaterialDef::setBaseTexture(const QString& value) {
    mBaseTexture = value;
}

void TerrainMaterialDef::setBevelTexture(const QString& value) {
    mBevelTexture = value;
}

void TerrainMaterialDef::setEdgeTexture(const QString& value) {
    mEdgeTexture = value;
}

void TerrainMaterialDef::setTiled(bool value) {
    mTiled = value;
}

void TerrainMaterialDef::setOpaque(bool value) {
    mOpaque = value;
}

void TerrainMaterialDef::setEdgeWidth(float value) {
    mEdgeWidth = value;
}

void TerrainMaterialDef::setEdgeOffset(float value) {
    mEdgeOffset = value;
}

void TerrainMaterialDef::setEdgeScale(float value) {
    mEdgeScale = value;
}

void TerrainMaterialDef::setBevelScale(float value) {
    mBevelScale = value;
}

void TerrainMaterialDef::setBlendMode(BlendMode value) {
    mBlendMode = value;
}

void TerrainMaterialDef::reset() {
    mName.clear();
    mBaseTexture.clear();
    mBevelTexture.clear();
    mEdgeTexture.clear();

    mTiled = true;
    mOpaque = true;
    mEdgeWidth = 0.0f;
    mEdgeOffset = 0.0f;
    mEdgeScale = 1.0f;
    mBevelScale = 1.0f;

    mBlendMode = BlendMode::Add;
}

void TerrainMaterialDef::mergeFromJson(const QVariantMap& jsonValue) {
    setName(jsonValue.value("name").toString());

    setName(jsonValue.value("name").toString());
    setBaseTexture(jsonValue.value("baseTexture").toString());
    setBevelTexture(jsonValue.value("bevelTexture").toString());
    setEdgeTexture(jsonValue.value("edgeTexture").toString());
    setTiled(jsonValue.value("tiled", true).toBool());
    setOpaque(jsonValue.value("opaque", true).toBool());
    setEdgeWidth(jsonValue.value("edgeWidth", 0.0f).toFloat());
    setEdgeOffset(jsonValue.value("edgeOffset", 0.0f).toFloat());
    setEdgeScale(jsonValue.value("edgeScale", 1.0f).toFloat());
    setBlendMode(parseBlendMode(jsonValue.value("blendMode").toString(), BlendMode::Add));
}

TerrainMaterialDef::BlendMode TerrainMaterialDef::parseBlendMode(const QString& str,
        BlendMode defaultValue) {
    return BLEND_MODE_NAME_MAP.value(str, defaultValue);
}
