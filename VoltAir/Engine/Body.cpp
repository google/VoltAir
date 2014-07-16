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

#include <Box2D/Box2D.h>
#include <QObject>
#include <QtMath>
#include "Body.h"
#include "Engine.h"
#include "Joint.h"
#include "Level.h"
#include "utils/Box2dUtil.h"
#include "utils/Util.h"

Body::Body(QObject* parent) : QObject(parent) {
    b2BodyDef bodyDef = getBodyDef();
    mBody = Engine::getInstance()->getWorld()->CreateBody(&bodyDef);
    connect(this, &Body::contactBegun, this, &Body::queuedContactBegun, Qt::QueuedConnection);
    connect(this, &Body::contactEnded, this, &Body::queuedContactEnded, Qt::QueuedConnection);
}

Body::~Body() {
    clearAllAttachedJoints();
    // Not calling destroyFixtures here because that memory is managed by b2Body
    // Not calling destroyBody here because that memory is managed by b2world
    disconnect(this, &Body::contactBegun, this, &Body::queuedContactBegun);
    disconnect(this, &Body::contactEnded, this, &Body::queuedContactEnded);
}

Actor* Body::getActor() const {
    if (!mActor) {
        mActor = qobject_cast<Actor*>(parent());
    }
    return mActor;
}

Body::BodyType Body::getBodyType() const {
    return static_cast<BodyType>(mBody->GetType());
}

void Body::setBodyType(BodyType value) {
    mBody->SetType(static_cast<b2BodyType>(value));
    emit bodyTypeChanged();
}

bool Body::isActive() const {
    return mBody->IsActive();
}

void Body::setActive(bool value) {
    mBody->SetActive(value);
    emit activeChanged();
}

float Body::getLinearDamping() const {
    return mBody->GetLinearDamping();
}

void Body::setLinearDamping(float value) {
    mBody->SetLinearDamping(value);
    emit linearDampingChanged();
}

float Body::getAngularDamping() const {
    return mBody->GetAngularDamping();
}

void Body::setAngularDamping(float value) {
    mBody->SetAngularDamping(value);
    emit angularDampingChanged();
}

float Body::getGravityScale() const {
    return mBody->GetGravityScale();
}

void Body::setGravityScale(float value) {
    mBody->SetGravityScale(value);
    emit gravityScaleChanged();
}

void Body::setMagnetic(bool value) {
    mMagnetic = value;
    emit magneticChanged();
}

void Body::setMagneticStrength(float value) {
    mMagneticStrength = value;
    emit magneticStrengthChanged();
}

QPointF Body::getPosition() const {
    return Box2dUtil::toQPointF(mBody->GetPosition());
}

void Body::setPosition(const QPointF& value) {
    mBody->SetTransform(Box2dUtil::toB2Vec2(value), mBody->GetAngle());
    emit positionSet();
}

float Body::getAngleInRadians() const {
    return mBody->GetAngle();
}

void Body::setAngleInRadians(float value) {
    mBody->SetTransform(mBody->GetPosition(), value);
    emit angleInRadiansSet();
}

QPointF Body::getLinearVelocity() const {
    return Box2dUtil::toQPointF(mBody->GetLinearVelocity());
}

void Body::setLinearVelocity(const QPointF& value) {
    mBody->SetLinearVelocity(Box2dUtil::toB2Vec2(value));
    emit linearVelocitySet();
}

float Body::getAngularVelocity() const {
    return mBody->GetAngularVelocity();
}

void Body::setAngularVelocity(float value) {
    mBody->SetAngularVelocity(value);
    emit angularVelocitySet();
}

void Body::setSensor(bool value) {
    mIsSensor = value;
    forEachFixture([this] (b2Fixture* f) { f->SetSensor(mIsSensor); });
    emit sensorChanged();
}

void Body::setDensity(float value) {
    mDensity = value;
    forEachFixture([this] (b2Fixture* f) { f->SetDensity(mDensity); });
    emit densityChanged();
}

void Body::setFriction(float value) {
    mFriction = value;
    forEachFixture([this] (b2Fixture* f) { f->SetFriction(mFriction); });
    emit frictionChanged();
}

void Body::setRestitution(float value) {
    mRestitution = value;
    forEachFixture([this] (b2Fixture* f) { f->SetRestitution(mRestitution); });
    emit restitutionChanged();
}

b2BodyDef Body::getBodyDef() {
    b2BodyDef bodyDef;

    if (!mBody) {
        // Default static properties
        bodyDef.type = static_cast<b2BodyType>(StaticBody);
        bodyDef.active = true;
        bodyDef.linearDamping = 0.0f;
        bodyDef.angularDamping = 0.0f;
        bodyDef.gravityScale = 1.0f;

        // Default dynamic properties
        bodyDef.linearVelocity = b2Vec2(0.0f, 0.0f);
        bodyDef.angularVelocity = 0.0f;
    } else {
        bodyDef.type = static_cast<b2BodyType>(getBodyType());
        bodyDef.active = isActive();
        bodyDef.linearDamping = getLinearDamping();
        bodyDef.angularDamping = getAngularDamping();
        bodyDef.gravityScale = getGravityScale();

        bodyDef.linearVelocity = Box2dUtil::toB2Vec2(getLinearVelocity());
        bodyDef.angularVelocity = getAngleInRadians();
    }

    bodyDef.userData = this;

    return bodyDef;
}

b2FixtureDef Body::getFixtureDef() {
    b2FixtureDef fixtureDef;
    fixtureDef.isSensor = mIsSensor;
    fixtureDef.density = mDensity;
    fixtureDef.friction = mFriction;
    fixtureDef.restitution = mRestitution;
    return fixtureDef;
}

void Body::addFixtures(b2FixtureDef* def) {
    b2Body* body = getBody();
    forEachShape([&](b2Shape* shape) {
                def->shape = shape;
                body->CreateFixture(def);
            });
}

void Body::createFixtures() {
    b2FixtureDef fixtureDef = getFixtureDef();
    destroyFixtures();
    addFixtures(&fixtureDef);
}

void Body::destroyFixtures() {
    b2Fixture* fixture = mBody->GetFixtureList();
    while (fixture) {
        b2Fixture* next = fixture->GetNext();
        getBody()->DestroyFixture(fixture);
        fixture = next;
    }
}

void Body::updateBeforePhysics() {
    if (!isActive()) {
        return;
    }

    if (mFixturesDirty) {
        createFixtures();
        mFixturesDirty = false;
        mTransformDirty = true;
    }

    if (mTransformDirty) {
        Actor* actor = getActor();
        if (actor) {
            QPointF pos = actor->position();
            mBody->SetTransform(b2Vec2(pos.x(), pos.y()), qDegreesToRadians(actor->rotation()));
        }
        mTransformDirty = false;
    }
}

void Body::updateAfterPhysics() {
    // Don't update inactive or static bodies, as they can't possibly have moved as a result of
    // internal physics updates. Setting Actor position and transform fires off a bunch of signals
    // and invalidates internal state, which can get expensive.
    if (!isActive() || getBodyType() == StaticBody) {
        return;
    }

    Actor* actor = getActor();
    if (actor) {
        actor->setPosition(getPosition());
        actor->setRotation(qRadiansToDegrees(getAngleInRadians()));
    }
}

void Body::registerAttachedJoint(Joint* joint) {
    mAttachedJoints.push_back(joint);
}

void Body::unregisterAttachedJoint(Joint* joint) {
    mAttachedJoints.removeAll(joint);
    mJoints.removeAll(joint);
}

QList<Body*> Body::getContactedBodies() const {
    // TODO: There's probably a better way to do this. This makes a deep copy.
    return mContactCountMap.keys();
}

void Body::beginContact(Body* otherBody, const QPointF& normal) {
    if (mContactCountMap[otherBody]++ == 0) {
        emit contactBegun(otherBody, normal);
    }
}

void Body::endContact(Body* otherBody, const QPointF& normal) {
    auto contactIt = mContactCountMap.find(otherBody);
    if (contactIt != mContactCountMap.end()) {
        int remainingCount = --(*contactIt);
        if (remainingCount <= 0) {
            mContactCountMap.erase(contactIt);
            emit contactEnded(otherBody, normal);
        }
    }
}

QQmlListProperty<Joint> Body::getJointListProperty() {
    return QQmlListProperty<Joint>(this, nullptr,
            &Body::appendJoint, &Body::countJoints, &Body::jointAt, &Body::clearJoints);
}

void Body::addJoint(Joint* joint) {
    Q_ASSERT(joint);
    joint->setParent(this);
    mJoints.push_back(joint);
    // Attempt to create the joint right away.
    joint->createJoint();
    emit jointsChanged();
}

void Body::removeJoint(Joint* joint) {
    int index = mJoints.indexOf(joint);
    if (index < 0) {
        return;
    }

    // Destroy the b2Joint if it has been created.
    joint->destroyJoint();

    // Remove the joint from the list, and clear its parent.
    // The caller is responsible for assigning a new parent or deleting it.
    mJoints.removeAt(index);
    joint->setParent(nullptr);
}

void Body::clearJoints() {
    // TODO: When the list is set from QML it removes all the items and adds in all the new ones.
    // If the difference between lists is very small this is very inefficient. We could delay
    // updating joints until next updateBeforePhysics, but we have to track the old set of joints
    // and the new set. For now, if we only use addJoint directly there is no issue.

    // Destroy existing joints.
    for (Joint* joint : mJoints) {
        delete joint;
    }
    mJoints.clear();
    emit jointsChanged();
}

void Body::setJoints(const QList<Joint*>& value) {
    mJoints = value;
    emit jointsChanged();
}

void Body::clearAllAttachedJoints() {
    // Clear joints we own.
    clearJoints();

    // Clear joints we are attached to.
    while (!mAttachedJoints.isEmpty()) {
        Joint* joint = mAttachedJoints.takeLast();
        delete joint;
    }
}


//
// Internal methods to implement QQmlListProperty<Joint*>
//

void Body::appendJoint(QQmlListProperty<Joint>* property, Joint* value) {
    // TODO: There does not seem to be a way to invoke this in QML without setting the entire list.
    // For now, we have exposed a separate addJoint method on the body directly.
    static_cast<Body*>(property->object)->addJoint(value);
}

Joint* Body::jointAt(QQmlListProperty<Joint>* property, int index) {
    return static_cast<Body*>(property->object)->getJoint(index);
}

void Body::clearJoints(QQmlListProperty<Joint>* property) {
    static_cast<Body*>(property->object)->clearJoints();
}

int Body::countJoints(QQmlListProperty<Joint>* property) {
    return static_cast<Body*>(property->object)->getJointCount();
}

void Body::forEachFixture(const std::function<void (b2Fixture*)>& func) {
    if (mBody) {
        b2Fixture* fixture = mBody->GetFixtureList();
        while (fixture) {
            func(fixture);
            fixture = fixture->GetNext();
        }
    }
}

//
// Body dynamics
//

void Body::applyTorque(float torque) {
    if (!mBody) {
        return;
    }
    mBody->ApplyTorque(torque, true);
}

void Body::applyForceToCenter(const QPointF& force) {
    if (!mBody) {
        return;
    }
    mBody->ApplyForceToCenter(b2Vec2(force.x(), force.y()), true);
}
