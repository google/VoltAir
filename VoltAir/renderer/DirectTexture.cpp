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

#include "DirectTexture.h"

DirectTexture::DirectTexture() : DirectTexture(0) {
}

DirectTexture::DirectTexture(GLuint id) : mId(id) {
}

DirectTexture::~DirectTexture() {
}

void DirectTexture::bind() {
    glBindTexture(GL_TEXTURE_2D, mId);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, mMagFilter);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, mMinFilter);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, mHorizontalWrapMode);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, mVerticalWrapMode);
}
void DirectTexture::unbind() {
    glBindTexture(GL_TEXTURE_2D, 0);
}

int DirectTexture::getWidth() const {
    // TODO: Implement. Requires GL query.
    return 0;
}

int DirectTexture::getHeight() const {
    // TODO: Implement. Requires GL query.
    return 0;
}

GLint DirectTexture::getMagnificationFilter() {
    return mMagFilter;
}

void DirectTexture::setMagnificationFilter(GLint value) {
    // TODO: Support updating if texture is bound.
    mMagFilter = value;
}

GLint DirectTexture::getMinificationFilter() {
    return mMinFilter;
}

void DirectTexture::setMinificationFilter(GLint value) {
    // TODO: Support updating if texture is bound.
    mMinFilter = value;
}

GLint DirectTexture::getHorizontalWrapMode() {
    return mHorizontalWrapMode;
}

void DirectTexture::setHorizontalWrapMode(GLint value) {
    // TODO: Support updating if texture is bound.
    mHorizontalWrapMode = value;
}

GLint DirectTexture::getVerticalWrapMode() {
    return mVerticalWrapMode;
}

void DirectTexture::setVerticalWrapMode(GLint value) {
    // TODO: Support updating if texture is bound.
    mVerticalWrapMode = value;
}
