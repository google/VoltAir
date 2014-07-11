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

#ifndef ACTOR_H
#define ACTOR_H

#include <QList>
#include <QMap>
#include <QQuickItem>

class Body;
class Logic;

/**
 * @ingroup Engine
 * @brief Representation of an entity within the Game scene.
 *
 * Actor%s are owned by a Level, and are composed of Logic%s, Graphic%s, and optionally a Body.
 * An Actor mediates communication between these three components, with each component defining
 * gameplay, visuals, and physics for this Actor respectively. The Actor class is not intended to
 * be subclassed directly. Instead, it is "templated" into QML components defined in QML files (for
 * example, Orb in Orb.qml). This template defines the Actor's default components and setup, and
 * how they are connected. The template in turn can be specialized by the Level in a level file
 * which overrides these defaults (for example setting the initial position of that instance of the
 * Actor).
 */
class Actor : public QQuickItem {
    Q_OBJECT
public:
    // TODO: Generalize to ActorTraits of which each actor can have 0-N.
    Q_ENUMS(ActorType)
    /**
     * @brief Different categories of Actor%s, used to differentiate among them.
     * @see #actorType
     */
    enum ActorType {
        /**
         * @brief Actor which is not any other type.
         */
        GenericActor = 0,
        /**
         * @brief Actor which is controlled by a player (a user).
         *
         * This can be used, for example, to control Camera focus (CameraMovementLogic).
         */
        PlayerActor,
    };

    /**
     * @brief Type of this Actor, as one of ActorType.
     *
     * This property is used to differentiate categories of Actor%s, as Actor%s are not generally
     * proper C++ subclasses of Actor, and thus have no differentiating type information.
     */
    Q_PROPERTY(ActorType actorType READ getActorType WRITE setActorType NOTIFY actorTypeChanged)
    /**
     * @brief Associated physics Body, if it exists.
     */
    Q_PROPERTY(Body* body READ getBody)

    /**
     * @brief Constructs an Actor.
     */
    Actor();

    /**
     * @brief Returns #actorType.
     */
    ActorType getActorType() const { return mActorType; }
    /**
     * @brief Sets #actorType.
     * @param actorType ActorType to set #actorType to
     */
    void setActorType(ActorType actorType);

    /**
     * @brief Returns #body.
     */
    Body* getBody() const;

    /**
     * @brief Look through our subtree and find a child which is of the type, or a subtype of the
     * type named by string.
     *
     * For example, "ParticleEmitterLogic" finds a child of type ParticleEmitterLogic.
     * @param typeName Name of the type to look for
     */
    Q_INVOKABLE QObject* findChildByTypeName(const QString& typeName);

signals:
    /**
     * @brief Emitted when #actorType changes.
     */
    void actorTypeChanged();

protected:
    /**
     * @brief Performs additional initialization, like finding this Actor's associated Body, if one
     * exists.
     */
    virtual void componentComplete() override;

private:
    void invalidateBodyTransform();
    void indexChildren();
    QObject* findChildByType(QObject* item, const QMetaObject& metadata);

    ActorType mActorType = GenericActor;
    Body* mBody = nullptr;
};
Q_DECLARE_METATYPE(Actor*)

#endif // ACTOR_H
