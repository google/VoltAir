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

#include <GameInput/ControllerEvent.h>
#include <GameInput/routers/KeyboardRouter.h>
#include "InputArea.h"
#include "TouchScreenButtonController.h"
#include "utils/Util.h"

TouchScreenButtonController::TouchScreenButtonController(QQuickItem* parent)
        : QQuickItem(parent), mTouchScreenDeviceId(Util::getDeviceTouchScreenDeviceId()) {
}

void TouchScreenButtonController::onKeyDown(int keyCode) {
    ControllerEvent event(mTouchScreenDeviceId);
    event.setKeyState(InputArea::convertQtKeyCode(keyCode), true);
    KeyboardRouter::getInstance()->routeControllerEvent(&event);
}

void TouchScreenButtonController::onKeyUp(int keyCode) {
    ControllerEvent event(mTouchScreenDeviceId);
    event.setKeyState(InputArea::convertQtKeyCode(keyCode), false);
    KeyboardRouter::getInstance()->routeControllerEvent(&event);
}
