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

#ifndef GRAPHIC_H
#define GRAPHIC_H

#include <QQuickItem>

class RenderList;

/**
 * @ingroup QQuickItem
 * @brief Base class for visual elements which are part of the game scene, and are rendered through
 * Renderer.
 *
 * Graphic serves as the main bridge between Renderer and the Qml item tree, which contains our
 * Actor%s. It provides a clean synchronization point where RenderNode%s can be queued, and render
 * resources buffered.
 */
class Graphic : public QQuickItem {
    Q_OBJECT
public:
    /**
     * @brief Construct a Graphic.
     * @param parent Parent item
     */
    explicit Graphic(QQuickItem* parent = nullptr);
    /**
     * @brief Synchronize this Graphic for rendering, adding any RenderNode%s to @p renderList, and
     * buffering any data that will be needed on the render thread for rendering.
     * @param renderList RenderList to add RenderNode%s to for rendering in sorted order
     */
    virtual void synchronizeForRendering(RenderList* renderList);

protected:
    /**
     * @brief Struct containing the accumulated result of getFlattenedRenderParameters().
     */
    struct RenderParameters {
        /**
         * @brief World position of this Graphic.
         */
        QPointF worldPosition;
        /**
         * @brief Rotation in world space of this Graphic.
         */
        float rotation = 0.0f;
        /**
         * @brief Opacity of this Graphic, with @c 0.0f being fully transparent, and @c 1.0f being
         * opaque.
         */
        float opacity = 1.0f;
        /**
         * @brief Z-depth of this Graphic, to be used for sorting.
         */
        float zDepth = 0.0f;
    };
    /**
     * @brief Compute the rendering parameters and transform of this Graphic by moving up the
     * @c QQuickItem tree and accumulating results.
     *
     * Position, rotation, and opacity are computed by multiplying together and collapsing parent
     * transforms and values. Z-depth is computed by adding together parent @c z property values.
     * @note The treatment of @c z differs from QtQuick. QtQuick normally uses @c z to sort items
     * among siblings. By adding together parent @c z values, sorting becomes global, and each
     * child's @c z value becomes a z-offset.
     * @param parameters RenderParameters struct to write results to
     */
    void getFlattenedRenderParameters(RenderParameters* parameters);

private:
    void getFlattenedRenderParametersRecursive(QQuickItem* root, QQuickItem* item,
            RenderParameters* parameters);
};
Q_DECLARE_METATYPE(Graphic*)

#endif // GRAPHIC_H
