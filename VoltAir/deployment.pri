#
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
#

# Deployment commands. This file provides the code for amending two variables,
# INSTALLS and QMAKE_EXTRA_TARGETS.
android {
    x86 {
        target.path = /libs/x86
    } else: armeabi-v7a {
        target.path = /libs/armeabi-v7a
    } else {
        target.path = /libs/armeabi
    }
    installPrefix = /assets

    export(target.path)
    INSTALLS += target
} else:unix {
    copyCommand =
    for(deploymentfolder, DEPLOYMENTFOLDERS) {
        source = $$PWD/$$eval($${deploymentfolder}.source)
        source = $$replace(source, \\\\, /)
        macx {
            target = $$OUT_PWD/$${TARGET}.app/Contents/Resources/$$eval($${deploymentfolder}.target)
        } else {
            target = $$OUT_PWD/$$eval($${deploymentfolder}.target)
        }
        target = $$replace(target, \\\\, /)
        sourcePathSegments = $$split(source, /)
        targetFullPath = $$target/$$last(sourcePathSegments)
        targetFullPath ~= s,/\\.?/,/,
        !isEqual(source,$$targetFullPath) {
            !isEmpty(copyCommand):copyCommand += &&
            copyCommand += $(MKDIR) \"$$target\"
            copyCommand += && $(COPY_DIR) \"$$source\" \"$$target\"
        }
    }
    !isEmpty(copyCommand) {
        copyCommand = @echo Copying application data... && $$copyCommand
        copydeploymentfolders.commands = $$copyCommand
        first.depends = $(first) copydeploymentfolders
        export(first.depends)
        export(copydeploymentfolders.commands)
        QMAKE_EXTRA_TARGETS += first copydeploymentfolders
    }
    !isEmpty(target.path) {
        installPrefix = $${target.path}
    } else {
        installPrefix = /opt/$${TARGET}
    }

    isEmpty(target.path) {
        target.path = $${installPrefix}/bin
        export(target.path)
    }
    INSTALLS += target
}

for(deploymentfolder, DEPLOYMENTFOLDERS) {
    item = item$${deploymentfolder}
    itemfiles = $${item}.files
    $$itemfiles = $$eval($${deploymentfolder}.source)
    itempath = $${item}.path
    $$itempath = $${installPrefix}/$$eval($${deploymentfolder}.target)
    export($$itemfiles)
    export($$itempath)
    INSTALLS += $$item
}

export (INSTALLS)
export (QMAKE_EXTRA_TARGETS)
