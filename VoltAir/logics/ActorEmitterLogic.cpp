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

#include <Engine/Body.h>
#include <Engine/Engine.h>
#include <Engine/Level.h>
#include <Engine/utils/Constants.h>
#include <QQmlComponent>
#include "ActorEmitterLogic.h"

void ActorEmitterLogic::setActorModel(const QString& value) {
    mActorModel = value;
    emit actorModelChanged();
}

void ActorEmitterLogic::setDecayActors(bool value) {
    mDecayActors = value;
    emit decayActorsChanged();
}

void ActorEmitterLogic::update() {
    EmitterLogic::update();

    // Update all of the active actors.
    auto it = mActiveActors.begin();
    while (it != mActiveActors.end()) {
        Actor* actor = it.key();

        bool isInUse = actor->isVisible() || (actor->getBody() && actor->getBody()->isActive());
        bool decayed = mDecayActors && ((it.value() -= Engine::TIME_STEP_S) < 0);

        // Similar to particles, stop rendering the actor and remove it from the physics sim.
        if (decayed)  {
            actor->setVisible(false);
            if (actor->getBody()) {
                actor->getBody()->setActive(false);
            }
        }

        // Make the actors "inactive" if it is no longer in use or it has decayed.
        if (!isInUse || decayed) {
            it = mActiveActors.erase(it);
            mInactiveActors.push_back(actor);
        } else {
            ++it;
        }
    }
}

void ActorEmitterLogic::emitEntity(const SpawnParameters& parameters) {
    if (getEntityCount() >= getMaxEntityCount()) {
        return;
    }

    Actor* actor;

    // Add an actor to the actor pool if there is still room to expand the pool.
    if (getTotalActors() < getMaxEntityCount()) {
        actor = createActor(parameters);
    } else {
        // Otherwise, given the check above, we are guaranteed to have an inactive actor
        // that we can recycle.
        actor = mInactiveActors.first();
        mInactiveActors.removeFirst();

        // Reset the actor (which will invalidate it's body transform).
        actor->setPosition(parameters.position);
        actor->setVisible(true);
        if (actor->getBody()) {
            actor->getBody()->setLinearVelocity(parameters.velocity);
            actor->getBody()->setActive(true);
        }
    }

    // Stamp the actor with a decay time.
    mActiveActors[actor] = parameters.decayTime;
}

QString ActorEmitterLogic::getActorQmlString() const {
    return QString("import %1\nimport VoltAir 1.0\n%2 { }").arg(Constants::QQUICK_MODULE_NAME).arg(
            mActorModel);
}

Actor* ActorEmitterLogic::createActor(const SpawnParameters& parameters) {
    QQmlComponent component(Engine::getInstance()->getQmlEngine());
    component.setData(getActorQmlString().toUtf8(), QUrl());
    Actor* actor = qobject_cast<Actor*>(component.create());
    if (!actor) {
        qDebug() << "Cannot create" << mActorModel;
        qDebug() << component.errors();
    } else {
        actor->setPosition(parameters.position);
        actor->getBody()->setLinearVelocity(parameters.velocity);

        // Insert the new actor into the scene graph.
        Engine::getInstance()->getLevel()->addActor(actor);
    }
    return actor;
}
