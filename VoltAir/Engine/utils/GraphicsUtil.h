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

#ifndef GRAPHICSUTIL_H
#define GRAPHICSUTIL_H

class QOpenGLFunctions;

/**
 * @ingroup Engine
 * @brief Frequently used, static, graphics-related utility functions.
 */
namespace GraphicsUtil
{

/**
 * @brief Returns a pointer to the cross-platform OpenGL ES 2.0 API functions, creating and
 * initializing them if necessary.
 */
QOpenGLFunctions* getOpenGLFunctions();

} // namespace GraphicsUtil

#endif // GRAPHICSUTIL_H
