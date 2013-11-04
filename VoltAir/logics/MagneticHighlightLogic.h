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

#ifndef MAGNETICHIGHLIGHTLOGIC_H
#define MAGNETICHIGHLIGHTLOGIC_H

#include <Engine/Logic.h>

/**
 * @brief Class which mediates between magnetic attractors and magnet visual effects on target
 * objects.
 *
 * It is used to fade in a glow that signifies the magnetic object is within range.
 *
 * Magnetic attractors write their state to this Logic. This Logic latches that state for one frame,
 * and resets the next. For example, if an attractor is within range of this Logic's #actor, the
 * attractor will notify this Logic. This Logic will then mark itself as having an attractor within
 * range. If no attractor is within range for an entire frame, it resets.
 *
 * This method provides advantages over having each attractor remember which magnets were within
 * range, including no pointer management / dangling pointer cleanup, and not requiring any set
 * objects or allocations that might be associated with using a container object. The main
 * disadvantage is potential one-frame delays.
 */
class MagneticHighlightLogic : public Logic {
    Q_OBJECT

    /**
     * @brief Whether or not there is currently an attractor within range of this #actor.
     */
    Q_PROPERTY(bool inAttractorRange READ isInAttractorRange WRITE setInAttractorRange
            NOTIFY inAttractorRangeChanged)

public:
    /**
     * @brief Returns #inAttractorRange.
     */
    bool isInAttractorRange() const { return mInAttractorRange; }
    /**
     * @brief Sets #inAttractorRange.
     * @param value Boolean to set #inAttractorRange to
     */
    void setInAttractorRange(bool value);

    /**
     * @brief Marks this actor as having an attractor within range this frame.
     *
     * This causes its state to latch to true. It is reset to false the next frame if no attractor
     * is within range then.
     */
    void notifyInAttractorRange();

    /**
     * @brief Performs latching of #inAttractorRange in response to calls to
     * notifyInAttractorRange().
     */
    virtual void update() override;

signals:
    /**
     * @brief Emitted when #inAttractorRange has changed.
     */
    void inAttractorRangeChanged();

private:
    bool mInAttractorRange = false;
    bool mMarkedInAttractorRange = false;
};
Q_DECLARE_METATYPE(MagneticHighlightLogic*)

#endif // MAGNETICHIGHLIGHTLOGIC_H
