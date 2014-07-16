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

import QtQuick 2.2
import VoltAir 1.0

/**
 * @ingroup QQuickItem
 * @brief A sensor area that triggers an action.
 */
Actor {
    id: actor

    /**
     * @brief List of all the TriggerArea's InterpolationLogic%s.
     */
    property list<InterpolationLogic> interpolators
    /**
     * @brief Actors that will trigger.
     */
    property var inputs: []
    /**
     * @brief Whether this actor will respond to inputs contacting it.
     */
    property bool active: true
    /**
     * @brief Total number of points of contact this actor has with all of its #inputs.
     */
    property int contacts: 0
    /**
     * @brief Name of the achievement to unlock when first contacting an input.
     */
    property string achievementToUnlock
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body: body
    /**
     * @brief Sound that plays while the first InterpolationLogic interpolates.
     */
    property string interpolatingSound

    PolygonBody {
        id: body

        sensor: true
    }

    ContactTrigger {
        id: beginContactTrigger

        contact: ContactEvent.ContactBegun
        actorType: Actor.GenericActor

        property bool unlockedAchievement: false

        function handleEvent(e) {
            if (!active || inputs.indexOf(e.otherBody.actor) == -1) {
                return;
            }
            if (++actor.contacts == 1) {
                if (!unlockedAchievement && actor.achievementToUnlock) {
                    Game.unlockAchievement(actor.achievementToUnlock)
                    unlockedAchievement = true
                }

                for (var i = 0; i < actor.interpolators.length; i++) {
                    actor.interpolators[i].state = InterpolationLogic.Forward
                }
            }
        }
    }

    ContactTrigger {
        contact: ContactEvent.ContactEnded
        actorType: Actor.GenericActor
        function handleEvent(e) {
            if (!active || inputs.indexOf(e.otherBody.actor) == -1) {
                return;
            }
            if (--actor.contacts == 0) {
                for (var i = 0; i < actor.interpolators.length; i++) {
                    actor.interpolators[i].state = InterpolationLogic.Backward
                }
            }
        }
    }

    onAchievementToUnlockChanged: {
        beginContactTrigger.unlockedAchievement = false
    }

    Component.onCompleted: {
        if (interpolatingSound && interpolators[0]) {
            interpolators[0].interpolatingSound = interpolatingSound
        }
    }
}
