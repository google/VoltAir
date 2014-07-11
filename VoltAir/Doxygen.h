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

/*
 * This file contains only information to be parsed by doxygen, such as grouping definitions.
 */

/**
 * @mainpage VoltAir API Documentation
 */

/**
 * @defgroup QQuickItem QQuickItem definitions
 * @brief @c Item%s that can be instantiated in QML.
 */

/**
 * @defgroup QmlQObject QObjects instantiable in QML
 * @brief @c QObject%s that can be instantiated in QML.
 */

/**
 * @defgroup GameInput GameInput library classes
 * @brief Modules that comprise the GameInput library for handling controller input.
 */

/**
 * @defgroup JNINativeMethod Native callback functions
 * @brief Native callback functions loaded for and used by the Android activity.
 *
 * All JNINativeMethod functions will be registered and loaded into the JVM in JNI_OnLoad.
 */

/**
 * @defgroup Renderer Game-specific OpenGL renderer and helper classes
 * @brief Wrappers around GL resources, and classes managing draw calls and render lists.
 *
 * This module is a simple game world renderer focused on 2D scenes. It is separated into three
 * main sections:
 * - GL object wrappers (Shader, Texture, Mesh)
 * - GL draw call and state management (Renderer)
 * - Simple scene graph management (RenderList, RenderNode)
 *
 * These are designed to be modular and reused / repurposed. For simplicity this renderer does not
 * perform batching or other optimizations. Our usage also does not rely on texture sheets. With
 * some modifications these could be added.
 *
 * VoltAir maintains a Renderer, and a single RenderList in Engine. Each Graphic, which represents a
 * visual element of an Actor in the game world, is then requested to queue RenderNode%s to that
 * RenderList. Engine then renders these on Qt's render thread. Because rendering occurs on a
 * separate thread from physics and game logic, each Graphic is required to perform synchronization
 * and double buffering, which is partially accomplished through InstancedShader%s (for example
 * TerrainShader).
 */

/**
 * @defgroup Engine Engine library classes
 * @brief Modules that define the game Engine
 *
 * These are the classes that represent VoltAir's game engine. The files are entirely located
 * in the "Engine" directory of the source code tree. Although the code in this sub-tree is
 * almost entirely devoid of any references to the game, it is not entirely clear of them,
 * unfortunately. There is still some separation work to be done.
 */
