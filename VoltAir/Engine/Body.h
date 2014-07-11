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

#ifndef BODY_H
#define BODY_H

#include <QObject>
#include <QPointF>
#include <QQmlListProperty>
#include <QSet>
#include <QVariant>
#include <functional>
#include <queue>

class Actor;
class Joint;
class b2Body;
class b2Fixture;
class b2Shape;
struct b2BodyDef;
struct b2FixtureDef;

/**
 * @ingroup Engine
 * @brief A QObject container for a Box2D @c b2Body.
 *
 * Along with representing the Box2D object, this class maintains several additional properties
 * including magnetic strength and the concept of uniform fixture properties (e.g. density,
 * restitution, friction, sensor, etc.).
 *
 * Body objects expect to be a direct child (in the QQuickItem hierarchy) of an Actor. When one
 * places a Body as a child of an Actor, that actor's position and rotation can potentially be
 * modified by this Body as a result of the physics simulation.
 *
 * Body is a base class. Its subclasses are required to define the b2Fixture objects to be
 * associated with this Body's b2Body.
 *
 * @note As in traditional Box2D fashion, setting a property during Box2D physics simulation
 * is prohibited and will result in an assert in DEBUG builds and a no-op in RELEASE builds. In
 * order to be able to set properties while the physics simulation is running (e.g. during contact
 * callbacks), a separate queuing mechanism must be used (e.g. queuing the contact callback, which
 * is already done automatically in C++ and required in QML).
 */
class Body : public QObject {
    Q_OBJECT

    /**
     * @brief Actor object associated with this Body. Always the parent in the item hierarchy.
     */
    Q_PROPERTY(Actor* actor READ getActor)

    /**
     * @brief BodyType of this Body.
     */
    Q_PROPERTY(BodyType bodyType READ getBodyType WRITE setBodyType NOTIFY bodyTypeChanged)

    /**
     * @brief Whether or not the Body takes part in the physics simulation.
     *
     * Equivalent to the @c b2Body's active property.
     */
    Q_PROPERTY(bool active READ isActive WRITE setActive NOTIFY activeChanged)

    /**
     * @brief Dampens the #linearVelocity of the Body.
     *
     * Equivalent to the @c b2Body's linear damping property.
     */
    Q_PROPERTY(float linearDamping READ getLinearDamping WRITE setLinearDamping
            NOTIFY linearDampingChanged)

    /**
     * @brief Dampens the #angularVelocity of the Body.
     *
     * Equivalent to the @c b2Body's angular damping property.
     */
    Q_PROPERTY(float angularDamping READ getAngularDamping WRITE setAngularDamping
            NOTIFY angularDampingChanged)

    /**
     * @brief Coefficient on the continuous force of gravity.
     *
     * Equivalent to the @c b2Body's gravity scale property.
     */
    Q_PROPERTY(float gravityScale READ getGravityScale WRITE setGravityScale
            NOTIFY gravityScaleChanged)

    /**
     * @brief Whether or not magnetism is set on for this Body.
     *
     * Magnetism is a pseudo-physical effect in the system that causes forces to be applied between
     * all nearby Body%s that have this value set to @c true. The actual behavior for it defined
     * elsewhere in MagneticAttractorLogic.
     */
    Q_PROPERTY(bool magnetic READ isMagnetic WRITE setMagnetic NOTIFY magneticChanged)

    /**
     * @brief Intensity of the magnetic forces involving this Body.
     */
    Q_PROPERTY(float magneticStrength READ getMagneticStrength WRITE setMagneticStrength
            NOTIFY magneticStrengthChanged)

    /**
     * @name Properties Affected by Physics
     * <a name="propertiesAffectedByPhysics"></a>
     *
     * The following group of properties are special in that their values can potentially be
     * modified by the physics simulation. Implicit in this is that the property a user writes to
     * them may not be the same one that is read back at a later time.
     *
     * Furthermore, each of their respective "property changed" signals are only emitted when the
     * property is explicitly set (i.e. not when they are changed by the physics simulation).
     *
     * @{
     */

    /**
     * @brief Positional component of the @c b2Body's transform.
     */
    Q_PROPERTY(QPointF position READ getPosition WRITE setPosition NOTIFY positionSet)

    /**
     * @brief Rotational component of the @c b2Body's transform, in radians.
     */
    Q_PROPERTY(float angleInRadians READ getAngleInRadians WRITE setAngleInRadians
            NOTIFY angleInRadiansSet)

    /**
     * @brief The rate which the Body%s position changes.
     *
     * Equivalent to the @c b2Body's linear velocity.
     */
    Q_PROPERTY(QPointF linearVelocity READ getLinearVelocity WRITE setLinearVelocity
            NOTIFY linearVelocitySet)

    /**
     * @brief The rate which the Body%s angle changes.
     *
     * Equivalent to the @c b2Body's angular velocity.
     * @note Positive values result in a counter-clockwise rotation.
     */
    Q_PROPERTY(float angularVelocity READ getAngularVelocity WRITE setAngularVelocity
            NOTIFY angularVelocitySet)

    /**
     * @}
     */

    /**
     * @brief The sensor value for all of this Body's @c b2Fixture%s.
     *
     * A @c true value implies that this is a Body which generates contacts but has no restitution
     * forces applied to it or the Body it contacts.
     */
    Q_PROPERTY(bool sensor READ isSensor WRITE setSensor NOTIFY sensorChanged)

    /**
     * @brief The density value for all of this Body's @c b2Fixture%s.
     */
    Q_PROPERTY(float density READ getDensity WRITE setDensity NOTIFY densityChanged)

    /**
     * @brief The friction value for all of this Body's @c b2Fixture%s.
     */
    Q_PROPERTY(float friction READ getFriction WRITE setFriction NOTIFY frictionChanged)

    /**
     * @brief The restitution value for all of this Body's @c b2Fixture%s.
     */
    Q_PROPERTY(float restitution READ getRestitution WRITE setRestitution NOTIFY restitutionChanged)

    /**
     * @brief List of Joint objects associated with this Body.
     */
    Q_PROPERTY(QQmlListProperty<Joint> joints READ getJointListProperty NOTIFY jointsChanged)

public:

    /**
     * @brief Overarching category of how this Body interacts with the world.
     *
     * Equivalent to the @c b2BodyType of this object.
     */
    Q_ENUMS(BodyType)
    enum BodyType {

        /**
         * @brief A non-movable Body.
         *
         * Equivalent to @c b2BodyType::b2_staticBody.
         */
        StaticBody = 0,

        /**
         * @brief A movable Body that is not affected by forces or collisions.
         *
         * Equivalent to @c b2BodyType::b2_kinematicBody.
         */
        KinematicBody,

        /**
         * @brief A movable Body that is affected by forces or collisions.
         *
         * Equivalent to @c b2BodyType::b2_dynamicBody.
         */
        DynamicBody
    };

    /**
     * @brief Constructs a Body.
     */
    explicit Body(QObject* parent = 0);

    /**
     * @brief Destroys a Body.
     */
    virtual ~Body();

    /**
     * @brief Returns #actor.
     */
    Actor* getActor() const;

    /**
     * @brief Returns #bodyType.
     */
    BodyType getBodyType() const;

    /**
     * @brief Sets #bodyType.
     * @param value BodyType to set #bodyType to
     */
    void setBodyType(BodyType value);

    /**
     * @brief Returns #active.
     */
    bool isActive() const;

    /**
     * @brief Sets #active.
     * @param value Boolean to set #active to
     */
    void setActive(bool value);

    /**
     * @brief Returns #linearDamping.
     */
    float getLinearDamping() const;

    /**
     * @brief Sets #linearDamping.
     * @param value Float to set #linearDamping to
     */
    void setLinearDamping(float value);

    /**
     * @brief Returns #angularDamping.
     */
    float getAngularDamping() const;

    /**
     * @brief Sets #angularDamping.
     * @param value Float to set #angularDamping to
     */
    void setAngularDamping(float value);

    /**
     * @brief Returns #gravityScale.
     */
    float getGravityScale() const;

    /**
     * @brief Sets #gravityScale.
     * @param value Float to set #gravityScale to
     */
    void setGravityScale(float value);

    /**
     * @brief Returns #magnetic.
     */
    bool isMagnetic() const { return mMagnetic; }

    /**
     * @brief Sets #magnetic.
     * @param value Boolean to set #magnetic to
     */
    void setMagnetic(bool value);

    /**
     * @brief Returns #magneticStrength.
     */
    float getMagneticStrength() const { return mMagneticStrength; }

    /**
     * @brief Sets #magneticStrength.
     * @param value Float to set #magneticStrength to
     */
    void setMagneticStrength(float value);

    /**
     * @brief Returns #position.
     */
    QPointF getPosition() const;

    /**
     * @name Setters and Getters for Properties Affected by Physics
     * @brief Please see <a href="#propertiesAffectedByPhysics">Properties Affected by Physics</a>.
     * @{
     */

    /**
     * @brief Sets #position.
     * @param value QPointF to set #position to
     */
    void setPosition(const QPointF& value);

    /**
     * @brief Returns #angleInRadians.
     */
    float getAngleInRadians() const;

    /**
     * @brief Sets #angleInRadians.
     * @param value Float to set #angleInRadians to
     */
    void setAngleInRadians(float value);

    /**
     * @brief Returns #linearVelocity.
     */
    QPointF getLinearVelocity() const;

    /**
     * @brief Sets #linearVelocity.
     * @param value QPointF to set #linearVelocity to
     */
    void setLinearVelocity(const QPointF& value);

    /**
     * @brief Returns #angularVelocity.
     */
    float getAngularVelocity() const;

    /**
     * @brief Sets #angularVelocity.
     * @param value Float to set #angularVelocity to
     */
    void setAngularVelocity(float value);

    /**
     * @}
     */

    /**
     * @brief Returns #sensor.
     */
    bool isSensor() const { return mIsSensor; }

    /**
     * @brief Sets #sensor.
     * @param value Boolean to set #sensor to
     */
    void setSensor(bool value);

    /**
     * @brief Returns #density.
     */
    float getDensity() const { return mDensity; }

    /**
     * @brief Sets #density.
     * @param value Float to set #density to
     */
    void setDensity(float value);

    /**
     * @brief Returns #friction.
     */
    float getFriction() const { return mFriction; }

    /**
     * @brief Sets #friction.
     * @param value Float to set #friction to
     */
    void setFriction(float value);

    /**
     * @brief Returns #restitution.
     */
    float getRestitution() const { return mRestitution; }

    /**
     * @brief Sets #restitution.
     * @param value Float to set #restitution to
     */
    void setRestitution(float value);

    /**
     * @brief Returns #joints as a const QList<Joint*>&.
     */
    const QList<Joint*>& getJoints() const { return mJoints; }

    /**
     * @brief Returns #joints as a QQmlListProperty<Joint>.
     */
    QQmlListProperty<Joint> getJointListProperty();

    /**
     * @brief Sets #joints.
     * @param value QList<Joint*> to set @p joints to
     */
    void setJoints(const QList<Joint*>& value);

    /**
     * @brief Returns a Joint at a given @p index.
     * @param index Index of Joint to return
     */
    Q_INVOKABLE Joint* getJoint(int index) { return mJoints[index]; }

    /**
     * @brief Returns the number of Joint%s associated with this Body.
     */
    Q_INVOKABLE int getJointCount() const { return mJoints.size(); }

    /**
     * @brief Add a Joint to the Body.
     * @param joint Joint to add
     */
    Q_INVOKABLE void addJoint(Joint* joint);

    /**
     * @brief Remove a Joint from the Body.
     * @param joint Joint to remove
     */
    Q_INVOKABLE void removeJoint(Joint* joint);

    /**
     * @brief Clear all the Joint%s owned by this Body.
     */
    Q_INVOKABLE void clearJoints();

    /**
     * @brief Destroys all Joint%s associated with this Body, whether or not this Body is the
     * Joint's parent.
     * @note Destroyed Joint%s are removed from their parent Body.
     */
    Q_INVOKABLE void clearAllAttachedJoints();

    /**
     * @brief Returns the @c b2Body associated with this Body.
     */
    b2Body* getBody() { return mBody; }

    /**
     * @brief Apply @p torque to the associated @c b2Body.
     * @note Positive values result in a counter-clockwise torque.
     * @param torque Amount of torque to apply
     */
    Q_INVOKABLE void applyTorque(float torque);

    /**
     * @brief Apply @p force to the associated @c b2Body.
     * @param force Amount of force to apply
     */
    Q_INVOKABLE void applyForceToCenter(const QPointF& force);

    /**
     * @brief Marks the transform for this Body as dirty.
     *
     * This informs updateBeforePhysics() whether it's necessary to set this b2Body's transform.
     */
    void invalidateTransform() { mTransformDirty = true; }

    /**
     * @brief Called immediately preceding the physics step.
     *
     * Pushes this object's data to the Box2D data.
     */
    virtual void updateBeforePhysics();

    /**
     * @brief Called immediately following the physics step.
     *
     * Pushes the pertinent Box2D data to this object's data.
     */
    virtual void updateAfterPhysics();

    /**
     * @brief Returns a QList containing the list of Body%s in contact with this Body.
     */
    QList<Body*> getContactedBodies() const;

    /**
     * @brief Called when this Body has made contact with another.
     * @param otherBody The other Body with which this one made contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void beginContact(Body* otherBody, const QPointF& normal);

    /**
     * @brief Called when this Body loses contact with another.
     * @param otherBody The other Body with which this one lost contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void endContact(Body* otherBody, const QPointF& normal);

    /**
     * @brief Calls @p func on the complete set of @c b2Shape%s that represent this Body.
     * @param func Function to call, which receives the @c b2Shape as an argument
     */
    virtual void forEachShape(const std::function<void(b2Shape*)>& func) { (void) func; }

protected:
    /**
     * @brief Marks the Body's fixtures as dirty and that they need to be recreated.
     */
    void invalidateFixtures() { mFixturesDirty = true; }
    /**
     * @brief Applies @p func to each of the Body's fixtures.
     * @param func Function to apply
     */
    void forEachFixture(const std::function<void(b2Fixture*)>& func);

signals:

    /**
     * @brief Emitted when #bodyType changes.
     */
    void bodyTypeChanged();

    /**
     * @brief Emitted when #active changes.
     */
    void activeChanged();

    /**
     * @brief Emitted when #linearDamping changes.
     */
    void linearDampingChanged();

    /**
     * @brief Emitted when #angularDamping changes.
     */
    void angularDampingChanged();

    /**
     * @brief Emitted when #gravityScale changes.
     */
    void gravityScaleChanged();

    /**
     * @brief Emitted when #magnetic changes.
     */
    void magneticChanged();

    /**
     * @brief Emitted when #magneticStrength changes.
     */
    void magneticStrengthChanged();

    /**
     * @brief Emitted when #position is set.
     */
    void positionSet();

    /**
     * @brief Emitted when #angleInRadians is set.
     */
    void angleInRadiansSet();

    /**
     * @brief Emitted when #linearVelocity is set.
     */
    void linearVelocitySet();

    /**
     * @brief Emitted when #angularVelocity is set.
     */
    void angularVelocitySet();

    /**
     * @brief Emitted when #sensor changes.
     */
    void sensorChanged();

    /**
     * @brief Emitted when #density changes.
     */
    void densityChanged();

    /**
     * @brief Emitted when #friction changes.
     */
    void frictionChanged();

    /**
     * @brief Emitted when #restitution changes.
     */
    void restitutionChanged();

    /**
     * @brief Emitted when #joints changes.
     */
    void jointsChanged();

    /**
     * @brief Emitted when a contact begins.
     * @note Sometimes multiple calls to beginContact are made referring to the same event. In
     * these cases, this signal is still emitted only once.
     * @param otherBody The other Body with which this one made contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void contactBegun(Body* otherBody, QPointF normal);

    /**
     * @brief Emitted when a contact ends.
     * @note Sometimes multiple calls to endContact are made referring to the same event. In
     * these cases, this signal is still emitted only once.
     * @param otherBody The other Body with which this one lost contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void contactEnded(Body* otherBody, QPointF normal);

    /**
     * @brief Queued version of contactBegun().
     *
     * Rather than triggering immediately, the connected slot will be called in a
     * queued fashion, using Qt::QueuedConnection.
     * @param otherBody The other Body with which this one made contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void queuedContactBegun(Body* otherBody, QPointF normal);

    /**
     * @brief Queued version of contactEnded().
     *
     * Rather than triggering immediately, the connected slot will be called in a
     * queued fashion, using Qt::QueuedConnection.
     * @param otherBody The other Body with which this one lost contact
     * @param normal The normal on @p otherBody at point of contact
     */
    void queuedContactEnded(Body* otherBody, QPointF normal);

private:
    b2BodyDef getBodyDef();
    b2FixtureDef getFixtureDef();
    void addFixtures(b2FixtureDef* def);
    void createFixtures();
    void destroyFixtures();

    friend class Joint;
    /**
     * Internally register a joint in this body as a non-parent endpoint to ensure the joint gets
     * created after all endpoints have created their b2Body.
     */
    void registerAttachedJoint(Joint* joint);
    void unregisterAttachedJoint(Joint* joint);

    // --------------------------------------------------------------------------------------
    // Internal methods to implement QQmlListProperty<Joint*>
    // --------------------------------------------------------------------------------------
    static void appendJoint(QQmlListProperty<Joint>* property, Joint* value);
    static Joint* jointAt(QQmlListProperty<Joint>* property, int index);
    static void clearJoints(QQmlListProperty<Joint>* property);
    static int countJoints(QQmlListProperty<Joint>* property);

    mutable Actor* mActor = nullptr;

    b2Body* mBody = nullptr;
    bool mFixturesDirty = true;
    bool mTransformDirty = true;

    bool mMagnetic = false;
    float mMagneticStrength = 1.0f;

    bool mIsSensor = false;
    float mDensity = 1.0f;
    float mFriction = 0.3f;
    float mRestitution = 0.3f;

    QList<Joint*> mAttachedJoints;
    QMap<Body*, int> mContactCountMap;
    QList<Joint*> mJoints;
};
Q_DECLARE_METATYPE(Body*)

#endif // BODY_H
