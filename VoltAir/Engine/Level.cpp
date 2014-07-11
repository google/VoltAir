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

#include <cassert>
#include "Camera.h"
#include "Engine.h"
#include "Level.h"
#include "Logic.h"
#include "graphics/ParticleRendererItem.h"
#include "logics/PickupLogic.h"
#include "utils/Constants.h"
#include "utils/Util.h"

const float Level::PARTICLE_RENDERER_LAYER_ZBIAS = 1.0E-6f;

Level::Level() {
    // Set ourselves as the current Level object in Engine, so that other QObjects that get
    // instantiated by the QML engine have access to this object, and the b2World.
    Engine::getInstance()->setCurrentLevel(this);

    // Create our Box2D world.
    mWorld.reset(new b2World(b2Vec2(mGravity.x(), mGravity.y())));
}

Level::~Level() {
    // We need to delete the b2World after deleting our children, which happens in our base class'
    // destructor. Queue the destruction in Engine.
    Engine::getInstance()->queueWorldForDeletion(mWorld.release());
    Engine::getInstance()->invalidateSceneGraphObjectCaches();
}

void Level::setName(const QString& value) {
    mName = value;
    emit nameChanged();
}

void Level::setFileName(const QString& value) {
    mFileName = value;
    emit fileNameChanged();
}

void Level::setGravity(const QPointF& value) {
    if (value == mGravity) {
        return;
    }
    mGravity = value;
    mWorld->SetGravity(b2Vec2(mGravity.x(), mGravity.y()));
    emit gravityChanged();
}

void Level::setParallaxOrigin(const QPointF& value) {
    if (value == mParallaxOrigin) {
        return;
    }
    mParallaxOrigin = value;

    // Copy it to our camera.
    Engine::getInstance()->getCamera()->setParallaxOrigin(value);

    emit parallaxOriginChanged();
}

void Level::setParallaxStrength(const QPointF& value) {
    if (value == mParallaxStrength) {
        return;
    }
    mParallaxStrength = value;
    emit parallaxStrengthChanged();
}

void Level::setParticleLayer(int value) {
    mParticleLayer = value;
    if (mParticleRendererItem) {
        updateParticleRendererItemZ();
    }
    emit particleLayerChanged();
}

void Level::setParticleAlpha(float value) {
    mParticleAlpha = value;
    emit particleAlphaChanged();
}

void Level::setParticleLayers(const QList<ParticleLayer*>& value) {
    mParticleLayers = value;
    emit particleLayersChanged();
}

QQmlListProperty<ParticleLayer> Level::getParticleLayerListProperty() {
    return Util::QQmlListPropertyOnQList<
            Level,
            ParticleLayer,
            QList<ParticleLayer*>,
            &Level::mParticleLayers,
            &Level::particleLayersChanged>::createList(this);
}

void Level::setCompletionThreshold(int value) {
    mCompletionThreshold = value;
    emit completionThresholdChanged();
}

void Level::componentComplete() {
    QQuickItem::componentComplete();

    // Create a ParticleRendererItem. Note that we do it in componentComplete() as
    // we want it to be the absolute last item in the level.
    ParticleRendererItem* particleRendererItem = new ParticleRendererItem();
    particleRendererItem->setParent(this);
    particleRendererItem->setParentItem(this);
    mParticleRendererItem = particleRendererItem;
    updateParticleRendererItemZ();

    // Index the actors in the scene graph
    for (Actor* actor : findChildren<Actor*>()) {
        mActors[actor->getActorType()].insert(actor);
        // For now, we define the teleporter to be an actor with the activationThreshold property.
        QVariant variant = actor->property("activationThreshold");
        if (variant.isValid()) {
            if (mPortal) {
                qDebug() << "Warning: Level has more than one teleporter.";
            }
            mPortal = actor;
        }
    }

    // Determine the number of pickups that exist in the static level
    mStartingNumPickups = findChildren<PickupLogic*>().size();

    if (mCompletionThreshold < 0) {
        emit completionThresholdChanged();
    }

    // Check invariant that the activationThreshold is no larger than the completion threshold
    if (mPortal) {
        Q_ASSERT(getCompletionThreshold() >= mPortal->property("activationThreshold").toInt());
    }

    // TODO: Add sanity check that completion threshold can be reached.
}

void Level::updateParticleRendererItemZ() {
    // Set the particle renderer to render just beneath the layer specified.
    // Since the Layer property of Actors is an integer, this is valid.
    mParticleRendererItem->setZ(((float) mParticleLayer) - PARTICLE_RENDERER_LAYER_ZBIAS);
}

void Level::setCameraBoundary(const QRectF& value) {
    mCameraBoundary = value;
    emit cameraBoundaryChanged();
}

void Level::setFillCamera(bool value) {
    mFillCamera = value;
    emit fillCameraChanged();
}

void Level::addActor(Actor* actor) {
    // Only add the actor to the Qt scene graph if it does not already exist in it
    if (mActors[actor->getActorType()].contains(actor)) {
        return;
    }

    // Recursive add all the child actors
    mActors[actor->getActorType()].insert(actor);
    for (Actor* childActor : actor->findChildren<Actor*>()) {
        // A child cannot have more than one parent in a valid scene graph
        assert(!mActors[childActor->getActorType()].contains(childActor));
        mActors[childActor->getActorType()].insert(childActor);
    }

    // Insert the actor into the Qt scene graph
    actor->setParent(this);
    actor->setParentItem(this);

    // Perform any initialization of the new scene graph components
    // TODO: Refactor into queue inside of engine to avoid possible double initialization.
    for (Logic* logic : actor->findChildren<Logic*>()) {
        logic->init();
    }

    // Invalidate the Engine's cached view of the scene graph
    Engine::getInstance()->invalidateSceneGraphObjectCaches();
}

const QSet<Actor*>& Level::getActors(Actor::ActorType type) const {
    // Cannot use "value()" which returns by value, and we do not want the list copied
    const auto& it = mActors.find(type);
    if (it != mActors.end()) {
        return it.value();
    } else {
        return Constants::EMPTY_ACTOR_SET;
    }
}
