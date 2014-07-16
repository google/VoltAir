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
#include <Engine/particles/ParticleLayer.h>
#include <Engine/particles/WaterParticle.h>
#include <Engine/utils/Box2dUtil.h>
#include "WaterBodyLogic.h"

/**
 * Box2D callback handler which resets particle decay times, keeping them alive.
 */
class WaterBodyLogic::KeepAliveQueryCallback : public b2QueryCallback {
public:
    KeepAliveQueryCallback(WaterParticleSet* particles) : mParticles(particles) {
    }

    virtual bool ReportFixture(b2Fixture*) override {
        return false;
    }

    virtual bool ReportParticle(const b2ParticleSystem* psystem, int32 index) override {
        void* userData = psystem->GetUserDataBuffer()[index];
        // Check if this particle belongs to our body of water.
        WaterParticle* particle = mParticles->getParticleWithUserData(userData);
        if (!particle) {
            // It isn't part of our set.
            return true;
        }

        // Keep this particle alive.
        particle->resetDecayTime();
        return true;
    }

private:
    WaterParticleSet* mParticles = nullptr;
};

WaterBodyLogic::WaterBodyLogic() : ParticleEmitterLogic() {
    setRequestedMaxEntityCount(-1);
}

void WaterBodyLogic::init() {
    ParticleEmitterLogic::init();
    spawnInitialParticles();
}

void WaterBodyLogic::spawnInitialParticles() {
    // Fill in particles where the body would be.
    // Because the body is inactive, it has not been created yet, and we need to query for the
    // shape directly.
    Actor* actor = getActor();
    Body* body = actor->getBody();
    WaterParticleSet& particles = getWaterParticleSet();
    ParticleLayer* layer = getLayer();
    b2Transform transform = body->getBody()->GetTransform();

    b2ParticleSystem* psystem = layer->getParticleSystem();
    b2ParticleGroupDef def;
    def.position = Box2dUtil::toB2Vec2(actor->position());
    def.angle = actor->rotation();
    def.color = Box2dUtil::toB2ParticleColor(getColor());
    def.stride = mSpawnStride * psystem->GetRadius();
    // TODO: Support initial velocity.

    int spawnCount = 0;
    b2AABB totalBoundingBox = {
            { std::numeric_limits<float>::max(), std::numeric_limits<float>::max() },
            { std::numeric_limits<float>::lowest(), std::numeric_limits<float>::lowest() } };

    body->forEachShape([&](b2Shape* shape) {
                // Create particles to fill this shape using a particle group.
                def.shape = shape;
                b2ParticleGroup* group = psystem->CreateParticleGroup(def);

                // Create WaterParticle wrappers for each constructed particle.
                if (!group) {
                    return;
                }

                int startIndex = group->GetBufferIndex();
                int createCount = group->GetParticleCount();
                for (int i = 0; i < createCount; i++) {
                    // Create wrapper.
                    SpawnParameters parameters = getNextRandomSpawnParameters();
                    WaterParticle* particle = new WaterParticle(
                            layer,
                            startIndex + i,
                            parameters.decayTime);
                    particles.addParticle(particle);
                    particle->beginDecaying();
                }

                // TODO: Delete group, but leave particles around.

                // Increment spawned count.
                spawnCount += createCount;

                // Compute bounding box.
                for (int i = 0; i < shape->GetChildCount(); i++) {
                    b2AABB boundingBox;
                    shape->ComputeAABB(&boundingBox, transform, i);
                    totalBoundingBox.Combine(boundingBox);
                }
            });

    // Save off the number of particles we spawned.
    // This becomes the limit for the emitter.
    mInitialSpawnCount = spawnCount;
    mInitialBoundingBox = Box2dUtil::toQRectF(totalBoundingBox);
}

void WaterBodyLogic::update() {
    if (mNeedsRespawn) {
        spawnInitialParticles();
        mNeedsRespawn = false;
    }

    ParticleEmitterLogic::update();

    // Find particles within our bounding box and keep them alive.
    Actor* actor = getActor();
    b2ParticleSystem* psystem = getLayer()->getParticleSystem();

    float boundingBoxPadding = getLayer()->getRadius() * 2.0f;
    QRectF boundingBox = mInitialBoundingBox;
    boundingBox.adjust(-boundingBoxPadding, -boundingBoxPadding,
            boundingBoxPadding, boundingBoxPadding);
    boundingBox.translate(actor->position());

    KeepAliveQueryCallback callback(&getWaterParticleSet());
    psystem->QueryAABB(&callback, Box2dUtil::toB2AABB(boundingBox));
}

void WaterBodyLogic::onPausedChanged() {
    ParticleEmitterLogic::onPausedChanged();
    if (!isPaused()) {
        mNeedsRespawn = true;
    }
}

QRectF WaterBodyLogic::getEmitterWorldBounds() {
    QRectF bounds = mInitialBoundingBox;
    bounds.translate(getActor()->position());
    return bounds;
}
