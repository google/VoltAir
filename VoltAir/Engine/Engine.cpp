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

#include <QFileInfo>
#include <QGuiApplication>
#include <QMetaObject>
#include <QQmlEngine>
#include <QQuickView>
#include <QScreen>
#include <QTemporaryFile>
#include "Actor.h"
#include "Body.h"
#include "Camera.h"
#include "Engine.h"
#include "Environment.h"
#include "Level.h"
#include "LevelInfo.h"
#include "Logic.h"
#include "audio/SoundManager.h"
#include "graphics/Graphic.h"
#include "graphics/LiquidFunDebugDraw.h"
#include "graphics/TerrainMaterials.h"
#include "graphics/TextureManager.h"
#include "inputs/InputArea.h"
#include "logics/PickupLogic.h"
#include "logics/StopwatchLogic.h"
#include "renderer/DebugRenderer.h"
#include "renderer/RenderList.h"
#include "renderer/Renderer.h"
#include "utils/DebugMetricsMonitor.h"
#include "utils/Util.h"

#ifdef Q_OS_ANDROID
#include "android/AndroidActivity.h"
#endif

const float Engine::UPDATE_FREQUENCY = 60.0f;
const float Engine::TIME_STEP_S = 1 / UPDATE_FREQUENCY;
const float Engine::TIME_STEP_MS = 1000 * TIME_STEP_S;
const int Engine::VELOCITY_ITERATIONS = 6;
const int Engine::POSITION_ITERATIONS = 2;
const int Engine::PARTICLE_ITERATIONS = 1;

Engine* Engine::sInstance = nullptr;

Engine::Engine(QObject* parent) : QObject(parent) {
}

Engine::~Engine() {
}

void Engine::init() {
    if (mIsInitialized) {
        return;
    }

    // Create renderer.
    mRenderer.reset(new Renderer());
    mRenderList.reset(new RenderList());

    // Create window.
    mViewer.reset(new QQuickView());
    mViewer->setSource(Util::getUrlPathToAsset("Engine/qml/main.qml"));
    mViewer->setResizeMode(QQuickView::SizeRootObjectToView);

    // Initially set the window to call glClear for us. This is to prevent an uninitialized frame
    // buffer from being displayed to the user. We prevent the window from calling glClear later
    // so that we can render under it.
    mViewer->setColor(QColor::fromRgba(0x00000000));
    mViewer->setClearBeforeRendering(true);

    // Attempt to select RGB565 with a 16-bit depth buffer.
    // TODO: According to comments in q_createConfigAttributesFromFormat (qeglconvenience.cpp) this
    // doesn't work.
    QSurfaceFormat surfaceFormat;
    surfaceFormat.setSwapBehavior(QSurfaceFormat::DoubleBuffer);
    surfaceFormat.setRedBufferSize(5);
    surfaceFormat.setGreenBufferSize(6);
    surfaceFormat.setBlueBufferSize(5);
    surfaceFormat.setDepthBufferSize(16);
    surfaceFormat.setStencilBufferSize(8);
    surfaceFormat.setAlphaBufferSize(0);
    surfaceFormat.setSamples(0);
    mViewer->setFormat(surfaceFormat);

    showViewer();

    // Load materials.
    mTextureManager.reset(new TextureManager());
    mTerrainMaterials.reset(new TerrainMaterials(Util::getPathToData("materials.json")));
    mSoundManager.reset(new SoundManager(this));

    // Create UI components.
    mInputArea = getRoot()->findChild<InputArea*>("inputArea");
    Q_ASSERT(mInputArea);

    mCamera = mViewer->rootObject()->findChild<Camera*>("camera");
    mLevelLoader = mCamera->findChild<QQuickItem*>("levelLoader");

    // Other connections.
    connect(mViewer.get(), &QQuickView::beforeSynchronizing, this, &Engine::onBeforeSynchronizing,
            Qt::DirectConnection);
    connect(mViewer.get(), &QQuickView::beforeRendering, this, &Engine::onBeforeRendering,
            Qt::DirectConnection);
    connect(mViewer.get(), &QQuickView::afterRendering, this, &Engine::onAfterRendering,
            Qt::DirectConnection);
    connect(mViewer.get(), &QQuickView::afterAnimating, this, &Engine::update,
            Qt::DirectConnection);
    connect(mLevelLoader, SIGNAL(loadCompleted(bool)), this, SLOT(onLoadCompleted(bool)));

    mContactListener.reset(new ContactListener());
    mDestructionListener.reset(new DestructionListener());
    mDebugDraw.reset(new LiquidFunDebugDraw());

    mIsInitialized = true;
}

b2World* Engine::getWorld() const {
    return mLevel ? mLevel->getWorld() : nullptr;
}

QQmlEngine* Engine::getQmlEngine() const {
    return mViewer->engine();
}

QQuickItem* Engine::getRoot() const {
    return mViewer->rootObject();
}

void Engine::addChildItem(QQuickItem* item) {
    item->setParent(mInputArea);
    item->setParentItem(mInputArea);
}

void Engine::setCurrentLevel(Level* level) {
    mLevel = level;
}

void Engine::deleteCurrentLevel() {
    mLevelReady = false;
    if (!mLevel) {
        return;
    }

    // Setting the source property to an empty string causes level to be deleted.
    mLevelLoader->setProperty("source", "");

    mLevel = nullptr;
    invalidateSceneGraphObjectCaches();
    mWorldStepCount = 0;
}

void Engine::queueWorldForDeletion(b2World* world) {
    mWorldToDelete.reset(world);
}

void Engine::startLoad() {
    mTextureManager->markAllTexturesForDeletion();
    deleteCurrentLevel();
    mCamera->updateTransform();
}

void Engine::performLevelChange() {
    // We want to wait at least one sync before changing levels so we can ensure the render list
    // has been cleared.
    if (!mHasNextLevel || mSyncsSinceNextLevelRequest <= 0) {
        return;
    }
    mHasNextLevel = false;
    mSyncsSinceNextLevelRequest = 0;
    startLoad();
    // Setting the "source" property triggers the load.
    mLevelLoader->setProperty("source", Util::getPathToLevel(mNextLevelName));
    mNextLevelName.clear();
}

void Engine::onLoadCompleted(bool success) {
    Q_ASSERT_X(success, "Level load", "File not of correct format");
    if (success) {
        Level* level = qobject_cast<Level*>(mLevelLoader->property("item").value<QObject*>());

        // This is a workaround for a Qt Loader race condition bug whereby sometimes the Loader will
        // create an incorrect level using data long since deleted from a previous load -- even
        // though the source has been correctly set to the new level data. So, for now, we must
        // check that this is indeed the level we intended to load, and, if not, try to load it
        // again (which will cause the one just incorrectly created to be deleted).
        // TODO: Find the root cause of this problem.
        QFileInfo levelFileInfo(Util::getPathToLevel(mInFlightLevelInfo->getFileName()));
        if (level->getFileName() != levelFileInfo.baseName()) {
            qDebug() << "Warning: Loader has incorrectly loaded" << level->getFileName()
                    << "instead of" <<  levelFileInfo.baseName();
            loadLevel(mInFlightLevelInfo);
            return;
        }
        level->setName(mInFlightLevelInfo->getName());

        mLevel = level;

        b2World* world = mLevel->getWorld();
        world->SetContactListener(mContactListener.get());
        world->SetDestructionListener(mDestructionListener.get());
        world->SetDebugDraw(mDebugDraw.get());

        invalidateSceneGraphObjectCaches();
        forEach<Logic>([] (Logic* logic) { logic->init(); });

        int activationThreshold = (level->getPortal())
                ? level->getPortal()->property("activationThreshold").toInt() : 0;

        emit levelChanged(level->getName(), level->getCompletionThreshold(), activationThreshold);

        // If this is a timed level, set up timers and start them rolling.
        mSoundManager->setBGMTrack(SoundManager::EnvironmentalPriority,
                Util::getPathToSound(mInFlightLevelInfo->getEnvironment()->getBGMTrack()));

        // Mark level load complete.
        mLevelReady = true;
    }
}

void Engine::onBeforeSynchronizing() {
    synchronizeForRendering();
}

void Engine::onBeforeRendering() {
    sceneRender();
}

void Engine::onAfterRendering() {
    // We have rendered a frame. Mark the viewer ready for pausing, as we have finished creating
    // our surface.
    mViewerReady = true;
}

void Engine::synchronizeForRendering() {
    // Stop Qt from clearing the back buffer now that we have properly attached to the rendering
    // thread. We need to render beneath it, so the window clearing would obscure our draws. We
    // instead clear the back buffer ourselves in sceneRender().
    mViewer->setClearBeforeRendering(false);

    // Clean up the render list, just in case Qt decided not to render a frame.
    mRenderList->reset();
    mSyncsSinceNextLevelRequest++;

    // Do not render if our level has not been loaded, or we are currently preparing to delete it.
    // We cannot render a level that is about to be deleted because the children of Level (actors,
    // graphics etc.) hold on to resources used by GL, which might get used by our threaded
    // renderer.
    if (!mLevelReady) {
        return;
    }

    // Generate the new render list.
    RenderList* renderList = mRenderList.get();
    forEach<Graphic>([renderList] (Graphic* graphic) {
        graphic->synchronizeForRendering(renderList);
    });

    // Set up our transforms.
    Matrix4 projMat;
    memcpy(projMat, mCamera->getOpenGLViewMatrix().data(), sizeof(Matrix4));
    mRenderer->setProjectionMatrix(projMat);
    mRenderer->getDebugRenderer()->setProjectionMatrix(projMat);

    // Queue up our debug shapes.
    mRenderer->attachAsCurrent();
    debugRender();
    mRenderer->detachAsCurrent();
    mRenderer->getDebugRenderer()->synchronizeForRendering();
}

void Engine::sceneRender() {
    // Set up our GL state.
    float devicePixelRatio = mViewer->devicePixelRatio();
    glViewport(0, 0, mViewer->width() * devicePixelRatio, mViewer->height() * devicePixelRatio);
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
    glDisable(GL_DEPTH_TEST);

    // Set up our renderer.
    mRenderer->attachAsCurrent();
    mRenderer->begin();

    // Render.
    mRenderList->render();
    mRenderer->getDebugRenderer()->render();

    // Cleanup.
    mRenderList->reset();
    mRenderer->end();
    mRenderer->detachAsCurrent();

    glEnable(GL_DEPTH_TEST);
}

void Engine::debugRender() {
    b2World* world = getWorld();
    // Set mDebugHudItem here since the debugHud doesn't exist when Engine's init() is called.
    if (!mDebugHudItem && mViewer) {
        mDebugHudItem = mViewer->rootObject()->findChild<QQuickItem*>("debugHud");
    }
    if (world && mDebugHudItem && mDebugHudItem->property("debugRendererVisible").toBool()) {
        world->DrawDebugData();
    }
}

Engine* Engine::getInstance(bool createIfNecessary) {
    if (!sInstance && createIfNecessary) {
        sInstance = new Engine();
    }
    return sInstance;
}

void Engine::updateCamera() {
    // Recompute transforms.
    // The new transform will be consumed by the render thread using applyTransform.
    mCamera->updateTransform();
    // Copy in transforms now to keep them in sync with the renderer.
    mCamera->applyTransform();
}

void Engine::showViewer() {
    if (mViewer && !mViewer->isVisible()) {
        mViewer->showFullScreen();
    }
}

void Engine::hideViewer() {
    if (mViewerReady && mViewer && mViewer->isVisible()) {
        mViewer->hide();
    }
}

void Engine::update() {
    // We're about to start another frame. It's safe to delete our level, and start cleaning up the
    // old b2World.
    performLevelChange();
    mWorldToDelete.reset();

    emit beforeUpdate();

    if (isPaused()) {
        updateCamera();
        return;
    }

    // If no level has yet to be loaded (which can happen if the queued event
    // hasn't yet been processed) then we must skip
    if (!mLevelReady) {
        return;
    }

    setPhase(LOGICS_PHASE);

    forEach<Logic>([] (Logic* logic) {
        if (logic->isActive()) {
            logic->update();
        }
    });

    setPhase(BEFORE_PHYSICS_PHASE);
    forEach<Body>([] (Body* body) { body->updateBeforePhysics(); });
    setPhase(PHYSICS_PHASE);
    mWorldStepCount++;
    getWorld()->Step(TIME_STEP_S, VELOCITY_ITERATIONS, POSITION_ITERATIONS, PARTICLE_ITERATIONS);
    setPhase(AFTER_PHYSICS_PHASE);
    forEach<Body>([] (Body* body) { body->updateAfterPhysics(); });

    emit afterUpdate();

    setPhase(CAMERA_PHASE);
    updateCamera();
    mTextureManager->processDeletion();

    setPhase(RENDERING_PHASE);
}

void Engine::setPhase(Phase phase) {
    mPhase = phase;
    // TODO: Capture durations of each phase
}

void Engine::loadLevel(LevelInfo* levelInfo) {
    mLevelReady = false;
    mInFlightLevelInfo = levelInfo;
    mHasNextLevel = true;
    mNextLevelName = levelInfo->getFileName();
}

void Engine::setTrackerScreenName(const QString& screenName, bool sendScreenView) {
#ifdef Q_OS_ANDROID
    AndroidActivity::setTrackerScreenName(screenName, sendScreenView);
#else
    Q_UNUSED(screenName);
    Q_UNUSED(sendScreenView);
#endif
}

void Engine::sendTrackerEvent(const QString& category, const QString& action) {
#ifdef Q_OS_ANDROID
    AndroidActivity::sendTrackerEvent(category, action);
#else
    Q_UNUSED(category);
    Q_UNUSED(action);
#endif
}

void Engine::sendTrackerEvent(const QString& category, const QString& action,
        const QString& label) {
#ifdef Q_OS_ANDROID
    AndroidActivity::sendTrackerEvent(category, action, label);
#else
    Q_UNUSED(category);
    Q_UNUSED(action);
    Q_UNUSED(label);
#endif
}

void Engine::sendTrackerEvent(const QString& category, const QString& action, const QString& label,
        long value) {
#ifdef Q_OS_ANDROID
    AndroidActivity::sendTrackerEvent(category, action, label, value);
#else
    Q_UNUSED(category);
    Q_UNUSED(action);
    Q_UNUSED(label);
    Q_UNUSED(value);
#endif
}

void Engine::sendTrackerEvent(const QString& category, const QString& action, long value) {
#ifdef Q_OS_ANDROID
    AndroidActivity::sendTrackerEvent(category, action, value);
#else
    Q_UNUSED(category);
    Q_UNUSED(action);
    Q_UNUSED(value);
#endif
}

void Engine::onPlayLevelRequested() {
    mSoundManager->setPaused(false);
}

void Engine::pause() {
    mPausedRefCount++;
}

void Engine::resume() {
    mPausedRefCount = qMax(mPausedRefCount - 1, 0);
}

void Engine::onDeviceCreate() {
    emit deviceCreate();
}

void Engine::onDeviceStart() {
    emit deviceStart();
}

void Engine::onDeviceResume() {
    if (mIsInitialized) {
        showViewer();
        mSoundManager->setPaused(false);
        for (QQuickItem* child : mInputArea->findChildren<QQuickItem*>()) {
            if (Util::javaScriptFuncExists(child, "onDeviceResume")) {
                QMetaObject::invokeMethod(child, "onDeviceResume");
            }
        }
    }
    resume();
    emit deviceResume();
}

void Engine::onDevicePause() {
    pause();
    if (mSoundManager) {
        mSoundManager->setPaused(true);
    }
    if (mIsInitialized) {
        // TODO: Refactor into concept of controllers, and only inform the active controller.
        for (QQuickItem* child : mInputArea->findChildren<QQuickItem*>()) {
            if (Util::javaScriptFuncExists(child, "onDevicePause")) {
                QMetaObject::invokeMethod(child, "onDevicePause");
            }
        }
        hideViewer();
    }
    emit devicePause();
}

void Engine::onDeviceStop() {
    emit deviceStop();
}

void Engine::onDeviceDestroy() {
    emit deviceDestroy();
}

void Engine::onSignedIntoCloudChanged(bool signedIntoCloud) {
    emit signedIntoCloudChanged(signedIntoCloud);
}

void Engine::onCloudDataLoaded(int statusCode, const QString& data) {
    emit cloudDataLoaded(statusCode, data);
}

void Engine::onQuitRequested() {
    mSoundManager->setPaused(true);
    mSoundManager->clearBGMTrack(SoundManager::MenuPriority);
    mSoundManager->clearBGMTrack(SoundManager::EnvironmentalPriority);
}

void Engine::onOpeningCinematicCompleted(const QString& menuBGMTrack) {
    mSoundManager->setBGMTrack(SoundManager::MenuPriority, Util::getPathToSound(menuBGMTrack));
    mSoundManager->setPaused(false);
}
