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

# Extract the unsigned apk.
cd $(dirname $0)
mkdir -p bin/deploy
cd bin/deploy
rm -rf *
unzip -qo ../voltAir-android_original.apk

# Replace assets.
rm -rf assets/qml/VoltAir/assets
mkdir -p assets/qml/VoltAir
cp -r ../../../../voltAir-java/voltAir-desktop/assets assets/qml/VoltAir/

# Make sure the jar is unsigned.
rm -f META-INF/CERT.RSA META-INF/CERT.SF

# Repackage zip.
rm -f ../voltAir-android_debug_unaligned.apk
zip -r -0 ../voltAir-android_debug_unaligned.apk .

# Generate a new debug key if necessary.
cd ..
DEBUG_KEYSTORE=~/.android/debug.keystore
if [ ! -f $DEBUG_KEYSTORE ]; then
  DEBUG_KEYSTORE=debug.keystore
  if [ ! -f debug.keystore ]; then
    echo Generating new bin/debug.keystore
    keytool \
      -genkey \
      -v \
      -keystore debug.keystore \
      -alias androiddebugkey \
      -storepass android \
      -keypass android \
      -keyalg RSA \
      -validity 14000 << END
Google
Google
Google
Mountain View
CA
US
y
END
  else
    echo Using existing bin/debug.keystore
  fi
else
  echo Using ~/.android/debug.keystore
fi

# Resign the apk using a debug key.
jarsigner -keystore $DEBUG_KEYSTORE -storepass android -keypass android voltAir-android_debug_unaligned.apk androiddebugkey

# Align the apk.
zipalign -f 4 voltAir-android_debug_unaligned.apk voltAir-android_debug.apk

# Install and run the apk.
cd ..
./run-android.sh
