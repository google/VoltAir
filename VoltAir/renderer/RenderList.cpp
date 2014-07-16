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

#include "RenderList.h"
#include <algorithm>

RenderList::RenderList() {
}

RenderList::~RenderList() {
}

void RenderList::addNode(RenderNode* node) {
    assert(node);
    mNodeList.push_back(node);
}

void RenderList::reset() {
    mNodeList.clear();
    mRenderList.clear();
}

void RenderList::render() {
    buildRenderList();
    for (RenderNode* renderNode : mRenderList) {
        renderNode->render();
    }
}

void RenderList::buildRenderList() {
    // Add nodes to vector.
    mRenderList.clear();
    mRenderList.reserve(mNodeList.size());
    for (RenderNode* renderNode : mNodeList) {
        // TODO: perform culling.
        mRenderList.push_back(renderNode);
    }

    // Sort the list.
    std::stable_sort(mRenderList.begin(), mRenderList.end(), NodeDepthComparator());
}

bool RenderList::NodeDepthComparator::operator() (const RenderNode* e1,
        const RenderNode* e2) const {
    float diff = e2->zDepth - e1->zDepth;
    return diff > 0.0f;
}
