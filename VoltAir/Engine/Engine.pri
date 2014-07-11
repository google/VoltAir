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

engine_qml_folder.source = Engine/qml
engine_qml_folder.target = Engine
engine_shaders_folder.source = Engine/shaders
engine_shaders_folder.target = Engine
DEPLOYMENTFOLDERS += engine_qml_folder engine_shaders_folder

CONFIG += staticlib

defined ( LIQUIDFUN ) {
    LIQUIDFUN_DIR = $$(LIQUIDFUN)
} else {
    # Note: This needs to simply be changed to "liquidfun" for release.
    LIQUIDFUN_DIR = $$PWD/../../../../libs/liquidfun
}

# TODO: limit this scope of this to just the headers/sources in this file.
INCLUDEPATH += $$PWD $$PWD/../..

HEADERS += \
    $$PWD/../../third_party/poly2tri/poly2tri/common/shapes.h \
    $$PWD/../../third_party/poly2tri/poly2tri/common/utils.h \
    $$PWD/../../third_party/poly2tri/poly2tri/poly2tri.h \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/advancing_front.h \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/cdt.h \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/sweep.h \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/sweep_context.h \
    $$PWD/Achievement.h \
    $$PWD/Actor.h \
    $$PWD/Body.h \
    $$PWD/Camera.h \
    $$PWD/Engine.h \
    $$PWD/Environment.h \
    $$PWD/Joint.h \
    $$PWD/Joints.h \
    $$PWD/Level.h \
    $$PWD/LevelInfo.h \
    $$PWD/Logic.h \
    $$PWD/audio/SoundEffectInstance.h \
    $$PWD/audio/SoundManager.h \
    $$PWD/bodies/CircleBody.h \
    $$PWD/bodies/PolygonBody.h \
    $$PWD/graphics/AnimatedImageRenderer.h \
    $$PWD/graphics/Graphic.h \
    $$PWD/graphics/ImageRenderer.h \
    $$PWD/graphics/LiquidFunDebugDraw.h \
    $$PWD/graphics/ParallaxTransformItem.h \
    $$PWD/graphics/ParticleRendererItem.h \
    $$PWD/graphics/PolygonMesh.h \
    $$PWD/graphics/PolygonVertexAttributeArray.h \
    $$PWD/graphics/TerrainMaterialDef.h \
    $$PWD/graphics/TerrainMaterials.h \
    $$PWD/graphics/TerrainMeshRenderer.h \
    $$PWD/graphics/TerrainShader.h \
    $$PWD/graphics/TextureManager.h \
    $$PWD/inputs/InputArea.h \
    $$PWD/inputs/TouchScreenButtonController.h \
    $$PWD/joints/RevoluteJoint.h \
    $$PWD/joints/WeldJoint.h \
    $$PWD/logics/CameraMovementLogic.h \
    $$PWD/logics/InterpolationLogic.h \
    $$PWD/logics/JavaScriptLogic.h \
    $$PWD/logics/StopwatchLogic.h \
    $$PWD/logics/Trigger.h \
    $$PWD/logics/events/ContactEvent.h \
    $$PWD/logics/triggers/ContactTrigger.h \
    $$PWD/particles/Particle.h \
    $$PWD/particles/ParticleLayer.h \
    $$PWD/particles/WaterParticle.h \
    $$PWD/particles/WaterParticleSet.h \
    $$PWD/utils/Box2dUtil.h \
    $$PWD/utils/Constants.h \
    $$PWD/utils/ContactListener.h \
    $$PWD/utils/DebugMetricsMonitor.h \
    $$PWD/utils/DestructionListener.h \
    $$PWD/utils/GraphicsUtil.h \
    $$PWD/utils/QmlUtil.h \
    $$PWD/utils/Util.h \
    $$PWD/utils/VariantConverter.h \

SOURCES +=  \
    $$PWD/../../third_party/poly2tri/poly2tri/common/shapes.cc \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/advancing_front.cc \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/cdt.cc \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/sweep.cc \
    $$PWD/../../third_party/poly2tri/poly2tri/sweep/sweep_context.cc \
    $$PWD/Achievement.cpp \
    $$PWD/Actor.cpp \
    $$PWD/Body.cpp \
    $$PWD/Camera.cpp \
    $$PWD/Engine.cpp \
    $$PWD/Environment.cpp \
    $$PWD/Joint.cpp \
    $$PWD/Joints.cpp \
    $$PWD/Level.cpp \
    $$PWD/LevelInfo.cpp \
    $$PWD/Logic.cpp \
    $$PWD/audio/SoundEffectInstance.cpp \
    $$PWD/audio/SoundManager.cpp \
    $$PWD/bodies/CircleBody.cpp \
    $$PWD/bodies/PolygonBody.cpp \
    $$PWD/graphics/AnimatedImageRenderer.cpp \
    $$PWD/graphics/Graphic.cpp \
    $$PWD/graphics/ImageRenderer.cpp \
    $$PWD/graphics/LiquidFunDebugDraw.cpp \
    $$PWD/graphics/ParallaxTransformItem.cpp \
    $$PWD/graphics/ParticleRendererItem.cpp \
    $$PWD/graphics/PolygonMesh.cpp \
    $$PWD/graphics/PolygonVertexAttributeArray.cpp \
    $$PWD/graphics/TerrainMaterialDef.cpp \
    $$PWD/graphics/TerrainMaterials.cpp \
    $$PWD/graphics/TerrainMeshRenderer.cpp \
    $$PWD/graphics/TerrainShader.cpp \
    $$PWD/graphics/TextureManager.cpp \
    $$PWD/inputs/InputArea.cpp \
    $$PWD/inputs/TouchScreenButtonController.cpp \
    $$PWD/joints/RevoluteJoint.cpp \
    $$PWD/joints/WeldJoint.cpp \
    $$PWD/logics/CameraMovementLogic.cpp \
    $$PWD/logics/InterpolationLogic.cpp \
    $$PWD/logics/JavaScriptLogic.cpp \
    $$PWD/logics/StopwatchLogic.cpp \
    $$PWD/logics/Trigger.cpp \
    $$PWD/logics/events/ContactEvent.cpp \
    $$PWD/logics/triggers/ContactTrigger.cpp \
    $$PWD/particles/Particle.cpp \
    $$PWD/particles/ParticleLayer.cpp \
    $$PWD/particles/WaterParticle.cpp \
    $$PWD/particles/WaterParticleSet.cpp \
    $$PWD/utils/Constants.cpp \
    $$PWD/utils/ContactListener.cpp \
    $$PWD/utils/DebugMetricsMonitor.cpp \
    $$PWD/utils/DestructionListener.cpp \
    $$PWD/utils/GraphicsUtil.cpp \
    $$PWD/utils/QmlUtil.cpp \
    $$PWD/utils/Util.cpp \

android {
    HEADERS += \
        $$PWD/android/AndroidActivity.h \
        $$PWD/android/SelfDetachingJNIEnv.h \

    SOURCES += \
        $$PWD/android/AndroidActivity.cpp \
        $$PWD/android/AndroidJNI.cpp \
        $$PWD/android/SelfDetachingJNIEnv.cpp \

    # Have QtCreator list our Java and XML source files for easy editing
    OTHER_FILES += \
        $$PWD/android/deploy/AndroidManifest.xml \
        $$PWD/android/deploy/res/drawable-ldpi/icon.png \
        $$PWD/android/deploy/res/drawable-xhdpi/logo.png \
        $$PWD/android/deploy/res/values/voltairactivity_strings.xml \
        $$PWD/android/deploy/res/values/googleplayserviceshelper_strings.xml \
        $$PWD/android/deploy/res/values/ids.xml \
        $$PWD/android/deploy/res/xml/voltair_tracker.xml \
        $$PWD/android/deploy/src/com/google/fpl/voltair/VoltAirActivity.java \
        $$PWD/android/deploy/src/com/google/fpl/utils/GooglePlayServicesHelper.java \
        $$PWD/android/deploy/src/com/google/fpl/utils/SoundManager.java \

    LIBS += \
        $$LIQUIDFUN_DIR/Box2D/obj/local/armeabi-v7a/libliquidfun_static.a \

    QMAKE_CXXFLAGS_WARN_ON += -Wno-pragmas
}
macx {
    LIBS += \
        $$LIQUIDFUN_DIR/Box2D/Box2D/Debug/libliquidfun.a \
}

# For linux-specific statements, there is a slightly more complex predicate.
unix:!mac:!android {
    LIBS += \
        $$LIQUIDFUN_DIR/Box2D/Box2D/Release/libliquidfun.a \
}

# Have Qt pick up our custom android source
android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android/deploy
}

INCLUDEPATH += \
    $$PWD/$$LIQUIDFUN_DIR/Box2D \

