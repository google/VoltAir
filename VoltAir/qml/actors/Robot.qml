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
import "../graphics"

/**
 * @ingroup QQuickItem
 * @brief Player controlled robot that rolls and magnetizes.
 *
 * PlayerManager::MAGNETIZE input will generate a force on the Robot in the direction of every
 * other nearby Actor that has a body with Body#magnetic @c true.  Additionally, symmetric forces
 * with opposite direction and equal magnitude will be applied to the other magnetic Actor%s.
 *
 * PlayerManager::HORIZONTAL, PlayerManager::LEFT, or PlayerManager::RIGHT input will cause the
 * Robot to try and move horizontally in world space.  However, if the Robot is magnetized and in
 * range of another Actor that is magnetic and static, the Robot will try to move perpendicular to
 * that other Actor.
 */
Actor {
    id: root

    /**
     * @brief Unique id number of the player controlling the Robot.
     *
     * @note This is the id that can be used with PlayerManager.
     */
    property int playerId: 0
    /**
     * @brief Player's horizontal directional input <tt>[-1.0, 1.0]</tt> that determines how fast
     * the Robot should roll to its left or right.
     */
    property real inputForce: 0.0
    /**
     * @brief type:bool Exposes whether or not the Robot is currently magnetized.
     */
    property alias magnetized: magneticAttractorLogic.on
    /**
     * @brief type:Body Backing physics body for the Actor.
     * @note Use of a dynamic property alias is necessitated by C++ property definitions lacking
     * dynamic access to properties in subclasses (e.g. "vertices" in PolygonBody::Body).
     */
    property alias body : body
    /**
     * @brief type:RollingMovementLogic Exposes the Robot's RollingMovementLogic.
     */
    property alias rollingMovementLogic: rollingMovementLogic
    /**
     * @brief type:MagneticAttractorLogic Exposes the Robot's MagneticAttractorLogic.
     */
    property alias magneticAttractorLogic: magneticAttractorLogic
    /**
     * @brief Path to the sound effect that plays when the Robot hits the ground.
     */
    property string landHitSound: Util.getPathToSound("landhit.wav")
    /**
     * @brief Path to the sound effect that continiously plays while the Robot is #magnetized.
     */
    property string magnetLoopSound: Util.getPathToSound("magnet_loop.wav")
    /**
     * @brief type:RobotGraphics Exposes the Robot's RobotGraphics.
     */
    property alias graphics: graphics

    /**
     * @brief Hides the Robot and disables control logics and physics.
     */
    function deactivate() {
        body.active = false
        visible = false
        inputLogic.active = false
    }

    /**
     * @brief Disable components that emit sound.
     */
    function silence() {
        magneticAttractorLogic.active = false
    }

    actorType: Actor.PlayerActor

    RobotGraphics {
        id: graphics
    }

    CircleBody {
        id: body
        bodyType: Body.DynamicBody
        radius: graphics.size
        density: 2.0
        friction: 0.9
        restitution: 0.1
        linearDamping: 0.2
        angularDamping: d.noInputAngularDamping
        magnetic: false
        magneticStrength: 0.25

        onQueuedContactBegun: {
            if (otherBody.sensor) {
                return
            }
            // TODO: We should be checking how fast we are moving in the direction of the surface
            // normal. We cannot currently because:
            // 1) We destroyed that information before getting to JS
            // 2) There's no way to read up-to-date dynamical values like linear velocity from JS
            Engine.getSoundManager().playSoundEffect(landHitSound)
        }
    }

    GameInputLogic {
        id: inputLogic
    }

    JavaScriptLogic {
        property bool wasMagnetized: false
        function updateFunc() {
            var velocitySquared = body.linearVelocity.x * body.linearVelocity.x
                    + body.linearVelocity.y * body.linearVelocity.y

            rollingMovementLogic.direction = Qt.point(root.inputForce, 0.0)

            var frameOffset = 0
            var idle = Math.abs(root.inputForce) < 0.5
            if (graphics.eyeGraphics.delayCounter > 0) {
                graphics.eyeGraphics.delayCounter--
            } else {
                if (!idle) {
                    frameOffset = root.inputForce > 0 ? 1 : -1
                    graphics.eyeGraphics.delayCounter = graphics.eyeGraphics.transitionDelay
                    body.angularDamping = d.inputAngularDamping
                } else {
                    body.angularDamping = d.noInputAngularDamping
                    if (velocitySquared < graphics.eyeGraphics.velocitySquaredThreshold
                            || Math.abs(graphics.eyeGraphics.eyeState)
                            == graphics.eyeGraphics.maxState) {
                        graphics.eyeGraphics.delayCounter = graphics.eyeGraphics.transitionDelay
                        if (graphics.eyeGraphics.eyeState > 0) {
                            frameOffset = -1
                        } else if (graphics.eyeGraphics.eyeState < 0) {
                            frameOffset = 1
                        }
                    }
                }
            }

            var xAcceleration = body.linearVelocity.x - d.cachedLinearVelocity.x
            var yAcceleration = body.linearVelocity.y - d.cachedLinearVelocity.y
            var accelerationSquared = xAcceleration * xAcceleration + yAcceleration * yAcceleration

            if (accelerationSquared > 100.0) {
                graphics.eyeGraphics.blinkHold = accelerationSquared / 15.0
                graphics.eyeGraphics.blinkTimer = 120.0 + Math.random() * 180.0
            }
            if (graphics.eyeGraphics.blinkHold > 0.0) {
                graphics.eyeGraphics.blinkHold--
            } else if (graphics.eyeGraphics.blinkTimer > 0.0) {
                // Blink twice as often when idle.
                graphics.eyeGraphics.blinkTimer -= idle ? 2.0 : 1.0
            } else {
                graphics.eyeGraphics.blinkHold = 4.0 + Math.random() * 4.0
                graphics.eyeGraphics.blinkTimer = 180.0 + Math.random() * 360.0
            }

            d.cachedLinearVelocity = Qt.point(body.linearVelocity.x, body.linearVelocity.y)

            graphics.eyeGraphics.eyeState += frameOffset
            graphics.eyeGraphics.updateTurnGraphic()

            graphics.magnetLightning.opacity = root.magnetized ? 1 : 0
            graphics.magnetLightning.rotation = Math.random() * 360.0
            d.lightningCycle += 0.5 * Math.random()
            d.lightningSize = 7.5 + 1.5 * Math.cos(d.lightningCycle)

            graphics.magnetLightning.sizeScale = graphics.size * d.lightningSize
            wasMagnetized = root.magnetized;

            if (Game.getCurrentLevelProgression().isSinglePlayer()
                    && body.linearVelocity.x > d.achievementVelocity) {
                Game.unlockAchievement("fast_and_curious")
            }

            if (Game.getCurrentLevelProgression().multiplayer
                    && body.position.y < Engine.getLevel().cameraBoundary.y
                    - d.achievementYBuffer) {
                Game.unlockAchievement("going_going_gone")
            }

            // TODO: Move this code into a gimbalLogic.
            d.averageAngularVelocity += body.angularVelocity
            d.averageAngularVelocity *= 1.0 - d.angularVelocityAttenuation

            var currentMagneticForce = magneticAttractorLogic.getCurrentMagneticForce()
            currentMagneticForce.x *= gimbal.magneticStrength
            currentMagneticForce.y *= gimbal.magneticStrength
            gimbalBody.applyForceToCenter(currentMagneticForce)
            rollingMovementLogic.magnetismInfluence = currentMagneticForce

            var groundNormal = rollingMovementLogic.getGroundNormal()
            var groundNormalLengthSquared = groundNormal.x * groundNormal.x
                    + groundNormal.y * groundNormal.y

            // The following constants were determined experimentally and do not necessarily
            // represent physically realistic properties.

            gimbalBody.angularDamping = 8.0 + 15.0 * groundNormalLengthSquared
            // Allow the character to do a backflip if it is moving upwards > 6 m/s or is touching
            // a ceiling.
            if ((body.linearVelocity.y < -6.0 || groundNormal.y > 0.25) &&
                    !(magneticAttractorLogic.hasTargetInRange && magnetized)) {
                // Torque is dependant on the player's input, the character's proximity
                // to the ground, and the character's linear velocity.
                var torque = root.inputForce / (200.0 + 50.0 * gimbalBody.angularDamping)
                torque *= velocitySquared * -0.000015
                gimbalBody.applyTorque(torque)
                gimbalBody.gravityScale = 1.5
            } else if (gimbalBody.gravityScale < gimbal.maxGravityScale) {
                gimbalBody.gravityScale *= 1.0 + gimbal.gravityScalingSpeed
            }

            if (!(magneticAttractorLogic.hasTargetInRange && magnetized)) {
                groundNormal.x *= gimbal.groundPull
                groundNormal.y *= gimbal.groundPull
                gimbalBody.applyForceToCenter(groundNormal)
            } else {
                gimbalBody.gravityScale = 1.0
            }

            var correctedRotation = -root.rotation - 0.5 * d.averageAngularVelocity
                    * d.angularVelocityAttenuation + gimbal.rotation
            graphics.eyes.rotation = correctedRotation
        }
    }

    RollingMovementLogic {
        id: rollingMovementLogic
    }

    MagneticAttractorLogic {
        id: magneticAttractorLogic

        sensorBody: magnetSensor.body
        activeSound: magnetLoopSound

        onHasTargetInRangeChanged: {
            graphics.magneticHighlight.state = hasTargetInRange ? "ON" : "OFF"
        }
    }

    Actor {
        id: magnetSensor

        property alias body : magnetSensorBody
        CircleBody {
            id: magnetSensorBody
            bodyType: Body.DynamicBody
            radius: 5.0
            sensor: true
            // Welds behave strangely. Zero density objects cause system not to rotate. Values
            // between ~1.0E-14 and zero cause the sensor to detach from the main character, falling
            // through the floor. 1.0E-14 was found experimentally.
            // TODO: Ensure this actually works on all platforms and all floating point precisions
            // and rounding modes (ie. on Android ARM, x86, etc).
            density: 1.0E-14
            friction: 0.0
            restitution: 0.0
            linearDamping: 0.0
            angularDamping: 0.0
            magnetic: root.magnetized
            magneticStrength: 1.0E12
        }
    }

    Actor {
        id: gimbal

        property alias body: gimbalBody
        property real magneticStrength: 0.0000002
        property real groundPull: -0.000003
        // Value greater than 0.0 which determines how quickly the gimbal's gravityScale changes.
        property real gravityScalingSpeed: 0.04
        property real maxGravityScale: 10.0

        PolygonBody {
            sensor: true
            id: gimbalBody
            bodyType: Body.DynamicBody
            vertices: [[0.0, 0.0], [1.0, 0.6], [-1.0, 0.6]]
            // Make the gimbal low density so that it doesn't affect the physics of the voltAir.
            density: 1.0E-7
        }
    }

    Component.onCompleted: {
        // Add the magnet sensor to the level.
        magnetSensor.parent = root

        // Center the magnet on the voltAir, and weld them together.
        magnetSensor.x = x
        magnetSensor.y = y
        body.addJoint(Joints.createWeldJoint(body, magnetSensor.body))

        // Add the gimbal to the level.
        gimbal.parent = root

        // Center the gimbal on the voltAir, and pin them together.
        gimbal.x = x
        gimbal.y = y
        body.addJoint(Joints.createRevoluteJoint(body, gimbal.body))

        d.cachedLinearVelocity = Qt.point(body.linearVelocity.x, body.linearVelocity.y)

        if (Game.getCurrentLevelProgression().multiplayer) {
            var colors = ["red", "green", "blue", "yellow"]
            graphics.color = colors[root.playerId]
            graphics.eyeGraphics.updateTurnGraphic()
        }
    }

    QtObject {
        id: d

        // These private variables should be made public as needed for external configuration.
        property real lightningSize: 10.0
        property real inputAngularDamping: 0.1
        property real noInputAngularDamping: 10.0
        property real achievementVelocity: 20.0
        property real averageAngularVelocity: 0.0
        // Value [0.0, 1.0] which determines how averageAngularVelocity decays.
        // 0.0 is no attenuation.  1.0 is instant complete decay.
        property real angularVelocityAttenuation: 0.25
        property point cachedLinearVelocity
        // How many units above the cameraBoundary the player needs to go to trigger the achievement.
        property real achievementYBuffer: 3.0
        property real lightningCycle: 0.0
    }
}
