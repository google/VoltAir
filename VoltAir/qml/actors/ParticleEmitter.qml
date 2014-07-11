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
 * @brief Emits water particles.
 * @note The rotation and position of this Actor determine the initial position and velocity
 * direction of created particles.
 */
Actor {
    id: actor

    /**
     * @brief type:ParticleEmitterLogic Logic that determines how particles are spawned.
     */
    property alias emitterLogic: logic

    ParticleEmitterLogic {
        id: logic
    }
}
