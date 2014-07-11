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

#include <Engine/Engine.h>
#include <Engine/Environment.h>
#include <Engine/Level.h>
#include <Engine/LevelInfo.h>
#include <Engine/audio/SoundManager.h>
#include <Engine/utils/DebugMetricsMonitor.h>
#include <Engine/utils/Util.h>
#include <QGuiApplication>
#include <QObject>
#include <QQmlEngine>
#include "DebugManager.h"
#include "Game.h"
#include "LevelProgression.h"
#include "LevelProgressionList.h"
#include "UiInternal.h"
#include "inputs/PlayerManager.h"

Game* Game::sInstance = nullptr;

Game::Game(QObject* parent)
    : QObject(parent),
      mPlayerProfile(this) {
}

Game::~Game() {
}

void Game::init() {
    if (mIsInitialized) {
        return;
    }

    // TODO: figure out if the game should be a subclass of the Engine.
    Engine* engine = Engine::getInstance();
    QQmlEngine* qmlEngine = engine->getQmlEngine();

    // Read in and register Ui
    QQmlComponent uiComponent(qmlEngine, Util::getUrlPathToAsset("qml/Ui.qml"));
    mUi = qobject_cast<UiInternal*>(uiComponent.create());
    for (QQmlError error : uiComponent.errors()) {
        qDebug() << "Error on Line" << error.line() << ":" << error.description();
    }
    Q_ASSERT(mUi);
    mUi->setFocus(true);
    engine->addChildItem(mUi);

    mDebugMetricsMonitor = mUi->findChild<DebugMetricsMonitor*>("debugMetricsMonitor");

    // Read in LevelProgressionList
    QQmlComponent levelProgressionList(qmlEngine, Util::getUrlPathToAsset(
                "qml/VoltAirLevelProgressionList.qml"));
    mLevelProgressionList = qobject_cast<LevelProgressionList*>(levelProgressionList.create());
    for (QQmlError error : levelProgressionList.errors()) {
        qDebug() << "Error on Line" << error.line() << ":" << error.description();
    }
    Q_ASSERT(mLevelProgressionList);
    mPlayerProfile.setLevelProgressionList(mLevelProgressionList);
    mUi->setLevelProgressionList(mLevelProgressionList);

    // Ui signal connections
    connect(mUi, &UiInternal::activeChanged, this, &Game::onUiActiveChanged);
    connect(mUi, &UiInternal::changeLevelProgressionRequested, this,
            &Game::onChangeLevelProgressionRequested);
    connect(mUi, &UiInternal::changeLevelRequested, this, &Game::onChangeLevelRequested,
            Qt::DirectConnection);
    connect(mUi, &UiInternal::openingCinematicCompleted, this,
            &Game::onOpeningCinematicCompleted);
    connect(mUi, &UiInternal::pauseRequested, engine, &Engine::pause, Qt::DirectConnection);
    connect(mUi, &UiInternal::playLevelRequested, this, &Game::onPlayLevelRequested,
            Qt::DirectConnection);
    connect(mUi, &UiInternal::playNextLevelRequested, this, &Game::onPlayNextLevelRequested,
            Qt::DirectConnection);
    connect(mUi, &UiInternal::quitRequested, this, &Game::onQuitRequested);
    connect(mUi, &UiInternal::resumeRequested, engine, &Engine::resume, Qt::DirectConnection);
    connect(mUi, &UiInternal::signIntoCloudRequested, this, &Game::onSignIntoCloudRequested);
    connect(mUi, &UiInternal::muteBGMRequested, this, &Game::onMuteBGMRequested);
    connect(mUi, &UiInternal::unmuteBGMRequested, this, &Game::onUnmuteBGMRequested);
    connect(mUi, &UiInternal::showAchievementsRequested, &mPlayerProfile,
            &PlayerProfile::showAchievements);

    // Ui slot connections
    connect(engine, &Engine::levelChanged, mUi, &UiInternal::onLevelChanged);
    connect(this, &Game::levelCompleted, mUi, &UiInternal::onLevelCompleted);
    connect(this, &Game::playerScoreChanged, mUi, &UiInternal::onPlayerScoreChanged);
    connect(PlayerManager::getInstance(), &PlayerManager::playerActivationChanged, mUi,
            &UiInternal::onPlayerActivationChanged);
    connect(&mPlayerProfile, &PlayerProfile::newDataMerged, mUi, &UiInternal::onPlayerDataChanged);

    // Engine/Game connections.
    connect(engine, &Engine::signedIntoCloudChanged, this, &Game::onSignedIntoCloudChanged,
            Qt::DirectConnection);
    connect(engine, &Engine::cloudDataLoaded, this, &Game::onCloudDataLoaded, Qt::DirectConnection);
    connect(engine, &Engine::beforeUpdate, this, &Game::onBeforeUpdate);
    connect(engine, &Engine::afterUpdate, this, &Game::onAfterUpdate);
    connect(engine, &Engine::deviceDestroy, this, &Game::onQuitRequested, Qt::DirectConnection);
    connect(engine, &Engine::levelChanged, this, &Game::onLevelChanged);

    // Initialize Ui.
    mUi->setSignedIntoCloud(mPlayerProfile.isSignedIntoCloud());
    mUi->setBGMMuted(engine->getSoundManager()->isBGMMuted());

    // Need this in init for now so all objects are parented on the correct thread.
    LevelProgression* debugLevelProgression =
            DebugManager::getInstance()->getDebugLevelProgression();
    if (debugLevelProgression) {
        qDebug() << "DebugManager has a debugLevelProgression scheme.";
        mUi->setProperty("initialState", "LOADING_SCREEN");
    }

    if (!mPlayerProfile.hasCloudSave() || mPlayerProfile.isSignedIntoCloud()
            || mPlayerProfile.cloudSignInFailed()) {
        mUi->tryStart();
    }

    mIsInitialized = true;
}

Game* Game::getInstance() {
    if (!sInstance) {
        sInstance = new Game();
    }
    return sInstance;
}

void Game::updatePlayerScore(int playerId, int amountChanged) {
    int playerScore = mPlayerProfile.updatePlayerScore(playerId, amountChanged);
    emit playerScoreChanged(playerId, playerScore);

    if (getCurrentLevelProgression()->isSinglePlayer()) {
        long long currentStepCount = Engine::getInstance()->getWorldStepCount();
        mScoreUpdateTimes.append(currentStepCount);

        // Remove all score update events that are outside the relevant time window.
        while((currentStepCount - mScoreUpdateTimes.first()) * Engine::TIME_STEP_S
                > mTimeForComboAchievement) {
            mScoreUpdateTimes.pop_front();
        }

        if (mScoreUpdateTimes.length() >= mScoreUpdateComboAchievement) {
            unlockAchievement("energy_crisis");
        }
    }

    Level* level = Engine::getInstance()->getLevel();
    int completionThreshold = level->getCompletionThreshold();
    if (playerScore >= completionThreshold) {
        // Unlock single player achievement for collecting "all stars" in the level.
        if (getCurrentLevelProgression()->isSinglePlayer()) {
            unlockAchievement("challenge_accepted");
        }
        // In levels without teleporters, the level is completed when reaching the completion
        // threshold.
        if (!level->getPortal()) {
            onLevelCompleted();
        }
    }
}

LevelInfo* Game::getCurrentLevelInfo() const {
    if (mCurrentLevelProgression) {
        return mPlayerProfile.getLastPlayedLevelInfo(mCurrentLevelProgression->getName());
    } else {
        return nullptr;
    }
}

bool Game::isEnvironmentUnlocked(const QString& progressionName,
        const QString& environmentName) const {
    return mPlayerProfile.isEnvironmentUnlocked(progressionName, environmentName);
}

bool Game::isLevelUnlocked(const QString& progressionName, const QString& levelName) const {
    return mPlayerProfile.isLevelUnlocked(progressionName, levelName);
}

int Game::getNumStars(const QString& progressionName, const QString& levelName) const {
    return mPlayerProfile.getNumStars(progressionName, levelName);
}

int Game::getLastPlayedEnvironmentIndex(const QString& progressionName) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        return -1;
    }
    LevelInfo* levelInfo = mPlayerProfile.getLastPlayedLevelInfo(progressionName);
    return levelProgression->getIndexOfEnvironmentFromLevelName(levelInfo->getName());
}

int Game::getLastPlayedLevelIndexInEnvironment(const QString& progressionName,
        const QString& environmentName) const {
    const LevelProgression* levelProgression = mLevelProgressionList->getLevelProgressionByName(
            progressionName);
    if (!levelProgression) {
        return -1;
    }
    const LevelInfo* levelInfo = mPlayerProfile.getLastPlayedLevelInfo(progressionName);
    const Environment* environment = levelProgression->getEnvironmentFromLevelName(
            levelInfo->getName());
    if (environment->getName() != environmentName) {
        return -1;
    } else {
        return environment->getIndexOfLevelInfo(levelInfo->getName());
    }
}

void Game::onLevelCompleted() {
    Engine* engine = Engine::getInstance();
    engine->pause();
    mIsPlayingLevel = false;

    mScoreUpdateTimes.clear();

    QString levelCompletedTag = getLevelTrackerTag("LevelCompleted");
    engine->sendTrackerEvent("Gameplay", levelCompletedTag);

    const LevelProgression* levelProgression = getCurrentLevelProgression();
    const LevelInfo* levelInfo = mPlayerProfile.getLastPlayedLevelInfo(
            levelProgression->getName());
    const Environment* environment = levelProgression->getEnvironmentFromLevelName(
            levelInfo->getName());

    if (levelProgression->isMultiplayer()) {
        int numPlayers = PlayerManager::getInstance()->getAvailablePlayers().size();
        if (numPlayers > 1) {
            unlockAchievement("lots_of_bots");
        } else {
            engine->sendTrackerEvent("Gameplay", levelCompletedTag, "NumPlayers", numPlayers);
        }
    }

    int singlePlayerScore = mPlayerProfile.getCurrentPlayerScore();
    int starScore = levelProgression->isSinglePlayer() ? getStarScore(singlePlayerScore) : -1;


    bool progressionIsOver = mPlayerProfile.onCurrentLevelCompleted(levelProgression->getName(),
            starScore);

    // For now, we only unlock progression / completionist achievements for single player (player 0)
    // progressions because we do not have a star-scoring like system for multiplayer.
    if (levelProgression->isSinglePlayer()) {
        // Check if the environment has now been "passed", which is defined as minimally earning
        // 1 star on each level in the environment.
        if (mPlayerProfile.hasMinStars(levelProgression->getName(), environment->getName(), 1)) {
            unlockAchievement(environment->getAchievementToUnlockOnPassing());
            for (const QString& achievement : environment->getAchievementsToRevealOnPassing()) {
                revealAchievement(achievement);
            }
        }

        // Check if the environment has now been "completed", which is defined as minimally earning
        // 3 stars on each level in the environment.
        if (mPlayerProfile.hasMinStars(levelProgression->getName(), environment->getName(), 3)) {
            unlockAchievement(environment->getAchievementToUnlockOnCompletion());
        }

        // Check if the progression has now been "perfected", which is defined as earning all
        // 4 stars on each level in the progression.
        if (mPlayerProfile.hasMinStars(levelProgression->getName(), 4)) {
            unlockAchievement(levelProgression->getAchievementToUnlockOnPerfection());
        }

        engine->sendTrackerEvent("Gameplay", levelCompletedTag, "NumOrbs", singlePlayerScore);
        engine->sendTrackerEvent("Gameplay", levelCompletedTag, "NumStars", starScore);
    }

    for (Actor* player : Engine::getInstance()->getLevel()->getActors(Actor::PlayerActor)) {
        if (Util::javaScriptFuncExists(player, "silence")) {
            QMetaObject::invokeMethod(player, "silence");
        }
    }

    mPlayerProfile.save();

    ScoringInfo scoringInfo = getScoringInfo();
    emit levelCompleted(progressionIsOver, scoringInfo.oneStarThreshold,
            scoringInfo.twoStarThreshold, scoringInfo.threeStarThreshold, scoringInfo.perfectScore,
            singlePlayerScore);
}

void Game::onSignedIntoCloudChanged(bool signedIntoCloud) {
    if (mUi) {
        mUi->setSignedIntoCloud(signedIntoCloud);
        mUi->tryStart();
    }

    // If we have already loaded the player profile, then we should kick off a separate cloud
    // sync request to cause the newly available cloud data to be merged.
    if (signedIntoCloud && mPlayerProfile.getLoadState() == PlayerProfile::LOADED) {
        mPlayerProfile.startLoadFromCloud();
    }
}

void Game::onMuteBGMRequested() {
    Engine::getInstance()->getSoundManager()->setBGMMuted(true);
    mUi->setBGMMuted(true);
}

void Game::onUnmuteBGMRequested() {
    Engine::getInstance()->getSoundManager()->setBGMMuted(false);
    mUi->setBGMMuted(false);
}

void Game::onCloudDataLoaded(int statusCode, const QString& data) {
    mPlayerProfile.onCloudDataLoaded(statusCode, data);
}

QString Game::onCloudDataConflict(const QString& localData, const QString& serverData) {
    return mPlayerProfile.onCloudDataConflict(localData, serverData);
}

void Game::unlockAchievement(const QString& name, bool immediately) {
    mPlayerProfile.unlockAchievement(name, immediately);
}

void Game::incrementAchievement(const QString& name, int numSteps, bool immediately) {
    mPlayerProfile.incrementAchievement(name, numSteps, immediately);
}

void Game::setAchievementSteps(const QString& name, int minSteps, bool immediately) {
    mPlayerProfile.setAchievementSteps(name, minSteps, immediately);
}

void Game::revealAchievement(const QString& name, bool immediately) {
    mPlayerProfile.revealAchievement(name, immediately);
}

void Game::onUiActiveChanged(bool isActive) {
    mIsUiActive = isActive;
}

void Game::onChangeLevelProgressionRequested() {
    abandonCurrentLevel();
    mCurrentLevelProgression = nullptr;
    mUi->setCurrentProgression(mCurrentLevelProgression);
}

void Game::onChangeLevelRequested() {
    abandonCurrentLevel();
}

void Game::onOpeningCinematicCompleted() {
    Engine::getInstance()->onOpeningCinematicCompleted(mUi->getMenuBGMTrack());
}

void Game::onPlayLevelRequested(LevelProgression* levelProgression, const QString& levelName) {
    mCurrentLevelProgression = levelProgression;
    mUi->setCurrentProgression(mCurrentLevelProgression);
    mPlayerProfile.onLevelSelected(levelProgression->getName(), levelName, false);
    // Reset the player <-> controller mappings in case the controller configuration or
    // number of controllers has changed since the previous engine.
    // TODO: Implement a more persistent controller to player mapping so character colors and
    // stylings can remain the same if the same controller is playing again the next engine.
    PlayerManager::getInstance()->reset();
    Engine::getInstance()->onPlayLevelRequested();
    tryLoadLevel();
}

void Game::onPlayNextLevelRequested() {
    tryLoadLevel();
}

void Game::onQuitRequested() {
    abandonCurrentLevel();
    Engine::getInstance()->onQuitRequested();
    QGuiApplication::quit();
}

void Game::onSignIntoCloudRequested() {
    mPlayerProfile.signIntoCloud();
}

void Game::tryLoadLevel() {
    if (mPlayerProfile.getLoadState() == PlayerProfile::LOADED && getCurrentLevelProgression()) {
        Engine::getInstance()->loadLevel(getCurrentLevelInfo());
    }
}

void Game::onBeforeUpdate() {
    // Process level loading.
    if (mPlayerProfile.getLoadState() == PlayerProfile::UNLOADED) {
        LevelProgression* debugLevelProgression =
                DebugManager::getInstance()->getDebugLevelProgression();
        mPlayerProfile.startLoad();
        if (debugLevelProgression) {
            onPlayLevelRequested(debugLevelProgression,
                    debugLevelProgression->getStartingLevelInfo()->getName());
        }
    } else if (mPlayerProfile.getLoadState() == PlayerProfile::LOADING) {
        if (mPlayerProfile.tryFinishLoad()) {
            tryLoadLevel();
        }
    }
}

void Game::onAfterUpdate() {
    // TODO: Possibly add timer to save achievements to cloud so buffered achievement actions are
    // more responsive (e.g. incremental orb collection).
    mDebugMetricsMonitor->update();
}

void Game::onLevelChanged() {
    Engine* engine = Engine::getInstance();
    engine->sendTrackerEvent("Gameplay", getLevelTrackerTag("LevelStarted"));
    mIsPlayingLevel = true;
}

Game::ScoringInfo Game::getScoringInfo() const {
    Level* level = Engine::getInstance()->getLevel();

    int completionThreshold = level->getCompletionThreshold();
    int activationThreshold = (level->getPortal())
            ? level->getPortal()->property("activationThreshold").toInt() : 0;

    float twoStarThreshold = activationThreshold + TWO_STAR_THRESHOLD_FACTOR
            * (completionThreshold - activationThreshold);
    float threeStarThreshold = twoStarThreshold + THREE_STAR_THRESHOLD_FACTOR
            * (completionThreshold - twoStarThreshold);

    return { activationThreshold, int(twoStarThreshold), int(threeStarThreshold),
            completionThreshold };
}

int Game::getStarScore(int playerScore) const {
    ScoringInfo scoringInfo = getScoringInfo();

    if (playerScore >= scoringInfo.perfectScore) {
        return 4;
    } else if (playerScore >= scoringInfo.threeStarThreshold) {
        return 3;
    } else if (playerScore >= scoringInfo.twoStarThreshold) {
        return 2;
    } else if (playerScore >= scoringInfo.oneStarThreshold) {
        return 1;
    } else {
        return 0;
    }
}

QString Game::getLevelTrackerTag(const QString& eventName) const {
    return QString("%1 | %2").arg(eventName).arg(Engine::getInstance()->getLevel()->getName());
}

void Game::abandonCurrentLevel() {
    Engine* engine = Engine::getInstance();

    // Stop the level music.
    engine->getSoundManager()->clearBGMTrack(SoundManager::EnvironmentalPriority);

    if (!mIsPlayingLevel) {
        return;
    }

    mIsPlayingLevel = false;

    // Send abandoned event.
    engine->sendTrackerEvent("Gameplay", getLevelTrackerTag("LevelAbandoned"));

    // Save the player profile and abandon the current level.
    mPlayerProfile.save();
    mPlayerProfile.onCurrentLevelAbandoned();

    // We do not want to continue rendering the current level.
    engine->deleteCurrentLevel();
}
