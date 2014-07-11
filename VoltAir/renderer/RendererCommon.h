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

#ifndef RENDERERCOMMON_H
#define RENDERERCOMMON_H

/**
 * @ingroup Renderer
 * @file RendererCommon.h
 * @brief Header declaring and including types common to renderer classes such as Vector2. Also
 * includes GL headers and forward declarations for renderer types.
 */

#if defined(__ANDROID__)
#include "GLES2/gl2.h"
#elif defined(__APPLE__)
#include "gl.h"
#include "glext.h"
#else
#include "GL/gl.h"
#include "GL/glext.h"
#endif

#include "PointerDeclarations.h"


// TODO: This can be replaced with a more proper math library.
#include "Box2D/Common/b2Math.h"

/**
 * @brief 4x4 float matrix, whose layout is compatible with GL.
 */
typedef float Matrix4[16];
/**
 * @brief 2D float vector, whose layout is compatible with GL.
 */
typedef b2Vec2 Vector2;

#endif // RENDERERCOMMON_H
