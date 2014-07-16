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

#ifndef ATTRIBUTEARRAY_H
#define ATTRIBUTEARRAY_H

#include "RendererCommon.h"

/**
 * @ingroup Renderer
 * @brief A helper class to access and iterate over an interleaved vertex attribute array.
 *
 * Vertex data is stored as a list of packed vertices. Each vertex is defined by a set of
 * attributes. This means that for any particular attribute, subsequent values are separated by
 * the size of the vertex. This class helps deal with these discontigious arrays as iterable lists.
 */
template<typename T>
class AttributeArray {
public:
    /**
     * @ingroup Renderer
     * @brief An iterator over a vertex attribute array.
     */
    class Iterator {
    public:
        /**
         * @brief Construct an iterator.
         * @param ptr Pointer to the first element of the array
         * @param stride Number of bytes between elements
         */
        Iterator(GLbyte* ptr, int stride) : mPtr(ptr), mStride(stride) {
        }

        /**
         * @brief Compares two iterators to test if they point to the same element.
         * @param other Iterator to compare with this iterator
         * @returns Whether or not the two iterators point to the same element
         */
        bool operator== (const Iterator& other) const {
            return mPtr == other.mPtr;
        }

        /**
         * @brief Compares two iterators to test if they do not point to the same element.
         * @param other Iterator to compare with this iterator
         * @returns Whether or not the two iterators do not point to the same element
         */
        bool operator!= (const Iterator& other) const {
            return !(this->operator ==(other));
        }

        /**
         * @brief Returns a constant reference to the current element.
         * @returns Current element
         */
        const T& operator* () const {
            return *(T*) (mPtr);
        }

        /**
         * @brief Returns a mutable reference to the current element.
         * @returns Current element
         */
        T& operator* () {
            return *(T*) (mPtr);
        }

        /**
         * @brief Arrow operator dereferencing the current element.
         * @returns Current element
         */
        T* operator-> () {
            return (T*) (mPtr);
        }

        /**
         * @brief Moves this iterator forward one element.
         */
        void operator++ () {
            mPtr += mStride;
        }
        /**
         * @brief Prepent moves this iterator forward one element.
         */
        void operator++ (int) {
            mPtr += mStride;
        }
        /**
         * @brief Moves this iterator back one element.
         */
        void operator-- () {
            mPtr -= mStride;
        }
        /**
         * @brief Prepend moves this iterator back one element.
         */
        void operator-- (int) {
            mPtr -= mStride;
        }
    private:
        GLbyte* mPtr = nullptr;
        int mStride = 0;
    };

    /**
     * A mutable iterator over the array.
     */
    typedef Iterator iterator;
    /**
     * A const iterator over the array.
     */
    typedef const Iterator const_iterator;

    /**
     * @brief Constructs an attribute array which is marked as invalid.
     */
    AttributeArray() {
    }
    /**
     * @brief Constructs an attribute array which points to a buffer in memory.
     * @param count Number of elements in the array
     * @param arrayBase Pointer to the first element in the array
     * @param stride Number of bytes between elements
     * @param attribute Pointer to the definition of the attributes in this array
     */
    AttributeArray(int count, GLbyte* arrayBase, int stride, const Attribute* attribute)
            : mCount(count),
              mArrayBase(arrayBase),
              mStride(stride),
              mAttribute(attribute) {
    }

    /**
     * @brief Returns whether this attribute array points to a valid array and can be accessed.
     *
     * If this attribute array was associated with a mesh, an invalid array indicates that the
     * attribute requested did not exist in the mesh.
     * @returns Whether or not this array is valid
     */
    bool isValid() const { return mArrayBase; }
    /**
     * @brief Gets the definition of the attributes in this array.
     * @returns Attribute definition of elements in this array
     */
    const Attribute* getAttribute() const { return mAttribute; }

    /**
     * @brief Gets a constant reference to the element at the given index.
     * @param index Index of the element to get
     * @returns Element at the given index
     */
    const T& operator[] (int index) const {
        assert(isValid() && index >= 0 && index < mCount);
        return *(const T*) (mArrayBase + mStride * index);
    }
    /**
     * @brief Gets a mutable reference to the element at the given index.
     * @param index Index of the element to get
     * @returns Mutable reference to the element at the given index
     */
    T& operator[] (int index) {
        assert(isValid() && index >= 0 && index < mCount);
        return *(T*) (mArrayBase + mStride * index);
    }

    /**
     * @brief Gets a const iterator pointing to the beginning of the array.
     */
    const Iterator begin() const {
        assert(isValid());
        return Iterator(mArrayBase, mStride);
    }
    /**
     * @brief Gets an iterator pointing to the beginning of the array.
     */
    Iterator begin() {
        assert(isValid());
        return Iterator(mArrayBase, mStride);
    }
    /**
     * @brief Gets a const iterator pointing to immediately beyond the last element of the array.
     */
    const Iterator end() const {
        assert(isValid());
        return Iterator(mArrayBase + mStride * mCount, mStride);
    }
    /**
     * @brief Gets an iterator pointing to immediately beyond the last element of the array.
     */
    Iterator end() {
        assert(isValid());
        return Iterator(mArrayBase + mStride * mCount, mStride);
    }

    /**
     * @brief Reinterprets this array as an array of a different type.
     *
     * This method allows the data in the array to be reinterpreted as a different C++ type. For
     * example, if the data being accessed is a 2D float vector, this method can be used to
     * get the array as an AttributeArray with custom 2D vector container elements.
     * @returns Reinterpreted array
     */
    template<typename Y> AttributeArray<Y> getAsType() const {
        return AttributeArray<Y>(mCount, mArrayBase, mStride, mAttribute);
    }
private:
    int mCount = 0;
    GLbyte* mArrayBase = nullptr;
    int mStride = 0;
    const Attribute* mAttribute = nullptr;
};

#endif // ATTRIBUTEARRAY_H
