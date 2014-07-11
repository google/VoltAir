#!/bin/bash
# Copyright (C) 2014 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Copy in QML assets
cd $(dirname $0)
APP_PATH=../build-VoltAir-Desktop_Qt_5_3_0_clang_64bit-Debug/VoltAir.app
rm -rf $APP_PATH/Contents/Resources/qml
cp -r qml $APP_PATH/Contents/Resources/

# Update assets.
mkdir -p $APP_PATH/Contents/Resources/qml/VoltAir
cp -r ../../voltAir-java/voltAir-desktop/assets $APP_PATH/Contents/Resources/qml/VoltAir/

# Launch the app.
$APP_PATH/Contents/MacOS/VoltAir
