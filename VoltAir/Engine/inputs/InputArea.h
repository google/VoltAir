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

#ifndef INPUTAREA_H
#define INPUTAREA_H

#include <GameInput/KeyCodes.h>
#include <QKeyEvent>
#include <QMap>
#include <QQuickItem>
#include <QSet>

/**
 * @ingroup Engine
 * @ingroup QQuickItem
 * @brief Ui module for gaining basic input event (i.e. keyboard) support on non-Android devices.
 *
 * On non-Android devices, this item, when given focus or along a focused path in the Qml item tree,
 * intercepts QKeyEvent%s, converts them into their associated ControllerEvent%s, and passes them
 * to the KeyboardManager for handling.
 * @note InputArea must ignore QKeyEvent%s on Android, and instead handle them separately in
 * AndroidActivity. The problem is Qt translates sequences of Android @c MotionEvent%s occasionally
 * into QKeyEvent%s that are difficult to correlate due to lack of device Id on QEvent%s. As
 * a result, even though a gamepad-related controller was spawned for the Android @c MotionEvent%s
 * in AndroidActivity, we would end up spawning a second keyboard-related controller for the Qt
 * system's translated QKeyEvent if we did not ignore the QKeyEvent%s on Android.
 * Thus, the full solution adopted here and in AndroidActivity is, on Android, to not let InputArea
 * spawn controllers (i.e. route events to ControllerManager%s). Instead, AndroidActivity captures
 * all input events (both @c KeyEvent%s and @c MotionEvent%s), translating and routing them
 * appropriately. However, we leave the InputArea code to do translation for other non-Android
 * platforms.
 */
class InputArea : public QQuickItem {
    Q_OBJECT
public:
    /**
     * @brief Defines an additional set of key codes to extend @c Qt::Key.
     * @note At the time of writing this class, the highest @c Qt::Key enum value is currently
     * @c Qt::Key_Cancel @c (0x01020001), which Key_X gives plenty of buffer room between.
     */
    Q_ENUMS(Key_X)
    enum Key_X {
        /**
         * @brief Represents a gamepad "B" button.
         */
        Key_Button_B = 0x01030000,
    };

    /**
     * @brief Constructs an InputArea.
     * @param parent Parent item
     */
    explicit InputArea(QQuickItem* parent = 0);

    /**
     * @brief Returns the KeyCode that corresponds @c Qt::Key code.
     * @param qtKeyCode @c Qt::Key code to convert
     */
    static KeyCode convertQtKeyCode(int qtKeyCode);

protected:
    /**
     * @brief Intercept QKeyEvent press and process the event.
     *
     * If the converted ControllerEvent is not handled by the KeyboardManager, then @p event is
     * allowed to continue propagation; otherwise, @p event is accepted.
     * @param event Key press event to handle
     */
    virtual void keyPressEvent(QKeyEvent* event) override;
    /**
     * @brief Intercept QKeyEvent release and process the event.
     *
     * If the converted ControllerEvent is not handled by the KeyboardManager, then @p event is
     * allowed to continue propagation; otherwise, @p event is accepted.
     * @param event Key release event to handle
     */
    virtual void keyReleaseEvent(QKeyEvent* event) override;

private:
    static QMap<int, KeyCode> sQtKeyConversionMap;
};
Q_DECLARE_METATYPE(InputArea*)

#endif // INPUTAREA_H
