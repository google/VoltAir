#
# Copyright (C) 2014 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CONFIG += staticlib

# TODO: limit this scope of this to just the headers/sources in this file.
INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/ControllerEvent.h \
    $$PWD/ControllerFactory.h \
    $$PWD/ControllerManager.h \
    $$PWD/InputRouter.h \
    $$PWD/InputScheme.h \
    $$PWD/InputUtil.h \
    $$PWD/JoystickAxisCodes.h \
    $$PWD/JoystickAxisScheme.h \
    $$PWD/KeyCodes.h \
    $$PWD/KeyScheme.h \
    $$PWD/TriggerAxisCodes.h \
    $$PWD/TriggerAxisScheme.h \
    $$PWD/VirtualController.h \
    $$PWD/routers/GamepadRouter.h \
    $$PWD/routers/KeyboardRouter.h \
    $$PWD/routers/TouchNavigationRouter.h \

SOURCES +=  \
    $$PWD/ControllerEvent.cpp \
    $$PWD/ControllerManager.cpp \
    $$PWD/InputRouter.cpp \
    $$PWD/VirtualController.cpp \
    $$PWD/routers/GamepadRouter.cpp \
    $$PWD/routers/KeyboardRouter.cpp \
    $$PWD/routers/TouchNavigationRouter.cpp \
