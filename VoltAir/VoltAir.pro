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

# Add more folders to ship with the application, here
# TODO: This manner of handling deployment folders needs some love. Sub-projects that want to deploy
# folders must make sure their var names don't collide with these.
assets_folder.source = assets
assets_folder.target = .
qml_folder.source = qml
qml_folder.target = .
DEPLOYMENTFOLDERS = assets_folder qml_folder

defined ( LIQUIDFUN ) {
    LIQUIDFUN_DIR = $$(LIQUIDFUN)
} else {
    # TODO: change to "liquidfun" for release.
    LIQUIDFUN_DIR = ../../../libs/liquidfun
}

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH +=

CONFIG += c++11
QT += multimedia qml quick
DEFINES += GL_GLEXT_PROTOTYPES

HEADERS += \
    DebugManager.h \
    Doxygen.h \
    Game.h \
    LevelProgression.h \
    LevelProgressionList.h \
    PlayerProfile.h \
    QmlConstants.h \
    UiInternal.h \
    inputs/PlayerManager.h \
    logics/AcceleratorLogic.h \
    logics/ActorEmitterLogic.h \
    logics/EmitterLogic.h \
    logics/GameInputLogic.h \
    logics/MagneticAttractorLogic.h \
    logics/MagneticHighlightLogic.h \
    logics/ParticleEmitterLogic.h \
    logics/PickupLogic.h \
    logics/RollingMovementLogic.h \
    logics/WaterBodyLogic.h \

INCLUDEPATH += \
    $$LIQUIDFUN_DIR/Box2D \

SOURCES += \
    DebugManager.cpp \
    Game.cpp \
    LevelProgression.cpp \
    LevelProgressionList.cpp \
    PlayerProfile.cpp \
    UiInternal.cpp \
    inputs/PlayerManager.cpp \
    logics/AcceleratorLogic.cpp \
    logics/ActorEmitterLogic.cpp \
    logics/EmitterLogic.cpp \
    logics/GameInputLogic.cpp \
    logics/MagneticAttractorLogic.cpp \
    logics/MagneticHighlightLogic.cpp \
    logics/ParticleEmitterLogic.cpp \
    logics/PickupLogic.cpp \
    logics/RollingMovementLogic.cpp \
    logics/WaterBodyLogic.cpp \
    main.cpp \

include(Engine/Engine.pri)
include(GameInput/GameInput.pri)
include(renderer/Renderer.pri)

include(deployment.pri)

RESOURCES += \

cache()
