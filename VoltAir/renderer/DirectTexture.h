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

#ifndef DIRECTTEXTURE_H
#define DIRECTTEXTURE_H

#include "RendererCommon.h"
#include "Texture.h"

/**
 * @ingroup Renderer
 * @brief A texture which points to a user managed GL texture object.
 *
 * @note The texture object is still logically managed by the creator, and will not be automatically
 * destroyed by this wrapper.
 */
class DirectTexture : public Texture {
public:
    /**
     * @brief Creates a Texture which references the invalid texture object zero.
     */
    DirectTexture();
    /**
     * @brief Creates a Texture which references the given texture object.
     * @param id GL texture object id
     */
    DirectTexture(GLuint id);
    /**
     * @brief Cleans up additional resources owned by this object.
     * @note This destructor does not delete the referenced texture object.
     */
    virtual ~DirectTexture();

    virtual void bind() override;
    virtual void unbind() override;
    /**
     * @brief Current unsupported.
     * @returns Always returns @c 0
     */
    virtual int getWidth() const override;
    /**
     * @brief Current unsupported.
     * @returns Always returns @c 0
     */
    virtual int getHeight() const override;
    virtual GLint getMagnificationFilter() override;
    virtual void setMagnificationFilter(GLint value) override;
    virtual GLint getMinificationFilter() override;
    virtual void setMinificationFilter(GLint value) override;
    virtual GLint getHorizontalWrapMode() override;
    virtual void setHorizontalWrapMode(GLint value) override;
    virtual GLint getVerticalWrapMode() override;
    virtual void setVerticalWrapMode(GLint value) override;

private:
    GLuint mId = 0;
    GLint mMagFilter = GL_LINEAR;
    GLint mMinFilter = GL_NEAREST_MIPMAP_LINEAR;
    GLint mHorizontalWrapMode = GL_REPEAT;
    GLint mVerticalWrapMode = GL_REPEAT;
};

#endif // DIRECTTEXTURE_H
