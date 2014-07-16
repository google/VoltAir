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

#include "Trigger.h"
#include "utils/Util.h"

void Trigger::update() {
    while (!mEventQueue.empty()) {
        handleEvent(mEventQueue.front().get());
        mEventQueue.pop();
    }
}

void Trigger::queueEvent(TriggerEvent* event) {
    mEventQueue.push(std::unique_ptr<TriggerEvent>(event));
}

void Trigger::handleEvent(TriggerEvent* event) {
    if (Util::javaScriptFuncExists(this, "handleEvent")) {
        QMetaObject::invokeMethod(
                this, "handleEvent",
                Qt::DirectConnection, // force invocation in current thread
                Q_ARG(QVariant, event->toVariant()));
    }
}
