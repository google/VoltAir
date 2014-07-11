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

#ifndef TEXTURE_H
#define TEXTURE_H

#include "RendererCommon.h"

/**
 * @ingroup Renderer
 * @brief Texture abstract base class.
 *
 * Texture%s can either be used on their own as wrappers around GL textures or in conjunction with
 * Renderer. If used with Renderer, bind() and unbind() will be called as needed when selected.
 * @note See OpenGLES documentation of
 * <a href="https://www.khronos.org/opengles/sdk/docs/man/xhtml/glTexParameter.xml">glTexParameter()
 * </a> for a discussion of filter and wrap modes.
 */
class Texture {
public:
    virtual ~Texture() { }

    /**
     * @brief Binds this Texture to the current active texture stage.
     *
     * The active texture stage is selected through Renderer::selectTexture(), or a call to
     * @c glActiveTexture().
     */
    virtual void bind() = 0;
    /**
     * @brief Unbinds this Texture from the current active texture stage.
     */
    virtual void unbind() = 0;
    /**
     * @brief Returns the width of this Texture in texels.
     */
    virtual int getWidth() const = 0;
    /**
     * @brief Returns the height of this Texture in texels.
     */
    virtual int getHeight() const = 0;
    /**
     * @brief Returns the magnification filter mode applied to this Texture.
     */
    virtual GLint getMagnificationFilter() = 0;
    /**
     * @brief Sets the magnification filter mode applied to this Texture.
     * @param value Filter mode to set
     */
    virtual void setMagnificationFilter(GLint value) = 0;
    /**
     * @brief Returns the minification filter mode applied to this Texture.
     */
    virtual GLint getMinificationFilter() = 0;
    /**
     * @brief Sets the minification filter mode applied to this Texture.
     * @param value Filter mode to set
     */
    virtual void setMinificationFilter(GLint value) = 0;
    /**
     * @brief Returns the wrap mode to apply to the Texture horizontally.
     */
    virtual GLint getHorizontalWrapMode() = 0;
    /**
     * @brief Sets the wrap mode to apply to the Texture horizontally.
     * @param value Wrap mode
     */
    virtual void setHorizontalWrapMode(GLint value) = 0;
    /**
     * @brief Returns the wrap mode to apply to the Texture vertically.
     */
    virtual GLint getVerticalWrapMode() = 0;
    /**
     * @brief Sets the wrap mode to apply to the Texture vertically.
     * @param value Wrap mode
     */
    virtual void setVerticalWrapMode(GLint value) = 0;
};

#endif // TEXTURE_H
