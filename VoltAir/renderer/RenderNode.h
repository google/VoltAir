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

#ifndef RENDERNODE_H
#define RENDERNODE_H

#include "MeshInstance.h"
#include "RenderableInterface.h"
#include "RendererCommon.h"
#include "Shader.h"

/**
 * @ingroup Renderer
 * @brief Node which queues a callback (RenderableInterface) or MeshInstance for rendering.
 *
 * RenderNode%s are added to a RenderList, which stores and sorts nodes by #zDepth. To queue a
 * callback, set #callback to non-null. To queue a MeshInstance, set #shader and #mesh to non-null.
 * A queued MeshInstance and Shader will be rendered through a call to Renderer::drawMesh().
 */
struct RenderNode {
    /**
     * @brief Z-depth value used for sorting nodes in a RenderList.
     */
    float zDepth = 0.0f;
    /**
     * @brief Shader to draw #mesh with, if set.
     */
    ShaderPtr shader;
    /**
     * @brief MeshInstance to queue for rendering.
     *
     * If both #shader and #mesh are set, they will be rendered through a call to
     * Renderer::drawMesh() by render().
     */
    MeshInstancePtr mesh;
    /**
     * @brief RenderableInterface queued for rendering.
     *
     * The queued callback will be fired by a call to render().
     */
    RenderableInterface* callback = nullptr;

    /**
     * @brief Renders the queued callback or MeshInstance.
     *
     * This method is called by RenderList. To render MeshInstances with this method correctly, a
     * valid Renderer should be set as current using Renderer::attachAsCurrent().
     */
    void render();
};

#endif // RENDERNODE_H
