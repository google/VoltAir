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

#ifndef ENGINE_H
#define ENGINE_H

#include <QList>
#include <QObject>
#include <QQuickItem>
#include <QSet>
#include <functional>
#include "renderer/PointerDeclarations.h"
#include "utils/ContactListener.h"
#include "utils/DestructionListener.h"

class Camera;
class Environment;
class InputArea;
class Level;
class LevelInfo;
class LiquidFunDebugDraw;
class QQuickItem;
class QQuickView;
class SoundManager;
class TextureManager;
class TerrainMaterials;
class b2World;

/**
 * @ingroup Engine
 * @brief The singleton object responsible for game execution.
 *
 * This is the main object for execution and rendering of the game. It is responsible for:
 *   - Loading/unloading of levels
 *   - Loading of overlays such as UI
 *   - Execution of the game physics
 *   - Registration and execution of Logic objects
 *   - Maintaining Google Analytics
 *
 * It is also the parent object for the numerous sub-objects that are required for engine
 * interaction.
 *
 * <h2>Not Quite a %Game %Engine</h2>
 *
 * This Engine object is about as close as the VoltAir code comes to defining a game engine. Just
 * to be certain it's not misleading, the Engine object should not be misconstrued into being
 * considered a full engine. It was just separated out to diagram out the beginnings of one.
 *
 * <h2>%Game Execution</h2>
 *
 * %VoltAir is built on QtQuick, which provides a multi-threaded system for execution and
 * rendering.  Please see the section on "Threaded Render Loop" in the <a href=
 * "http://qt-project.org/doc/qt-5/qtquick-visualcanvas-scenegraph.html#scene-graph-and-rendering">
 * Qt Quick Scene Graph</a> documentation.
 *
 * In the context of this, the "mainline" of the engine is implemented in the private update()
 * slot, which is connected to the QQuickView::afterAnimating() signal, which occurs in the
 * UI thread after all QQuickItem properties are updated.
 *
 * Within that update() call, there are three phases of execution. In order:
 *   - Logics phase: All the Logic objects' update() functions are called.
 *   - Physics phase: The Box2D physics are executed.
 *   - %Camera phase: The camera is updated, having potentially changed due to QML/Logics execution.
 *
 * Please see the Phase enum below for more information on the phases.
 *
 * After the update() is executed, the system is ready to draw the current frame's graphics,
 * through a combination of QtQuick's scene graph for the UI, and VoltAir's Renderer for the game
 * world.
 */
class Engine : public QObject {
    Q_OBJECT
public:

    /**
     * @brief The phases of Engine execution.
     *
     * This enum describes the possible phases that the engine is in during an update() call.
     */
    enum Phase {

        /**
         * @brief Engine is executing the Logic::update() calls.
         *
         * These contain a majority of the game's gameplay logic, including player input processing
         * and triggers.
         */
        LOGICS_PHASE = 0,

        /**
         * @brief Engine is executing the Body::updateBeforePhysics() calls.
         *
         * This allows the Body%s to synchronize their internal physics body positions and
         * transforms to the Actor, if the Actor's was changed due to some external action such
         * as Logics.
         */
        BEFORE_PHYSICS_PHASE,

        /**
         * @brief Engine is executing the Box2D/LiquidFun physics.
         *
         * This causes dynamic Body%s to update position.
         */
        PHYSICS_PHASE,


        /**
         * @brief Engine is executing the Body::updateAfterPhysics() calls.
         *
         * This allows Body%s to synchronize with their associated Actor%s and Graphic%s with their
         * internal physics body positions and transforms.
         */
        AFTER_PHYSICS_PHASE,


        /**
         * @brief Engine is adjusting the camera relative to the state of the world.
         *
         * In this phase, the Camera's properties are applied to the environment's view. It's
         * important to note this as it implies that before this phase, for instance in the
         * LOGICS_PHASE, the Camera actually contains the previous frame's view, not the current
         * frame's.
         */
        CAMERA_PHASE,

        /**
         * @brief Engine is rendering.
         * @note It remains in this state until it returns to the @p LOGICS_PHASE.
         */
        RENDERING_PHASE,
    };

    /**
     * @brief The target frame rate.
     */
    static const float UPDATE_FREQUENCY;

    /**
     * @brief The fixed simulation time step between frames, in seconds.
     */
    static const float TIME_STEP_S;

    /**
     * @brief The fixed simulation time step between frames, in milliseconds.
     */
    static const float TIME_STEP_MS;

    /**
     * @brief LiquidFun velocity iterations, controlling world substepping.
     */
    static const int VELOCITY_ITERATIONS;

    /**
     * @brief LiquidFun position iterations, controlling world substepping.
     */
    static const int POSITION_ITERATIONS;

    /**
     * @brief LiquidFun particle solve iterations, controlling world substepping.
     */
    static const int PARTICLE_ITERATIONS;

    virtual ~Engine();

    /**
     * @brief Initialize the Engine.
     *
     * This includes:
     * - Constructing and displaying the QQuickView "window"
     * - Setting up the game-specific renderer
     *
     * It is intended to only be called once and will ignore all subsequent calls.
     */
    void init();

    /**
     * @brief Returns @c true if the Engine has been initialized.
     */
    bool isInitialized() const { return mIsInitialized; }

    /**
     * @brief Returns @c true if engine is paused, e.g. when the in-game menu is open.
     *
     */
    Q_INVOKABLE bool isPaused() const { return mPausedRefCount != 0; }

    /**
     * @brief Returns the Box2D world object.
     */
    b2World* getWorld() const;

    /**
     * @brief Returns the number of physics steps since last level loaded.
     */
    long long getWorldStepCount() const { return mWorldStepCount; }


    /**
     * @brief Returns the QQmlEngine being used by the Engine.
     */
    QQmlEngine* getQmlEngine() const;

    /**
     * @brief Returns the root item, as defined in the main QML file.
     */
    QQuickItem* getRoot() const;

    /**
     * @brief Returns the Camera object.
     */
    Camera* getCamera() const { return mCamera; }

    /**
     * @brief Returns the @p Renderer object, the game-specific renderer.
     */
    Renderer* getRenderer() const { return mRenderer.get(); }

    /**
     * @brief Returns the SoundManager object.
     */
    Q_INVOKABLE SoundManager* getSoundManager() const { return mSoundManager.get(); }

    /**
     * @brief Returns the @p TextureManager object.
     */
    TextureManager* getTextureManager() const { return mTextureManager.get(); }

    /**
     * @brief Returns the @p TerrainMaterials object.
     */
    TerrainMaterials* getTerrainMaterials() const { return mTerrainMaterials.get(); }


    /**
     * @brief Returns ContactListener, the Engine's implementation of the b2ContactListener.
     */
    ContactListener* getContactListener() const { return mContactListener.get(); }

    /**
     * @brief Return the phase of execution.
     *
     * @see Phase
     */
    Phase getPhase() const { return mPhase; }

    /**
     * @brief Add a child item to the QQuickItem scene graph.
     *
     * This is used, for instance, to add UI and HUD elements to the QQuickView.
     */
    void addChildItem(QQuickItem* item);

    /**
     * @brief Returns the current Level being displayed and executed.
     */
    Q_INVOKABLE Level* getLevel() const { return mLevel; }
    // TODO: Consider refactoring into separate Analytics / Tracker class.
    /**
     * @brief Sets the Google Analytics screen name and optionally sends a screen view hit.
     * @param screenName Name of screen to be set
     * @param sendScreenView @c true if a screen view hit should be sent
     * @note This function only has an effect on an Android device.
     */
    Q_INVOKABLE void setTrackerScreenName(const QString& screenName, bool sendScreenView = true);
    /**
     * @brief Sends an event hit to Google Analytics.
     * @param category Category in which the event will be filed
     * @param action Action associated with the event
     * @note This function only has an effect on an Android device.
     */
    Q_INVOKABLE void sendTrackerEvent(const QString& category, const QString& action);
    /**
     * @brief Sends an event hit to Google Analytics.
     * @param category Category in which the event will be filed
     * @param action Action associated with the event
     * @param label Descriptive label used for further differentiation of categorical actions
     * @note This function only has an effect on an Android device.
     */
    Q_INVOKABLE void sendTrackerEvent(const QString& category, const QString& action,
            const QString& label);
    /**
     * @brief Sends an event hit to Google Analytics.
     * @param category Category in which the event will be filed
     * @param action Action associated with the event
     * @param label Descriptive label used for further differentiation of categorical actions
     * @param value Value to be logged with the event
     * @note This function only has an effect on an Android device.
     */
    Q_INVOKABLE void sendTrackerEvent(const QString& category, const QString& action,
            const QString& label, long value);
    /**
     * @brief Sends an event hit to Google Analytics.
     * @param category Category in which the event will be filed
     * @param action Action associated with the event
     * @param value Value to be logged with the event
     * @note This function only has an effect on an Android device.
     */
    Q_INVOKABLE void sendTrackerEvent(const QString& category, const QString& action, long value);

    /**
     * @{
     * @name QObject Traversal Functions
     *
     * These functions help in the traversal of the QObject scene graph.
     */

    /**
     * @brief Recursively traverses scene graph and call @p func on each QObject of type T.
     * @note Matches are cached and can be flushed with a call to invalidateSceneGraphObjectCache()
     *   or invalidateSceneGraphObjectCaches(). See Below
     *
     * @tparam T Subclass of QObject to search for.
     * @param func Function to call on each node of type T
     */
    template <typename T>
    void forEach(const std::function<void(T*)>& func) const {
        static QList<T*> sItemCache;

        // Check if we have a valid cache of these items
        if (!mValidCacheSet.contains(&T::staticMetaObject)) {
            sItemCache.clear();
            createItemCache(getRoot(), &sItemCache);
            mValidCacheSet.insert(&T::staticMetaObject);
        }

        for (T* t : sItemCache) {
            func(t);
        }
    }

    /**
     * @brief Invalidates the cache of scene graph objects of the specified type.
     *
     * This function should be used whenever the scene graph is dynamically changed.
     * @note This function is dangerous if not used correctly due to polymorphism. For now, prefer
     * total invalidation of all scene graph object caches unless you are certain the scene graph
     * has only been altered for specific types.
     */
    template <typename T>
    void invalidateSceneGraphObjectCache() { mValidCacheSet.remove(&T::staticMetaObject); }

    /**
     * @brief Invalidates the caches of all scene graph objects, regardless of type.
     *
     * This function should be used whenever the scene graph is dynamically changed.
     */
    void invalidateSceneGraphObjectCaches() { mValidCacheSet.clear(); }

    // TODO: Provide an invalidate function that is given a const QMetaObject*.
    // It could be used to intelligently traverse the altered sub-tree of the scene graph and only
    // invalidate the affected caches.  However, the problem is the object's meta object changes
    // between calls and is not equal in reference to the static meta object.

    /**
     * @brief Recursively traverses scene graph and call func on each QObject of type T, starting
     * at the given root.
     *
     * @note Matches are not cached in this version.
     * @tparam T Subclass of QObject to search for.
     * @param root Object at which to start the traversal
     * @param func Function to call on each node of type T
     */
    template <typename T>
    void forEach(QObject* root, const std::function<void(T*)>& func) const {
        T* t = qobject_cast<T*>(root);
        if (t) {
            func(t);
        }
        for (QObject* child : root->children()) {
            forEach(child, func);
        }
    }

    /**
     * @}
     */

    /**
     * @brief Emits the signal to load level/start game.
     */
    void loadLevel(LevelInfo* levelInfo);

    /**
     * @brief Mark the current level for deletion and remove it from the scene graph to avoid
     * continuing rendering of the current level.
     */
    void deleteCurrentLevel();

    // TODO: Split this into two methods: create and getInstance()
    /**
     * @brief Returns the global singleton instance of Engine.
     * @param createIfNecessary Whether or not to create the singleton if it does not exist
     */
    static Engine* getInstance(bool createIfNecessary = true);

public slots:

    /**
     * @brief Respond to game pause.
     */
    void pause();

    /**
     * @brief Respond to game resume.
     */
    void resume();

    /**
     * @brief Respond to request to play the current level.
     */
    void onPlayLevelRequested();

    /**
     * @brief Respond to quit request.
     */
    void onQuitRequested();

    /**
     * @brief Respond to state of cloud sign-in changed.
     */
    void onSignedIntoCloudChanged(bool signedIntoCloud);

    /**
     * @brief Respond to cloud data being loaded.
     */
    void onCloudDataLoaded(int statusCode, const QString& data);

    /**
     * @brief Respond to opening cinematic finishing.
     */
    void onOpeningCinematicCompleted(const QString& menuBGMTrack);

    /**
     * @name Android Device Lifecycle slots
     * @{
     * The calling of these methods is not guaranteed but rather contingent upon
     * initialization of the Engine. E.g. "onDeviceCreate" will likely not be called since the
     * Engine may not yet have been initialized in a thread separate from the main device thread,
     * as the thread we just spawned, but we leave it here for completion.
     */

    /**
     * @brief Respond to Android onCreate().
     */
    void onDeviceCreate();

    /**
     * @brief Respond to Android onStart().
     */
    void onDeviceStart();

    /**
     * @brief Respond to Android onResume().
     */
    void onDeviceResume();

    /**
     * @brief Respond to Android onPause().
     */
    void onDevicePause();

    /**
     * @brief Respond to Android onStop().
     */
    void onDeviceStop();

    /**
     * @brief Respond to Android onDestroy().
     */
    void onDeviceDestroy();

    /**
     * @}
     */

signals:
    /**
     * @brief Emitted when a new level is finished loading a level.
     * @param levelName Name of the level
     * @param completionThreshold Total number of collectibles in this level
     * @param activationThreshold Number of collectibles before the level's Teleporter is opened
     */
    void levelChanged(const QString& levelName, int completionThreshold, int activationThreshold);

    /**
     * @brief Emitted when cloud sign-in has changed.
     * @param signedIntoCloud True if signed in, false if signed out
     */
    void signedIntoCloudChanged(bool signedIntoCloud);

    /**
     * @brief Emitted when the cloud data is loaded.
     * @param statusCode The returned status code from the data load
     * @param data String describing the data loaded.
     */
    void cloudDataLoaded(int statusCode, const QString& data);

    /**
     * @brief Emitted at the start of the update() call.
     */
    void beforeUpdate();

    /**
     * @brief Emitted at the end of the update() call.
     */
    void afterUpdate();

    // Signals for forwarding device lifecyle events.
    // See NOTE from device lifecycle slots above.

    /**
     * @name Android Device Lifecycle
     *
     * These signals are all emitted when each of their respective slots are called.
     * @{
     */

    /**
     * @brief Emitted at end of onDeviceCreate().
     */
    void deviceCreate();


    /**
     * @brief Emitted at end of onDeviceStart().
     */
    void deviceStart();

    /**
     * @brief Emitted at end of onDeviceResume().
     */
    void deviceResume();

    /**
     * @brief Emitted at end of onDevicePause().
     */
    void devicePause();

    /**
     * @brief Emitted at end of onDeviceStop().
     */
    void deviceStop();

    /**
     * @}
     */

    /**
     * @brief Signal for when the device has reached the end of its application lifecycle.
     *
     * @note Only attach to this signal using Qt::DirectConnection since the application is
     * exiting, but, as a result, also note that any code executed from this signal will likely be
     * running in a device thread different from the Qt Ui thread.
     */
    void deviceDestroy();

private slots:
    void update();
    void onBeforeSynchronizing();
    void onBeforeRendering();
    void onAfterRendering();
    void onLoadCompleted(bool success);

private:
    // Level needs access to setCurrentLevel and queueWorldForDeletion.
    friend class Level;

    /**
     * Private constructor for singleton instance.
     */
    Engine(QObject* parent = nullptr);

    /**
     * Marks a Level as the current level. Used to avoid instantiation order issues when
     * constructing a level from QML.
     */
    void setCurrentLevel(Level* level);
    /**
     * Queue a Box2D b2World object for deletion at the start of the next frame. Needed to avoid
     * destruction order issues.
     */
    void queueWorldForDeletion(b2World* world);

    void startLoad();
    void performLevelChange();
    void setPhase(Phase phase);

    template <typename T>
    void createItemCache(QObject* item, QList<T*>* itemCache) const {
        T* t = qobject_cast<T*>(item);
        if (t) {
            itemCache->push_back(t);
        }
        for (QObject* child : item->children()) {
            createItemCache(child, itemCache);
        }
    }

    void showViewer();
    void hideViewer();
    // This function updates the camera transformations, which has the desired side-effect of
    // forcing the render thread to execute every time it's called. It is almost always called
    // before leaving update().
    void updateCamera();
    void sceneRender();
    void debugRender();
    void synchronizeForRendering();

    bool mIsInitialized = false;
    // The game starts paused.
    int mPausedRefCount = 1;
    long long mWorldStepCount = 0;
    Phase mPhase = LOGICS_PHASE;
    Camera* mCamera = nullptr;
    QQuickItem* mDebugHudItem = nullptr;
    InputArea* mInputArea = nullptr;
    bool mLevelReady = false;
    Level* mLevel = nullptr;
    bool mHasNextLevel = false;
    int mSyncsSinceNextLevelRequest = 0;
    QString mNextLevelName;
    QQuickItem* mLevelLoader = nullptr;
    volatile bool mViewerReady = false;
    std::unique_ptr<QQuickView> mViewer;
    std::unique_ptr<ContactListener> mContactListener;
    std::unique_ptr<DestructionListener> mDestructionListener;
    std::unique_ptr<Renderer> mRenderer;
    std::unique_ptr<RenderList> mRenderList;
    std::unique_ptr<TextureManager> mTextureManager;
    std::unique_ptr<TerrainMaterials> mTerrainMaterials;
    std::unique_ptr<LiquidFunDebugDraw> mDebugDraw;
    std::unique_ptr<SoundManager> mSoundManager;
    // Temporary state to ensure the level gets deleted after the level stops rendering.
    std::unique_ptr<b2World> mWorldToDelete;
    mutable QSet<const QMetaObject*> mValidCacheSet;
    LevelInfo* mInFlightLevelInfo;

    static Engine* sInstance;
};
Q_DECLARE_METATYPE(Engine*)

#endif // ENGINE_H
