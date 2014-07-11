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

#include <QQuickWindow>
#include <QSGTexture>
#include "Engine.h"
#include "TextureManager.h"
#include "renderer/Texture.h"
#include "utils/Util.h"

/**
 * Implementation of Texture based on QSGTexture.
 */
class TextureImpl : public Texture {
public:
    explicit TextureImpl(QSGTexture* texture);
    virtual ~TextureImpl();

    virtual void bind() override;
    virtual void unbind() override;
    virtual int getWidth() const override;
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
    static QSGTexture::Filtering toFilterMode(GLint value);
    static QSGTexture::Filtering toMipmapFilterMode(GLint value);
    static GLint toMagnificationFilterMode(QSGTexture::Filtering value);
    static GLint toMinificationFilterMode(QSGTexture::Filtering filtering,
            QSGTexture::Filtering mipmapFiltering);
    static GLint toNearestMinificationFilterMode(QSGTexture::Filtering mipmapFiltering);
    static GLint toLinearMinificationFilterMode(QSGTexture::Filtering mipmapFiltering);
    static QSGTexture::WrapMode toWrapMode(GLint value);
    static GLint toWrapMode(QSGTexture::WrapMode value);

    std::unique_ptr<QSGTexture> mTexture;
};

TextureManager::~TextureManager() {
}

TexturePtr TextureManager::getTexture(const QString& path) {
    // Check if we have this cached.
    const TexturePtr& texturePtr = mTextures.value(path);
    if (texturePtr) {
        return texturePtr;
    }
    // Check our deleted map too.
    if (!mDeleteQueue.isEmpty()) {
        const TexturePtr& deletedTexturePtr = mDeleteQueue.value(path);
        if (deletedTexturePtr) {
            // Move this back to the active list.
            TexturePtr strongTexturePtr = deletedTexturePtr;
            mTextures[path] = strongTexturePtr;
            mDeleteQueue.remove(path);
            return strongTexturePtr;
        }
    }

    // We don't have it cached. Load it now.
    if (!QFile(path).exists()) {
        // This file doesn't exist.
        // It will load as a blank texture. We could optionally force it to load a "broken"
        // texture to indicate failure. Qt doesn't by default report texture load failures, so
        // manually log it.
        // TODO: Consider replacing with broken texture.
#if defined(QT_DEBUG)
        qDebug() << "Unable to load missing texture:" << path;
#endif
    } else {
#if defined(QT_DEBUG)
        // qDebug() << "Loading texture:" << path;
#endif
    }

    QQuickWindow* window = Engine::getInstance()->getRoot()->window();
    TexturePtr texture(new TextureImpl(window->createTextureFromImage(QImage(path))));
    texture->setHorizontalWrapMode(GL_CLAMP_TO_EDGE);
    texture->setVerticalWrapMode(GL_CLAMP_TO_EDGE);
    mTextures[path] = texture;
    return texture;
}

TexturePtr TextureManager::getTextureAsset(const QString& assetPath) {
    return getTexture(Util::getPathToAsset(assetPath));
}

TexturePtr TextureManager::getTextureImage(const QString& imagePath) {
    return getTexture(Util::getPathToImage(imagePath));
}

void TextureManager::markAllTexturesForDeletion() {
    // Copy out current textures and clear the cache.
    QMap<QString, TexturePtr> toMark;
    std::swap(mTextures, toMark);

    // Clean up the delete queue and prepare it for additional items.
    processDeletion();

    // Place all textures on the delete queue.
    // We'll check if all other references to each of them were released next frame.
    std::swap(mDeleteQueue, toMark);
}

void TextureManager::processDeletion() {
    // Put all textures that are still in use back in the cache.
    for (auto it = mDeleteQueue.begin(); it != mDeleteQueue.end(); ++it) {
        const QString& path = it.key();
        const TexturePtr& texture = it.value();
        if (!texture.unique()) {
            // This texture is now in use (someone else holds a ref to it).
            // Put it back in the cache map.
            mTextures[path] = texture;
            // TODO: commenting out debugging until we figure out correct mechanism.
#if defined(QT_DEBUG)
            // qDebug() << "Retaining texture:" << path;
#endif
        } else {
            // We hold the only reference to this texture, so delete it.
#if defined(QT_DEBUG)
            // qDebug() << "Deleting texture:" << path;
#endif
        }
    }
    mDeleteQueue.clear();
}

TextureImpl::TextureImpl(QSGTexture* texture) : mTexture(texture) {
    // Make sure our defaults are the same as defaults for GL.
    texture->setFiltering(QSGTexture::Linear);
    texture->setMipmapFiltering(QSGTexture::Nearest);
    texture->setHorizontalWrapMode(QSGTexture::Repeat);
    texture->setVerticalWrapMode(QSGTexture::Repeat);
}

TextureImpl::~TextureImpl() {
}

void TextureImpl::bind() {
    if (!mTexture) {
        return;
    }
    mTexture->bind();
}

void TextureImpl::unbind() {
    if (!mTexture) {
        return;
    }
    glBindTexture(GL_TEXTURE_2D, 0);
}

int TextureImpl::getWidth() const {
    return mTexture->textureSize().width();
}

int TextureImpl::getHeight() const {
    return mTexture->textureSize().height();
}

GLint TextureImpl::getMagnificationFilter() {
    return toMagnificationFilterMode(mTexture->filtering());
}

void TextureImpl::setMagnificationFilter(GLint) {
    // QSGTexture does no support separate min / mag filters, so only setMinimizationFiltering has
    // any effect.
}

GLint TextureImpl::getMinificationFilter() {
    return toMinificationFilterMode(mTexture->filtering(), mTexture->mipmapFiltering());
}

void TextureImpl::setMinificationFilter(GLint value) {
    mTexture->setFiltering(toFilterMode(value));
    // TODO: Provide finer control over mip-mapping.
    mTexture->setMipmapFiltering(toMipmapFilterMode(value));
}

GLint TextureImpl::getHorizontalWrapMode() {
    return toWrapMode(mTexture->horizontalWrapMode());
}

void TextureImpl::setHorizontalWrapMode(GLint value) {
    mTexture->setHorizontalWrapMode(toWrapMode(value));
}

GLint TextureImpl::getVerticalWrapMode() {
    return toWrapMode(mTexture->verticalWrapMode());
}

void TextureImpl::setVerticalWrapMode(GLint value) {
    mTexture->setVerticalWrapMode(toWrapMode(value));
}

QSGTexture::Filtering TextureImpl::toFilterMode(GLint value) {
    switch (value) {
    case GL_NONE:
        return QSGTexture::None;
    case GL_NEAREST:
    case GL_NEAREST_MIPMAP_NEAREST:
    case GL_LINEAR_MIPMAP_NEAREST:
        return QSGTexture::Nearest;
    default:
    case GL_LINEAR:
    case GL_NEAREST_MIPMAP_LINEAR:
    case GL_LINEAR_MIPMAP_LINEAR:
        return QSGTexture::Linear;
    }
}

QSGTexture::Filtering TextureImpl::toMipmapFilterMode(GLint value) {
    switch (value) {
    case GL_NONE:
    case GL_NEAREST:
    case GL_LINEAR:
        return QSGTexture::None;
    case GL_NEAREST_MIPMAP_NEAREST:
    case GL_NEAREST_MIPMAP_LINEAR:
        return QSGTexture::Nearest;
    case GL_LINEAR_MIPMAP_NEAREST:
    case GL_LINEAR_MIPMAP_LINEAR:
        return QSGTexture::Linear;
    default:
        return QSGTexture::Linear;
    }
}

GLint TextureImpl::toMagnificationFilterMode(QSGTexture::Filtering value) {
    switch (value) {
    case QSGTexture::None:
        return GL_NONE;
    case QSGTexture::Nearest:
        return GL_NEAREST;
    case QSGTexture::Linear:
        return GL_LINEAR;
    default:
        return GL_LINEAR;
    }
}

GLint TextureImpl::toMinificationFilterMode(QSGTexture::Filtering filtering,
        QSGTexture::Filtering mipmapFiltering) {
    switch (filtering) {
    case QSGTexture::None:
        return GL_NONE;
    case QSGTexture::Nearest:
        return toNearestMinificationFilterMode(mipmapFiltering);
    case QSGTexture::Linear:
        return toLinearMinificationFilterMode(mipmapFiltering);
    default:
        return toLinearMinificationFilterMode(mipmapFiltering);
    }
}

GLint TextureImpl::toNearestMinificationFilterMode(QSGTexture::Filtering mipmapFiltering) {
    switch (mipmapFiltering) {
    case QSGTexture::None:
        return GL_NEAREST;
    case QSGTexture::Nearest:
        return GL_NEAREST_MIPMAP_NEAREST;
    case QSGTexture::Linear:
        return GL_LINEAR_MIPMAP_NEAREST;
    default:
        return GL_NEAREST;
    }
}

GLint TextureImpl::toLinearMinificationFilterMode(QSGTexture::Filtering mipmapFiltering) {
    switch (mipmapFiltering) {
    case QSGTexture::None:
        return GL_LINEAR;
    case QSGTexture::Nearest:
        return GL_NEAREST_MIPMAP_LINEAR;
    case QSGTexture::Linear:
        return GL_LINEAR_MIPMAP_LINEAR;
    default:
        return GL_LINEAR;
    }
}

QSGTexture::WrapMode TextureImpl::toWrapMode(GLint value) {
    switch (value) {
    case GL_CLAMP_TO_EDGE:
        return QSGTexture::ClampToEdge;
    case GL_REPEAT:
        return QSGTexture::Repeat;
    default:
        return QSGTexture::Repeat;
    }
}

GLint TextureImpl::toWrapMode(QSGTexture::WrapMode value) {
    switch (value) {
    case QSGTexture::ClampToEdge:
        return GL_CLAMP_TO_EDGE;
    case QSGTexture::Repeat:
        return GL_REPEAT;
    default:
        return GL_REPEAT;
    }
}
