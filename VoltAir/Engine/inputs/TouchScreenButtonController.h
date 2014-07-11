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

#ifndef TOUCHSCREENBUTTONCONTROLLER_H
#define TOUCHSCREENBUTTONCONTROLLER_H

#include <QQuickItem>

/**
 * @ingroup Engine
 * @ingroup QQuickItem
 * @brief Ui element item that defines the basis for a visual and touch based VirtualController.
 *
 * This class converts the device touch screen into a VirtualController that is controlled through
 * visual elements and touch interaction with those elements. Users of this class can skin the
 * controller as necessary, intercepting touch events with @c MultiPointTouchArea, and reporting
 * the corresponding button presses / releases to this base element via onKeyDown() and onKeyUp().
 * @note This class functions as a thin wrapper around a keyboard-related VirtualController,
 * constructing relevant ControllerEvent%s and forwarding them through KeyboardManager. As a result,
 * unmapped key events (e.g. "back") do not propagate through the Qml item tree as a normal input
 * @c QKeyEvent would, and should not be used.  Instead, buttons that are defined to have that
 * functionality should instead raise the appropriate signals (e.g. "pause" or "back") and be wired
 * in appropriately.
 */
class TouchScreenButtonController : public QQuickItem {
    Q_OBJECT
public:
    /**
     * @brief Constructs a TouchScreenButtonController for the inherent device touch screen.
     * @param parent Parent item
     */
    explicit TouchScreenButtonController(QQuickItem* parent = nullptr);

public slots:
    /**
     * @brief Notifies TouchScreenButtonController of a button being pressed.
     * @param keyCode Key code associated with the button
     */
    void onKeyDown(int keyCode);
    /**
     * @brief Notifies TouchScreenButtonController of a button being released.
     * @param keyCode Key code associated with the button
     */
    void onKeyUp(int keyCode);

private:
    int mTouchScreenDeviceId = -1;
};
Q_DECLARE_METATYPE(TouchScreenButtonController*)

#endif // TOUCHSCREENBUTTONCONTROLLER_H
