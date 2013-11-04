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

#ifndef INPUTUTIL_H
#define INPUTUTIL_H

#include <algorithm>

/**
 * @ingroup GameInput
 * @brief Namespace containing frequently used static utility functions for the GameInput library.
 */
namespace InputUtil {

/**
 * @brief Returns the value @p a clamped between @p min and @p max.
 * @param a Value to clamp
 * @param min Minimum value to return
 * @param max Maximum value to return
 */
template <typename T>
const T& clamp(const T& a, const T& min, const T& max) {
    return std::max<T>(min, std::min<T>(max, a));
}

}

#endif // INPUTUTIL_H
