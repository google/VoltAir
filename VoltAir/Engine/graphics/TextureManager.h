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

#ifndef TEXTUREMANAGER_H
#define TEXTUREMANAGER_H

#include <QMap>
#include <memory>
#include "renderer/PointerDeclarations.h"

/**
 * @ingroup Engine
 * @brief Class which loads and caches Texture%s.
 *
 * Textures are loaded as QSGTexture%s and wrapped into Texture objects. Returned textures are
 * cached until the next call to markAllTexturesForDeletion() which occurs when Engine switches
 * levels. Texture%s that are requested before the next frame ends are retained in the cache.
 * Texture%s that were not referenced during that frame are released.
 *
 * This is used to:
 *   1. Ensure that Texture%s are not deleted while they are in use by GL
 *   2. Reduce texture loads when changing levels
 */
class TextureManager {
public:
    ~TextureManager();

    /**
     * @brief Returns a Texture containing the image at @p path relative to the standard image
     * directory.
     * @param path Platform dependent absolute path of image to get
     */
    TexturePtr getTexture(const QString& path);

    /**
     * @brief Returns a Texture containing the image at @p assetPath relative to the standard asset
     * directory.
     * @param assetPath Path of image to get
     */
    TexturePtr getTextureAsset(const QString& assetPath);

    /**
     * @brief Returns a Texture containing the image at @p imagePath relative to the standard image
     * directory.
     * @param imagePath Path of image to get
     */
    TexturePtr getTextureImage(const QString& imagePath);

    /**
     * @brief Move all Texture%s currently cached onto the deletion list, to be deleted on the next
     * call to processDeletion().
     *
     * If a Texture on the delete list is requested through one of the getTexture() calls, it will
     * move off the delete list and back into the cache.
     * @see processDeletion()
     */
    void markAllTexturesForDeletion();
    /**
     * @brief Release references to all Texture%s on the delete list.
     *
     * This list contains all Texture%s that have not been requested since the last call to
     * markAllTexturesForDeletion().
     */
    void processDeletion();

private:
    // TODO: Switch to QHash.
    QMap<QString, TexturePtr> mTextures;
    QMap<QString, TexturePtr> mDeleteQueue;
};

#endif // TEXTUREMANAGER_H
