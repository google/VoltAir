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

#ifndef JOYSTICKAXISCODES_H
#define JOYSTICKAXISCODES_H

/**
 * @ingroup GameInput
 * @brief Codes that uniquely identify each joystick axis, independent of platform.
 */
enum JoystickAxisCode {
    LEFT_ANALOG_X = 0,
    LEFT_ANALOG_Y = 1,
    RIGHT_ANALOG_X = 2,
    RIGHT_ANALOG_Y = 3,
    TOUCH_NAVIGATION_X = 4,
    TOUCH_NAVIGATION_Y = 5,
};

#endif // JOYSTICKAXISCODES_H
