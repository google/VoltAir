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

#ifndef PICKUPLOGIC_H
#define PICKUPLOGIC_H

#include <Engine/Logic.h>
#include <Engine/audio/SoundEffectInstance.h>

class Actor;
class Body;

/**
 * @brief Defines a behavior that, when added to an Actor, makes it "collectable".
 *
 * When a Body, whose corresponding Actor is an Actor::PlayerActor if #allowNonPlayerPickup is @c
 * false, comes in contact with #actor, PickupLogic "collects" #actor. Collection involves:
 *   - Awarding #pickupValue points to the appropriate player, if necessary
 *   - Updating incremental achievements to the appropriate player, if necessary
 *   - Playing a #pickupSound
 *   - Marking collection so it is not repeated
 * This class does not handle any visual or physical state changes for the collectable #actor, so it
 * is up to the user to define these changes by connecting to the collected() signal.
 */
class PickupLogic : public Logic {
    Q_OBJECT
    /**
     * @brief Number of points awarded to Actor::PlayerActor's for collection.
     */
    Q_PROPERTY(int pickupValue READ getPickupValue WRITE setPickupValue NOTIFY pickupValueChanged)
    /**
     * @brief @c true if non-sensor Body%s whose parent Actor is not a Actor::PlayerActor can
     * collect #actor.
     */
    Q_PROPERTY(bool allowNonPlayerPickup READ allowsNonPlayerPickup WRITE setAllowNonPlayerPickup
            NOTIFY allowNonPlayerPickupChanged)
    /**
     * @brief Name of sound asset to play once upon collection.
     */
    Q_PROPERTY(QString pickupSound READ getPickupSound WRITE setPickupSound
            NOTIFY pickupSoundChanged)

public:
    /**
     * @brief Returns #pickupValue.
     */
    int getPickupValue() const { return mPickupValue; }
    /**
     * @brief Sets #pickupValue.
     * @param value Integer to set #pickupValue to
     */
    void setPickupValue(int value);
    /**
     * @brief Returns #allowNonPlayerPickup.
     */
    bool allowsNonPlayerPickup() const { return mAllowNonPlayerPickup; }
    /**
     * @brief Sets #allowNonPlayerPickup.
     * @param value Boolean to set #allowNonPlayerPickup to
     */
    void setAllowNonPlayerPickup(bool value);
    /**
     * @brief Returns #pickupSound.
     */
    const QString& getPickupSound() const { return mPickupSound; }
    /**
     * @brief Sets #pickupSound.
     * @param value String to set #pickupSound to
     */
    void setPickupSound(const QString& value);

    /**
     * @brief Makes #actor collectable again.
     * @note If any visual or physical state changes were performed outside of this PickupLogic on
     * previous collections, they will need to also be reset.
     */
    Q_INVOKABLE void reset();

    /**
     * @brief Checks that the PickupLogic has an #actor with a Body.
     */
    virtual void init() override;

signals:
    /**
     * @brief Emitted when #pickupValue changes.
     */
    void pickupValueChanged();
    /**
     * @brief Emitted when #allowNonPlayerPickup changes.
     */
    void allowNonPlayerPickupChanged();
    /**
     * @brief Emitted when #pickupSound changes.
     */
    void pickupSoundChanged();
    /**
     * @brief Emitted when #actor is collected.
     * @param otherActor Actor who collected #actor
     */
    void collected(Actor* otherActor);

private slots:
    void onPickupContacted(Body* otherBody, QPointF normal);

private:
    int mPickupValue = 1;
    bool mAllowNonPlayerPickup = false;
    QString mPickupSound;
    SoundEffectInstance mPickupSoundInstance;
    bool mPickedUp = false;
};
Q_DECLARE_METATYPE(PickupLogic*)

#endif // PICKUPLOGIC_H
