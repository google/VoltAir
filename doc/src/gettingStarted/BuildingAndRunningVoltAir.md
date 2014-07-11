# Building and Running VoltAir

Please make certain you have followed the steps in [Configuring Qt Creator][].

At this point, *VoltAir* is like any other Qt project. It can be built and run via the
*Build Project "VoltAir"* menu item. For additional information please visit the following
[Qt Creator][] documentation about building and running.

This process is best described in Qt Creator online documentation.  Please visit the following
sites for additional information:
* [Building and Running][]: Overall instructions on how to build and run a Qt project.
* [Building for Multiple Platforms][]
* [Running on Multiple Platforms][]
* [Deploying Applications to Android Devices][]
* [Connecting Android Devices][]: Much of this has already been covered by this documentation.

The following screenshot shows the expected kit chooser display:

![VoltAir Kit Chooser](QtCreatorBuildAndRun.png)


# Building an APK from the Command Line

A convenience script exists in the `build` directory that allows one to build an Android APK of
*VoltAir* from the command line. The script is called `build_android.py`. One can learn of the
script's options with the `--help` option. For example:

    % build/build_android.py --help
    usage: build_android.py [-h] --build-dir BUILD_DIR
                            [--voltair-root VOLTAIR_ROOT] --liquidfun-root
                            LIQUIDFUN_ROOT --qt-root QT_ROOT --jdk JDK --sdk-root
                            SDK_ROOT --ndk-root NDK_ROOT
                            [--ndk-platform NDK_PLATFORM] --ant ANT
                            [--num-processes NUM_PROCESSES] --output-apk
                            OUTPUT_APK

    Build VoltAir.apk

    optional arguments:
    -h, --help            show this help message and exit
    --build-dir BUILD_DIR
                            directory in which to build
    --voltair-root VOLTAIR_ROOT
                            Location of VoltAir source code
    --liquidfun-root LIQUIDFUN_ROOT
                            directory in which liquidfun is located
    --qt-root QT_ROOT     Dir for Qt (>= Qt 5.3)
    --jdk JDK             Java Development Kit location
    --sdk-root SDK_ROOT   Android SDK location
    --ndk-root NDK_ROOT   Android NDK location
    --ndk-platform NDK_PLATFORM
                            Android platform (must be >= android-18)
    --ant ANT             ant binary location
    --num-processes NUM_PROCESSES
                            Number of processes to use for 'make'
    --output-apk OUTPUT_APK, -o OUTPUT_APK
                            Destination of produced APK

And here is an example of the options that will produce an APK. This example matches the
*Qt Creator* settings for the various modules found in [Configuring Qt Creator][]:

    % build/build_android.py \
        --build-dir=build-VoltAir \
        --qt-root=/Users/username/Qt5.3.1/5.3 \
        --jdk=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home \
        --sdk-root=/Applications/adt-bundle-mac-x86_64-20130729/sdk \
        --ndk-root=/Applications/android-ndk-r9b \
        --ant=/usr/local/bin/ant \
        --liquidfun-root=/usr/local/liquidfun \
        --num-process=8 \
        --output-apk=/tmp/VoltAir.apk

[Qt Creator]: http://qt-project.org/doc/qtcreator-3.0/
[Configuring Qt Creator]: md__configuring_qt_creator.html
[Building and Running]: http://qt-project.org/doc/qtcreator-3.0/creator-building-running.html
[Building for Multiple Platforms]: http://qt-project.org/doc/qtcreator-3.0/creator-building-targets.html
[Running on Multiple Platforms]: http://qt-project.org/doc/qtcreator-3.0/creator-running-targets.html
[Deploying Applications to Android Devices]: http://qt-project.org/doc/qtcreator-3.0/creator-deploying-android.html
[Connecting Android Devices]: http://qt-project.org/doc/qtcreator-3.0/creator-developing-android.html
