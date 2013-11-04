# VoltAir Source QML Conventions

Overview
========

The most complete style guide to QML is the source code itself. Try to make any additions look as
close as possible to the existing code.

The overall philosophy of our QML style is as follows:
  * First put object identification (`id` and `objectName`)
  * Then put any additions you are making to the item’s definition (e.g. dynamic properties,
    signals, and functions)
  * Then put the initialization of the item’s state
  * Then put the item’s children
  * Then define behavior (i.e. how it handles events through slots)
  * And finally, include any private state or functions in a hidden `QtObject`

Additionally, there are also several ordering rules for guidance.

Line Breaks
===========
In our adopted convention, a line break should minimally be inserted after each "region".

Additionally, intra-region line breaks can be added (e.g. logical grouping of property
initializations or separating JavaScript functions).

Our recommended "Region" ordering after declaration is as follows:
  * Identification (i.e. `id` and `objectName`)
  * New property definitions (including property aliases)
  * New signal definitions
  * New JavaScript function definitions
  * Property initializations (suggested logical grouping)
  * Anchoring / Implicit Sizing (i.e. any `anchor` properties)
  * Explicit sizing (e.g. `width` and `height`)
  * Explicit positioning (e.g. `z`)
  * Explicit visibility (i.e. `visible`) / Enabled state (i.e. `enabled`)
  * `state` and `states`
  * `transitions` (animation component declarations need not recursively follow region line breaks)
  * SubComponent declarations and definitions
  * Instance slots
  * "Static" slots (e.g. `Keys` slots)
  * QtObject encapsulating private dynamic properties / temporary variables

Identification
==============
Object name, if needed, should always be the string literal of the id name.

Miscelleneous Rules
===================
  * As noted above, top-level dynamic private properties are not allowed
      * Please encapsulate in a `QtObject` whose `id` property is "d"
  * All real values should be explicitly stated as such with a decimal point
  * Property aliases should be listed after regular properties
  * Lines should be no longer than 100 characters long with 4 character long indentations. If
    a line break is required, do so at the latest possible white space.
  * Do not use tabs.
    

Example
=======

We provide the following code sample which demonstrates the our conventions:

    Component {
        id: foo
        objectName: "foo"

        property real customProp1: 14.0
        property bool customProp2: false
        property alias aliasedProperty: subComponent1.aliasedProperty

        signal mySignal()

        function customJavaScriptFunc() {
            ...
        }

        anchors.horizontalCenter: parent.center

        width: 0.1 * parent.width
        height: 2 * width

        z: 1

        visible: false
        opacity: 0.0
        enabled: false

        bar: 0.6
        baz: "hello,world"

        state: "STARTING_STATE"

        states: [
           State { name: "STARTING_STATE" },
           State { name: "ENDING_STATE" }
        ]

        transitions: [
            Transition {
                to: "STARTING_STATE"
                ...
           },
           Transition {
               to: "ENDING_STATE"
               ...
           }
        ]

        SubComponent1 {
            id: subComponent1
            ...
        }

        SubComponent2 {
            ...
        }

        onMyCustomSlot: {
            ...
        }

        // "Static" slots
        Keys.onPressed: {
            ...
        }

        // Encapsulation of private properties.
        QtObject {
            id: private
            property int temporaryVariable: 678
        }
    }

