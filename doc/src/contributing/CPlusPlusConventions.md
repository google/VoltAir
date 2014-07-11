# VoltAir Source C++ Conventions

Overview
========

The most complete style guide to C++ is the source code itself. Any additions or modifications
should be made to look as close as possible to the pre-existing code.

Naming
======
  * With the exception of `main.cpp`, both `h` and `cpp` files are named with "upper camel case,"
    i.e.  first letter is capitalized as well. For example, `PlayerProfile.cpp` and `Game.h` are
    valid names.
  * Classes are named with upper camel case as well, with a one-to-one naming between the class
    and the files that support it.
  * All functions are named with "lower camel case," i.e. first letter is not capitalized. For
    example, `updatePlayerScore()` and `init()` are valid names.
  * All variables are named with lower camel case as well.
  * Class member variables are prefixed with `m`, such as `mDebugMetricsMonitor`.
  * Static class member variables are prefixed with `s`, such as `sInstance`.
  * All constants are capitalized, whether defined as a macro or as a static variable.

Header File Structure
=====================
  * Use a forward declarations instead of including headers whenever possible, as it potentially
    decreases build time.
  * Document all public elements of a header using [Doxygen][].
  * The access modifiers of a header should be ordered as follows:
    * `Q_OBJECT` and `Q_PROPERTY()` declarations before any access modifiers, when appropriate.
    * `public`
    * `public slots`
    * `signals` 
    * `protected`
    * `private slots`
    * `private`
  * The only code allowed in headers are simple getter functions and virtual destructors.
  * In the `public` section, first declare getters/setters, then other behaviors.

Source File Structure
=====================
  * Definitions shall be ordered as followed:
    * Static variables
    * Constructors/destructors
    * Other definitions.
  * Opening curly braces are always on the same line of the control statement it is scoping. 
  * A function's return value and function name are on the same line.
  * A single line break is put between each function definition.
  * Comments are always placed on the line above the statements it is documenting.

Miscelleneous Rules
===================
  * `#include` statements use `<>` for system- and Qt-level includes, `""` for local includes.
  * `#include` statements are then alphabetized.
  * All real values should be explicitly stated as such with a decimal point.
  * The `*` and `&` modifier is joined to the type, not the variable. For example, do
    `int* values;` instead of `int *values;`.
  * Lines should be no longer than 100 characters long with 4 character long indentations. If
    a line break is required, do so at the latest possible white space.
  * Do not use tabs.
  * Do not use `using namespace` anywhere.
  * Maintain a "warnings are errors" policy regarding builds.
  * VoltAir is C++11 compliant. It is within bounds to use any of its features.

[Doxygen]: http://www.stack.nl/~dimitri/doxygen
