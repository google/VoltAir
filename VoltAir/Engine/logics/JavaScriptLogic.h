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

#ifndef JAVASCRIPTLOGIC_H
#define JAVASCRIPTLOGIC_H

#include "Logic.h"

/**
 * @ingroup Engine
 * @ingroup QmlQObject
 * @brief Extends Logic to include custom behavior defined via JavaScript code in Qml files.
 *
 * JavaScriptLogic entities in the Qml item tree merely need to define <tt>function initFunc()</tt>
 * or <tt>function updateFunc()</tt> dynamically to be executed in place of a typical dedicated C++
 * init() or update() method.
 */
class JavaScriptLogic : public Logic {
    Q_OBJECT
public:
    /**
     * @brief Invokes a JavaScript function @c initFunc() if it is declaritively defined in Qml.
     */
    virtual void init() override;
    /**
     * @brief Invokes a JavaScript function @c updateFunc() if it is declaritively defined in Qml.
     */
    virtual void update() override;

private:
    enum Method {
        Init,
        Update
    };
    void invokeJavaScript(Method method);
};
Q_DECLARE_METATYPE(JavaScriptLogic*)

#endif // JAVASCRIPTLOGIC_H
