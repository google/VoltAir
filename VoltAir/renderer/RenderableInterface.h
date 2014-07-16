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

#ifndef RENDERABLEINTERFACE_H
#define RENDERABLEINTERFACE_H

struct RenderNode;

/**
 * @ingroup Renderer
 * @brief Callback set in a RenderNode which can be used to issues draw calls.
 */
class RenderableInterface {
public:
    virtual ~RenderableInterface() { }
    /**
     * @brief Renders the associated node.
     *
     * This method should be implemented to issue GL draw calls to render the visuals associated
     * with the given RenderNode @p node. This can be done using the draw calls in Renderer,
     * (i.e. Renderer::drawMesh()), direct GL calls, or some other mechanism. It is up to the user
     * to ensure GL state is correctly preserved as necessary.
     * @note The parameter @p node can be used to render multiple RenderNode%s in a single
     * implementer.
     * @param node RenderNode that is being rendered
     */
    virtual void render(RenderNode* node) = 0;
};

#endif // RENDERABLEINTERFACE_H
