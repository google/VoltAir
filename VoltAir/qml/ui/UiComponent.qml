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

import QtQuick 2.2
import VoltAir 1.0

/**
 * @brief Base class for UI sub-components that provides an API for showing, hiding, and focus
 * changes.
 */
KeyNavFocusArea {
    /**
     * @brief State transitioned to when show() is called.
     * @note It is the inheriting component's responsibility to change the @c opacity of this
     * component from @c 0.0 to @c 1.0 when transitioning to #showState.
     */
    property string showState
    /**
     * @brief State transitioned to when hide() is called.
     * @note It is the inheriting component's responsibility to change the @c opacity of this
     * component from @c 1.0 to @c 0.0 when transitioning to #hideState.
     */
    property string hideState
    /**
     * @brief Time, in milliseconds, that the UiComponent takes to show.
     * @note This duration is a guideline and should be used by the implementing component, but is
     * in no way strictly enforced.
     */
    property int showDuration
    /**
     * @brief Time, in milliseconds, that the UiComponent takes to hide.
     * @note This duration is a guideline and should be used by the implementing component, but is
     * in no way strictly enforced.
     */
    property int hideDuration
    /**
     * @brief Whether or not the UiComponent is shown or is transitioning to the #showState.
     */
    property bool showing: false
    /**
     * @brief Whether or not the UiComponent should gain focus when shown.
     */
    property bool shouldGainFocus: true
    /**
     * @brief Item that the component returns focus to if this UiComponent gained focus previously.
     */
    property Item returnFocusTo: parent

    /**
     * @brief Emitted when the UiComponent has completely shown.
     */
    signal showCompleted()
    /**
     * @brief Emitted when the UiComponent has completely hidden.
     */
    signal hideCompleted()

    /**
     * @brief Shows the UiComponent over @p time milliseconds.
     * @param type:int time Duration taken to show the UiComponent
     */
    function show(time) {
        if (!showing) {
            showDuration = time
            enabled = true
            if (shouldGainFocus) {
                focus = true
            }
            state = showState
            showing = true
            if (objectName) {
                Engine.setTrackerScreenName(objectName)
            }
        }
    }

    /**
     * @brief Hides the UiComponent over @p time milliseconds.
     * @param type:int time Duration taken to hide the UiComponent
     */
    function hide(time) {
        if (showing) {
            hideDuration = time
            if (focus && enabled && returnFocusTo) {
                returnFocusTo.focus = true
            }
            // UiComponents are immediately disabled as soon as they are hidden.
            enabled = false
            state = hideState
            showing = false
        }
    }

    // UiComponents are initially not showing or functioning.
    state: hideState
    opacity: 0
    enabled: false

    onFocusChanged: {
        if (showing && focus) {
            enabled = true
        }
    }
}
