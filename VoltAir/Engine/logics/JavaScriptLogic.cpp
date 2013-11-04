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

#include "JavaScriptLogic.h"
#include "utils/Util.h"

void JavaScriptLogic::init() {
    Logic::init();
    invokeJavaScript(Init);
}

void JavaScriptLogic::update() {
    invokeJavaScript(Update);
}

void JavaScriptLogic::invokeJavaScript(Method method) {
    if (method == Init && Util::javaScriptFuncExists(this, "initFunc")) {
        QMetaObject::invokeMethod(this, "initFunc");
    } else if (method == Update && Util::javaScriptFuncExists(this, "updateFunc")) {
        QMetaObject::invokeMethod(this, "updateFunc");
    }
}
