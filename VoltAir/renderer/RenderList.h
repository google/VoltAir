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

#ifndef RENDERLIST_H
#define RENDERLIST_H

#include "RenderNode.h"
#include "RendererCommon.h"
#include <vector>

/**
 * @ingroup Renderer
 * @brief List of RenderNode%s, sorted by z-depth for rendering.
 *
 * RenderNode%s describe parts of the scene that need to perform rendering. This container class
 * stores and sorts them. Currently this list does not support complex mutation operations so its
 * list is intended to be rebuilt every frame.
 *
 * Once RenderNode%s are added to the list, a call to render() will render these nodes in sorted
 * order through a call to RenderNode::render(). RenderNode%s with larger RenderNode::zDepth values
 * are drawn after those with lower z-depths, resulting in them appearing on top.
 */
class RenderList {
public:
    /**
     * @brief Construct an empty RenderList.
     */
    RenderList();
    ~RenderList();

    /**
     * @brief Add a RenderNode to this RenderList.
     * @param node RenderNode to add
     */
    void addNode(RenderNode* node);
    /**
     * @brief Clear this RenderList.
     */
    void reset();
    /**
     * @brief Draw RenderNode%s in sorted order, with larger z-depths appearing on top.
     * @note It is expected that a valid Renderer be set as current using
     * Renderer::attachAsCurrent().
     */
    void render();
private:
    struct NodeDepthComparator {
        bool operator() (const RenderNode* e1, const RenderNode* e2) const;
    };

    void buildRenderList();

    std::vector<RenderNode*> mNodeList;
    std::vector<RenderNode*> mRenderList;
};

#endif // RENDERLIST_H
