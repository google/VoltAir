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

#include <qmath.h>
#include "Camera.h"
#include "Engine.h"
#include "Graphic.h"

Graphic::Graphic(QQuickItem* parent) : QQuickItem(parent) {
}

void Graphic::getFlattenedRenderParameters(RenderParameters* parameters) {
    Camera* camera = Engine::getInstance()->getCamera();
    QPointF worldPos = camera->mapFromItem(this, QPointF(0.0f, 0.0f));
    // TODO: Consider computing scale as well.
    // Recursivly accumulate parent properties.
    getFlattenedRenderParametersRecursive(camera, this, parameters);
    parameters->worldPosition = worldPos;
    parameters->rotation = qDegreesToRadians(parameters->rotation);
}

void Graphic::getFlattenedRenderParametersRecursive(QQuickItem* root, QQuickItem* item,
        RenderParameters* parameters) {
    // TODO: zDepth is slightly off (QQuick only sorts among siblings).
    parameters->rotation += item->rotation();
    parameters->zDepth += item->z();
    parameters->opacity *= item->opacity();

    QQuickItem* parent = item->parentItem();
    if (item == root || !parent) {
        return;
    }
    getFlattenedRenderParametersRecursive(root, parent, parameters);
}

void Graphic::synchronizeForRendering(RenderList*) {
}
