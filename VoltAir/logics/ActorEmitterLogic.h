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

#ifndef ACTOREMITTERLOGIC_H
#define ACTOREMITTERLOGIC_H

#include <QList>
#include <QMap>
#include "EmitterLogic.h"

/**
 * @brief Spawns Actor%s of QML type #actorModel into the Game's QML tree through Level::addActor().
 *
 * ActorEmitterLogic will create a pool of Actor%s of maximum size #maxEntityCount.  That is, this
 * class will create new Actor%s for each call to emitEntity() up until #maxEntityCount calls of
 * emitEntity() is reached, at which point it will begin to recycle decayed (i.e. inactive) Actor%s
 * from the pool.
 */
class ActorEmitterLogic : public EmitterLogic {
    Q_OBJECT
    /**
     * @brief QML type of Actor to spawn.
     * @note Changing this property after the ActorEmitterLogic has been running is undefined as
     * Actor%s of a different #actorModel could be used from the already created pool instead.
     */
    Q_PROPERTY(QString actorModel READ getActorModel WRITE setActorModel NOTIFY actorModelChanged)
    /**
     * @brief Whether or not the spawned actors should be decayed.
     *
     * Decaying an actor means to make in invisible in the QML tree and to make its Body inactive.
     */
    Q_PROPERTY(bool decayActors READ decaysActors WRITE setDecayActors NOTIFY decayActorsChanged)
public:
    /**
     * @brief Returns #actorModel.
     */
    const QString& getActorModel() const { return mActorModel; }
    /**
     * @brief Sets #actorModel.
     * @param value String to set #actorModel to
     */
    void setActorModel(const QString& value);
    /**
     * @brief Returns #decayActors.
     */
    bool decaysActors() const { return mDecayActors; }
    /**
     * @brief Sets #decayActors.
     * @param value Boolean to set #decayActors to
     */
    void setDecayActors(bool value);

    virtual int getEntityCount() const override { return mActiveActors.size(); }

    /**
     * @brief Decays any currently active, previously emitted Actor%s, and places them back into
     * the internal Actor pool.
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #actorModel changes.
     */
    void actorModelChanged();
    /**
     * @brief Emitted when #decayActors changes.
     */
    void decayActorsChanged();

protected:
    /**
     * @brief Emits an Actor of type #actorModel initialized with @p parameters.
     *
     * This method creates new Actor%s until it has been called #maxEntityCount times, at which
     * point it will begin to recycle decayed (i.e. inactive) Actor%s from the pool.
     * @param parameters Parameters to initialized the spawned Actor with
     */
    virtual void emitEntity(const SpawnParameters& parameters) override;

private:
    int getTotalActors() const { return mActiveActors.size() + mInactiveActors.size(); }
    /**
     * @brief Returns the string representing the QML needed to instantiate a basic actor of type
     * #actorModel.
     */
    QString getActorQmlString() const;
    Actor* createActor(const SpawnParameters& parameters);

    QString mActorModel = "Actor";
    bool mDecayActors = false;
    QMap<Actor*, float> mActiveActors;
    QList<Actor*> mInactiveActors;
};
Q_DECLARE_METATYPE(ActorEmitterLogic*)

#endif // ACTOREMITTERLOGIC_H
