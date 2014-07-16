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

#include <Engine/Actor.h>
#include <Engine/Body.h>
#include <Engine/Camera.h>
#include <Engine/Engine.h>
#include <Engine/Environment.h>
#include <Engine/Joint.h>
#include <Engine/Joints.h>
#include <Engine/Level.h>
#include <Engine/LevelInfo.h>
#include <Engine/Logic.h>
#include <Engine/audio/SoundManager.h>
#include <Engine/bodies/CircleBody.h>
#include <Engine/bodies/PolygonBody.h>
#include <Engine/graphics/AnimatedImageRenderer.h>
#include <Engine/graphics/ImageRenderer.h>
#include <Engine/graphics/ParallaxTransformItem.h>
#include <Engine/graphics/ParticleRendererItem.h>
#include <Engine/graphics/PolygonMesh.h>
#include <Engine/graphics/PolygonVertexAttributeArray.h>
#include <Engine/graphics/TerrainMeshRenderer.h>
#include <Engine/inputs/InputArea.h>
#include <Engine/inputs/TouchScreenButtonController.h>
#include <Engine/joints/RevoluteJoint.h>
#include <Engine/joints/WeldJoint.h>
#include <Engine/logics/CameraMovementLogic.h>
#include <Engine/logics/InterpolationLogic.h>
#include <Engine/logics/JavaScriptLogic.h>
#include <Engine/logics/StopwatchLogic.h>
#include <Engine/logics/Trigger.h>
#include <Engine/logics/events/ContactEvent.h>
#include <Engine/logics/triggers/ContactTrigger.h>
#include <Engine/particles/ParticleLayer.h>
#include <Engine/utils/DebugMetricsMonitor.h>
#include <Engine/utils/QmlUtil.h>
#include <QDir>
#include <QtGui/QGuiApplication>
#include "Game.h"
#include "LevelProgression.h"
#include "LevelProgressionList.h"
#include "QmlConstants.h"
#include "UiInternal.h"
#include "logics/AcceleratorLogic.h"
#include "logics/ActorEmitterLogic.h"
#include "logics/GameInputLogic.h"
#include "logics/MagneticAttractorLogic.h"
#include "logics/MagneticHighlightLogic.h"
#include "logics/ParticleEmitterLogic.h"
#include "logics/PickupLogic.h"
#include "logics/RollingMovementLogic.h"
#include "logics/WaterBodyLogic.h"

static QObject* getEngineInstance(QQmlEngine*, QJSEngine*) {
    return Engine::getInstance();
}

static QObject* getGameInstance(QQmlEngine*, QJSEngine*) {
    return Game::getInstance();
}

static QObject* getJointsInstance(QQmlEngine*, QJSEngine*) {
    return Joints::getInstance();
}

static QObject* getQmlUtilInstance(QQmlEngine*, QJSEngine*) {
    return QmlUtil::getInstance();
}

static void registerQmlFilesInDir(const QString& dirPath, const char* libStr) {
    QDir dir(Util::getPathToAsset(dirPath));
    for (const QString& path : dir.entryList()) {
        if (!path.endsWith(".qml", Qt::CaseInsensitive)) {
            continue;
        }
        QString qmlFile = QString::fromLatin1("%1/%2").arg(dirPath).arg(path);
        QString qmlName = path;
        qmlName.remove(qmlName.length() - 4, 4);
        std::string qmlNameStr = qmlName.toStdString();
        qmlRegisterType(Util::getUrlPathToAsset(qmlFile), libStr, 1, 0, qmlNameStr.c_str());
    }
}

int main(int argc, char* argv[]) {
    // @uri VoltAir
    static const char* QML_LIBSTR = "VoltAir";
    QGuiApplication app(argc, argv);

    // Initialize QCoreApplication metadata
    QCoreApplication::setOrganizationName("FunPropulsionLabs");
    QCoreApplication::setOrganizationDomain("google.com");
    QCoreApplication::setApplicationName(QML_LIBSTR);

    qmlRegisterType<Actor>(QML_LIBSTR, 1, 0, "Actor");
    qmlRegisterType<Body>(QML_LIBSTR, 1, 0, "Body");
    qmlRegisterType<Camera>(QML_LIBSTR, 1, 0, "Camera");
    qmlRegisterType<Environment>(QML_LIBSTR, 1, 0, "Environment");
    qmlRegisterType<Joint>(QML_LIBSTR, 1, 0, "Joint");
    qmlRegisterType<Level>(QML_LIBSTR, 1, 0, "Level");
    qmlRegisterType<LevelInfo>(QML_LIBSTR, 1, 0, "LevelInfo");
    qmlRegisterType<LevelProgression>(QML_LIBSTR, 1, 0, "LevelProgression");
    qmlRegisterType<LevelProgressionList>(QML_LIBSTR, 1, 0, "LevelProgressionList");
    qmlRegisterType<Logic>(QML_LIBSTR, 1, 0, "Logic");
    qmlRegisterType<UiInternal>(QML_LIBSTR, 1, 0, "UiInternal");

    // audio
    qmlRegisterType<SoundManager>(QML_LIBSTR, 1, 0, "SoundManager");

    // bodies
    qmlRegisterType<CircleBody>(QML_LIBSTR, 1, 0, "CircleBody");
    qmlRegisterType<PolygonBody>(QML_LIBSTR, 1, 0, "PolygonBody");

    // graphics
    qmlRegisterType<AnimatedImageRenderer>(QML_LIBSTR, 1, 0, "AnimatedImageRenderer");
    qmlRegisterType<ImageRenderer>(QML_LIBSTR, 1, 0, "ImageRenderer");
    qmlRegisterType<ParallaxTransformItem>(QML_LIBSTR, 1, 0, "ParallaxTransformItem");
    qmlRegisterType<ParticleRendererItem>(QML_LIBSTR, 1, 0, "ParticleRendererItem");
    qmlRegisterType<PolygonMesh>(QML_LIBSTR, 1, 0, "PolygonMesh");
    qmlRegisterType<PolygonVertexAttributeArray>(QML_LIBSTR, 1, 0, "PolygonVertexAttributeArray");
    qmlRegisterType<TerrainMeshRenderer>(QML_LIBSTR, 1, 0, "TerrainMeshRenderer");

    // inputs
    qmlRegisterType<InputArea>(QML_LIBSTR, 1, 0, "InputArea");
    qmlRegisterType<TouchScreenButtonController>(QML_LIBSTR, 1, 0, "TouchScreenButtonController");

    // joints
    qmlRegisterType<RevoluteJoint>(QML_LIBSTR, 1, 0, "RevoluteJoint");
    qmlRegisterType<WeldJoint>(QML_LIBSTR, 1, 0, "WeldJoint");

    // logics
    qmlRegisterType<AcceleratorLogic>(QML_LIBSTR, 1, 0, "AcceleratorLogic");
    qmlRegisterType<ActorEmitterLogic>(QML_LIBSTR, 1, 0, "ActorEmitterLogic");
    qmlRegisterType<CameraMovementLogic>(QML_LIBSTR, 1, 0, "CameraMovementLogic");
    qmlRegisterType<GameInputLogic>(QML_LIBSTR, 1, 0, "GameInputLogic");
    qmlRegisterType<InterpolationLogic>(QML_LIBSTR, 1, 0, "InterpolationLogic");
    qmlRegisterType<JavaScriptLogic>(QML_LIBSTR, 1, 0, "JavaScriptLogic");
    qmlRegisterType<MagneticAttractorLogic>(QML_LIBSTR, 1, 0, "MagneticAttractorLogic");
    qmlRegisterType<MagneticHighlightLogic>(QML_LIBSTR, 1, 0, "MagneticHighlightLogic");
    qmlRegisterType<ParticleEmitterLogic>(QML_LIBSTR, 1, 0, "ParticleEmitterLogic");
    qmlRegisterType<PickupLogic>(QML_LIBSTR, 1, 0, "PickupLogic");
    qmlRegisterType<RollingMovementLogic>(QML_LIBSTR, 1, 0, "RollingMovementLogic");
    qmlRegisterType<StopwatchLogic>(QML_LIBSTR, 1, 0, "StopwatchLogic");
    qmlRegisterType<WaterBodyLogic>(QML_LIBSTR, 1, 0, "WaterBodyLogic");

    // particles
    qmlRegisterType<ParticleLayer>(QML_LIBSTR, 1, 0, "ParticleLayer");

    // triggers
    qmlRegisterType<Trigger>(QML_LIBSTR, 1, 0, "Trigger");
    qmlRegisterType<ContactTrigger>(QML_LIBSTR, 1, 0, "ContactTrigger");

    // triggers/events
    qmlRegisterType<ContactEvent>(QML_LIBSTR, 1, 0, "ContactEvent");
    qmlRegisterType<TriggerEvent>(QML_LIBSTR, 1, 0, "TriggerEvent");

    // utils
    qmlRegisterType<DebugMetricsMonitor>(QML_LIBSTR, 1, 0, "DebugMetricsMonitor");
    qmlRegisterType<QmlConstants>(QML_LIBSTR, 1, 0, "QmlConstants");

    // singletons
    qmlRegisterSingletonType<Engine>(QML_LIBSTR, 1, 0, "Engine", getEngineInstance);
    qmlRegisterSingletonType<Game>(QML_LIBSTR, 1, 0, "Game", getGameInstance);
    qmlRegisterSingletonType<Joints>(QML_LIBSTR, 1, 0, "Joints", getJointsInstance);
    qmlRegisterSingletonType<QmlUtil>(QML_LIBSTR, 1, 0, "Util", getQmlUtilInstance);

    // Add in all our Actor QML files.
    registerQmlFilesInDir("qml", QML_LIBSTR);
    registerQmlFilesInDir("qml/actors", QML_LIBSTR);
    registerQmlFilesInDir("qml/graphics", QML_LIBSTR);

    Engine::getInstance()->init();
    Game::getInstance()->init();

    return app.exec();
}
