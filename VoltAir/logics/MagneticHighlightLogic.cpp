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

#include "MagneticHighlightLogic.h"

void MagneticHighlightLogic::setInAttractorRange(bool value) {
    if (mInAttractorRange == value) {
        return;
    }
    mInAttractorRange = value;
    emit inAttractorRangeChanged();
}

void MagneticHighlightLogic::notifyInAttractorRange() {
    mMarkedInAttractorRange = true;
}

void MagneticHighlightLogic::update() {
    // Latch to the current value.
    setInAttractorRange(mMarkedInAttractorRange);
    mMarkedInAttractorRange = false;
}
