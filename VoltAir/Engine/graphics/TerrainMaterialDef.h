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

#ifndef TERRAINMATERIALDEF_H
#define TERRAINMATERIALDEF_H

#include <QVariant>

/**
 * @ingroup Engine
 * @brief Definition of a terrain material.
 *
 * A terrain material blends up to three textures:
 *   - Base texture
 *   - Bevel texture
 *   - Edge texture
 *
 * The base texture is tiled across the entire terrain mesh. The edge texture is used to mask out
 * the outer edges of the mesh. This adds antialiasing which also help create small variations that
 * break up the edge visually. The bevel texture is overlayed on top of these. It is stretched from
 * the outer edge inwards to some depth, and is blended using the selected mode (see
 * setBlendMode()). This allows the bevel texture to be used to create a variety effects such as:
 *   - Rim lighting
 *   - Top soil or surface texturing
 *
 * TerrainMaterialDef%s are loaded from JSON by class TerrainMaterials and consumed by
 * TerrainMeshRenderer. Terrain materials are referenced by name.
 */
class TerrainMaterialDef {
public:
    /**
     * @brief Blend modes used to mix the bevel texture with the base texture.
     */
    enum class BlendMode {
        /**
         * @brief Additive blending.
         *
         * Source color values are added on to the destination.
         */
        Add,
        /**
         * @brief Multiplicative blending.
         *
         * Source color values are multiplied with the destination.
         */
        Multiply,
        /**
         * @brief Overlay blending.
         *
         * Source color values are multiplied by @c 2.0f, and then with the destination. This
         * results in source values over @c 0.5f brightening the destination, and source values
         * under @c 0.5f darkening it. Values of exactly @c 0.5f leave the destination unchanged.
         * This effect is performed per color channel allowing color tinting similar to
         * BlendMode::Multiply. The alpha channel determines how much to mix this computed color
         * with the destination.
         */
        Overlay,
        /**
         * @brief Source over blending.
         *
         * Source colors are linearly mixed with the destination based on source alpha.
         */
        Blend,
        /**
         * @brief Total number of blending modes.
         * @note This value is not a valid blend mode, and should not be used in setBlendMode().
         */
        Count,
    };

    /**
     * @brief Construct a default TerrainMaterialDef.
     */
    TerrainMaterialDef();

    /**
     * @brief Returns the name of this material.
     */
    const QString& getName() const { return mName; }
    /**
     * @brief Sets the name of this material, used to identify it and look it up.
     * @param value Name to set
     */
    void setName(const QString& value);
    /**
     * @brief Returns the graphics root relative path to the base texture.
     */
    const QString& getBaseTexture() const { return mBaseTexture; }
    /**
     * @brief Sets the graphics root relative path to the base texture.
     * @param value Path to texture to set
     */
    void setBaseTexture(const QString& value);
    /**
     * @brief Returns the graphics root relative path to the bevel texture.
     */
    const QString& getBevelTexture() const { return mBevelTexture; }
    /**
     * @brief Sets the graphics root relative path to the bevel texture.
     * @param value Path to texture to set
     */
    void setBevelTexture(const QString& value);
    /**
     * @brief Returns the graphics root relative path to the edge texture.
     */
    const QString& getEdgeTexture() const { return mEdgeTexture; }
    /**
     * @brief Sets the graphics root relative path to the edge texture.
     * @param value Path to texture to set
     */
    void setEdgeTexture(const QString& value);
    /**
     * @brief Whether or not the base texture should be tiled past the first instance.
     */
    bool isTiled() const { return mTiled; }
    /**
     * @brief Sets whether or not the base texture should be tiled past the first instance.
     * @param value @c true to tile
     * @default{true}
     */
    void setTiled(bool value);
    /**
     * @brief Whether or not the alpha channel on the base texture should be used for alpha
     * blending.
     */
    bool isOpaque() const { return mOpaque; }
    /**
     * @brief Returns whether or not the alpha channel on the base texture should be used for alpha
     * blending.
     *
     * When this is @c true, the base texture is treated as an opaque texture and the only alpha
     * rendered is where the edge texture has alpha. When this is @c false, the base texture's
     * alpha channel is used as a per-pixel alpha, and multiplied with the edge texture's alpha to
     * produce an overall per-pixel transparency.
     * @param value @c true to treat the base texture as opaque
     * @default{true}
     */
    void setOpaque(bool value);
    /**
     * @brief Returns the width of the edge, in world coordinates.
     * @see setEdgeWidth()
     */
    float getEdgeWidth() const { return mEdgeWidth; }
    /**
     * @brief Sets the width of the edge, in world coordinates.
     *
     * This specifies the width of the triangle strip around the circumference of the terrain. This
     * strip is where the edge texture gets combined with the base texture (and potentially bevel
     * texture) to produce a soft edge. A value of @c 0.0f disables the generation of the edge
     * triangle strip (reducing the amount of geometry drawn, but introducing aliasing artifacts).
     * @note This is used exclusively by the editor to generate the render mesh.
     * @param value Width to set
     * @default{0.0f}
     */
    void setEdgeWidth(float value);
    /**
     * @brief Returns the offset to apply to the start of the edge polygon's texture coordinates.
     * @see setEdgeOffset()
     */
    float getEdgeOffset() const { return mEdgeOffset; }
    /**
     * @brief Sets the offset to apply to the start of the edge polygon's texture coordinates, to
     * shift the start of the edge polygon where a texture seam occurs.
     * @note This is used exclusively by the editor to generate the render mesh.
     * @param value Offset to set
     * @default{0.0f}
     */
    void setEdgeOffset(float value);
    /**
     * @brief Returns the scaling factor on edge texture coordinates.
     */
    float getEdgeScale() const { return mEdgeScale; }
    /**
     * @brief Sets the scaling factor on edge texture coordinates, controlling the tightness of
     * tiling.
     *
     * Larger values increases the size of each tile segment, spacing them out. Smaller values
     * decrease the size of each tile segment, tighting the tiling pattern.
     * @note This is used exclusively by the editor to generate the render mesh.
     * @default{1.0f}
     * @param value Scaling factor to set
     */
    void setEdgeScale(float value);
    /**
     * @brief Returns the horizontal scaling factor on bevel texture coordinates.
     */
    float getBevelScale() const { return mBevelScale; }
    /**
     * @brief Sets the horizontal scaling factor on bevel texture coordinates, controlling the
     * tightness of tiling.
     *
     * Larger values increases the size of each tile segment, spacing them out. Smaller values
     * decrease the size of each tile segment, tighting the tiling pattern.
     * @note This is used exclusively by the editor to generate the render mesh.
     * @default{1.0f}
     * @param value Scaling factor to set
     */
    void setBevelScale(float value);
    /**
     * @brief Returns the blend mode used to composite the bevel texture over the base texture.
     */
    BlendMode getBlendMode() const { return mBlendMode; }
    /**
     * @brief Returns the blend mode used to composite the bevel texture over the base texture.
     * @see #BlendMode
     * @param value BlendMode to use
     * @default{BlendMode::Add}
     */
    void setBlendMode(BlendMode value);

    /**
     * @brief Sets all properties in this TerrainMaterialDef to their default.
     */
    void reset();
    /**
     * @brief Initializes the terrain material properties from a JSON-based property map.
     * @param jsonValue JSON-based property map to initialize from
     */
    void mergeFromJson(const QVariantMap& jsonValue);

    /**
     * @brief Returns a string converted into the corresponding BlendMode.
     * @param str String to parse
     * @param defaultValue Default BlendMode to return if @p str is not recognized
     */
    static BlendMode parseBlendMode(const QString& str, BlendMode defaultValue);

private:
    QString mName;
    QString mBaseTexture;
    QString mBevelTexture;
    QString mEdgeTexture;

    bool mTiled = true;
    bool mOpaque = true;
    float mEdgeWidth = 0.0f;
    float mEdgeOffset = 0.0f;
    float mEdgeScale = 1.0f;
    float mBevelScale = 1.0f;

    BlendMode mBlendMode = BlendMode::Add;
};

#endif // TERRAINMATERIALDEF_H
