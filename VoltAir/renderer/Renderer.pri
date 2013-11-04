#
# Copyright (C) 2014 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CONFIG += staticlib

HEADERS += \
    $$PWD/Attribute.h \
    $$PWD/AttributeArray.h \
    $$PWD/AttributeSet.h \
    $$PWD/DebugRenderer.h \
    $$PWD/DirectTexture.h \
    $$PWD/InstancedShader.h \
    $$PWD/InstancedShaderBase.h \
    $$PWD/Mesh.h \
    $$PWD/MeshInstance.h \
    $$PWD/PointerDeclarations.h \
    $$PWD/RenderList.h \
    $$PWD/RenderNode.h \
    $$PWD/RenderableInterface.h \
    $$PWD/Renderer.h \
    $$PWD/RendererCommon.h \
    $$PWD/Shader.h \
    $$PWD/ShaderBase.h \
    $$PWD/SingletonInstancedShaderBase.h \
    $$PWD/SpriteShader.h \
    $$PWD/Texture.h \

SOURCES +=  \
    $$PWD/Attribute.cpp \
    $$PWD/AttributeSet.cpp \
    $$PWD/DebugRenderer.cpp \
    $$PWD/DirectTexture.cpp \
    $$PWD/InstancedShader.cpp \
    $$PWD/Mesh.cpp \
    $$PWD/MeshInstance.cpp \
    $$PWD/Renderer.cpp \
    $$PWD/RenderList.cpp \
    $$PWD/RenderNode.cpp \
    $$PWD/Shader.cpp \
    $$PWD/ShaderBase.cpp \
    $$PWD/SpriteShader.cpp \
