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

#include <Engine/utils/Util.h>
#include <GameInput/JoystickAxisScheme.h>
#include <GameInput/KeyScheme.h>
#include <GameInput/TriggerAxisScheme.h>
#include <GameInput/VirtualController.h>
#include <GameInput/routers/GamepadRouter.h>
#include <GameInput/routers/KeyboardRouter.h>
#include <GameInput/routers/TouchNavigationRouter.h>
#include <algorithm>
#include "PlayerManager.h"

PlayerManager* PlayerManager::sInstance = nullptr;

PlayerManager::PlayerManager(QObject* parent)
        : QObject(parent), ControllerManager::DeviceConnectionListener() {
    ControllerManager::getInstance()->registerDeviceConnectionListener(this);

    // Schemes for Keyboard Input
    // NOTE: The ordering of these schemes is independent of players. That is, which of these
    // schemes become active is dependent only upon which inputs occur (i.e. which players join)
    // first, so order / naming here is irrelevant.
    KeyboardRouter::KeyboardControllerFactory schemeFactory1(
            KeyScheme({
                { KEYCODE_DPAD_LEFT, LEFT },
                { KEYCODE_DPAD_RIGHT, RIGHT },
                { KEYCODE_DPAD_DOWN, MAGNETIZE },
                { KEYCODE_L, LEFT },
                { KEYCODE_APOSTROPHE, RIGHT },
                { KEYCODE_SEMICOLON, MAGNETIZE },
            }));
    KeyboardRouter::KeyboardControllerFactory schemeFactory2(
            KeyScheme({
                { KEYCODE_O, LEFT },
                { KEYCODE_LEFT_BRACKET, RIGHT },
                { KEYCODE_P, MAGNETIZE },
            }));
    KeyboardRouter::KeyboardControllerFactory schemeFactory3(
            KeyScheme({
                { KEYCODE_A, LEFT },
                { KEYCODE_D, RIGHT },
                { KEYCODE_S, MAGNETIZE },
            }));
    KeyboardRouter::KeyboardControllerFactory schemeFactory4(
            KeyScheme({
                { KEYCODE_Q, LEFT },
                { KEYCODE_E, RIGHT },
                { KEYCODE_W, MAGNETIZE },
            }));
    bool addedFactory = KeyboardRouter::getInstance()->addKeyboardControllerFactory(schemeFactory1);
    Q_ASSERT(addedFactory);
    addedFactory = KeyboardRouter::getInstance()->addKeyboardControllerFactory(schemeFactory2);
    Q_ASSERT(addedFactory);
    addedFactory = KeyboardRouter::getInstance()->addKeyboardControllerFactory(schemeFactory3);
    Q_ASSERT(addedFactory);
    addedFactory = KeyboardRouter::getInstance()->addKeyboardControllerFactory(schemeFactory4);
    Q_ASSERT(addedFactory);

    // Scheme for Gamepad Input
    GamepadRouter::GamepadControllerFactory gamepadFactory(
            KeyScheme({
                { KEYCODE_DPAD_LEFT, LEFT },
                { KEYCODE_DPAD_RIGHT, RIGHT },
                { KEYCODE_BUTTON_A, MAGNETIZE },
                { KEYCODE_BUTTON_L1, MAGNETIZE },
                { KEYCODE_BUTTON_R1, MAGNETIZE },
            }),
            JoystickAxisScheme({
                { LEFT_ANALOG_X, HORIZONTAL },
            }),
            TriggerAxisScheme({
                { LEFT_TRIGGER, LEFT },
                { RIGHT_TRIGGER, RIGHT },
            }));
    addedFactory = GamepadRouter::getInstance()->addGamepadControllerFactory(gamepadFactory);
    Q_ASSERT(addedFactory);

    // Scheme for touch navigation input.
    TouchNavigationRouter::TouchNavigationControllerFactory touchNavigationFactory(
            KeyScheme({
                { KEYCODE_DPAD_LEFT, LEFT },
                { KEYCODE_DPAD_RIGHT, RIGHT },
                { KEYCODE_DPAD_CENTER, MAGNETIZE },
            }),
            JoystickAxisScheme({
                { TOUCH_NAVIGATION_X, HORIZONTAL },
            }));
    addedFactory = TouchNavigationRouter::getInstance()->addTouchNavigationControllerFactory(
            touchNavigationFactory);
    Q_ASSERT(addedFactory);

#ifndef QT_DEBUG
    (void) addedFactory;
#endif
}

PlayerManager::~PlayerManager() {
    // Need to remove the dangling reference to this class since it is being destroyed
    ControllerManager::getInstance()->unregisterDeviceConnectionListener(this);
}

void PlayerManager::reset() {
    // Calling this will notify us below of devices being disconnected.
    ControllerManager::getInstance()->reset();
}

VirtualController* PlayerManager::getPlayerController(int player) const {
    if (!mPlayerToDeviceMap.contains(player)) {
        return nullptr;
    }
    return ControllerManager::getInstance()->getController(mPlayerToDeviceMap[player]);
}

float PlayerManager::getHorizontal(int player) const {
    // Check the player is available since below a deviceId of 0 is valid.
    if (!mPlayerToDeviceMap.contains(player)) {
        return 0.0f;
    }

    VirtualController* controller = getPlayerController(player);

    // Assume leftSupport == rightSupport
    int leftSupport = controller->getActionSupport(LEFT);
    int horizontalSupport = controller->getActionSupport(HORIZONTAL);

    // Compute horizontal according to different action supports
    float horizontal = 0.0f;
    if (leftSupport & VirtualController::BINARY_ACTION) {
        if (controller->isActionActivated(LEFT)) {
            horizontal -= 1.0f;
        }
        if (controller->isActionActivated(RIGHT)) {
            horizontal += 1.0f;
        }
    }
    if (leftSupport & VirtualController::UNIT_INTERVAL_ACTION) {
        horizontal -= controller->getActionUnitIntervalValue(LEFT);
        horizontal += controller->getActionUnitIntervalValue(RIGHT);
    }
    if (horizontalSupport & VirtualController::SYMMETRIC_UNIT_INTERVAL_ACTION) {
        horizontal += controller->getActionSymmetricUnitIntervalValue(HORIZONTAL);
    }

    return Util::clamp(horizontal, -1.0f, 1.0f);
}

bool PlayerManager::isMagnetized(int player) const {
    // Check the player is available since below a deviceId of 0 is valid.
    if (!mPlayerToDeviceMap.contains(player)) {
        return false;
    }

    VirtualController* controller = getPlayerController(player);

    int magnetizeSupport = controller->getActionSupport(MAGNETIZE);

    // Evaluate magnetized according to different action supports
    bool magnetized = false;
    if (magnetizeSupport & VirtualController::BINARY_ACTION) {
        magnetized = magnetized || controller->isActionActivated(MAGNETIZE);
    }
    if (magnetizeSupport & VirtualController::UNIT_INTERVAL_ACTION) {
        magnetized = magnetized || controller->getActionUnitIntervalValue(MAGNETIZE) > 0;
    }

    return magnetized;
}

void PlayerManager::onDeviceConnectionChanged(int deviceId, bool isConnected) {
    if (isConnected) {
        addPlayerController(deviceId);
    } else {
        removePlayerController(deviceId);
    }
}

PlayerManager* PlayerManager::getInstance() {
    if (!sInstance) {
        sInstance = new PlayerManager();
    }
    return sInstance;
}

void PlayerManager::addPlayerController(int deviceId) {
    int playerId = mMinAvailablePlayerId;
    mPlayerToDeviceMap[playerId] = deviceId;
    mDeviceToPlayerMap[deviceId] = playerId;

    // Increment the minimum available player id until you find an available id
    // This must now be the minimum available player id since by definition the
    // starting id was the minimum before.
    while (mPlayerToDeviceMap.contains(++mMinAvailablePlayerId)) {
    }

    emit playerActivationChanged(playerId, true);
}

void PlayerManager::removePlayerController(int deviceId) {
    if (!mDeviceToPlayerMap.contains(deviceId)) {
        return;
    }

    int playerId = mDeviceToPlayerMap[deviceId];
    mPlayerToDeviceMap.remove(playerId);
    mDeviceToPlayerMap.remove(deviceId);

    // Check if this id becoming available is now the minimum id available
    mMinAvailablePlayerId = std::min(mMinAvailablePlayerId, playerId);

    emit playerActivationChanged(playerId, false);
}
