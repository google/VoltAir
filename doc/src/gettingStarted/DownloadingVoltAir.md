# Downloading VoltAir

Cloning Github Repo
===================

Simply run the following command to clone the github repo:

`git clone http://github.com/google/voltair.git`


Downloading the Liquidfun Submodule
===================================

VoltAir uses [LiquidFun][] version 1.1 for its rigid body and fluid simulations.

If you have [LiquidFun][] built already, please see the instructions in [Configuring Qt Creator][]
about how to reference an external version of [LiquidFun][].

If you do not have this built, we provide a ~git submodule~ from which you can instance it.  Please
run the following commands to instantiate this submodule:

        cd voltair/third_party
        git submodule init
        git submodule update

Then visit the [LiquidFun Build Instructions][] page and build for both your desktop system (e.g.
Linux or Mac OSX) and for Android.

The next step in the process is [Installing Qt][].

[LiquidFun]: http://google.github.io/liquidfun
[Configuring Qt Creator]:md__configuring_qt_creator.html
[LiquidFun Build Instructions]:http://google.github.io/liquidfun/Building/html/index.html
[Installing Qt]: md__installing_qt.html
