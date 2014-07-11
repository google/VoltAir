import QtQuick 2.2
import VoltAir 1.0
Level {
    cameraBoundary: Qt.rect(-1.63268, -34.8984, 202.6, 32.6998)
    fileName: "E1S3"
    parallaxOrigin.x: 78.86948
    parallaxOrigin.y: -21.843952
    parallaxStrength.y: 1
    Polygon {
        body.active: false
        body.vertices: [[-10.0774, 10.2079], [10.2866, 10.2079], [10.2866, -1.1297], [-10.0774, -1.1297]]
        id: actor36924
        objectName: "actor36924"
        property alias image: graphic1
        property alias parallaxTransform: parallaxTransform0
        x: 79.07939
        y: -26.998095
        z: -10
        ParallaxTransformItem {
            id: parallaxTransform0
            zDepth: 50
            ImageRenderer {
                id: graphic1
                sizeScale: 20.65564
                source: Util.getPathToImage("background_e1/bg_e1_flat.jpg")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.912791, 2.25201], [1.38154, 2.25201], [1.38154, -5.7767], [-0.912791, -5.7767]]
        id: actor169171
        objectName: "actor169171"
        property alias image: graphic2
        x: 168.16508
        y: -2.585011
        z: -2
        ImageRenderer {
            aspectRatio: 1.1275
            cacheRenderParams: actor169171.body.bodyType === Body.StaticBody
            id: graphic2
            sizeScale: 5.399178
            source: Util.getPathToImage("middleground_e1/deco_e1_column01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.998938, 2.46455], [1.51192, 2.46455], [1.51192, -6.32189], [-0.998938, -6.32189]]
        id: actor169350
        objectName: "actor169350"
        property alias image: graphic3
        x: 52.9371
        y: -8.770232
        z: -2
        ImageRenderer {
            cacheRenderParams: actor169350.body.bodyType === Body.StaticBody
            id: graphic3
            sizeScale: 5.9087334
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.737674, 1.81997], [0.914577, 1.81997], [0.914577, -8.27164], [-0.737674, -8.27164]]
        id: actor169532
        objectName: "actor169532"
        property alias image: graphic4
        rotation: -9.00011
        x: 14.16625
        y: -3.934853
        z: -2
        ImageRenderer {
            cacheRenderParams: actor169532.body.bodyType === Body.StaticBody
            id: graphic4
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.26332, 3.11684], [1.91208, 3.11684], [1.91208, -7.99509], [-1.26332, -7.99509]]
        id: actor173253
        objectName: "actor173253"
        property alias image: graphic5
        rotation: -8.999999
        x: 140.09668
        y: -6.758863
        z: -2
        ImageRenderer {
            cacheRenderParams: actor173253.body.bodyType === Body.StaticBody
            id: graphic5
            sizeScale: 7.4725866
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.627503, 1.54816], [0.949744, 1.54816], [0.949744, -7.03628], [-0.627503, -7.03628]]
        id: actor173463
        objectName: "actor173463"
        property alias image: graphic6
        rotation: 5.3998904
        x: 139.55472
        y: 4.4082613
        z: -2
        ImageRenderer {
            cacheRenderParams: actor173463.body.bodyType === Body.StaticBody
            id: graphic6
            sizeScale: 3.711694
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor348174.image) { actor348174.image.cacheRenderParams = false; }}
        body.vertices: [[-1.06377, 2.14167], [-0.57692, 2.14167], [-0.57692, -1], [-1.06377, -1]]
        id: actor340478
        inputs: [actor0]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 6
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor348174
                targetProperty: "emitterLogic.spawnRate"
            }
        ]
        objectName: "actor340478"
        visible: false
        x: 131.52733
        y: -13.850316
        z: -2
    }
    Polygon {
        body.vertices: [[-1, 12.7026], [0.00511932, 12.7026], [0.00511932, -24.3032], [-1, -24.3032]]
        id: actor2
        objectName: "actor2"
        visible: false
        y: -10.638224
        z: -2
    }
    Polygon {
        body.vertices: [[-0.00387573, 12.5784], [1, 12.5784], [1, -24.3078], [-0.00387573, -24.3078]]
        id: actor5
        objectName: "actor5"
        visible: false
        x: 200.025
        y: -10.638224
        z: -2
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.65828, 1.81997], [0.914577, 1.81997], [0.914577, -0.0149508], [-1.65828, -0.0149508]]
        id: actor169715
        objectName: "actor169715"
        property alias image: graphic10
        x: 15.432084
        y: -13.74506
        z: -1
        ImageRenderer {
            cacheRenderParams: actor169715.body.bodyType === Body.StaticBody
            id: graphic10
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.48566, 0.295214], [1.37488, 0.295214], [1.37488, -2.34523], [-1.48566, -2.34523]]
        id: actor169716
        objectName: "actor169716"
        property alias image: graphic11
        x: 22.176428
        y: -8.336497
        z: -1
        ImageRenderer {
            cacheRenderParams: actor169716.body.bodyType === Body.StaticBody
            id: graphic11
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.65828, 1.81997], [0.914577, 1.81997], [0.914577, -0.0149508], [-1.65828, -0.0149508]]
        id: actor169901
        objectName: "actor169901"
        property alias image: graphic12
        x: 10.074707
        y: -12.957211
        z: -1
        ImageRenderer {
            cacheRenderParams: actor169901.body.bodyType === Body.StaticBody
            id: graphic12
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.48566, 0.295214], [1.37488, 0.295214], [1.37488, -2.34523], [-1.48566, -2.34523]]
        id: actor169902
        objectName: "actor169902"
        property alias image: graphic13
        x: 57.75158
        y: -5.170533
        z: -1
        ImageRenderer {
            cacheRenderParams: actor169902.body.bodyType === Body.StaticBody
            id: graphic13
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.48566, 0.295214], [1.37488, 0.295214], [1.37488, -2.34523], [-1.48566, -2.34523]]
        id: actor171007
        objectName: "actor171007"
        property alias image: graphic14
        x: 118.42719
        y: -6.010795
        z: -1
        ImageRenderer {
            cacheRenderParams: actor171007.body.bodyType === Body.StaticBody
            id: graphic14
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.82723, 2.00539], [1.00776, 2.00539], [1.00776, -0.016474], [-1.82723, -0.016474]]
        id: actor171008
        objectName: "actor171008"
        property alias image: graphic15
        x: 94.43854
        y: -8.205514
        z: -1
        ImageRenderer {
            cacheRenderParams: actor171008.body.bodyType === Body.StaticBody
            id: graphic15
            sizeScale: 4.8078995
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.82723, 2.00539], [1.00776, 2.00539], [1.00776, -0.016474], [-1.82723, -0.016474]]
        id: actor171009
        objectName: "actor171009"
        property alias image: graphic16
        x: 196.1124
        y: -17.946123
        z: -1
        ImageRenderer {
            cacheRenderParams: actor171009.body.bodyType === Body.StaticBody
            id: graphic16
            sizeScale: 4.8078995
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.227564, 0.214461], [0.176634, 0.214461], [0.176634, -0.292197], [-0.227564, -0.292197]]
        id: actor171810
        objectName: "actor171810"
        property alias image: graphic17
        rotation: 23.399889
        x: 0.79934573
        y: -15.465018
        z: -1
        ImageRenderer {
            cacheRenderParams: actor171810.body.bodyType === Body.StaticBody
            id: graphic17
            sizeScale: 0.8253316
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.186725, 0.175974], [0.144935, 0.175974], [0.144935, -0.0897705], [-0.186725, -0.0897705]]
        id: actor172014
        objectName: "actor172014"
        property alias image: graphic18
        x: 3.536004
        y: -15.1404295
        z: -1
        ImageRenderer {
            cacheRenderParams: actor172014.body.bodyType === Body.StaticBody
            id: graphic18
            sizeScale: 0.67721725
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.766119, 0.734445], [1.55491, 0.734445], [1.55491, -1.74631], [-0.766119, -1.74631]]
        id: actor173041
        objectName: "actor173041"
        property alias image: graphic19
        x: 85.0969
        y: -6.4084806
        z: -1
        ImageRenderer {
            cacheRenderParams: actor173041.body.bodyType === Body.StaticBody
            id: graphic19
            sizeScale: 4.531605
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.65828, 1.81997], [0.914577, 1.81997], [0.914577, -0.0149508], [-1.65828, -0.0149508]]
        id: actor187649
        objectName: "actor187649"
        property alias image: graphic20
        x: 43.539993
        y: -11.727413
        z: -1
        ImageRenderer {
            cacheRenderParams: actor187649.body.bodyType === Body.StaticBody
            id: graphic20
            sizeScale: 4.363354
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.812837], [0.663165, 0.812837], [0.663165, 0.326016], [-0.527226, 0.326016]]
        id: actor213408
        objectName: "actor213408"
        property alias image: graphic21
        rotation: 5.40011
        x: 138.79924
        y: -17.956663
        z: -1
        ImageRenderer {
            cacheRenderParams: actor213408.body.bodyType === Body.StaticBody
            id: graphic21
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.745643], [0.663165, 0.745643], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor213409
        objectName: "actor213409"
        property alias image: graphic22
        x: 186.69124
        y: -16.64377
        z: -1
        ImageRenderer {
            cacheRenderParams: actor213409.body.bodyType === Body.StaticBody
            id: graphic22
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.751754], [0.663165, 0.751754], [0.663165, 0.279967], [-0.527226, 0.279967]]
        id: actor213413
        objectName: "actor213413"
        property alias image: graphic23
        x: 159.26585
        y: -5.403487
        z: -1
        ImageRenderer {
            cacheRenderParams: actor213413.body.bodyType === Body.StaticBody
            id: graphic23
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214264
        objectName: "actor214264"
        property alias image: graphic24
        rotation: -5.40011
        x: 12.328231
        y: -15.21701
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214264.body.bodyType === Body.StaticBody
            id: graphic24
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214291
        objectName: "actor214291"
        property alias image: graphic25
        x: 27.077469
        y: -13.93317
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214291.body.bodyType === Body.StaticBody
            id: graphic25
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214293
        objectName: "actor214293"
        property alias image: graphic26
        rotation: -6.3001094
        x: 56.712654
        y: -9.799607
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214293.body.bodyType === Body.StaticBody
            id: graphic26
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.06525], [-0.252724, 0.06525]]
        id: actor214294
        objectName: "actor214294"
        property alias image: graphic27
        x: 86.60314
        y: -10.063988
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214294.body.bodyType === Body.StaticBody
            id: graphic27
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214296
        objectName: "actor214296"
        property alias image: graphic28
        rotation: 17.099998
        x: 115.55237
        y: -10.644744
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214296.body.bodyType === Body.StaticBody
            id: graphic28
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214300
        objectName: "actor214300"
        property alias image: graphic29
        x: 137.0118
        y: -17.72827
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214300.body.bodyType === Body.StaticBody
            id: graphic29
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214303
        objectName: "actor214303"
        property alias image: graphic30
        rotation: 9.89989
        x: 142.98116
        y: -5.192832
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214303.body.bodyType === Body.StaticBody
            id: graphic30
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214304
        objectName: "actor214304"
        property alias image: graphic31
        x: 174.43768
        y: -3.7478964
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214304.body.bodyType === Body.StaticBody
            id: graphic31
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.2574, 0.249857], [1.16364, 0.249857], [1.16364, -1.98491], [-1.2574, -1.98491]]
        id: actor214312
        objectName: "actor214312"
        property alias image: graphic32
        x: 179.87605
        y: -8.573829
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214312.body.bodyType === Body.StaticBody
            id: graphic32
            sizeScale: 3.692958
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.82723, 2.00539], [1.00776, 2.00539], [1.00776, -0.016474], [-1.82723, -0.016474]]
        id: actor214313
        objectName: "actor214313"
        property alias image: graphic33
        x: 174.6993
        y: -10.725237
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214313.body.bodyType === Body.StaticBody
            id: graphic33
            sizeScale: 4.8078995
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.82723, 2.00539], [1.00776, 2.00539], [1.00776, -0.016474], [-1.82723, -0.016474]]
        id: actor214314
        objectName: "actor214314"
        property alias image: graphic34
        x: 186.59961
        y: -5.481493
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214314.body.bodyType === Body.StaticBody
            id: graphic34
            sizeScale: 4.8078995
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.2574, 0.249857], [1.16364, 0.249857], [1.16364, -1.98491], [-1.2574, -1.98491]]
        id: actor214315
        objectName: "actor214315"
        property alias image: graphic35
        x: 163.64586
        y: -1.7026365
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214315.body.bodyType === Body.StaticBody
            id: graphic35
            sizeScale: 3.692958
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.47191, 1.61543], [0.811793, 1.61543], [0.811793, -0.0132705], [-1.47191, -0.0132705]]
        id: actor214316
        objectName: "actor214316"
        property alias image: graphic36
        x: 132.25223
        y: -14.625606
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214316.body.bodyType === Body.StaticBody
            id: graphic36
            sizeScale: 3.8729804
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.88554, 2.06939], [1.03992, 2.06939], [1.03992, -0.0169997], [-1.88554, -0.0169997]]
        id: actor214317
        objectName: "actor214317"
        property alias image: graphic37
        x: 132.24825
        y: -7.091444
        z: -1
        ImageRenderer {
            cacheRenderParams: actor214317.body.bodyType === Body.StaticBody
            id: graphic37
            sizeScale: 4.9613433
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor240239.image) { actor240239.image.cacheRenderParams = false; }}
        body.vertices: [[-0.142204, 2.20589], [2.29292, 2.20589], [2.29292, -1], [-0.142204, -1]]
        id: actor240241
        inputs: [actor236430]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 4
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor240239
                targetProperty: "emitterLogic.spawnRate"
            }
        ]
        objectName: "actor240241"
        x: 96.091705
        y: -11.324332
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.524533], [0.31016, 0.524533], [0.31016, -0.152998], [-0.252724, -0.152998]]
        id: actor311289
        objectName: "actor311289"
        property alias image: graphic39
        x: 34.320675
        y: -14.270098
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311289.body.bodyType === Body.StaticBody
            id: graphic39
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.387457, 0.612691], [0.431483, 0.612691], [0.431483, -0.178713], [-0.387457, -0.178713]]
        id: actor311290
        objectName: "actor311290"
        property alias image: graphic40
        x: 177.69768
        y: -5.960489
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311290.body.bodyType === Body.StaticBody
            id: graphic40
            sizeScale: 1.3748184
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.391149, 0.61853], [0.435595, 0.61853], [0.435595, -0.180416], [-0.391149, -0.180416]]
        id: actor311291
        objectName: "actor311291"
        property alias image: graphic41
        x: 61.94209
        y: -9.54321
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311291.body.bodyType === Body.StaticBody
            id: graphic41
            sizeScale: 1.3879211
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.378029, 0.597782], [0.420984, 0.597782], [0.420984, -0.174364], [-0.378029, -0.174364]]
        id: actor311292
        objectName: "actor311292"
        property alias image: graphic42
        x: 93.48771
        y: -9.939433
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311292.body.bodyType === Body.StaticBody
            id: graphic42
            sizeScale: 1.3413646
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.477016, 0.754311], [0.531218, 0.754311], [0.531218, -0.220021], [-0.477016, -0.220021]]
        id: actor311293
        objectName: "actor311293"
        property alias image: graphic43
        x: 153.53252
        y: -4.9711595
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311293.body.bodyType === Body.StaticBody
            id: graphic43
            sizeScale: 1.6926013
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.477016, 0.754311], [0.531218, 0.754311], [0.531218, -0.220021], [-0.477016, -0.220021]]
        id: actor311294
        objectName: "actor311294"
        property alias image: graphic44
        x: 161.14894
        y: -5.0202346
        z: -1
        ImageRenderer {
            cacheRenderParams: actor311294.body.bodyType === Body.StaticBody
            id: graphic44
            sizeScale: 1.6926013
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.friction: 0
        body.vertices: [[-1.12308, 5.73769], [0.503749, 5.75962], [0.489024, 4.815], [0.689005, 4.21185], [0.902056, 3.79851], [1.48531, 2.83194], [1.50264, 0.608521], [0.883057, -0.990253], [-0.0133638, -2.56355], [-1.13144, -3.60424]]
        id: actor316831
        objectName: "actor316831"
        property alias bodyRenderer: graphic45
        x: -0.61082286
        y: -21.668242
        z: -1
        TerrainMeshRenderer {
            id: graphic45
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic45baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "VqWGv4RbtcCOtYu/B85gQJnzu71cGCBAVqWGv4RbtcCZ87u9XBggQFLxSj9Dg3I/VqWGv4RbtcBS8Uo/Q4NyP0e/sz+IYyC/VqWGv4RbtcBHv7M/iGMgv0vNsT8FgTPAVqWGv4RbtcBLzbE/BYEzwKuTUD/D+2/AVqWGv4RbtcCrk1A/w/tvwGPJGD/yiYXAVqWGv4RbtcBjyRg/8omFwM7Fxz44mJnAzsXHPjiYmcB4rd0+KQy2wFalhr+EW7XA"
            }
            PolygonVertexAttributeArray {
                id: graphic45baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "Hoczvq7n+D9oRzq+oELUPiKaerwYRRU/Hoczvq7n+D8imnq8GEUVP4xLBz7KlFc/Hoczvq7n+D+MSwc+ypRXP7Spbz6hXY0/Hoczvq7n+D+0qW8+oV2NP7oRbT6s1bs/Hoczvq7n+D+6EW0+rNW7Px0NCz6W/s8/Hoczvq7n+D8dDQs+lv7PPy+3yz2iBtk/Hoczvq7n+D8vt8s9ogbZP4ouhT17ZeY/ii6FPXtl5j/7yJM9cV35Px6HM76u5/g/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic45baseMesha_position, graphic45baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic45edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "jrWLvwfOYEBB8JW/3YlsQIHcmL+62rnAjrWLvwfOYECB3Ji/utq5wFalhr+EW7XAVqWGv4RbtcCB3Ji/utq5wK0UEz93kbrAVqWGv4RbtcCtFBM/d5G6wHit3T4pDLbAeK3dPikMtsCtFBM/d5G6wGt+Fj/CkJrAeK3dPikMtsBrfhY/wpCawM7Fxz44mJnAzsXHPjiYmcBrfhY/wpCawOr7Rz8BBYjAzsXHPjiYmcDq+0c/AQWIwGPJGD/yiYXAY8kYP/KJhcDq+0c/AQWIwJFGfT/JOXbAY8kYP/KJhcCRRn0/yTl2wKuTUD/D+2/Aq5NQP8P7b8CRRn0/yTl2wP5vyj/6+zbAq5NQP8P7b8D+b8o/+vs2wEvNsT8FgTPAS82xPwWBM8D+b8o/+vs2wN3tzD+QLBe/S82xPwWBM8Dd7cw/kCwXv0e/sz+IYyC/R7+zP4hjIL/d7cw/kCwXv74ueT+eP4Q/R7+zP4hjIL++Lnk/nj+EP1LxSj9Dg3I/UvFKP0ODcj++Lnk/nj+EP5k2hT0UCihAUvFKP0ODcj+ZNoU9FAooQJnzu71cGCBAmfO7vVwYIECZNoU9FAooQEHwlb/diWxAmfO7vVwYIEBB8JW/3YlsQI61i78HzmBA"
            }
            PolygonVertexAttributeArray {
                id: graphic45edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "aEc6vqBC1D4C60e+hJ3EPqzQS74n5/s/aEc6vqBC1D6s0Eu+J+f7Px6HM76u5/g/Hoczvq7n+D+s0Eu+J+f7P5IbxD36YPw/Hoczvq7n+D+SG8Q9+mD8P/vIkz1xXfk/+8iTPXFd+T+SG8Q9+mD8P4+oyD0sC+c/+8iTPXFd+T+PqMg9LAvnP4ouhT17ZeY/ii6FPXtl5j+PqMg9LAvnP5xSBT4Brto/ii6FPXtl5j+cUgU+Aa7aPy+3yz2iBtk/L7fLPaIG2T+cUgU+Aa7aP7bZKD5DE9I/L7fLPaIG2T+22Sg+QxPSPx0NCz6W/s8/HQ0LPpb+zz+22Sg+QxPSP1T1hj6p/rw/HQ0LPpb+zz9U9YY+qf68P7oRbT6s1bs/uhFtPqzVuz9U9YY+qf68P5SeiD4MmYw/uhFtPqzVuz+Unog+DJmMP7Spbz6hXY0/tKlvPqFdjT+Unog+DJmMPyofJj7L6lM/tKlvPqFdjT8qHyY+y+pTP4xLBz7KlFc/jEsHPsqUVz8qHyY+y+pTPyKeMTxI+Q8/jEsHPsqUVz8injE8SPkPPyKaerwYRRU/Ipp6vBhFFT8injE8SPkPPwLrR76EncQ+Ipp6vBhFFT8C60e+hJ3EPmhHOr6gQtQ+"
            }
            PolygonVertexAttributeArray {
                id: graphic45edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAAJB4FUAAAAAAAAAAAAAAgD+QeBVAAAAAAJB4FUAAAIA/kHgVQAAAgD+QeBVAAAAAAKSAL0AAAAAAkHgVQAAAgD+kgC9AAAAAAKSAL0AAAIA/pIAvQAAAgD+kgC9AAAAAAEaePkAAAAAApIAvQAAAgD9Gnj5AAAAAAEaePkAAAIA/Rp4+QAAAgD9Gnj5AAAAAAAnJSEAAAAAARp4+QAAAgD8JyUhAAAAAAAnJSEAAAIA/CclIQAAAgD8JyUhAAAAAAL85UEAAAAAACclIQAAAgD+/OVBAAAAAAL85UEAAAIA/vzlQQAAAgD+/OVBAAAAAAMVJYkAAAAAAvzlQQAAAgD/FSWJAAAAAAMVJYkAAAIA/xUliQAAAgD/FSWJAAAAAAJXugkAAAAAAxUliQAAAgD+V7oJAAAAAAJXugkAAAIA/le6CQAAAgD+V7oJAAAAAACamkEAAAAAAle6CQAAAgD8mppBAAAAAACamkEAAAIA/JqaQQAAAgD8mppBAAAAAAJMin0AAAAAAJqaQQAAAgD+TIp9AAAAAAJMin0AAAIA/kyKfQAAAgD+TIp9AAAAAAM9aq0AAAAAAkyKfQAAAgD/PWqtAAAAAAM9aq0AAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic45edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAPwAA4EAAAIA/AAAAAAAAgD8AAOBAAACAPwAA4EAAAIA/AAAAAAAAgD8AAAAAAACAP3cwnD8AAIA/AAAAAAAAgD93MJw/AACAP3cwnD8AAIA/dzCcPwAAgD93MJw/AACAP0Li9j8AAIA/dzCcPwAAgD9C4vY/AACAP0Li9j8AAIA/QuL2PwAAgD9C4vY/AACAP2vxGUAAAIA/QuL2PwAAgD9r8RlAAACAP2vxGUAAAIA/a/EZQAAAgD9r8RlAAACAP4xDMEAAAIA/a/EZQAAAgD+MQzBAAACAP4xDMEAAAIA/jEMwQAAAgD+MQzBAAACAP59zZkAAAIA/jEMwQAAAgD+fc2ZAAACAP59zZkAAAIA/n3NmQAAAgD+fc2ZAAACAP+iWqEAAAIA/n3NmQAAAgD/olqhAAACAP+iWqEAAAIA/6JaoQAAAgD/olqhAAACAP5y90UAAAIA/6JaoQAAAgD+cvdFAAACAP5y90UAAAIA/nL3RQAAAgD+cvdFAAACAP+Qy/UAAAIA/nL3RQAAAgD/kMv1AAACAP+Qy/UAAAIA/5DL9QAAAgD/kMv1AAACAP8ztEEEAAIA/5DL9QAAAgD/M7RBBAACAP8ztEEEAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic45edgeMesha_position, graphic45edgeMesha_texCoord, graphic45edgeMesha_maskTexCoord, graphic45edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic45bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic45bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic45bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic45bevelMesha_position, graphic45bevelMesha_texCoord, graphic45bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.friction: 0
        body.vertices: [[-1.45113, 4.44554], [1, 4.4199], [1, -1], [0.992191, -3.21591], [-0.161357, -3.21743], [-0.244098, -2.09957], [-0.948868, -0.980823], [-1.5359, 1.16976], [-1.35812, 2.33515], [-1.28459, 3.36084]]
        id: actor316832
        objectName: "actor316832"
        property alias bodyRenderer: graphic46
        x: 201.01076
        y: -29.505148
        z: -1
        TerrainMeshRenderer {
            id: graphic46
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic46baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "Qh6hv+q8FMAf0be/BHeWv+V5W78AyXA/R6OXvy9aV8BCHqG/6rwUwOV5W78AyXA/R6OXvy9aV8DleVu/AMlwP/awGL4FXwRAChOwvxYpjMBHo5e/L1pXwPawGL4FXwRA9rAYvgVfBEBwML+9HTlJQDvraz+jSUlAChOwvxYpjMD2sBi+BV8EQDvraz+jSUlAChOwvxYpjMA762s/o0lJQGpmZj9/9H8/amZmP3/0fz+8zW0/ny+LwAoTsL8WKYzA"
            }
            PolygonVertexAttributeArray {
                id: graphic46baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "A9NWvk6UsT/UFnW+1hOZP0RREr6A3lc/Ci9KvrrIxz8D01a+TpSxP0RREr6A3lc/Ci9KvrrIxz9EURK+gN5XP56Wy7ynwCc/DsRqvrpw3T8KL0q+usjHP56Wy7ynwCc/npbLvKfAJz9A63682LPzPn1HHT7QnfM+DsRqvrpw3T+elsu8p8AnP31HHT7QnfM+DsRqvrpw3T99Rx0+0J3zPpyZGT5AV1U/nJkZPkBXVT8oiR4+asrcPw7Ear66cN0/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic46baseMesha_position, graphic46baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic46edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "R6OXvy9aV8CIN7G/3tVWwPZpw7+TWpDAR6OXvy9aV8D2acO/k1qQwAoTsL8WKYzAChOwvxYpjMD2acO/k1qQwCEZiT8SsI/AChOwvxYpjMAhGYk/ErCPwLzNbT+fL4vAvM1tP58vi8AhGYk/ErCPwMzMjD/ABYA/vM1tP58vi8DMzIw/wAWAP2pmZj9/9H8/amZmP3/0fz/MzIw/wAWAP5kKiD89WVJAamZmP3/0fz+ZCog/PVlSQDvraz+jSUlAO+trP6NJSUCZCog/PVlSQCDdar6gm1JAO+trP6NJSUAg3Wq+oJtSQHAwv70dOUlAcDC/vR05SUAg3Wq+oJtSQGGcrb6jXwhAcDC/vR05SUBhnK2+o18IQPawGL4FXwRA9rAYvgVfBEBhnK2+o18IQA4shb/BsoI/9rAYvgVfBEAOLIW/wbKCP+V5W78AyXA/5XlbvwDJcD8OLIW/wbKCP+Bf0b8c/pS/5XlbvwDJcD/gX9G/HP6Uvx/Rt78Ed5a/H9G3vwR3lr/gX9G/HP6Uvy6Pur9yKRbAH9G3vwR3lr8uj7q/cikWwEIeob/qvBTAQh6hv+q8FMAuj7q/cikWwIg3sb/e1VbAQh6hv+q8FMCIN7G/3tVWwEejl78vWlfA"
            }
            PolygonVertexAttributeArray {
                id: graphic46edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "Ci9KvrrIxz8LSmy+oJzHP6RGgr5iPOA/Ci9KvrrIxz+kRoK+YjzgPw7Ear66cN0/DsRqvrpw3T+kRoK+YjzgPyzMNj63yt8/DsRqvrpw3T8szDY+t8rfPyiJHj5qytw/KIkePmrK3D8szDY+t8rfP7u7Oz5qU1U/KIkePmrK3D+7uzs+alNVP5yZGT5AV1U/nJkZPkBXVT+7uzs+alNVP3djNT4Eiec+nJkZPkBXVT93YzU+BInnPn1HHT7QnfM+fUcdPtCd8z53YzU+BInnPmuTHL2AMOc+fUcdPtCd8z5rkxy9gDDnPkDrfrzYs/M+QOt+vNiz8z5rkxy9gDDnPix7Z72TFSU/QOt+vNiz8z4se2e9kxUlP56Wy7ynwCc/npbLvKfAJz8se2e9kxUlPxOQMb4Vb1Q/npbLvKfAJz8TkDG+FW9UP0RREr6A3lc/RFESvoDeVz8TkDG+FW9UP0CVi74F1Zg/RFESvoDeVz9AlYu+BdWYP9QWdb7WE5k/1BZ1vtYTmT9AlYu+BdWYP+i+eL7RDbI/1BZ1vtYTmT/ovni+0Q2yPwPTVr5OlLE/A9NWvk6UsT/ovni+0Q2yPwtKbL6gnMc/A9NWvk6UsT8LSmy+oJzHPwovSr66yMc/"
            }
            PolygonVertexAttributeArray {
                id: graphic46edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAAMB3jD4AAAAAAAAAAAAAgD/Ad4w+AAAAAMB3jD4AAIA/wHeMPgAAgD/Ad4w+AAAAAFIdYz8AAAAAwHeMPgAAgD9SHWM/AAAAAFIdYz8AAIA/Uh1jPwAAgD9SHWM/AAAAAEB/D0AAAAAAUh1jPwAAgD9Afw9AAAAAAEB/D0AAAIA/QH8PQAAAgD9Afw9AAAAAAKrzMkAAAAAAQH8PQAAAgD+q8zJAAAAAAKrzMkAAAIA/qvMyQAAAgD+q8zJAAAAAAJloRUAAAAAAqvMyQAAAgD+ZaEVAAAAAAJloRUAAAIA/mWhFQAAAgD+ZaEVAAAAAAOJXV0AAAAAAmWhFQAAAgD/iV1dAAAAAAOJXV0AAAIA/4ldXQAAAgD/iV1dAAAAAALx/bEAAAAAA4ldXQAAAgD+8f2xAAAAAALx/bEAAAIA/vH9sQAAAgD+8f2xAAAAAAGUViEAAAAAAvH9sQAAAgD9lFYhAAAAAAGUViEAAAIA/ZRWIQAAAgD9lFYhAAAAAAL+DkUAAAAAAZRWIQAAAgD+/g5FAAAAAAL+DkUAAAIA/v4ORQAAAgD+/g5FAAAAAAL69mUAAAAAAv4ORQAAAgD++vZlAAAAAAL69mUAAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic46edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAP6CzUj8AAIA/AAAAAAAAgD+gs1I/AACAP6CzUj8AAIA/oLNSPwAAgD+gs1I/AACAP/5VKkAAAIA/oLNSPwAAgD/+VSpAAACAP/5VKkAAAIA//lUqQAAAgD/+VSpAAACAP+E+10AAAIA//lUqQAAAgD/hPtdAAACAP+E+10AAAIA/4T7XQAAAgD/hPtdAAACAP8A2BkEAAIA/4T7XQAAAgD/ANgZBAACAP8A2BkEAAIA/wDYGQQAAgD/ANgZBAACAP3MOFEEAAIA/wDYGQQAAgD9zDhRBAACAP3MOFEEAAIA/cw4UQQAAgD9zDhRBAACAP+qBIUEAAIA/cw4UQQAAgD/qgSFBAACAP+qBIUEAAIA/6oEhQQAAgD/qgSFBAACAP81fMUEAAIA/6oEhQQAAgD/NXzFBAACAP81fMUEAAIA/zV8xQQAAgD/NXzFBAACAPxcgTEEAAIA/zV8xQQAAgD8XIExBAACAPxcgTEEAAIA/FyBMQQAAgD8XIExBAACAP55FWkEAAIA/FyBMQQAAgD+eRVpBAACAP55FWkEAAIA/nkVaQQAAgD+eRVpBAACAP5ycZkEAAIA/nkVaQQAAgD+cnGZBAACAP5ycZkEAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic46edgeMesha_position, graphic46edgeMesha_texCoord, graphic46edgeMesha_maskTexCoord, graphic46edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic46bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic46bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic46bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic46bevelMesha_position, graphic46bevelMesha_texCoord, graphic46bevelMesha_blendTexCoord]
            }
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor326828.image) { actor326828.image.cacheRenderParams = false; }if (actor326830.image) { actor326830.image.cacheRenderParams = false; }if (actor326831.image) { actor326831.image.cacheRenderParams = false; }if (actor330835.image) { actor330835.image.cacheRenderParams = false; }}
        body.vertices: [[-2.959, -0.635253], [-0.957226, -0.601423], [-1.00567, -3.18325], [-2.94053, -2.95087]]
        id: actor328429
        inputs: [actor0]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326831
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326828
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326830
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor330835
                targetProperty: "body.active"
            }
        ]
        objectName: "actor328429"
        visible: false
        x: 130.55841
        y: -11.21207
        z: -1
    }
    Polygon {
        body.vertices: [[-1.00071, 0.688207], [-0.759743, 0.688066], [-0.75956, -1], [-1, -1], [-1.0335, -0.692282], [-1.03364, -0.493301], [-0.87653, -0.296641], [-0.940144, -0.227449], [-1.29617, -0.0972172], [-1.351, -0.0281322], [-1.27173, 0.0574004], [-1.1199, 0.0830306], [-1.14573, 0.208009], [-1.16961, 0.307483], [-1.21502, 0.367005], [-1.19724, 0.453968], [-1.14717, 0.567623], [-1.06993, 0.671208]]
        id: actor330835
        objectName: "actor330835"
        visible: false
        x: 128.4382
        y: -12.824513
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor0.image) { actor0.image.cacheRenderParams = false; }if (actor326831.image) { actor326831.image.cacheRenderParams = false; }}
        body.vertices: [[-0.190811, 2.543], [0.168625, 2.543], [0.168625, -0.314816], [-0.190811, -0.314816]]
        id: actor331998
        inputs: [actor326831, actor326828, actor326830]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 6
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor0
                targetProperty: "body.linearVelocity.x"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: -1.5
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326831
                targetProperty: "body.linearVelocity.x"
            }
        ]
        objectName: "actor331998"
        visible: false
        x: 126.8279
        y: -13.773061
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor326828.image) { actor326828.image.cacheRenderParams = false; }if (actor326830.image) { actor326830.image.cacheRenderParams = false; }if (actor326831.image) { actor326831.image.cacheRenderParams = false; }if (actor331998.image) { actor331998.image.cacheRenderParams = false; }if (actor340478.image) { actor340478.image.cacheRenderParams = false; }if (actor348174.image) { actor348174.image.cacheRenderParams = false; }}
        body.vertices: [[-1.66581, 2.543], [0.743843, 2.543], [0.743843, 1.71852], [-1.66581, 1.71852]]
        id: actor334417
        inputs: [actor326831, actor326828, actor326830]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 0.3
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326830
                targetProperty: "body.restitution"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 100
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326830
                targetProperty: "body.density"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 100
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326828
                targetProperty: "body.density"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 100
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor326831
                targetProperty: "body.density"
            },
            InterpolationLogic {
                backwardDuration: 1.66666674613953
                endValue: 0
                forwardDuration: 1.66666674613953
                smoothing: 0
                target: actor348174
                targetProperty: "emitterLogic.spawnRate"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor331998
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor340478
                targetProperty: "body.active"
            }
        ]
        objectName: "actor334417"
        visible: false
        x: 126.8279
        y: -13.773061
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.477016, 0.754311], [0.531218, 0.754311], [0.531218, -0.220021], [-0.477016, -0.220021]]
        id: actor370912
        objectName: "actor370912"
        property alias image: graphic51
        rotation: -107.06793
        x: 133.46225
        y: -13.4095545
        z: -1
        ImageRenderer {
            cacheRenderParams: actor370912.body.bodyType === Body.StaticBody
            id: graphic51
            sizeScale: 1.6926013
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.vertices: [[-1, 1], [201.032, 1], [201.032, -1], [-1, -1]]
        id: actor14856
        objectName: "actor14856"
        y: -35.925762
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.246641, 0.00104438], [-0.044501, 0.221139], [0.570699, 0.31426], [1.53046, 0.252249], [2.46003, 0.415607], [3.36402, 0.347464], [3.79214, 0.417593], [4.591, -0.508346], [4.57489, -0.641778], [4.43559, -0.644167], [4.23111, -0.54777], [4.02208, -0.450478], [3.84791, -0.34239], [3.66341, -0.272741], [3.46122, -0.248918], [3.29823, -0.251296], [2.78339, -0.286007], [1.03107, -0.384817], [-0.0586908, -0.56935], [-0.349245, -0.552146], [-0.527264, -0.504435], [-0.588955, -0.393546]]
        id: actor36630
        objectName: "actor36630"
        visible: false
        x: 55.015293
        y: -12.740647
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[1.12391, 0.123895], [0.897173, 0.195974], [0.486863, 0.264036], [-0.14099, 0.283288], [-1.64073, 0.27719], [-2.21729, 0.318349], [-2.52918, 0.278515], [-2.8778, 0.125636], [-3.01887, -0.0666736], [-3.02215, -0.27169], [-2.86457, -0.302436], [-2.67393, -0.288979], [-2.50415, -0.203211], [-2.35117, -0.154071], [-2.12097, -0.14456], [-1.85925, -0.132584], [0.175904, -0.17046], [0.446434, -0.208009], [0.674851, -0.260123], [0.871095, -0.310738], [1.05982, -0.387111], [1.22596, -0.386487], [1.31483, -0.277818], [1.26046, -0.0245129]]
        id: actor36675
        objectName: "actor36675"
        visible: false
        x: 180.84819
        y: -24.954714
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.12391, 0.123895], [-0.897173, 0.195974], [-0.486863, 0.264036], [0.14099, 0.283288], [1.64073, 0.27719], [2.21729, 0.318349], [2.52918, 0.278515], [2.8778, 0.125636], [3.01887, -0.0666736], [3.02215, -0.27169], [2.86457, -0.302436], [2.6804, -0.276047], [2.50415, -0.203211], [2.35117, -0.163771], [2.12935, -0.167603], [1.85602, -0.142282], [-0.175904, -0.17046], [-0.446434, -0.208009], [-0.674851, -0.260123], [-0.871095, -0.310738], [-1.05982, -0.387111], [-1.22596, -0.386487], [-1.31483, -0.277818], [-1.26046, -0.0245129]]
        id: actor36677
        objectName: "actor36677"
        visible: false
        x: 56.955063
        y: -22.982998
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.83818, 2.09381], [1.68481, 2.09381], [1.68481, 1.5702], [-1.83818, 1.5702]]
        id: actor38185
        objectName: "actor38185"
        property alias image: graphic56
        rotation: -0.75
        x: 56.994106
        y: -14.531123
        ImageRenderer {
            cacheRenderParams: actor38185.body.bodyType === Body.StaticBody
            id: graphic56
            sizeScale: 5.229526
            source: Util.getPathToImage("middleground_e1/deco_e1_platform01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.528039], [-0.424806, -0.528039]]
        id: actor38405
        objectName: "actor38405"
        property alias image: graphic57
        x: 76.127655
        y: -13.977871
        ImageRenderer {
            cacheRenderParams: actor38405.body.bodyType === Body.StaticBody
            id: graphic57
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor38106
        objectName: "actor38106"
        property alias image: graphic58
        rotation: 2.6999998
        x: 57.82734
        y: -24.449123
        ImageRenderer {
            cacheRenderParams: actor38106.body.bodyType === Body.StaticBody
            id: graphic58
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor38105
        objectName: "actor38105"
        property alias image: graphic59
        x: 179.94797
        y: -26.422422
        ImageRenderer {
            cacheRenderParams: actor38105.body.bodyType === Body.StaticBody
            id: graphic59
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-2.95996, 7.16922], [3.02521, 7.19277], [8.08566, -5.03917], [10.032, -7.33385], [12.5836, -8.23911], [14.8871, -8.30281], [16.9676, -7.64047], [17.8811, -6.38375], [19.0456, -5.62788], [20.9889, -5.32289], [22.6502, -4.28302], [23.1022, -2.73708], [20.4438, 7.16301], [26.4732, 7.15271], [34.5165, -4.67738], [37.8853, -6.11077], [41.5819, -6.54684], [44.5657, -6.29299], [45.8814, -5.10451], [46.7832, -3.29788], [48.6969, -2.11743], [48.9983, -0.573048], [48.5423, 1.07324], [46.2343, 4.39125], [41.7841, 7.12656], [55.4537, 7.1032], [53.3204, 1.23061], [53.7761, -0.318594], [54.7272, -1.53088], [56.3106, -2.28021], [58.273, -2.5061], [58.8081, -1.12092], [59.1263, 0.783987], [58.965, 2.88118], [64.5546, 7.08766], [72.7617, 7.08181], [73.4525, 2.33285], [75.0978, 1.36063], [78.3489, 1.72221], [79.8439, 1.48316], [80.8285, 0.667379], [80.9229, -1.04784], [81.3688, -2.03508], [82.8851, -2.60442], [84.5489, -2.8256], [87.1532, -2.59713], [88.838, -1.30667], [90.6454, -0.805372], [91.3986, -1.9404], [92.6852, -2.60514], [94.1351, -2.88245], [95.5382, -2.828], [96.319, -1.86392], [96.4444, -0.201402], [95.8544, 0.999615], [94.2669, 2.37974], [92.3418, 3.41901], [93.051, 7.03898], [113.327, 7.00434], [116.007, 3.70759], [115.393, -0.946615], [116.686, -2.07691], [118.404, -3.00492], [121.051, -3.70627], [123.491, -3.96874], [123.821, -3.02591], [124.321, -2.37888], [128.976, -2.31131], [130.157, -2.54063], [130.712, -2.25992], [131.083, -1.81906], [131.802, -1.56097], [132.47, -1.49492], [133.38, -0.383198], [133.793, 0.597914], [133.904, 1.57964], [138.862, 2.13138], [140.186, 1.7182], [141.567, 1.77957], [142.72, 2.45596], [143.197, 3.88922], [143.045, 6.95357], [161.353, 6.9223], [163.243, 2.79046], [164.929, 1.75601], [166.806, 1.29994], [168.488, 1.30463], [171.07, 2.70143], [175.199, 6.89865], [181.129, 6.88852], [182.81, 2.09301], [183.495, 1.03443], [184.575, 0.213284], [186.005, -0.211082], [187.769, -0.0175251], [188.991, 0.929572], [190.899, 6.87183], [200.036, 6.85908], [200.047, -3.93495], [194.073, -6.96831], [192.873, -8.86668], [193.278, -10.6612], [194.476, -11.9471], [200.101, -13.1374], [200.1, -19.7709], [198.757, -19.7329], [192.937, -19.7445], [192.212, -19.4548], [191.482, -18.8576], [191.134, -17.8783], [191.231, -17.0676], [191.637, -16.3266], [192.173, -15.8143], [192.682, -15.1597], [192.868, -14.5058], [192.909, -13.7775], [192.694, -13.1324], [192.201, -12.6435], [191.668, -12.2634], [191.104, -11.9992], [190.419, -11.6981], [189.552, -11.4578], [188.54, -11.2058], [187.664, -11.0261], [186.875, -10.8704], [186.042, -10.8284], [184.866, -10.8758], [184.202, -11.013], [183.483, -11.293], [182.753, -11.687], [181.951, -12.5162], [180.611, -13.2089], [179.743, -13.0712], [178.521, -12.4837], [177.388, -12.2931], [176.044, -12.2447], [173.359, -12.0516], [171.239, -11.9021], [168.972, -11.7732], [167.48, -11.8106], [166.422, -11.8598], [165.739, -12.1009], [165.4, -12.2971], [165.039, -12.3212], [164.591, -12.213], [164.182, -11.9286], [164.041, -11.0081], [164.095, -10.0031], [164.511, -8.91186], [164.668, -7.61719], [164.261, -6.16453], [164.162, -5.07422], [164.514, -4.30755], [165.236, -4.17358], [166.102, -4.1157], [167.49, -3.79702], [168.689, -3.36516], [170.385, -3.15764], [172.336, -3.19659], [172.777, -3.43059], [173.315, -4.14954], [174.53, -4.70068], [175.165, -5.42748], [176.606, -5.61562], [177.82, -5.30276], [178.27, -4.81156], [178.31, -4.20306], [178.408, -3.54156], [178.743, -3.3191], [179.598, -3.48883], [180.429, -3.53092], [181.262, -3.45077], [182.014, -3.19743], [182.585, -2.81523], [182.94, -2.26875], [183.039, -1.57688], [182.995, -0.816206], [182.836, -0.122149], [182.506, 0.412464], [181.969, 0.722228], [181.386, 0.85913], [180.69, 0.892763], [179.709, 0.831476], [179.011, 0.661786], [178.296, 0.307765], [177.784, -0.169551], [177.452, -0.636243], [177.253, -0.692775], [177.129, -0.484749], [176.452, -0.473402], [176.31, -0.683529], [176.14, -0.706906], [175.989, -0.444974], [175.973, 0.0021317], [175.869, 0.463197], [175.502, 1.07515], [174.985, 1.49865], [174.282, 1.73775], [173.494, 1.79782], [172.578, 1.77224], [171.787, 1.55744], [171.011, 1.03613], [170.095, 0.466808], [168.989, 0.0358842], [167.672, -0.244924], [166.554, -0.305954], [165.371, -0.209362], [164.298, -0.0290829], [163.257, 0.21625], [162.285, 0.365365], [161.659, 0.371455], [161.18, 0.341285], [160.941, 0.290997], [160.811, 0.271954], [160.667, 0.356714], [160.538, 0.609493], [159.996, 0.605157], [159.788, 0.287276], [159.658, 0.126836], [159.523, 0.119592], [159.212, 0.328551], [158.931, 0.378505], [158.081, 0.36407], [156.335, 0.409198], [154.462, 0.499941], [153.825, 0.423785], [153.263, 0.275276], [153.088, 0.27543], [152.842, 0.660624], [152.195, 0.653503], [152.036, 0.343829], [151.921, 0.289062], [151.446, 0.405061], [150.839, 0.240414], [150.356, 0.0366512], [149.724, -0.253453], [149.215, -0.128902], [149.022, 0.162699], [148.874, 0.660164], [148.444, 1.16064], [147.433, 1.64054], [146.41, 1.8698], [145.736, 1.89991], [145.019, 1.85519], [144.454, 1.6723], [143.853, 1.30309], [143.169, 0.831255], [142.638, 0.503347], [141.998, 0.294402], [141.623, 0.250743], [141.295, 0.283472], [141.013, 0.45963], [140.636, 0.526583], [140.272, 0.550168], [139.82, 0.544616], [139.286, 0.491203], [138.458, 0.225218], [137.623, -0.194736], [136.256, -0.977726], [134.692, -2.09413], [133.831, -2.82161], [133.093, -3.5483], [132.708, -4.01899], [132.253, -4.50797], [131.853, -5.07151], [131.54, -5.56119], [131.279, -6.01999], [131.067, -6.50382], [130.926, -6.69828], [130.676, -6.77396], [130.481, -6.79881], [130.334, -6.80855], [130.177, -6.78798], [129.886, -6.70803], [129.228, -6.56682], [128.273, -6.5432], [127.638, -6.60106], [127.064, -6.79935], [126.481, -6.79474], [126.385, -6.72364], [126.2, -6.56801], [125.985, -6.36609], [125.626, -6.23105], [125.266, -6.14776], [124.93, -6.16609], [124.628, -6.2893], [124.391, -6.52016], [124.255, -6.80042], [124.221, -7.19219], [123.991, -7.31172], [123.665, -7.34693], [123.316, -7.32131], [123.101, -7.06959], [123.107, -6.4956], [122.954, -5.93807], [122.658, -5.43936], [122.199, -5.14915], [121.68, -4.9704], [121.071, -4.91167], [120.472, -4.87427], [119.394, -4.84996], [118.187, -4.8269], [116.575, -4.91964], [115.251, -5.02204], [114.135, -5.09389], [112.803, -5.11205], [111.384, -5.10536], [110.113, -5.06551], [109.265, -4.98939], [108.871, -4.90632], [108.138, -4.5993], [107.195, -4.46899], [105.841, -4.38806], [104.557, -4.44706], [103.41, -4.65022], [102.504, -5.03333], [101.829, -5.30002], [101.082, -5.58966], [100.494, -5.82163], [99.8843, -6.10046], [99.2298, -6.55193], [98.7503, -6.98388], [98.2073, -7.64946], [97.5772, -7.96157], [96.5875, -8.06155], [95.5619, -8.20255], [94.4453, -8.4227], [93.946, -8.57659], [93.5424, -8.49961], [93.2605, -8.13913], [93.1222, -7.75268], [93.2715, -7.2279], [93.6183, -7.00538], [94.1465, -7.02634], [95.2226, -6.86676], [96.1166, -6.7086], [96.5303, -6.51512], [96.9147, -6.22431], [97.1067, -5.91881], [97.2549, -5.55131], [97.264, -4.76773], [96.8564, -4.32329], [96.0814, -4.20265], [95.1956, -4.20444], [94.4108, -4.23275], [93.7303, -4.44565], [93.3112, -4.68387], [93.0135, -4.68767], [92.9119, -4.40228], [92.1578, -4.40326], [91.9834, -4.74022], [91.8098, -4.73252], [91.579, -4.58934], [91.1541, -4.44144], [89.6524, -4.19827], [88.8094, -4.32403], [87.8996, -4.38442], [86.7031, -4.45803], [85.8124, -4.50451], [84.8163, -4.54943], [83.7309, -4.56499], [82.4435, -4.52462], [81.4364, -4.50802], [80.5361, -4.47314], [79.5249, -4.43135], [78.1963, -4.3865], [76.5065, -4.42711], [74.7003, -4.35876], [73.1925, -4.25952], [71.7152, -4.2888], [71.1677, -4.39901], [70.6427, -4.67203], [70.1586, -5.06162], [69.8281, -5.54131], [69.5104, -6.37835], [69.3472, -7.06034], [69.1055, -7.31415], [68.8929, -7.27664], [68.7199, -7.02672], [68.7069, -6.54366], [68.6012, -6.13026], [68.366, -5.73992], [67.954, -5.51138], [67.4834, -5.42413], [66.8817, -5.39116], [66.1656, -5.43014], [65.5094, -5.53161], [65.0981, -5.66496], [64.8088, -5.68176], [64.5304, -5.57905], [64.3203, -5.31697], [64.2272, -4.7922], [63.9773, -4.31628], [63.7098, -4.06601], [63.3748, -3.93202], [63.0324, -3.88664], [62.6551, -3.88127], [62.2956, -3.92671], [62.0471, -4.01555], [61.8835, -4.15779], [61.7585, -4.3089], [61.5532, -4.29396], [61.381, -4.02629], [60.6809, -4.03158], [60.5208, -4.30176], [60.3269, -4.35215], [60.2212, -4.35201], [60.144, -4.22409], [60.0261, -4.1092], [59.7751, -4.01548], [59.4462, -4.03544], [59.045, -4.08985], [58.2162, -4.20254], [57.3632, -4.2629], [56.2776, -4.22287], [55.4918, -4.1211], [54.4814, -3.9407], [53.2746, -3.71794], [52.3562, -3.58553], [51.5486, -3.50912], [50.8099, -3.5642], [50.0777, -3.75336], [49.4298, -4.0343], [48.8584, -4.45985], [48.349, -5.04628], [48.0575, -5.67158], [47.9821, -6.32368], [47.9678, -6.99362], [48.0475, -7.59356], [48.1686, -8.06474], [48.5432, -8.65075], [48.9579, -9.09067], [49.3745, -9.48511], [50.0557, -9.84857], [50.8851, -10.0334], [51.7587, -10.0554], [52.6829, -9.96443], [53.3737, -9.66736], [53.7229, -9.5138], [53.9136, -9.61816], [53.9679, -9.88621], [53.7712, -10.306], [53.4347, -10.8154], [52.7248, -11.4607], [51.701, -11.7716], [50.6858, -11.8728], [49.785, -11.6241], [48.9435, -11.157], [47.9446, -10.5836], [46.7958, -9.96262], [45.3608, -9.39238], [43.715, -8.89187], [42.3542, -8.68689], [40.7899, -8.45033], [38.3851, -8.33344], [36.0868, -8.33736], [35.1961, -8.4364], [34.8279, -8.52022], [34.4989, -8.63145], [34.2492, -8.78219], [33.9767, -8.97557], [33.8056, -9.02521], [33.7225, -8.82877], [32.9703, -8.82602], [32.9341, -9.01767], [32.803, -8.98094], [32.6592, -8.85652], [32.376, -8.6821], [32.0383, -8.53414], [31.4755, -8.36352], [30.8348, -8.20328], [29.3909, -8.07983], [27.7757, -8.07694], [27.2566, -8.08942], [26.748, -8.15251], [25.6832, -8.46327], [24.8169, -8.72507], [24.3669, -8.81113], [23.9425, -8.80791], [23.6812, -8.67165], [23.1952, -8.24484], [22.5234, -7.5848], [21.6741, -7.26628], [21.2224, -7.20246], [20.591, -7.20776], [20.0614, -7.27536], [19.5467, -7.39207], [19.102, -7.58554], [18.7275, -7.84827], [18.5022, -8.14197], [18.3612, -8.42764], [18.2949, -8.7448], [18.2836, -9.21059], [18.2543, -9.52752], [18.0533, -9.8026], [17.7853, -9.95029], [17.2868, -10.1315], [16.8283, -10.3262], [16.4014, -10.5523], [16.0792, -10.6325], [15.4058, -10.6552], [14.7269, -10.5374], [14.0323, -10.2409], [13.2686, -9.98263], [12.5664, -9.8253], [11.7568, -9.66616], [11.0287, -9.61373], [10.1283, -9.58125], [9.17039, -9.56209], [8.09749, -9.58125], [6.90417, -9.67704], [6.01302, -9.83264], [5.31558, -9.96268], [4.76227, -10.025], [3.72109, -10.0188], [3.21444, -9.93461], [2.73368, -9.81208], [2.29622, -9.67704], [1.67202, -9.55073], [0.914142, -9.55073], [0.354781, -9.67704], [-0.0635685, -9.93872], [-0.40154, -10.3222], [-0.777091, -10.603], [-0.867827, -10.6281], [-2.96824, -10.6351]]
        id: actor39411
        objectName: "actor39411"
        property alias bodyRenderer: graphic60
        x: 0.9903946
        y: -5.330977
        TerrainMeshRenderer {
            id: graphic60
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic60baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic60baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic60baseMesha_position, graphic60baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic60edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic60edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic60edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic60edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic60edgeMesha_position, graphic60edgeMesha_texCoord, graphic60edgeMesha_maskTexCoord, graphic60edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic60bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic60bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "V0IaQb1WTz9+0BpBZBV2P9d3GkFKVHs/WdgaQQVlej/XdxpBSlR7P37QGkFkFXY/sNAaQQC1fj/XdxpBSlR7P1nYGkEFZXo/5bkaQRhngT/XdxpBSlR7P7DQGkEAtX4/5bkaQRhngT/XdxpBSlR7P3F+GUFhk40/5bkaQRhngT9xfhlBYZONPwcBGkGrvYw/vNEZQYabjz9xfhlBYZONPwcBGkGrvYw/Po0ZQRkFkj9xfhlBYZONP7zRGUGGm48/Po0ZQRkFkj9xfhlBYZONPwjrFkFhg58/Po0ZQRkFkj8I6xZBYYOfPy96F0H/XKA/69IWQWEOpD8I6xZBYYOfPy96F0H/XKA/69IWQWEOpD8I6xZBYYOfPzrkE0FUT6w/69IWQWEOpD865BNBVE+sP05TFEHw8q0/TlMUQfDyrT+v+xRBJBzZPzrkE0FUT6w/6UA1QQ2A2D+h/jhBOBCuP9t0OUHWG68/of44QTgQrj+TejhB69xmP9t0OUHWG68/OvifQXKaHD+mPJtB3KqvPnY0m0FAAp8+tx6bQV5Xqz52NJtBQAKfPqY8m0Hcqq8+uQSbQVCkpT52NJtBQAKfPrcem0FeV6s+qu+aQWzJnj52NJtBQAKfPrkEm0FQpKU+qu+aQWzJnj52NJtBQAKfPj44mkFAlus9qu+aQWzJnj4+OJpBQJbrPUYemkGskBI+0xOaQbROCT4+OJpBQJbrPUYemkGskBI+HA2aQbBw/j0+OJpBQJbrPdMTmkG0Tgk+YwqaQYha6T0+OJpBQJbrPRwNmkGwcP49wQuaQdgi1D0+OJpBQJbrPWMKmkGIWuk9KRGaQcCSvz0+OJpBQJbrPcELmkHYItQ9KRGaQcCSvz1PjZpBAPqQvT44mkFAlus9LAagQeRMeL8IAp9BsKhyv54Bn0H0mXa/CAKfQbCocr+eAZ9B9Jl2v1hdmkGe8Xa/CAKfQbCocr9YXZpBnvF2v8dnmkGuIXC/x2eaQa4hcL9YXZpBnvF2v3PPmUE61m+/x2eaQa4hcL9zz5lBOtZvv6wdmkHgQV+/rB2aQeBBX79zz5lBOtZvvz9AmUHuR2G/rB2aQeBBX78/QJlB7kdhv9+YmUHkelm/35iZQeR6Wb8/QJlB7kdhv4T8mEGEZkm/35iZQeR6Wb+E/JhBhGZJv904mUFaj0i/3TiZQVqPSL+nD5lBsLY1v4T8mEGEZkm/ImiaQdi6wL6oTZpBfAapvg85mkG4rZ2+/yeaQSw4kb4POZpBuK2dvqhNmkF8Bqm+/yeaQSw4kb4POZpBuK2dvuPPmUHkboO+/yeaQSw4kb7jz5lB5G6DvqAKmkHok4S+UO+ZQQhCc77jz5lB5G6DvqAKmkHok4S+5smZQWB7Yb7jz5lB5G6DvlDvmUEIQnO+5smZQWB7Yb7jz5lB5G6DvudfmUFw716+5smZQWB7Yb7nX5lBcO9evgejmUEYcFe+H0+ZQSgWOr7nX5lBcO9evgejmUEYcFe+H0+ZQSgWOr7nX5lBcO9evpzqmEGwZEO+H0+ZQSgWOr6c6phBsGRDvtUDmUG4nie+1QOZQbieJ76c6phBsGRDvqdcmEEIPCS+1QOZQbieJ76nXJhBCDwkvpZ8mEEg1e69lnyYQSDV7r2nXJhBCDwkvoWpl0EoYQu+lnyYQSDV7r2FqZdBKGELvmvKl0HgtZm9a8qXQeC1mb2FqZdBKGELvo/ZlkHw9+K9a8qXQeC1mb2P2ZZB8PfivV8tl0FANzi9ofuWQQBoHb2P2ZZB8PfivV8tl0FANzi9KciWQWASGb2P2ZZB8PfivaH7lkEAaB29KciWQWASGb2P2ZZB8PfivZ8llkEAD769KciWQWASGb2fJZZBAA++vYI6lkFggSy9gjqWQWCBLL2fJZZBAA++vZOClUHw8J29gjqWQWCBLL2TgpVB8PCdvceLlUFggSa9x4uVQWCBJr2TgpVB8PCdvXLVlEFALJW9x4uVQWCBJr1y1ZRBQCyVvavVlEFgG1G9q9WUQWAbUb1y1ZRBQCyVvRfik0FwC5+9q9WUQWAbUb0X4pNBcAufvesHlEHAQtW8kuWTQcBowrwX4pNBcAufvesHlEHAQtW8A8OTQUBbzbwX4pNBcAufvZLlk0HAaMK81qGTQcCY9bwX4pNBcAufvQPDk0FAW8281qGTQcCY9bwX4pNBcAufvddWk0Ew0bu91qGTQcCY9bzXVpNBMNG7vUlwk0GgiTa99xGTQVAhg73XVpNBMNG7vUlwk0GgiTa99xGTQVAhg73XVpNBMNG7vanAkkHwNfa99xGTQVAhg72pwJJB8DX2vWWpkkGA4cO9ZamSQYDhw72pwJJB8DX2vWAnkkGolyS+ZamSQYDhw71gJ5JBqJckvgsBkkGITgu+CwGSQYhOC75gJ5JBqJckvk2DkUHQcXm+CwGSQYhOC75Ng5FB0HF5vmtVkUGghTC+Y/2QQYCtSr5Ng5FB0HF5vmtVkUGghTC+Y/2QQYCtSr5Ng5FB0HF5vut5kEHEPZ++Y/2QQYCtSr7reZBBxD2fvnNnkEGMn4K+c2eQQYyfgr7reZBBxD2fvmXRj0GMW5i+c2eQQYyfgr5l0Y9BjFuYviLxj0Ho6n2+IvGPQejqfb5l0Y9BjFuYvmHXjkFok3S+IvGPQejqfb5h145BaJN0vvPpjkGgVle+8+mOQaBWV75h145BaJN0vi/rjUGAn2C+8+mOQaBWV74v641BgJ9gvjLxjUE4FEO+MvGNQTgUQ74v641BgJ9gvuPWjEFAoVu+MvGNQTgUQ77j1oxBQKFbvozbjEFoaDC+jNuMQWhoML7j1oxBQKFbvmaxikEQ30e+jNuMQWhoML5msYpBEN9HvqHvikHw//u9jryKQUAy9r1msYpBEN9HvqHvikHw//u9QomKQfCG+b1msYpBEN9Hvo68ikFAMva9QomKQfCG+b1msYpBEN9HvvP+iEEYjji+QomKQfCG+b3z/ohBGI44vrUCiUFQCxu+tQKJQVALG77z/ohBGI44vrcth0FgVSu+tQKJQVALG763LYdBYFUrvvVjh0GQjcW91kGHQeDdv723LYdBYFUrvvVjh0GQjcW9Qx+HQRAPwb23LYdBYFUrvtZBh0Hg3b+9nv2GQSAVyb23LYdBYFUrvkMfh0EQD8G9nv2GQSAVyb23LYdBYFUrvhP7hUHoKi++nv2GQSAVyb0T+4VB6Covvvf4hUGgvxG+9/iFQaC/Eb4T+4VB6CovvjofhUGwYzS+9/iFQaC/Eb46H4VBsGM0vj4UhUEwShi+PhSFQTBKGL46H4VBsGM0vsmOhEHg1E2+PhSFQTBKGL7JjoRB4NRNvmlfhEHwfxq+aV+EQfB/Gr7JjoRB4NRNvgtMhEFYbGG+aV+EQfB/Gr4LTIRBWGxhvm4ghEE46Bm+biCEQTjoGb4LTIRBWGxhvssJhEFgfWO+biCEQTjoGb7LCYRBYH1jvswVhEHgFh2+zBWEQeAWHb7LCYRBYH1jvqS0g0HgRFm+zBWEQeAWHb6ktINB4ERZvkDmg0FIFCK+QOaDQUgUIr6ktINB4ERZvutpg0GgEkC+QOaDQUgUIr7raYNBoBJAvgLDg0FoSiS+AsODQWhKJL7raYNBoBJAvgtQg0Ewdc29AsODQWhKJL4LUINBMHXNvVK8g0HAKvy9SrODQbCPyb0LUINBMHXNvVK8g0HAKvy9aqGDQTBdmb0LUINBMHXNvUqzg0Gwj8m9aqGDQTBdmb20WoNBACQcuwtQg0Ewdc29qq+DQXDv2T177oNBvO5cPmbQg0Gsx3Q+0/SDQYTibT5m0INBrMd0Pnvug0G87lw+GfWDQWghfz5m0INBrMd0PtP0g0GE4m0+S++DQb4QiD5m0INBrMd0Phn1g0FoIX8+S++DQb4QiD5m0INBrMd0Prd8g0EaTcU+S++DQb4QiD63fINBGk3FPnOsg0E4fsc+c6yDQTh+xz63fINBGk3FPp1og0EAVfs+c6yDQTh+xz6daINBAFX7PoaRg0GSkvk+hpGDQZKS+T4oqYNBGrUPP51og0EAVfs+tXmSQYx3az8iZJJBTHx+P6lXkkFp2H0/ImSSQUx8fj+pV5JBadh9P2cPkkGsMoY/ImSSQUx8fj9nD5JBrDKGP+hHkkFgvoU/ADySQTDEhz9nD5JBrDKGP+hHkkFgvoU/oSqSQdegiT9nD5JBrDKGPwA8kkEwxIc/VBSSQbpFiz9nD5JBrDKGP6EqkkHXoIk/VBSSQbpFiz9nD5JBrDKGP72akUFCb4o/VBSSQbpFiz+9mpFBQm+KPyPhkUGe4I0/b72RQVoxkD+9mpFBQm+KPyPhkUGe4I0/KpORQboGkj+9mpFBQm+KP2+9kUFaMZA/KpORQboGkj+9mpFBQm+KP7UekUGxQ4w/KpORQboGkj+1HpFBsUOMP4tekUESgJM/6jCRQUkAlT+1HpFBsUOMP4tekUESgJM/6f6QQdDJlT+1HpFBsUOMP+owkUFJAJU/6f6QQdDJlT+1HpFBsUOMPziNkEEUtYw/6f6QQdDJlT84jZBBFLWMP/2/kEFt65U/yJ2QQUc6lj84jZBBFLWMP/2/kEFt65U/Q3uQQdUelj84jZBBFLWMP8idkEFHOpY/t1mQQRyalT84jZBBFLWMP0N7kEHVHpY/t1mQQRyalT84jZBBFLWMP1XBj0GQ6Is/t1mQQRyalT9VwY9BkOiLP+Pkj0FIq5I/noSPQRR9kD9VwY9BkOiLP+Pkj0FIq5I/noSPQRR9kD9VwY9BkOiLP2Euj0FyrIk/noSPQRR9kD9hLo9BcqyJPwQaj0E+K40/BBqPQT4rjT9hLo9BcqyJP2mXjkH6/YQ/BBqPQT4rjT9pl45B+v2EP5yPjkEFEos/J1+OQST7iT9pl45B+v2EP5yPjkEFEos/hTOOQZpFiD9pl45B+v2EPydfjkEk+4k/hTOOQZpFiD9pl45B+v2EP8cqjkHgWH0/hTOOQZpFiD/HKo5B4Fh9P7sCjkHKbYU/A/KNQYSdhD/HKo5B4Fh9P7sCjkHKbYU/8+ONQeqfgz/HKo5B4Fh9PwPyjUGEnYQ/BtmNQYF9gj/HKo5B4Fh9P/PjjUHqn4M/l9GNQQxAgT/HKo5B4Fh9PwbZjUGBfYI/582NQXHkfz/HKo5B4Fh9P5fRjUEMQIE/582NQXHkfz/HKo5B4Fh9P0XqjUHezXE/582NQXHkfz9F6o1B3s1xP4LIjUGwyXc/gsiNQbDJdz9F6o1B3s1xP+fUjUHVpHA/gsiNQbDJdz/n1I1B1aRwP9rajUGog3I/2tqNQaiDcj/n1I1B1aRwPzu+jUEtznU/2tqNQaiDcj87vo1BLc51P9rajUGog3I/cdCNQQXkcz87vo1BLc51P9rajUGog3I/L8SNQR0BdT87vo1BLc51P3HQjUEF5HM/f7aNQTHRdT87vo1BLc51Py/EjUEdAXU/2qeNQSZNdj87vo1BLc51P3+2jUEx0XU/vZiNQcBwdj87vo1BLc51P9qnjUEmTXY/vZiNQcBwdj8JII1BTSd2Pzu+jUEtznU/ZQGNQUOtcD8Q94xBNFpxP5DyjEHgM3A/EPeMQTRacT+Q8oxB4DNwP0/ejEGdUHU/EPeMQTRacT9P3oxBnVB1PzP2jEESLHY/M/aMQRIsdj9P3oxBnVB1P6fbjEEqMYA/M/aMQRIsdj+n24xBKjGAP2n7jEF6qHo/owCNQYK4gz+n24xBKjGAP2n7jEF6qHo/owCNQYK4gz+n24xBKjGAPwDFjEHDZ4Y/owCNQYK4gz8AxYxBw2eGPxf9jEGYgIQ/Y/qMQWCnhj8AxYxBw2eGPxf9jEGYgIQ/X/GMQa+8iD8AxYxBw2eGP2P6jEFgp4Y/WuKMQSauij8AxYxBw2eGP1/xjEGvvIg/WuKMQSauij8AxYxBw2eGP0x2jEFOmY4/WuKMQSauij9MdoxBTpmOP3OkjEFgF5E/c6SMQWAXkT9MdoxBTpmOP8YGjEE6TZQ/c6SMQWAXkT/GBoxBOk2UP7dfjEH+NJg/RlCMQQmGmT/GBoxBOk2UP7dfjEH+NJg/VD2MQcWlmj/GBoxBOk2UP0ZQjEEJhpk/fSeMQQCLmz/GBoxBOk2UP1Q9jEHFpZo/cw+MQWwunD/GBoxBOk2UP30njEEAi5s/cw+MQWwunD/GBoxBOk2UPxRxi0FDf5c/cw+MQWwunD8UcYtBQ3+XP/W3i0FWb50/+oeLQWuXnj8UcYtBQ3+XP/W3i0FWb50/XlWLQQ4qnz8UcYtBQ3+XP/qHi0Frl54/XlWLQQ4qnz8UcYtBQ3+XP/fLikGsSpg/XlWLQQ4qnz/3y4pBrEqYP+POikG74J8/486KQbvgnz/3y4pBrEqYP+0MikFx85c/486KQbvgnz/tDIpBcfOXP24rikFxK6E/0wiKQaA4oT/tDIpBcfOXP24rikFxK6E/x+aJQWjVoD/tDIpBcfOXP9MIikGgOKE/r8aJQeYFoD/tDIpBcfOXP8fmiUFo1aA/r8aJQeYFoD/tDIpBcfOXP2dliUF7GZU/r8aJQeYFoD9nZYlBexmVPwNpiUGrfZw/TjuJQSYBmz9nZYlBexmVPwNpiUGrfZw/CRSJQWvrmD9nZYlBexmVP047iUEmAZs/CRSJQWvrmD9nZYlBexmVP/vDiEFeVo4/CRSJQWvrmD/7w4hBXlaOP8GjiEHWc5E/waOIQdZzkT/7w4hBXlaOP1oKiEG2Hoc/waOIQdZzkT9aCohBth6HPwrvh0GJiIo/Cu+HQYmIij9aCohBth6HPwMrh0GEr4E/Cu+HQYmIij8DK4dBhK+BPyk0h0GenYo/7gCHQfJaij8DK4dBhK+BPyk0h0GenYo/Os+GQXWJiT8DK4dBhK+BP+4Ah0HyWoo/Os+GQXWJiT8DK4dBhK+BP4IghkF/RHw/Os+GQXWJiT+CIIZBf0R8P1QRhkHkQoU/VBGGQeRChT+CIIZBf0R8P4s+hUE0uno/VBGGQeRChT+LPoVBNLp6PwVAhUErN4Q/BUCFQSs3hD+LPoVBNLp6P2tOhEFALn0/BUCFQSs3hD9rToRBQC59P2OUhEF6o4c/7GGEQflHiD9rToRBQC59P2OUhEF6o4c/bi6EQcA7iD9rToRBQC59P+xhhEH5R4g/bi6EQcA7iD9rToRBQC59P1V0g0Hr4YA/bi6EQcA7iD9VdINB6+GAP+eHg0ES84Y/54eDQRLzhj9VdINB6+GAP+eegkFHBoQ/54eDQRLzhj/nnoJBRwaEP4fkgkGefYk/oH6CQYYfij/nnoJBRwaEP4fkgkGefYk/oH6CQYYfij/nnoJBRwaEP6zVgUHW84U/oH6CQYYfij+s1YFB1vOFP3ragUHDpok/etqBQcOmiT+s1YFB1vOFPy1TgUG/CIY/etqBQcOmiT8tU4FBvwiGP7eBgUGFeIs/kByBQeR3jD8tU4FBvwiGP7eBgUGFeIs/kByBQeR3jD8tU4FBvwiGP9XugEECo4U/kByBQeR3jD/V7oBBAqOFP6QYgUH7G4w/egOBQTMejD/V7oBBAqOFP6QYgUH7G4w/ou6AQXPjiz/V7oBBAqOFP3oDgUEzHow/ydqAQattiz/V7oBBAqOFP6LugEFz44s/l8iAQbLAij/V7oBBAqOFP8nagEGrbYs/oriAQSziiT/V7oBBAqOFP5fIgEGywIo/oriAQSziiT/V7oBBAqOFPxy9gEEc/IQ/oriAQSziiT8cvYBBHPyEP5uwgEHuW4k/m7CAQe5biT8ZqoBB0LyEPxy9gEEc/IQ/CIh/QSxuhD8t735B08CJP2dhf0Fyw4I/Le9+QdPAiT9nYX9BcsOCP09Hf0HDw4I/Le9+QdPAiT9PR39Bw8OCPwhXf0G3i4Q/CFd/QbeLhD9PR39Bw8OCP2LMfkFuZIU/CFd/QbeLhD9izH5BbmSFP5r2fkGoqIg/mvZ+QaioiD9izH5BbmSFP0tNfkHuHoY/mvZ+QaioiD9LTX5B7h6GPy2ofkGunos/NYN+QfLGjD9LTX5B7h6GPy2ofkGunos/BVh+QVazjT9LTX5B7h6GPzWDfkHyxow/HSh+Qa5bjj9LTX5B7h6GPwVYfkFWs40/IvV9QSW6jj9LTX5B7h6GPx0ofkGuW44/IvV9QSW6jj9LTX5B7h6GPxDufEGq8IU/IvV9QSW6jj8Q7nxBqvCFP3fvfEFy1Y8/d+98QXLVjz8Q7nxBqvCFP1gkekFRhIY/d+98QXLVjz9YJHpBUYSGPwIsekGZ9ow/Aix6QZn2jD9YJHpBUYSGPzsid0GvrYc/Aix6QZn2jD87IndBr62HP3Ued0GyBYs/dR53QbIFiz87IndBr62HP/sWdkGHroY/dR53QbIFiz/7FnZBh66GPxj+dUFowYo/GP51QWjBij/7FnZBh66GPy0zdUH+yoQ/GP51QWjBij8tM3VB/sqEP9oedUFls4k/2h51QWWziT+yBHVB9KWEPy0zdUH+yoQ/QCVzQZ1RhT+7+XJBKEiLP7IOc0Eg+YQ/u/lyQShIiz+yDnNBIPmEP8JPckH1doY/u/lyQShIiz/CT3JB9XaGP1tOckEv4Ik/W05yQS/giT/CT3JB9XaGP3NKcUGUSYQ/W05yQS/giT9zSnFBlEmEP0UTcUE1Sok/RRNxQTVKiT9zSnFBlEmEP0iBcEEHpIE/RRNxQTVKiT9IgXBBB6SBP42LcEEQrIg/XchvQf+7hj9IgXBBB6SBP42LcEEQrIg/XchvQf+7hj9IgXBBB6SBP+eKb0FeD3w/XchvQf+7hj/nim9BXg98P2d0b0FLZoU/Z3RvQUtmhT/nim9BXg98P9vVbkHzyn4/Z3RvQUtmhT/b1W5B88p+PytLb0FbmYQ/K0tvQVuZhD/b1W5B88p+P5uUbkGsn4I/K0tvQVuZhD+blG5BrJ+CPwVNb0HzT4U/BU1vQfNPhT+blG5BrJ+CP6VWbkEvEIk/BU1vQfNPhT+lVm5BLxCJPzMpb0GS5Yg/yw1vQXjiij+lVm5BLxCJPzMpb0GS5Yg/0uVuQf+mjD+lVm5BLxCJP8sNb0F44oo/ArNuQZYfjj+lVm5BLxCJP9LlbkH/pow/ArNuQZYfjj+lVm5BLxCJP7CbbUGN348/ArNuQZYfjj+wm21Bjd+PPy3mbUFj65I/LeZtQWPrkj+wm21Bjd+PPxjya0GINZY/LeZtQWPrkj8Y8mtBiDWWP4+YbEGx3Zs/O0JsQdqinT8Y8mtBiDWWP4+YbEGx3Zs/WOBrQaGpnj8Y8mtBiDWWPztCbEHaop0/WOBrQaGpnj8Y8mtBiDWWP81GakHCM5k/WOBrQaGpnj/NRmpBwjOZPxrQakGbCaA/t4tqQfxooD/NRmpBwjOZPxrQakGbCaA/YkZqQYZMoD/NRmpBwjOZP7eLakH8aKA/kwNqQaW1nz/NRmpBwjOZP2JGakGGTKA/kwNqQaW1nz/NRmpBwjOZPwotaUFImZk/kwNqQaW1nz8KLWlBSJmZPxcsaUH39pw/FyxpQff2nD8KLWlBSJmZP1MAaEEEAZk/FyxpQff2nD9TAGhBBAGZP8c6aEFHJp8/6tRnQW2pnz9TAGhBBAGZP8c6aEFHJp8/HW5nQR9jnz9TAGhBBAGZP+rUZ0FtqZ8/HW5nQR9jnz9TAGhBBAGZP2sPZ0FgkZY/HW5nQR9jnz9rD2dBYJGWP3oIZ0FtUZ4/nUFmQbfJnD9rD2dBYJGWP3oIZ0FtUZ4/nUFmQbfJnD9rD2dBYJGWPwAUZkGMwJE/nUFmQbfJnD8AFGZBjMCRP6rSZUHIEJs/z6JlQURjmj8AFGZBjMCRP6rSZUHIEJs/TXhlQThsmT8AFGZBjMCRP8+iZUFEY5o/4lRlQb81mD8AFGZBjMCRP014ZUE4bJk/AjplQZPMlj8AFGZBjMCRP+JUZUG/NZg/AjplQZPMlj8AFGZBjMCRP6/7ZEFGtos/AjplQZPMlj+v+2RBRraLP7C/ZEHGlY4/sL9kQcaVjj+v+2RBRraLPxonZEGjmoc/sL9kQcaVjj8aJ2RBo5qHPxPGY0FKJI4/E8ZjQUokjj8aJ2RBo5qHP5MpY0HFBIU/E8ZjQUokjj+TKWNBxQSFP7r2YkHZQ4w/uvZiQdlDjD+TKWNBxQSFP4+YYkFOfYQ/uvZiQdlDjD+PmGJBTn2EPzOWYkFeR40/M5ZiQV5HjT+PmGJBTn2EP4ofYkH51oQ/M5ZiQV5HjT+KH2JB+daEP6CIYkF8dI4/oIhiQXx0jj+KH2JB+daEP6utYUHsE4c/oIhiQXx0jj+rrWFB7BOHP8L9YUFclI0/wv1hQVyUjT+rrWFB7BOHP5gJYUHRAog/wv1hQVyUjT+YCWFB0QKIPxUYYUGywYs/FRhhQbLBiz+YCWFB0QKIP4pwYEFbUog/FRhhQbLBiz+KcGBBW1KIP61zYEHGD4w/rXNgQcYPjD+KcGBBW1KIP9CzX0HDP4g/rXNgQcYPjD/Qs19Bwz+IPyutX0Ho84s/K61fQejziz/Qs19Bwz+IPxrTXkFgioc/K61fQejziz8a015BYIqHPyMJX0GDnI0/wMVeQTAVjj8a015BYIqHPyMJX0GDnI0/u4BeQWMojj8a015BYIqHP8DFXkEwFY4/dzxeQXPVjT8a015BYIqHP7uAXkFjKI4/dzxeQXPVjT8a015BYIqHP9d4XUFFEYQ/dzxeQXPVjT/XeF1BRRGEPziCXUF9/4s/2D5dQVJ6iz/XeF1BRRGEPziCXUF9/4s/ygBdQbyBij/XeF1BRRGEP9g+XUFSeos/F8tcQfghiT/XeF1BRRGEP8oAXUG8gYo/F8tcQfghiT/XeF1BRRGEP+MeXEEWRX0/F8tcQfghiT/jHlxBFkV9P43nW0F/2oE/jedbQX/agT/jHlxBFkV9P0DsWUEWIGk/jedbQX/agT9A7FlBFiBpPxirWUEvQXs/uGlZQZTReT9A7FlBFiBpPxirWUEvQXs/oy5ZQQiOdz9A7FlBFiBpP7hpWUGU0Xk/f/xYQY+QdD9A7FlBFiBpP6MuWUEIjnc/f/xYQY+QdD9A7FlBFiBpP7toV0FKaUw/f/xYQY+QdD+7aFdBSmlMP38lV0Hk0FE/fyVXQeTQUT+7aFdBSmlMP78FVkFgqDk/fyVXQeTQUT+/BVZBYKg5PyO1VUGgLT8/I7VVQaAtPz+/BVZBYKg5P9DUVEGn4yY/I7VVQaAtPz/Q1FRBp+MmPwp2VEHgljQ/6x9UQU4UMT/Q1FRBp+MmPwp2VEHgljQ/N9VTQRCqLD/Q1FRBp+MmP+sfVEFOFDE/N9VTQRCqLD/Q1FRBp+MmPz02VEE+zBo/N9VTQRCqLD89NlRBPswaP+pwU0F9kSU/6nBTQX2RJT89NlRBPswaPwB7U0FONg4/6nBTQX2RJT8Ae1NBTjYOPwrmUkE2Ah4/cmBSQYNOFD8Ae1NBTjYOPwrmUkE2Ah4/cmBSQYNOFD8Ae1NBTjYOP/XUUkEGM/8+cmBSQYNOFD/11FJBBjP/PnItUkEkcg4/xcxRQXApAz/11FJBBjP/PnItUkEkcg4/xcxRQXApAz/11FJBBjP/PrpTUkHY6eU+xcxRQXApAz+6U1JB2OnlPljDUUHU3P8+j41RQTwp5z66U1JB2OnlPljDUUHU3P8+j41RQTwp5z66U1JB2OnlPh/nUUFwEs4+j41RQTwp5z4f51FBcBLOPkN+UUGYpdQ+Q35RQZil1D4f51FBcBLOPpKRUUE+jLU+Q35RQZil1D6SkVFBPoy1Phs4UUHC8rs+GzhRQcLyuz6SkVFBPoy1PpNjUUEQOK0+GzhRQcLyuz6TY1FBEDitPjAiUUHosrg+MCJRQeiyuD6TY1FBEDitPoMMUUE4Lqo+MCJRQeiyuD6DDFFBOC6qPvXyUEEaJrk+9fJQQRomuT6DDFFBOC6qPuPAUEE4/6g+9fJQQRomuT7jwFBBOP+oPhq1UEGkPLg+GrVQQaQ8uD7jwFBBOP+oPkKKUEEChag+GrVQQaQ8uD5CilBBAoWoPiKOUEGI1bc+Io5QQYjVtz5CilBBAoWoPoBQUEFweak+Io5QQYjVtz6AUFBBcHmpPsNoUEFAgbg+w2hQQUCBuD6AUFBBcHmpPg/bT0G6ha0+w2hQQUCBuD4P209BuoWtPjr4T0F2bbw+OvhPQXZtvD4P209BuoWtPqXITkEK3bQ+OvhPQXZtvD6lyE5BCt20PrM7T0EmZME+NXBOQepDxD6lyE5BCt20PrM7T0EmZME+NXBOQepDxD6lyE5BCt20Phc7TUEIG7Y+NXBOQepDxD4XO01BCBu2Pig3TUFs8sQ+KDdNQWzyxD4XO01BCBu2PsIvTEEACLM+KDdNQWzyxD7CL0xBAAizPs13TEE0HMY+3zJMQQLExT7CL0xBAAizPs13TEE0HMY+ge9LQXrowz7CL0xBAAizPt8yTEECxMU+z69LQYaYwD7CL0xBAAizPoHvS0F66MM+z69LQYaYwD7CL0xBAAizPvpGS0EK7ag+z69LQYaYwD76RktBCu2oPqwyS0GCZbg+rDJLQYJluD76RktBCu2oPnVrSkHI9qg+rDJLQYJluD51a0pByPaoPmWMSkFSP7U+ZYxKQVI/tT51a0pByPaoPqlQSkGYw6s+ZYxKQVI/tT6pUEpBmMOrPr6DSkGi1LM+voNKQaLUsz6pUEpBmMOrPtAGSkEYi7M+voNKQaLUsz7QBkpBGIuzPhBLSkHaIb0+EEtKQdohvT7QBkpBGIuzPimpSUEGZ74+EEtKQdohvT4pqUlBBme+PjQwSkFGZcI+nwRKQbIlyT4pqUlBBme+PjQwSkFGZcI+M85JQSqIzj4pqUlBBme+Pp8ESkGyJck+oI9JQdpI0j4pqUlBBme+PjPOSUEqiM4+oI9JQdpI0j4pqUlBBme+PkoMSUHq3sU+oI9JQdpI0j5KDElB6t7FPluMSUGSUc8+SzBJQTYR1T5KDElB6t7FPluMSUGSUc8+88xIQdJs2D5KDElB6t7FPkswSUE2EdU+88xIQdJs2D5KDElB6t7FPrFwSEHsVco+88xIQdJs2D6xcEhB7FXKPvPeSEGALtY+d3pIQcTq2D6xcEhB7FXKPvPeSEGALtY+rRNIQZZN2T6xcEhB7FXKPnd6SEHE6tg+rRNIQZZN2T6xcEhB7FXKPn3aR0HKSsk+rRNIQZZN2T592kdBykrJPr8nSEFyv9c+zcBHQdAt1z592kdBykrJPr8nSEFyv9c+dV1HQRLB0z592kdBykrJPs3AR0HQLdc+dV1HQRLB0z592kdBykrJPhZRR0GcRcI+dV1HQRLB0z4WUUdBnEXCPtlyR0HwldI+OjFHQYDozz4WUUdBnEXCPtlyR0HwldI+k/RGQRTKyz4WUUdBnEXCPjoxR0GA6M8+475GQYpdxj4WUUdBnEXCPpP0RkEUyss+475GQYpdxj4WUUdBnEXCPjXlRkG6KbU+475GQYpdxj415UZBuim1PpLURkFKl8U+Jz1GQZpatD415UZBuim1PpLURkFKl8U+Jz1GQZpatD415UZBuim1PlanRkG6LaU+Jz1GQZpatD5Wp0ZBui2lPlVbRkFSUrY+ZEdGQTRLsz5Wp0ZBui2lPlVbRkFSUrY+QjhGQcLbrz5Wp0ZBui2lPmRHRkE0S7M+dC5GQRQirD5Wp0ZBui2lPkI4RkHC268+USpGQeQ+qD5Wp0ZBui2lPnQuRkEUIqw+/StGQVxUpD5Wp0ZBui2lPlEqRkHkPqg+aDNGQeaEoD5Wp0ZBui2lPv0rRkFcVKQ+U0BGQfzxnD5Wp0ZBui2lPmgzRkHmhKA+U0BGQfzxnD5Wp0ZBui2lPteeRkHqmpI+U0BGQfzxnD7XnkZB6pqSPkJSRkHyAJk+QlJGQfIAmT7XnkZB6pqSPsdWRkGiio4+QlJGQfIAmT7HVkZBooqOPig8RkG4j5k+KDxGQbiPmT7HVkZBooqOPlPcRUHW9Iw+KDxGQbiPmT5T3EVB1vSMPk/aRUEsvZs+T9pFQSy9mz5T3EVB1vSMPtlgRUGit40+T9pFQSy9mz7ZYEVBoreNPlCYRUF+aps+UJhFQX5qmz7ZYEVBoreNPrscRUFCyZc+UJhFQX5qmz67HEVBQsmXPtaPRUEaBJ0+1o9FQRoEnT67HEVBQsmXPi8hRUGOFbQ+1o9FQRoEnT4vIUVBjhW0PofYRUGuF6w+A+9FQaAFsj4vIUVBjhW0PofYRUGuF6w+qPtFQQhkuD4vIUVBjhW0PgPvRUGgBbI+9v1FQUjyvj4vIUVBjhW0Pqj7RUEIZLg+0/VFQd5txT4vIUVBjhW0Pvb9RUFI8r4+0/VFQd5txT4vIUVBjhW0PovfREE6+dE+0/VFQd5txT6L30RBOvnRPrbIRUHo5c8+q8JFQXwg1T6L30RBOvnRPrbIRUHo5c8+YrVFQV4k2j6L30RBOvnRPqvCRUF8INU+Q6FFQa7J3j6L30RBOvnRPmK1RUFeJNo+7YZFQX7r4j6L30RBOvnRPkOhRUGuyd4+M2dFQfpo5j6L30RBOvnRPu2GRUF+6+I+M2dFQfpo5j6L30RBOvnRPuldREHqEu0+M2dFQfpo5j7pXURB6hLtPoL1REH6hO0+G1tEQZhW/j7pXURB6hLtPoL1REH6hO0+G1tEQZhW/j7pXURB6hLtPlqWQ0GS+vw+G1tEQZhW/j5alkNBkvr8PnQcREFnQwE/SWdDQXI7Bz9alkNBkvr8PnQcREFnQwE/SWdDQXI7Bz9alkNBkvr8Pr+4QkFuQgM/SWdDQXI7Bz+/uEJBbkIDPw/RQkEiQQo/D9FCQSJBCj+/uEJBbkIDP8a5QUEq0AQ/D9FCQSJBCj/GuUFBKtAEP5wqQkGEiA0/KcZBQajnDj/GuUFBKtAEP5wqQkGEiA0/aF9BQawgDz/GuUFBKtAEPynGQUGo5w4/aF9BQawgDz/GuUFBKtAEP/fCQEG8xgU/aF9BQawgDz/3wkBBvMYFP/fIQEHSmg4/98hAQdKaDj/3wkBBvMYFP58IP0F+ZgY/98hAQdKaDj+fCD9BfmYGP0tzP0HskRI/gaY+QXaxEj+fCD9BfmYGP0tzP0HskRI/gaY+QXaxEj+fCD9BfmYGP60YPUGn/QY/gaY+QXaxEj+tGD1Bp/0GP1sWPUGmiw4/WxY9QaaLDj+tGD1Bp/0GP4eCOkGKnAQ/WxY9QaaLDj+HgjpBipwEP096OkEIOww/T3o6QQg7DD+HgjpBipwEP+9jOEFK/QE/T3o6QQg7DD/vYzhBSv0BP6i5OEHqpg8/8Ow3QVACED/vYzhBSv0BP6i5OEHqpg8/8Ow3QVACED/vYzhBSv0BP/KbNkGEJwA/8Ow3QVACED/ymzZBhCcAP/KSNkGGlg4/8pI2QYaWDj/ymzZBhCcAP9l7NEH6Yf8+8pI2QYaWDj/ZezRB+mH/Psx6NEEGZA4/zHo0QQZkDj/ZezRB+mH/PsI3MkGQuf8+zHo0QQZkDj/CNzJBkLn/PhI8MkF80A4/EjwyQXzQDj/CNzJBkLn/PuswMEHQ4AA/EjwyQXzQDj/rMDBB0OAAPw5CMEEskxI/DkIwQSyTEj/rMDBB0OAAPzPZLkGyzQI/DkIwQSyTEj8z2S5Bss0CP2wGL0EEsBU/bAYvQQSwFT8z2S5Bss0CP809LkGg1wQ/bAYvQQSwFT/NPS5BoNcEP/WbLkE+uRc/9ZsuQT65Fz/NPS5BoNcEPysQLUEuugw/9ZsuQT65Fz8rEC1BLroMPyDKLUFFph0/y5gtQSC5Hj8rEC1BLroMPyDKLUFFph0/M2UtQWw7Hz8rEC1BLroMP8uYLUEguR4/+jAtQQApHz8rEC1BLroMPzNlLUFsOx8/yv0sQXSCHj8rEC1BLroMP/owLUEAKR8/yv0sQXSCHj8rEC1BLroMPwKHK0E4JBA/yv0sQXSCHj8ChytBOCQQPweTK0H/vhc/B5MrQf++Fz8ChytBOCQQP7tYKUHCORI/B5MrQf++Fz+7WClBwjkSP9/AKUHPbR0/TFopQcL9HT+7WClBwjkSP9/AKUHPbR0/G/QoQewzHT+7WClBwjkSP0xaKUHC/R0/G/QoQewzHT+7WClBwjkSPxxGJ0EYsxA/G/QoQewzHT8cRidBGLMQP0A7J0FvzxY/QDsnQW/PFj8cRidBGLMQPyJpJUG+aAs/QDsnQW/PFj8iaSVBvmgLP21GJUEivRI/bUYlQSK9Ej8iaSVBvmgLP0byI0EuhAE/bUYlQSK9Ej9G8iNBLoQBP1SPI0ECpBA/VI8jQQKkED9G8iNBLoQBPzneIkE0aPU+VI8jQQKkED853iJBNGj1PlCMIkFeyQc/UIwiQV7JBz853iJBNGj1PjesIUHKk+Y+UIwiQV7JBz83rCFBypPmPmq3IUEbIAM/C/0gQRKj+z43rCFBypPmPmq3IUEbIAM/C/0gQRKj+z43rCFBypPmPnq6IEHKpNo+C/0gQRKj+z56uiBByqTaPhJtIEEUYfE+Em0gQRRh8T56uiBByqTaPmO8H0HsG8w+Em0gQRRh8T5jvB9B7BvMPghZH0Fa/eE+CFkfQVr94T5jvB9B7BvMPh+rHkEaj7Q+CFkfQVr94T4fqx5BGo+0PhhxHkH4g9I+0RseQYpNyz4fqx5BGo+0PhhxHkH4g9I+Y9QdQZ4Iwj4fqx5BGo+0PtEbHkGKTcs+Y9QdQZ4Iwj4fqx5BGo+0PnniHUHI9J0+Y9QdQZ4Iwj554h1ByPSdPvOgHUHokbc+ViYdQb4Qoz554h1ByPSdPvOgHUHokbc+ViYdQb4Qoz554h1ByPSdPikIHUF8s3g+ViYdQb4Qoz4pCB1BfLN4PiWzHEE2rYk+JbMcQTatiT4pCB1BfLN4Pk0UHEFYk1o+JbMcQTatiT5NFBxBWJNaPgfjG0FQroI+B+MbQVCugj5NFBxBWJNaPmKFGkE0qlA+B+MbQVCugj5ihRpBNKpQPjvSGkGsXIM+CgYaQWphgT5ihRpBNKpQPjvSGkGsXIM+CgYaQWphgT5ihRpBNKpQPmXfGEGUKEI+CgYaQWphgT5l3xhBlChCPuO9GEEkQ3Q+470YQSRDdD5l3xhBlChCPswSF0EEcis+470YQSRDdD7MEhdBBHIrPrDdFkFkJGA+sN0WQWQkYD7MEhdBBHIrPgpOFkFY+xs+sN0WQWQkYD4KThZBWPsbPqNBFkEcA1Q+o0EWQRwDVD4KThZBWPsbPkjAFUGsYSI+o0EWQRwDVD5IwBVBrGEiPt84FkHQzFM+3zgWQdDMUz5cWxVBxH5DPkjAFUGsYSI+9YcaQYAKrj6/3hpBvNW1PncuG0Hm2r0+b3MbQYpwxz53LhtB5tq9Pr/eGkG81bU+b3MbQYpwxz53LhtB5tq9PmODG0HqoM4+b3MbQYpwxz5jgxtB6qDOPtlPG0HSEcQ+ZsgbQcTD2D5jgxtB6qDOPtlPG0HSEcQ+ZsgbQcTD2D5jgxtB6qDOPsLDG0HKxOI+ZsgbQcTD2D7CwxtBysTiPvuyG0EUutY+/uAbQepF4j7CwxtBysTiPvuyG0EUutY+5PYbQejg7j7CwxtBysTiPv7gG0HqReI+5PYbQejg7j7CwxtBysTiPpfFG0FL3AY/5PYbQejg7j6XxRtBS9wGP+L6G0FMEwI/qAEcQSBgBj+XxRtBS9wGP+L6G0FMEwI/BPsbQSetCj+XxRtBS9wGP6gBHEEgYAY/N+cbQfDQDj+XxRtBS9wGPwT7G0EnrQo/N+cbQfDQDj+XxRtBS9wGP7sLG0GilBM/N+cbQfDQDj+7CxtBopQTP6mWG0EYyRg/8YkbQXziGj+7CxtBopQTP6mWG0EYyRg/PXcbQQzNHD+7CxtBopQTP/GJG0F84ho/M18bQeh3Hj+7CxtBopQTPz13G0EMzRw/pEIbQWTUHz+7CxtBopQTPzNfG0Hodx4/jiIbQYDWID+7CxtBopQTP6RCG0Fk1B8/CgAbQVx1IT+7CxtBopQTP44iG0GA1iA/CgAbQVx1IT+7CxtBopQTPwu+GUHw9hY/CgAbQVx1IT8LvhlB8PYWP0cvGkFWeiI/HM0ZQaNpJD8LvhlB8PYWP0cvGkFWeiI/tWYZQcYQJT8LvhlB8PYWPxzNGUGjaSQ/tWYZQcYQJT8LvhlB8PYWP1VPGEEK7RY/tWYZQcYQJT9VTxhBCu0WPwdLGEGqDyU/B0sYQaoPJT9VTxhBCu0WP8MHF0EvKhY/B0sYQaoPJT/DBxdBLyoWP8JIF0G8XiQ/+n4WQSouIj/DBxdBLyoWP8JIF0G8XiQ/+n4WQSouIj/DBxdBLyoWP5vnFUEAihA/+n4WQSouIj+b5xVBAIoQPyfyFUE+Dh8/rzUVQQoMGj+b5xVBAIoQPyfyFUE+Dh8/rzUVQQoMGj+b5xVBAIoQP49BFUFTkAo/rzUVQQoMGj+PQRVBU5AKP20GFUEqMRg/bQYVQSoxGD+36RRB0xgKP49BFUFTkAo/4xcTQc7dCD8TNBNBQMcWP2DxEkEQSwk/EzQTQUDHFj9g8RJBEEsJP2WYEkHP0gw/EzQTQUDHFj9lmBJBz9IMPxM0E0FAxxY/R7QSQYITGz9lmBJBz9IMPxM0E0FAxxY/R7QSQYITGz9lmBJBz9IMP8biEUHyxxA/R7QSQYITGz/G4hFB8scQP8B4EkGd4Bs/J7QRQZ52Hz/G4hFB8scQP8B4EkGd4Bs/J7QRQZ52Hz/G4hFB8scQP99xD0GWFRc/J7QRQZ52Hz/fcQ9BlhUXPzfZD0Fo8yM/egwPQRJEJD/fcQ9BlhUXPzfZD0Fo8yM/egwPQRJEJD/fcQ9BlhUXP/YTDkGi2RM/egwPQRJEJD/2Ew5BotkTP9v7DUHW2SE/2/sNQdbZIT/2Ew5BotkTPw+hDEFGUBI/2/sNQdbZIT8PoQxBRlASP5OPDEFyZyM/k48MQXJnIz8PoQxBRlASPz+3CkEnbhA/k48MQXJnIz8/twpBJ24QP+2kCkEokSQ/7aQKQSiRJD8/twpBJ24QP8dKCUHSPQ8/7aQKQSiRJD/HSglB0j0PPzM/CUFbHR4/Mz8JQVsdHj/HSglB0j0PP4uzB0HyFw4/Mz8JQVsdHj+LswdB8hcOP/quB0Gcsxc/+q4HQZyzFz+LswdB8hcOP4P4BUE3sg0/+q4HQZyzFz+D+AVBN7INP7f5BUFCjRY/t/kFQUKNFj+D+AVBN7INP9PpA0Giug4/t/kFQUKNFj/T6QNBoroOP49UBEGQ2x8/7+8DQSZFIT/T6QNBoroOP49UBEGQ2x8/04gDQV0pIT/T6QNBoroOP+/vA0EmRSE/04gDQV0pIT/T6QNBoroOP3dNAkFeJw8/04gDQV0pIT93TQJBXicPP2G7AkGoyx4/b/EBQdeqHD93TQJBXicPP2G7AkGoyx4/b/EBQdeqHD93TQJBXicPPz/dAEGqCxA/b/EBQdeqHD8/3QBBqgsQPw/iAEHyjhc/D+IAQfKOFz8/3QBBqgsQP919/kCbHRE/D+IAQfKOFz/dff5Amx0RPwNa/0CJoCA/0vf+QIO+IT/dff5Amx0RPwNa/0CJoCA/05D+QJBLIj/dff5Amx0RP9L3/kCDviE/VSj+QCNDIj/dff5Amx0RP9OQ/kCQSyI/t8H9QISlIT/dff5Amx0RP1Uo/kAjQyI/t8H9QISlIT/dff5Amx0RP9I6+kD+QxI/t8H9QISlIT/SOvpA/kMSP/M7+kAGjxk/8zv6QAaPGT/SOvpA/kMSP6jS9EDbORE/8zv6QAaPGT+o0vRA2zkRP5/U9EDMGxo/n9T0QMwbGj+o0vRA2zkRP7gO70Dk+BI/n9T0QMwbGj+4Du9A5PgSPzP570BQfCU/vS7vQEqnJj+4Du9A5PgSPzP570BQfCU/6mDuQPiCJj+4Du9A5PgSP70u70BKpyY/6mDuQPiCJj+4Du9A5PgSPzU56kD4gxU/6mDuQPiCJj81OepA+IMVP6tC6kDMZCI/q0LqQMxkIj81OepA+IMVPyt05UBiwBQ/q0LqQMxkIj8rdOVAYsAUPyNa5UBmKxw/I1rlQGYrHD8rdOVAYsAUP2Ch40C3zBE/I1rlQGYrHD9goeNAt8wRP/vz40D2hhw/tVviQGJ/Gz9goeNAt8wRP/vz40D2hhw/tVviQGJ/Gz9goeNAt8wRP6rh4UAMigo/tVviQGJ/Gz+q4eFADIoKP9CJ4UBM1xk/VwPhQDDQGD+q4eFADIoKP9CJ4UBM1xk/SIbgQDz1Fj+q4eFADIoKP1cD4UAw0Bg/yxfgQP5ZFD+q4eFADIoKP0iG4EA89RY/yxfgQP5ZFD+q4eFADIoKP+tF4EAEKgA/yxfgQP5ZFD/rReBABCoAP4h/30CAoQ4/7eLeQLxzCj/rReBABCoAP4h/30CAoQ4/mGXeQIBYBT/rReBABCoAP+3i3kC8cwo/mGXeQIBYBT/rReBABCoAP5sq30CyqeY+mGXeQIBYBT+bKt9AsqnmPrsL3kDM4f4+V8LdQMqR9z6bKt9AsqnmPrsL3kDM4f4+yo/dQE6J7z6bKt9AsqnmPlfC3UDKkfc+0HXdQOwO5z6bKt9AsqnmPsqP3UBOie8+0HXdQOwO5z6bKt9AsqnmPqog3kCa77o+0HXdQOwO5z6qIN5Amu+6PuVi3UAqKcw++EvdQIBivz6qIN5Amu+6PuVi3UAqKcw+cFvdQKaQsj6qIN5Amu+6PvhL3UCAYr8+cFvdQKaQsj47od1A0vSYPqog3kCa77o+P6HcQAi/jz4K6NxAnnqdPjs13EDi0pk+CujcQJ56nT47NdxA4tKZPtot3ED6q7E+CujcQJ56nT7aLdxA+quxPpv/3EDQ3qY+pwrdQPq3sz7aLdxA+quxPpv/3EDQ3qY+0+vcQL5wwD7aLdxA+quxPqcK3UD6t7M+0+vcQL5wwD7aLdxA+quxPrPR20ByG8g+0+vcQL5wwD6z0dtAchvIPgrN3EBO/sA+wJ3cQG6HzT6z0dtAchvIPgrN3EBO/sA+Z0PcQMYa2T6z0dtAchvIPsCd3EBuh80+Z0PcQMYa2T6z0dtAchvIPkv+2kAKzd0+Z0PcQMYa2T5L/tpACs3dPrf+20Ais9w+2pHbQMSm5z5L/tpACs3dPrf+20Ais9w+Xf7aQIKq8D5L/tpACs3dPtqR20DEpuc+Xf7aQIKq8D5L/tpACs3dPpuP2UC+ouo+Xf7aQIKq8D6bj9lAvqLqPvKL2kC6+fM+m0TZQKSuAT+bj9lAvqLqPvKL2kC6+fM+m0TZQKSuAT+bj9lAvqLqPhj810BWXu8+m0TZQKSuAT8Y/NdAVl7vPi/l2EAItQI/bSvYQM6HBT8Y/NdAVl7vPi/l2EAItQI/omDXQAbCBj8Y/NdAVl7vPm0r2EDOhwU/omDXQAbCBj8Y/NdAVl7vPoAF1kC2F/E+omDXQAbCBj+ABdZAthfxPuXP1kACHwY/ZTfVQNoOBz+ABdZAthfxPuXP1kACHwY/ZTfVQNoOBz+ABdZAthfxPmKy00DKEe8+ZTfVQNoOBz9istNAyhHvPopV1ECmQAY/AszTQDrlBT9istNAyhHvPopV1ECmQAY/tUbTQFbHBD9istNAyhHvPgLM00A65QU/6MnSQBrwAj9istNAyhHvPrVG00BWxwQ/6MnSQBrwAj9istNAyhHvPl2O0UBIw+k+6MnSQBrwAj9djtFASMPpPh9X0UAySPg+H1fRQDJI+D5djtFASMPpPj1B0EBa/OI+H1fRQDJI+D49QdBAWvziPuIT0EAsEvI+4hPQQCwS8j49QdBAWvziPm1vz0B6KOI+4hPQQCwS8j5tb89AeijiPriRz0BMj/A+uJHPQEyP8D5tb89AeijiPjevzkDQgeY+uJHPQEyP8D43r85A0IHmPsc+z0Da9vI+xz7PQNr28j43r85A0IHmPs0dzkCo4vE+xz7PQNr28j7NHc5AqOLxPrMn0EBeVgA/syfQQF5WAD/NHc5AqOLxPnjUzUDwJQY/syfQQF5WAD941M1A8CUGP1oi0EAg2wU/ZwfQQL47DD941M1A8CUGP1oi0EAg2wU/CMTPQNtPEj941M1A8CUGP2cH0EC+Oww/CMTPQNtPEj941M1A8CUGP1P7zEAKDhM/CMTPQNtPEj9T+8xACg4TP/NVz0Cw8Rc/+DvPQAi4GT9T+8xACg4TP/NVz0Cw8Rc/RRjPQARSGz9T+8xACg4TP/g7z0AIuBk/A+zOQISyHD9T+8xACg4TP0UYz0AEUhs/mrjOQDjOHT9T+8xACg4TPwPszkCEshw/sn/OQAqcHj9T+8xACg4TP5q4zkA4zh0/G0POQGAVHz9T+8xACg4TP7J/zkAKnB4/ygTOQFg2Hz9T+8xACg4TPxtDzkBgFR8/ygTOQFg2Hz9T+8xACg4TPwELzEAREho/ygTOQFg2Hz8BC8xAERIaP4BtzEBo6R4/gG3MQGjpHj8BC8xAERIaP2HhykAc0R0/gG3MQGjpHj9h4cpAHNEdPy/Ty0BrzCE/rhfLQHd4JD9h4cpAHNEdPy/Ty0BrzCE/503KQKzHJT9h4cpAHNEdP64Xy0B3eCQ/503KQKzHJT9h4cpAHNEdPyi6yUAfDh8/503KQKzHJT8ouslAHw4fP8eRykB9fiQ/9/zIQOlxJj8ouslAHw4fP8eRykB9fiQ/9/zIQOlxJj8ouslAHw4fP356yEAGMh8/9/zIQOlxJj9+eshABjIfP+M5yUAs1yU/SaDHQI/lJT9+eshABjIfP+M5yUAs1yU/SaDHQI/lJT9+eshABjIfP39Fx0BS9x0/SaDHQI/lJT9/RcdAUvcdP1bcx0AciiU/80nGQBMmIz9/RcdAUvcdP1bcx0AciiU/80nGQBMmIz9/RcdAUvcdP5tjxkBTaRs/80nGQBMmIz+bY8ZAU2kbP0m1xkAueSM/0/LFQM5SIT+bY8ZAU2kbP0m1xkAueSM/MkbFQI7LHT+bY8ZAU2kbP9PyxUDOUiE/MkbFQI7LHT+bY8ZAU2kbP1fMxUAuWRc/MkbFQI7LHT9XzMVALlkXP8e+xUDYYx8/f5rFQMCiHj9XzMVALlkXP8e+xUDYYx8/tHvFQBKsHT9XzMVALlkXP3+axUDAoh4/n2PFQIiJHD9XzMVALlkXP7R7xUASrB0/M1PFQJ5GGz9XzMVALlkXP59jxUCIiRw/FUvFQBrwGT9XzMVALlkXPzNTxUCeRhs/mUvFQIKTGD9XzMVALlkXPxVLxUAa8Bk/uVTFQJ8+Fz9XzMVALlkXP5lLxUCCkxg/uVTFQJ8+Fz9XzMVALlkXP22AxUDoCxQ/uVTFQJ8+Fz9tgMVA6AsUP7lUxUCePhc/uVTFQJ4+Fz8sIsVAjkYUP22AxUDoCxQ/fgHBQOAfEz+4LsFAG04XP4bdwEAq0RI/uC7BQBtOFz+G3cBAKtESPyS2wEBUdBU/uC7BQBtOFz8ktsBAVHQVP7guwUAbThc/WDjBQNj1Fz8ktsBAVHQVP7guwUAbThc/rj3BQGupGD8ktsBAVHQVP1g4wUDY9Rc/hD7BQN5hGT8ktsBAVHQVP649wUBrqRg/1DrBQBEYGj8ktsBAVHQVP4Q+wUDeYRk/wTLBQPjEGj8ktsBAVHQVP9Q6wUARGBo/mybBQONhGz8ktsBAVHQVP8EywUD4xBo/mybBQONhGz8ktsBAVHQVPzNBwEB79xg/mybBQONhGz8zQcBAe/cYPwUZwUDu8xg/MOfAQO7YGz8zQcBAe/cYPwUZwUDu8xg/caPAQIxcHj8zQcBAe/cYPzDnwEDu2Bs/p1DAQH9jID8zQcBAe/cYP3GjwECMXB4/U/K/QMLXIT8zQcBAe/cYP6dQwEB/YyA/U/K/QMLXIT8zQcBAe/cYP+VTv0BQvBs/U/K/QMLXIT/lU79AULwbP0sjwECeBh8/7Mu/QKrQID/lU79AULwbP0sjwECeBh8/y2u/QK4XIj/lU79AULwbP+zLv0Cq0CA/8wW/QFDRIj/lU79AULwbP8trv0CuFyI/mZ2+QLT3Ij/lU79AULwbP/MFv0BQ0SI/mZ2+QLT3Ij/lU79AULwbP14yvkCSPRs/mZ2+QLT3Ij9eMr5Akj0bP5flvkDcUiE/1Bm+QOgxIj9eMr5Akj0bP5flvkDcUiE/ZUy9QLrkIT9eMr5Akj0bP9QZvkDoMSI/ZUy9QLrkIT9eMr5Akj0bP6/mvEAk1hk/ZUy9QLrkIT+v5rxAJNYZP+WTvUCaUCE/Ffy7QLUeID+v5rxAJNYZP+WTvUCaUCE/Ffy7QLUeID+v5rxAJNYZP0ZCukAg9hY/Ffy7QLUeID9GQrpAIPYWPwQtukAWZR0/BC26QBZlHT9GQrpAIPYWP5SOt0DwbRU/BC26QBZlHT+UjrdA8G0VP+dKuEDVwyI/MoO3QGRRJD+UjrdA8G0VP+dKuEDVwyI/n7W2QIaeJD+UjrdA8G0VPzKDt0BkUSQ/n7W2QIaeJD+UjrdA8G0VP2kdtEAcchY/n7W2QIaeJD9pHbRAHHIWP1xAtEBMmiM/XEC0QEyaIz9pHbRAHHIWP1KfsUC3Bxk/XEC0QEyaIz9Sn7FAtwcZP4DPsUCqzyI/gM+xQKrPIj9Sn7FAtwcZP9RlrkAIox0/gM+xQKrPIj/UZa5ACKMdPxuPr0B77iw/OA+vQPyeLj/UZa5ACKMdPxuPr0B77iw/hYauQJBhLz/UZa5ACKMdPzgPr0D8ni4/1vutQIAsLz/UZa5ACKMdP4WGrkCQYS8/1vutQIAsLz/UZa5ACKMdP9qHqkDSWCM/1vutQIAsLz/ah6pA0lgjP7GvqkCO7Co/sa+qQI7sKj/ah6pA0lgjP++Tp0CWwCY/sa+qQI7sKj/vk6dAlsAmP9m6p0Da8TA/2bqnQNrxMD/vk6dAlsAmP231pED2uSg/2bqnQNrxMD9t9aRA9rkoP4X5pECZkzU/hfmkQJmTNT9t9aRA9rkoPyeKokBFSCc/hfmkQJmTNT8niqJARUgnP0H6okBtczg/zXCiQEfVOD8niqJARUgnP0H6okBtczg/XOehQFZyOD8niqJARUgnP81wokBH1Tg/TWKhQMBNNz8niqJARUgnP1znoUBWcjg/TWKhQMBNNz8niqJARUgnPxEloEDMVSI/TWKhQMBNNz8RJaBAzFUiPwtFoEDwKTM/fMSeQK7BLj8RJaBAzFUiPwtFoEDwKTM/fMSeQK7BLj8RJaBAzFUiP9cDnkAM8Bo/fMSeQK7BLj/XA55ADPAaP6vVnUCopCo/01ydQEqNKD/XA55ADPAaP6vVnUCopCo/g/KcQKbLJT/XA55ADPAaP9NcnUBKjSg/cZqcQE54Ij/XA55ADPAaP4PynECmyyU/cZqcQE54Ij/XA55ADPAaPxMhnEBbtA8/cZqcQE54Ij8TIZxAW7QPPzd7m0CvShU/N3ubQK9KFT8TIZxAW7QPP9RymkCCNQA/N3ubQK9KFT/UcppAgjUAP/8wmkAjWwk/8r6ZQCT6Az/UcppAgjUAP/8wmkAjWwk/FHyZQJq++z7UcppAgjUAP/K+mUAk+gM/FHyZQJq++z7UcppAgjUAP+N5mUBYAt8+FHyZQJq++z7jeZlAWALfPlVlmUCk4ew+sTWZQMpg4D7jeZlAWALfPlVlmUCk4ew+9yqZQOqK0z7jeZlAWALfPrE1mUDKYOA+9yqZQOqK0z4rOZlAipO8PuN5mUBYAt8+QearQAA6Hj34matAYN+KPBBErEDQGgQ9+JmrQGDfijwQRKxA0BoEPTFhrEDA5k08+JmrQGDfijwxYaxAwOZNPMebq0DAKH08x5urQMAofTwxYaxAwOZNPOzJq0CAlNK8x5urQMAofTzsyatAgJTSvAv0qkCAUzW8C/SqQIBTNbzsyatAgJTSvIO/qkAwqpm9C/SqQIBTNbyDv6pAMKqZvYIIqkDg72S9ggiqQODvZL2Dv6pAMKqZvb6PqEAIqwy+ggiqQODvZL2+j6hACKsMvhIYqECwoeS9EhioQLCh5L2+j6hACKsMvmdhpUCYXiu+EhioQLCh5L1nYaVAmF4rvnEGpUBQ2eS9cQalQFDZ5L1nYaVAmF4rvsQ4okCQkTW+cQalQFDZ5L3EOKJAkJE1vmVwokCQ48e9ZXCiQJDjx73EOKJAkJE1vttun0Ag1Ry+ZXCiQJDjx73bbp9AINUcvmNkoEBggKO9Y2SgQGCAo73bbp9AINUcvsrGnEDgHdu9Y2SgQGCAo73KxpxA4B3bvRKUnUDwNIC9EpSdQPA0gL3KxpxA4B3bvQ6UmUCgRku9EpSdQPA0gL0OlJlAoEZLvWsImkDAssW8awiaQMCyxbwOlJlAoEZLvcThlUAAsFE8awiaQMCyxbzE4ZVAALBRPLRol0DQ1GY9IvyWQFjyiD3E4ZVAALBRPLRol0DQ1GY97n+WQKhQmD3E4ZVAALBRPCL8lkBY8og9m/mVQMDWoD3E4ZVAALBRPO5/lkCoUJg9m/mVQMDWoD3E4ZVAALBRPJpCkUBAxY89m/mVQMDWoD2aQpFAQMWPPU2TkUDYZsk9TZORQNhmyT2aQpFAQMWPPWP1i0Co6/Y9TZORQNhmyT1j9YtAqOv2PQoXjUCU+Sk+ypaLQBS1Oz5j9YtAqOv2PQoXjUCU+Sk+ypaLQBS1Oz5j9YtAqOv2PcCUh0BklhA+ypaLQBS1Oz7AlIdAZJYQPiK0iEAwR1M+ph+HQPRXWz7AlIdAZJYQPiK0iEAwR1M+ph+HQPRXWz7AlIdAZJYQPi+PgkBA4Cg+ph+HQPRXWz4vj4JAQOAoPs66gkAcl18+zrqCQByXXz4vj4JAQOAoPvKtdUCM5DQ+zrqCQByXXz7yrXVAjOQ0PnW5dUCImlM+dbl1QIiaUz7yrXVAjOQ0PnLrZkBYejQ+dbl1QIiaUz5y62ZAWHo0PsC3ZkD04m0+wLdmQPTibT5y62ZAWHo0Pv0lYUCYNSo+wLdmQPTibT79JWFAmDUqPjX+YUDsenU+a+lgQNx4dT79JWFAmDUqPjX+YUDsenU+PdpfQAACcj79JWFAmDUqPmvpYEDceHU+mtteQBQ6az79JWFAmDUqPj3aX0AAAnI+mtteQBQ6az79JWFAmDUqPpq5XkCYYiE+mtteQBQ6az6auV5AmGIhPggrX0A0zWc+3UtcQNA2UT6auV5AmGIhPggrX0A0zWc+3UtcQNA2UT6auV5AmGIhPgCGXEBsbRU+3UtcQNA2UT4AhlxAbG0VPh2XXEBA71A+QERbQMBWQj4AhlxAbG0VPh2XXEBA71A+4CRaQEztLz4AhlxAbG0VPkBEW0DAVkI+4CRaQEztLz4AhlxAbG0VPhjYWkCMRAU+4CRaQEztLz4Y2FpAjEQFPsvCWkAM/zU+KMpYQACqDT4Y2FpAjEQFPsvCWkAM/zU+KMpYQACqDT4Y2FpAjEQFPjIsWUDoPuQ9KMpYQACqDT4yLFlA6D7kPTuNWEC4swY+O41YQLizBj6IoVhAqCHaPTIsWUDoPuQ98z1SQCi+4j3zPVJAKL7iPa1lUUAIs/o9ODdRQARUHT6tZVFACLP6PfM9UkAovuI9ODdRQARUHT6tZVFACLP6Pe+AT0AUBhA+ODdRQARUHT7vgE9AFAYQPt0zUUBY8xg+qI5PQEzdRD7vgE9AFAYQPt0zUUBY8xg+qI5PQEzdRD7vgE9AFAYQPlBETUDMtR8+qI5PQEzdRD5QRE1AzLUfPiuPT0AAgUA+1yRPQGTASD5QRE1AzLUfPiuPT0AAgUA+P6ROQJSmTz5QRE1AzLUfPtckT0BkwEg+sxFOQHj4VD5QRE1AzLUfPj+kTkCUpk8+G3JNQISIWD5QRE1AzLUfPrMRTkB4+FQ+y8pMQDA4Wj5QRE1AzLUfPhtyTUCEiFg+y8pMQDA4Wj5QRE1AzLUfPgydSUDkcTE+y8pMQDA4Wj4MnUlA5HExPgHlS0CQhFQ+Yb9IQLzMXT4MnUlA5HExPgHlS0CQhFQ+Yb9IQLzMXT4MnUlA5HExPr1yRUCMFUI+Yb9IQLzMXT69ckVAjBVCPjrBRUAcgl8+OsFFQByCXz69ckVAjBVCPjshPEAc204+OsFFQByCXz47ITxAHNtOPjhJPECyHIQ+OEk8QLIchD47ITxAHNtOPvTBMUAgKU8+OEk8QLIchD70wTFAIClPPgxRM0AI3ow+GrYxQOZMjT70wTFAIClPPgxRM0AI3ow+Ch8wQGJ8iz70wTFAIClPPhq2MUDmTI0+Ch8wQGJ8iz70wTFAIClPPiNlLkAo200+Ch8wQGJ8iz4jZS5AKNtNPiOwL0CORok+0pAsQGyrgz4jZS5AKNtNPiOwL0CORok+0pAsQGyrgz4jZS5AKNtNPrwOK0AMNkc+0pAsQGyrgz68DitADDZHPiLvK0DeO4E+0fQoQLy4bz68DitADDZHPiLvK0DeO4E+0fQoQLy4bz68DitADDZHPq4wJEBsLSc+0fQoQLy4bz6uMCRAbC0nPhStI0B03kI+FK0jQHTeQj6uMCRAbC0nPtusHkAkfww+FK0jQHTeQj7brB5AJH8MPlWYHUC8v1I+VZgdQLy/Uj7brB5AJH8MPtPjG0Ak8AM+VZgdQLy/Uj7T4xtAJPADPqp9G0AAKEo+qn0bQAAoSj7T4xtAJPADPvRiGUC0AQQ+qn0bQAAoSj70YhlAtAEEPodsGkCko0Y+h2waQKSjRj70YhlAtAEEPtnrF0BseBA+h2waQKSjRj7Z6xdAbHgQPuVdGkDAlEk+5V0aQMCUST7Z6xdAbHgQPoriFEAEOzs+5V0aQMCUST6K4hRABDs7Pu9YF0DMo2U+71gXQMyjZT6K4hRABDs7PnV+EEBI838+71gXQMyjZT51fhBASPN/PtSDEUB6yIw+1IMRQHrIjD51fhBASPN/Pl/fCkCG7ZA+1IMRQHrIjD5f3wpAhu2QPl8WDUAYs6U+4kcKQEr/sT5f3wpAhu2QPl8WDUAYs6U+4kcKQEr/sT5f3wpAhu2QPpndB0DEV5Q+4kcKQEr/sT6Z3QdAxFeUPv+vCUAY/bI+w6oIQLrqtT6Z3QdAxFeUPv+vCUAY/bI+X5cHQPL9tj6Z3QdAxFeUPsOqCEC66rU+HIMGQHYptj6Z3QdAxFeUPl+XB0Dy/bY+HIMGQHYptj6Z3QdAxFeUPjG9A0AqEpQ+HIMGQHYptj4xvQNAKhKUPjF+A0DoHbE+MX4DQOgdsT4xvQNAKhKUPgxIAEAKi5A+MX4DQOgdsT4MSABACouQPgVU/z/Meqw+BVT/P8x6rD4MSABACouQPorM+T8sZIo+BVT/P8x6rD6KzPk/LGSKPtcp+j+MYa0+bfP2P1yCrD6KzPk/LGSKPtcp+j+MYa0+pd3zPyrSqD6KzPk/LGSKPm3z9j9cgqw+pd3zPyrSqD6KzPk/LGSKPjfh8z8WFoA+pd3zPyrSqD434fM/FhaAPht98j/cqaQ+c3rwP4p6oT434fM/FhaAPht98j/cqaQ+zaruP+zAnD434fM/FhaAPnN68D+KeqE+yyDtP6qtlj434fM/FhaAPs2q7j/swJw+yyDtP6qtlj434fM/FhaAPp/T7j8ku2M+yyDtP6qtlj6f0+4/JLtjPr9n7D9OpI8+1UTrPyz2ij6f0+4/JLtjPr9n7D9OpI8+hVrqP7iPhT6f0+4/JLtjPtVE6z8s9oo++K/pP2A2fz6f0+4/JLtjPoVa6j+4j4U+Y0rpP1COcj6f0+4/JLtjPviv6T9gNn8+Y0rpP1COcj6f0+4/JLtjPr+96z+4q0M+Y0rpP1COcj6/ves/uKtDPjup6D/k/lI+O6noP+T+Uj6/ves/uKtDPl/Q6T+0WSQ+O6noP+T+Uj5f0Ok/tFkkPk/P5z/Y/kQ+asblP7RzFD5f0Ok/tFkkPk/P5z/Y/kQ+asblP7RzFD5f0Ok/tFkkPh/n6D+stQE+asblP7RzFD4f5+g/rLUBPu1S5j+AnB0+cCblP0iP1j0f5+g/rLUBPu1S5j+AnB0+cCblP0iP1j0f5+g/rLUBPrjA6D9o3KI9cCblP0iP1j24wOg/aNyiPfjr5D/IbaY9+OvkP8htpj24wOg/aNyiPVp16D9gBVA9+OvkP8htpj1adeg/YAVQPafn5D+ACXs9p+fkP4AJez1adeg/YAVQPZ085j+gNd88p+fkP4AJez2dPOY/oDXfPJVo5D8AFjI9lWjkPwAWMj2dPOY/oDXfPFsf4z9AoWY8lWjkPwAWMj1bH+M/QKFmPNDd4T+AMBI90N3hP4AwEj1bH+M/QKFmPD3N3D8AOHy70N3hP4AwEj09zdw/ADh8u99+2z8Au7Q8337bPwC7tDw9zdw/ADh8u0Pa1j/AScG8337bPwC7tDxD2tY/wEnBvN811T8A3ls73zXVPwDeWztD2tY/wEnBvBh70T+g9ju93zXVPwDeWzsYe9E/oPY7vcoc0D8AApO8yhzQPwACk7wYe9E/oPY7vd2izT/gfFq9yhzQPwACk7zdos0/4Hxavf8ezT/AAcm8/x7NP8ABybzdos0/4HxavUdIxT/ghWO9/x7NP8ABybxHSMU/4IVjvRCyxT+AXRG8ELLFP4BdEbxHSMU/4IVjvR/evD/g0jS9ELLFP4BdEbwf3rw/4NI0vbOdvz+g2+g8s52/P6Db6Dwf3rw/4NI0veIRtD8AnXG8s52/P6Db6DziEbQ/AJ1xvNMjtz+A40Q90yO3P4DjRD3iEbQ/AJ1xvAQvqj9ANzo80yO3P4DjRD0EL6o/QDc6PE3drz+A0Zo9AM+sP1hTqz0EL6o/QDc6PE3drz+A0Zo9oJepP6gurz0EL6o/QDc6PADPrD9YU6s9oJepP6gurz0EL6o/QDc6PP4coT/ASN88oJepP6gurz3+HKE/wEjfPBfSpT+Y9aU9U22fP8BjoT3+HKE/wEjfPBfSpT+Y9aU9U22fP8BjoT3+HKE/wEjfPCeolj+AVjE9U22fP8BjoT0nqJY/gFYxPScWlz9AD4w9JxaXP0APjD0nqJY/gFYxPWs8jT9QHkc9JxaXP0APjD1rPI0/UB5HPSBxjT/YiKA9IHGNP9iIoD1rPI0/UB5HPbCtgT/QdlQ9IHGNP9iIoD2wrYE/0HZUPR3mgT8ABug9HeaBPwAG6D2wrYE/0HZUPcXDaj8AVFw9HeaBPwAG6D3Fw2o/AFRcPY1lcT+kKwM+QxVtP6DSBD7Fw2o/AFRcPY1lcT+kKwM+4MdoPzjAAj7Fw2o/AFRcPUMVbT+g0gQ+P7BkP9gZ+j3Fw2o/AFRcPeDHaD84wAI+P7BkP9gZ+j3Fw2o/AFRcPagrTz+AblQ9P7BkP9gZ+j2oK08/gG5UPTXMTj8IEac9NcxOPwgRpz2oK08/gG5UPXtsMD+w6iw9NcxOPwgRpz17bDA/sOosPeeaLz+A9ok955ovP4D2iT17bDA/sOosPX56GT8AuNk855ovP4D2iT1+ehk/ALjZPKj0Fj/IOqY9qPQWP8g6pj1+ehk/ALjZPGezBz9AMF88qPQWP8g6pj1nswc/QDBfPDIwBT8ofaI9MjAFPyh9oj1nswc/QDBfPGuO8z4ATPU7MjAFPyh9oj1rjvM+AEz1O8IB8j4A64M9wgHyPgDrgz1rjvM+AEz1O8/0vj5AaQQ8wgHyPgDrgz3P9L4+QGkEPMk/wD4ACRo9yT/APgAJGj3P9L4+QGkEPOahpT6gvIU8yT/APgAJGj3moaU+oLyFPIJ7qD6QXS89gnuoPpBdLz3moaU+oLyFPCpajT4gzeg8gnuoPpBdLz0qWo0+IM3oPOpXkD7QYUk96leQPtBhST0qWo0+IM3oPFupbT6w+Ss96leQPtBhST1bqW0+sPkrPcwThj7IvZE9aHJ/PmgRqT1bqW0+sPkrPcwThj7IvZE9jd9wPkCFuz1bqW0+sPkrPWhyfz5oEak9IuVgPuiDyD1bqW0+sPkrPY3fcD5Ahbs9IuVgPuiDyD1bqW0+sPkrPT08LD7QxmA9IuVgPuiDyD09PCw+0MZgPZ6KST5wc889zYoYPnAm7T09PCw+0MZgPZ6KST5wc889zYoYPnAm7T09PCw+0MZgPVvyuD2AumA9zYoYPnAm7T1b8rg9gLpgPZq13T0o5fY9Oyq7PbBm+j1b8rg9gLpgPZq13T0o5fY9l7aYPcgT9j1b8rg9gLpgPTsquz2wZvo9cDZwPdgk6j1b8rg9gLpgPZe2mD3IE/Y9cDZwPdgk6j1b8rg9gLpgPdm5AT0AKSo9cDZwPdgk6j3ZuQE9ACkqPQJGFT0IkMk9LwyrPMAdvD3ZuQE9ACkqPQJGFT0IkMk9QDvjO+iXqD3ZuQE9ACkqPS8MqzzAHbw9wGSeu4DGjz3ZuQE9ACkqPUA74zvol6g9wGSeu4DGjz3ZuQE9ACkqPfsoUrxAUmE8wGSeu4DGjz37KFK8QFJhPPNoAr2wFxQ982gCvbAXFD37KFK8QFJhPA0/QL0Av8u882gCvbAXFD0NP0C9AL/LvD+0ib0A1Du7P7SJvQDUO7sNP0C9AL/LvJ8rqL0gNVK9P7SJvQDUO7ufK6i9IDVSvctowr3Ah868y2jCvcCHzryfK6i9IDVSvWuGtL1AtFi9y2jCvcCHzrxrhrS9QLRYvUXLtb2gRka9Rcu1vaBGRr3OW5S+4B1nvWuGtL1AtFi9"
            }
            PolygonVertexAttributeArray {
                id: graphic60bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic60bevelMesha_position, graphic60bevelMesha_texCoord, graphic60bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.862572, 1.5251], [-0.351001, 1.94598], [0.233784, 2.16249], [0.799438, 2.32238], [0.975537, 2.34411], [1.2487, 2.17343], [1.70993, 2.17879], [2.08542, 2.31714], [2.45567, 2.62192], [3.37829, 2.66252], [4.36599, 2.42412], [5.04282, 1.65764], [5.3628, 1.395], [6.81396, 1.37525], [7.25773, 1.41424], [7.48562, 1.54194], [7.66886, 2.24597], [7.94745, 2.3515], [8.04691, 2.9687], [7.86854, 3.12771], [8.34459, 3.664], [8.79624, 4.07927], [9.07345, 4.68423], [9.59564, 5.14673], [10.0953, 5.14877], [10.4859, 4.42063], [10.5923, 3.45643], [10.8648, 2.49421], [11.5894, 1.85622], [12.9472, 1.30273], [13.9075, 1.12946], [14.8839, 0.90668], [15.7962, 0.86016], [17.248, 1.08861], [18.3162, 1.75452], [18.9358, 2.6376], [19.3327, 3.47328], [19.704, 4.71667], [19.761, 5.61801], [19.8822, 6.72898], [20.1486, 7.85835], [20.5436, 8.08903], [21.1376, 8.00302], [21.6643, 7.9912], [22.1191, 8.0964], [22.4775, 7.98243], [22.7301, 7.50394], [23.1363, 6.85518], [23.6916, 6.44106], [23.9133, 6.07812], [23.8629, 5.68239], [23.2647, 5.05056], [23.096, 4.08187], [23.0863, 2.95819], [23.1415, 1.85443], [23.3124, 1.04926], [23.2753, -0.367773], [22.9676, -1.49254], [22.5514, -2.12799], [22.305, -2.16623], [22.086, -2.09174], [21.9505, -1.88732], [21.7063, -1.68581], [21.2519, -1.52665], [20.661, -1.49664], [19.6835, -1.45331], [18.7549, -1.43545], [17.5927, -1.41457], [16.4776, -1.37187], [15.5679, -1.31943], [14.3568, -1.30544], [13.1575, -1.40123], [12.3689, -1.48636], [11.4938, -1.4889], [9.90815, -1.29238], [8.1801, -1.06885], [5.75838, -1.04273], [2.81626, -1.06941], [2.28066, -1.19391], [1.62698, -1.51746], [1.28597, -1.48665], [0.91725, -1.28684], [0.771593, -0.649265], [0.609591, -0.113425], [0.251408, 0.348871], [-0.316534, 0.665478], [-0.860786, 0.85066], [-0.969366, 1.08524]]
        id: actor39412
        objectName: "actor39412"
        property alias bodyRenderer: graphic61
        x: 125.66508
        y: -16.082996
        TerrainMeshRenderer {
            id: graphic61
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic61baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "0a4VvyC8j7+iQCO/lJ+Mv0o30b5Mz4e/4CFHvwBpvL/RrhW/ILyPv0o30b5Mz4e/4CFHvwBpvL9KN9G+TM+Hv8D0hz3XqGe/4CFHvwBpvL/A9Ic916hnvwIWtj7lpFe/4CFHvwBpvL8CFrY+5aRXv9BSAj8Oo0W/RmAlPxZeLL/830I/qMoMv+SMgj//NMS+0KqbP4job736FZ4/9IyLPRT6oz/MaoI+umeiP34rQT/zUZs/Pe6HPyM4sz9i6I0/FPqjP8xqgj66Z6I/fitBPyM4sz9i6I0/FPqjP8xqgj4jOLM/YuiNP+dexz8HtZI/0KqbP4job70U+qM/zGqCPudexz8HtZI/0KqbP4job73nXsc/B7WSPzBKCkDm+Vs/tBuWP3ZlN77Qqps/iOhvvTBKCkDm+Vs/KqCNP47Vk760G5Y/dmU3vjBKCkDm+Vs/5IyCP/80xL4qoI0/jtWTvjBKCkDm+Vs/5IyCP/80xL4wSgpA5vlbP2fgIUCM4BE/RmAlPxZeLL/kjII//zTEvmfgIUCM4BE/0FICPw6jRb9GYCU/Fl4sv2fgIUCM4BE/0FICPw6jRb9n4CFAjOARP2kWK0ByAvY+0FICPw6jRb9pFitAcgL2PmRTNUAce9k+4CFHvwBpvL/QUgI/DqNFv2RTNUAce9k+4CFHvwBpvL9kUzVAHHvZPo8YQEBnjM8+4CFHvwBpvL+PGEBAZ4zPPjtJuEBCGMk+4CFHvwBpvL87SbhAQhjJPlBQA0Fwni4/4CFHvwBpvL9QUANBcJ4uPy3PG0H0xiM/4CFHvwBpvL8tzxtB9MYjPxO6I0HhGjY/E7ojQeEaNj+APzhBw4yQP0mHQUEIxGY/4CFHvwBpvL8TuiNB4Ro2P0mHQUEIxGY/4CFHvwBpvL9Jh0FBCMRmP8BaSUGwN0w/4CFHvwBpvL/AWklBsDdMPzaATUGoREE/4CFHvwBpvL82gE1BqERBP9R/VUGYwUM/4CFHvwBpvL/Uf1VBmMFDPwZ+ZUFjumg/4CFHvwBpvL8GfmVBY7poPxZNeUF2oG4/4CFHvwBpvL8WTXlBdqBuP4T4g0Es53o/4CFHvwBpvL+E+INBLOd6P53SjEHRAoc/4CFHvwBpvL+d0oxB0QKHPzkvlEEoc1M/4CFHvwBpvL85L5RBKHNTP/UmmEEWOEM/4CFHvwBpvL/1JphBFjhDP7Gcm0H5zy0/4CFHvwBpvL+xnJtB+c8tP6T1nEGmVSw/epGfQTa0QD8ccqVBoIqKPxWdqEEa+ow/A0ueQcOzMj96kZ9BNrRAPxWdqEEa+ow/A0ueQcOzMj8VnahBGvqMP7KZqkEHJpI/spmqQQcmkj+7dqxB2FOeP+RUrUFCdp4/A0ueQcOzMj+ymapBByaSP+RUrUFCdp4/eR6vQXdbrT/wn7BBMsrCP9vKsEGcwME/28qwQZzAwT+Th7JBc4TlP5OHskFzhOU/28qwQZzAwT+Th7JBc4TlP8zDskHYm9k/eR6vQXdbrT/byrBBnMDBP8zDskHYm9k/zMOyQdib2T+lxbJB7q7nP9TUtEGUEKo/eR6vQXdbrT/Mw7JB2JvZP9TUtEGUEKo/5FStQUJ2nj95Hq9Bd1utP9TUtEGUEKo/A0ueQcOzMj/kVK1BQnaeP9TUtEGUEKo/A0ueQcOzMj/U1LRBlBCqP1zAtEHlyog+pPWcQaZVLD8DS55Bw7MyP1zAtEHlyog+4CFHvwBpvL+k9ZxBplUsP1zAtEHlyog+XMC0QeXKiD7ks7VBkIh+vxsAtkEA1+a/XMC0QeXKiD4bALZBANfmvy3vskGWzyzAXMC0QeXKiD4t77JBls8swC+IskHoIjfAXMC0QeXKiD4viLJB6CI3wBhmskEy5kHAG9+4QSvgrMBhBLxBGE67wCoxvEFi1b/AG9+4QSvgrMAqMbxBYtW/wHstu0G0hsXA3bC2QVp2n8Ab37hBK+CswHstu0G0hsXA3bC2QVp2n8B7LbtBtIbFwMmAuEER1s3AdH+0QS6xi8DdsLZBWnafwMmAuEER1s3AI0CzQdn6eMB0f7RBLrGLwMmAuEER1s3AI0CzQdn6eMDJgLhBEdbNwB+It0GnntHAI0CzQdn6eMAfiLdBp57RwEvLtkGNK9bAI0CzQdn6eMBLy7ZBjSvWwLFTtkHbQtvAI0CzQdn6eMCxU7ZB20LbwM0ltUFmh+7AT4qyQcCnTMAjQLNB2fp4wM0ltUFmh+7AGGayQTLmQcBPirJBwKdMwM0ltUFmh+7AGGayQTLmQcDNJbVBZofuwEUuskEemffAGGayQTLmQcBFLrJBHpn3wKnZsEHM4/jAGGayQTLmQcCp2bBBzOP4wBuIr0E6hffAGGayQTLmQcAbiK9BOoX3wMuOq0HksfXAXMC0QeXKiD4YZrJBMuZBwMuOq0HksfXAXMC0QeXKiD7LjqtB5LH1wMXjqEEk9/XAXMC0QeXKiD7F46hBJPf1wFHWpEE40/jAXMC0QeXKiD5R1qRBONP4wHk+o0GuYvXAXMC0QeXKiD55PqNBrmL1wHs6oEHJhdbAXMC0QeXKiD57OqBByYXWwD9Mn0EAXLPAXMC0QeXKiD4/TJ9BAFyzwH8koEFHEp3AXMC0QeXKiD5/JKBBRxKdwCQzoEHCA5XAXMC0QeXKiD4kM6BBwgOVwLjEn0E8JI3AXMC0QeXKiD64xJ9BPCSNwDC+nUEOAWbAXMC0QeXKiD4wvp1BDgFmwAIunEGMjEjAXMC0QeXKiD4CLpxBjIxIwDusmkHmkizAXMC0QeXKiD47rJpB5pIswP59mEE/vxHAXMC0QeXKiD7+fZhBP78RwAKYlUHuXNy/XMC0QeXKiD4CmJVB7lzcv6C2lEHG/8u/XMC0QeXKiD6gtpRBxv/Lv+qnk0HVlb6/XMC0QeXKiD7qp5NB1ZW+v5Z1kkFdmrS/XMC0QeXKiD6WdZJBXZq0v3NDikFQsn6/XMC0QeXKiD5zQ4pBULJ+v9TSfEHkokK/4CFHvwBpvL9cwLRB5cqIPtTSfEHkokK/4CFHvwBpvL/U0nxB5KJCvxnsbUGXwE6/4CFHvwBpvL8Z7G1Bl8BOvzszXkGfB4S/A+gnQer7W8ARPyZB04KMwJcjH0EqwJzAt3ssQYs3HMAD6CdB6vtbwJcjH0EqwJzAt3ssQYs3HMCXIx9BKsCcwOIaG0GDcJzAt3ssQYs3HMDiGhtBg3CcwOl1EkFz/ZPAt3ssQYs3HMDpdRJBc/2TwLsIDkHGp4DAYJY4Qau24r+3eyxBizccwLsIDkHGp4DAYJY4Qau24r+7CA5BxqeAwJenBkGwAmbAYJY4Qau24r+XpwZBsAJmwNz8/kAGjEjAbbVOQR51mr9gljhBq7biv9z8/kAGjEjAbbVOQR51mr/c/P5ABoxIwBlCAkHSI0DAbbVOQR51mr8ZQgJB0iNAwChmAEFzcxLAbbVOQR51mr8oZgBBc3MSwN/I90BNdwvAbbVOQR51mr/fyPdATXcLwLsS8kBUjL2/OzNeQZ8HhL9ttU5BHnWav7sS8kBUjL2/OzNeQZ8HhL+7EvJAVIy9v8sw6UByyqi/OzNeQZ8HhL/LMOlAcsqov0Mq2kCoPaO/OzNeQZ8HhL9DKtpAqD2jv8aCqkCiiaa/4CFHvwBpvL87M15BnweEv8aCqkCiiaa/4CFHvwBpvL/GgqpAoommvxEmn0A798q/4CFHvwBpvL8RJp9AO/fKv4APikBUqRXAgA+KQFSpFcAomFdA5QckwKZ0H0Dj0yHAgA+KQFSpFcCmdB9A49MhwNmmCEDavg7AgA+KQFSpFcDZpghA2r4OwDQx3T8NJgXA4CFHvwBpvL+AD4pAVKkVwDQx3T8NJgXA4CFHvwBpvL80Md0/DSYFwIVgnD/d7wTA4CFHvwBpvL+FYJw/3e8EwFg0dD8txg/A4CFHvwBpvL9YNHQ/LcYPwFW4UT/OWw7A4CFHvwBpvL9VuFE/zlsOwNePhz57UATA14+HPntQBMBbNJq+jPztv+AhR78Aaby/"
            }
            PolygonVertexAttributeArray {
                id: graphic61baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic61baseMesha_position, graphic61baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic61edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic61edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic61edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic61edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic61edgeMesha_position, graphic61edgeMesha_texCoord, graphic61edgeMesha_maskTexCoord, graphic61edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic61bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic61bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic61bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic61bevelMesha_position, graphic61bevelMesha_texCoord, graphic61bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.123816, 0.681748], [0.370917, 1.00018], [1.00629, 1.65098], [1.25419, 2.21965], [1.85557, 2.53062], [2.3386, 2.22951], [2.5242, 1.88338], [2.83672, 1.08915], [3.12385, 0.589403], [3.37099, 0.236043], [3.62793, -0.148569], [3.55745, -0.393717], [3.58782, -0.675011], [3.41387, -0.911788], [3.20188, -0.929426], [3.05663, -0.859789], [2.80416, -0.446703], [2.60292, -0.199278], [2.37243, 0.0014147], [2.04169, 0.17185], [1.6225, 0.298735], [1.2389, 0.35616], [0.877061, 0.373988], [0.555841, 0.349392], [0.1693, 0.245], [-0.0940212, 0.0908341], [-0.316044, 0.0344841], [-0.491233, 0.152633], [-0.496114, 0.465302]]
        id: actor39423
        objectName: "actor39423"
        rotation: -3.0114133
        visible: false
        x: 160.35515
        y: -15.802199
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[3.20878, -0.121483], [3.19451, -0.396744], [2.97809, -0.449735], [2.60234, -0.385368], [2.1988, -0.317372], [1.76122, -0.274448], [1.22962, -0.275234], [0.734782, -0.338728], [0.321294, -0.400817], [-0.121253, -0.428118], [-0.328856, -0.341447], [-0.417698, -0.0360052], [0.076048, 0.433794], [0.765502, 0.487209], [1.69486, 0.532696], [2.46343, 0.453573], [3.04309, 0.19277]]
        id: actor66718
        objectName: "actor66718"
        rotation: 3.6221159
        visible: false
        x: 20.148376
        y: -18.58373
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[5.82671, 0.628414], [6.1937, 0.0650191], [6.05112, -0.203016], [5.62076, -0.269927], [5.21532, -0.407544], [4.56063, -0.488536], [3.80763, -0.382324], [2.89121, -0.37644], [2.39579, -0.411932], [1.89188, -0.515268], [1.39023, -0.770983], [1.03361, -1.13449], [0.629757, -0.966275], [0.273468, -0.480081], [0.221849, -0.140343], [0.430049, -0.000487447], [0.810353, 0.0732955], [1.36439, 0.257416], [2.18636, 0.621391], [2.93526, 1.36242], [3.86159, 1.25536], [4.80943, 0.738399]]
        id: actor66720
        objectName: "actor66720"
        visible: false
        x: 26.630857
        y: -19.176924
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139209
        objectName: "actor139209"
        x: 164.80449
        y: -26.377926
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139210
        objectName: "actor139210"
        x: 51.7453
        y: -14.883851
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139211
        objectName: "actor139211"
        x: 49.82596
        y: -13.271171
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139212
        objectName: "actor139212"
        x: 49.72899
        y: -10.80354
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139213
        objectName: "actor139213"
        x: 51.64411
        y: -9.372396
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139214
        objectName: "actor139214"
        x: 54.138783
        y: -14.615617
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139218
        objectName: "actor139218"
        x: 61.999523
        y: -12.250168
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139219
        objectName: "actor139219"
        x: 61.9882
        y: -14.121905
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139220
        objectName: "actor139220"
        x: 160.99782
        y: -25.469223
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139221
        objectName: "actor139221"
        x: 158.89981
        y: -10.97147
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139233
        objectName: "actor139233"
        x: 162.078
        y: -28.803152
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139234
        objectName: "actor139234"
        x: 141.18571
        y: -13.915199
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139235
        objectName: "actor139235"
        x: 139.07066
        y: -8.323549
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139236
        objectName: "actor139236"
        x: 138.42923
        y: -13.075067
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139237
        objectName: "actor139237"
        x: 143.79959
        y: -12.361281
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139238
        objectName: "actor139238"
        x: 137.26625
        y: -10.888586
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139239
        objectName: "actor139239"
        x: 142.37921
        y: -7.9329925
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139240
        objectName: "actor139240"
        x: 110.53401
        y: -10.791246
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139241
        objectName: "actor139241"
        x: 154.99487
        y: -21.882452
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139242
        objectName: "actor139242"
        x: 150.77606
        y: -21.88889
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139243
        objectName: "actor139243"
        x: 173.75014
        y: -17.927126
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139244
        objectName: "actor139244"
        x: 186.74196
        y: -21.336926
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139246
        objectName: "actor139246"
        x: 68.65056
        y: -11.322613
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139247
        objectName: "actor139247"
        x: 129.06282
        y: -12.618868
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139248
        objectName: "actor139248"
        x: 76.28425
        y: -15.931065
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139249
        objectName: "actor139249"
        x: 161.14453
        y: -6.744715
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139250
        objectName: "actor139250"
        x: 154.3435
        y: -12.9465
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139251
        objectName: "actor139251"
        x: 159.23737
        y: -13.988701
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139252
        objectName: "actor139252"
        x: 174.75612
        y: -4.0629644
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139254
        objectName: "actor139254"
        x: 156.40005
        y: -15.26728
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139255
        objectName: "actor139255"
        x: 182.46442
        y: -4.902356
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139256
        objectName: "actor139256"
        x: 183.5499
        y: -6.285481
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139257
        objectName: "actor139257"
        x: 182.60799
        y: -8.161827
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139258
        objectName: "actor139258"
        x: 180.76472
        y: -8.334173
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139259
        objectName: "actor139259"
        x: 174.47058
        y: -26.195217
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139260
        objectName: "actor139260"
        x: 191.13167
        y: -17.480589
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139261
        objectName: "actor139261"
        x: 189.67271
        y: -22.282555
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139262
        objectName: "actor139262"
        x: 192.81184
        y: -18.773907
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor139263
        objectName: "actor139263"
        x: 192.22186
        y: -20.856226
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.43
        emitterLogic.spawnVelocity: 7.5
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor163184
        objectName: "actor163184"
        rotation: -180
        visible: false
        x: 62.01582
        y: -9.429957
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.pauseDistance: 12
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.33
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor163185
        objectName: "actor163185"
        rotation: -180
        visible: false
        x: 34.34586
        y: -14.2378
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.43
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor163187
        objectName: "actor163187"
        rotation: -180
        visible: false
        x: 177.79663
        y: -5.921476
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[5.65441, 0.364218], [6.27193, -0.139179], [6.2678, -0.568348], [5.95452, -0.741416], [5.80709, -0.590212], [5.66134, -0.470584], [5.50115, -0.372711], [5.27944, -0.282489], [4.977, -0.180391], [4.59246, -0.0540795], [4.13692, 0.0792107], [3.64838, 0.181986], [3.17025, 0.240797], [2.54224, 0.253556], [2.03951, 0.238963], [1.53956, 0.249479], [1.24893, 0.414295], [1.62123, 0.882682], [2.43379, 0.963038], [3.51737, 1.16776], [4.3583, 1.41104], [4.96238, 0.763279]]
        id: actor163322
        objectName: "actor163322"
        visible: false
        x: 45.881554
        y: -21.08009
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.635353, -0.340071], [-0.0680246, 0.338035], [0.872375, 0.480381], [2.33947, 0.38559], [3.76043, 0.6353], [5.14227, 0.531137], [5.7967, 0.638336], [7.01784, -0.777063], [6.99321, -0.981027], [6.7918, -0.973157], [6.46199, -0.831642], [6.25728, -0.62419], [5.971, -0.477792], [5.70135, -0.405961], [5.35283, -0.376686], [4.99561, -0.384134], [3.87616, -0.478195], [2.9453, -0.582981], [2.20658, -0.677515], [1.42231, -0.765095], [-0.700527, -1.02735], [-0.972649, -0.954418], [-1.06695, -0.784912]]
        id: actor163323
        objectName: "actor163323"
        visible: false
        x: 37.304096
        y: -18.336212
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.84429, 3.20244], [2.60697, 3.20244], [2.60697, 2.40765], [-2.84429, 2.40765]]
        id: actor163324
        objectName: "actor163324"
        property alias image: graphic109
        rotation: 0.75
        x: 40.33367
        y: -21.180187
        ImageRenderer {
            cacheRenderParams: actor163324.body.bodyType === Body.StaticBody
            id: graphic109
            sizeScale: 8.09185
            source: Util.getPathToImage("middleground_e1/deco_e1_platform03.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[2.38325, -0.0902288], [2.35823, -0.319473], [2.20171, -0.41849], [1.93876, -0.31093], [1.62988, -0.24219], [1.30811, -0.213543], [0.913275, -0.204424], [0.545744, -0.251583], [0.238634, -0.297698], [-0.0900584, -0.317975], [-0.244251, -0.253603], [-0.310236, -0.0267421], [0.056483, 0.322191], [0.56856, 0.361864], [1.35975, 0.721137], [1.82966, 0.336882], [2.26019, 0.143176]]
        id: actor163574
        objectName: "actor163574"
        x: 69.70195
        y: -18.45599
    }
    WaterBody {
        body.vertices: [[-1.04338, 1.02892], [1.72296, 1.13013], [2.60497, 1.1472], [2.45715, 0.780465], [2.16937, 0.429303], [1.78717, 0.184633], [1.35147, 0.00419033], [0.814906, -0.108565], [0.303032, -0.175205], [-0.291496, -0.175821], [-0.726056, -0.13067], [-1.54156, 0.22162], [-2.30208, 0.964416]]
        emitterLogic.layer: particleLayer1
        id: actor163579
        objectName: "actor163579"
        rotation: 180
        x: 21.963743
        y: -12.734873
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.928574, -0.541116], [0.309441, 0.0344458], [0.430542, 0.19044], [0.525691, 0.196411], [0.582376, 0.0953813], [1.40743, 0.0904236], [1.60085, 0.253874], [1.80107, 0.118435], [2.43158, 0.0556872], [2.92354, 0.193483], [3.35305, -0.0268122], [3.66622, -0.578363], [3.88959, -0.725552], [4.06219, -1.00878], [3.92978, -1.2003], [3.59495, -1.18957], [3.45091, -1.08141], [3.27585, -0.990352], [3.07507, -0.935689], [2.82646, -0.876353], [2.53597, -0.836969], [2.10152, -0.812641], [1.11457, -0.807545], [0.617606, -0.812237], [0.309721, -0.838786], [-0.0427826, -0.87788], [-0.330875, -0.926952], [-0.622749, -1.00391], [-0.871994, -1.00546], [-1.06021, -0.875859]]
        id: actor163712
        objectName: "actor163712"
        visible: false
        x: 104.408104
        y: -14.107965
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.12273, 1.99105], [0.79433, 1.99105], [0.79433, 1.53556], [-2.12273, 1.53556]]
        id: actor163713
        objectName: "actor163713"
        property alias image: graphic113
        x: 105.89739
        y: -16.444355
        ImageRenderer {
            cacheRenderParams: actor163713.body.bodyType === Body.StaticBody
            id: graphic113
            sizeScale: 5.2271504
            source: Util.getPathToImage("middleground_e1/deco_e1_platform08.png")
        }
    }
    WaterBody {
        body.vertices: [[2.32409, -0.468365], [1.61635, -0.100063], [0.841773, 0.0317804], [0.024646, 0.100328], [-0.746567, 0.068234], [-1.25208, -0.103697], [-1.86945, -0.504616]]
        emitterLogic.layer: particleLayer1
        id: actor163840
        objectName: "actor163840"
        x: 146.72166
        y: -3.5687187
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.13053, -0.796418], [-1.11918, -0.235179], [-0.647192, 0.274884], [-0.116709, 0.604798], [0.942596, 0.273472], [1.30423, 0.607304], [1.40404, 0.266515], [2.74991, 0.806693], [3.49627, 0.491647], [4.35994, 0.0753267], [4.53896, -0.696916], [4.24882, -0.897622], [3.97463, -0.895329], [3.33524, -0.740935], [2.69254, -0.677163], [1.92878, -0.637789], [0.912979, -0.633257], [0.425858, -0.695416], [-0.676765, -1.00622], [-0.945018, -0.962997]]
        id: actor163842
        objectName: "actor163842"
        visible: false
        x: 113.89415
        y: -14.307344
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.86348, 2.02027], [1.23632, 2.02027], [1.23632, 1.40672], [-1.86348, 1.40672]]
        id: actor163844
        objectName: "actor163844"
        property alias image: graphic116
        x: 115.5887
        y: -16.279682
        ImageRenderer {
            cacheRenderParams: actor163844.body.bodyType === Body.StaticBody
            id: graphic116
            sizeScale: 5.7832413
            source: Util.getPathToImage("middleground_e1/deco_e1_platform06.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[0.397537, 0.302092], [-0.540993, 0.538185], [-1.0422, 0.306879], [-2.69913, 0.312388], [-3.05821, 0.704035], [-3.58601, 0.411706], [-4.74998, 0.176776], [-5.67668, 0.149625], [-5.86154, 0.490798], [-6.7067, 0.190229], [-7.07542, -0.289152], [-7.04232, -0.723149], [-6.34475, -0.86503], [-4.54972, -0.879401], [-3.33843, -0.834743], [-1.92532, -0.819637], [-1.26431, -0.829793], [-0.685837, -0.881002], [-0.136772, -1.03694], [0.373901, -1.3181], [0.886673, -1.35194], [1.49555, -1.16661], [1.46031, -0.73759]]
        id: actor163846
        objectName: "actor163846"
        visible: false
        x: 173.70604
        y: -23.970062
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.122877, 3.49868], [-4.16648, 3.49868], [-4.16648, 2.76841], [-0.122877, 2.76841]]
        id: actor163847
        objectName: "actor163847"
        property alias image: graphic118
        x: 170.88829
        y: -27.544678
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor163847.body.bodyType === Body.StaticBody
            id: graphic118
            sizeScale: -8.6870165
            source: Util.getPathToImage("middleground_e1/deco_e1_platform07.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.52522, -0.0209427], [-1.40146, 0.263563], [-1.24101, 0.401339], [-0.0423896, 0.285306], [0.216522, 0.583255], [0.553393, 0.561304], [1.53931, 0.142347], [2.29133, -0.341021], [2.48391, -0.743359], [2.4173, -0.941988], [2.31941, -0.992771], [1.74694, -1.0307], [0.206473, -0.968275], [-0.357781, -0.979553], [-0.982292, -1.04721], [-1.74948, -1.15668], [-2.14362, -1.13283], [-2.48209, -0.974166], [-2.60519, -0.768291], [-2.65673, -0.552417], [-2.4114, -0.125969], [-2.02953, 0.0261606]]
        id: actor163849
        objectName: "actor163849"
        visible: false
        x: 99.986595
        y: -19.309807
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.4398, 1.72665], [1.56911, 1.72665], [1.56911, 1.04267], [-1.4398, 1.04267]]
        id: actor163850
        objectName: "actor163850"
        property alias image: graphic120
        x: 99.88586
        y: -21.312674
        ImageRenderer {
            cacheRenderParams: actor163850.body.bodyType === Body.StaticBody
            id: graphic120
            sizeScale: 5.2440615
            source: Util.getPathToImage("middleground_e1/deco_e1_platform11.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.42981, 0.204271], [0.609631, 0.106974], [0.817614, 0.343977], [1.00877, 0.382167], [1.28744, -0.0257891], [1.78507, -0.214395], [2.55157, -0.733533], [2.57237, -0.959943], [2.41151, -1.15379], [1.90228, -1.14711], [1.08862, -1.03664], [0.68055, -1.01162], [-0.519641, -1.00683], [-0.965149, -1.02323], [-1.42981, -1.09483], [-1.83254, -1.1956], [-2.17266, -1.37582], [-2.55169, -1.39689], [-2.80867, -1.20114], [-2.70355, -0.845848], [-2.56171, -0.661497], [-2.26879, -0.406899], [-2.12099, -0.0900059]]
        id: actor163852
        objectName: "actor163852"
        visible: false
        x: 115.051414
        y: -19.455103
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.428511, 1.96952], [1.96952, 1.96952], [1.96952, 1.34824], [-0.428511, 1.34824]]
        id: actor163853
        objectName: "actor163853"
        property alias image: graphic122
        x: 114.9302
        y: -21.767645
        ImageRenderer {
            cacheRenderParams: actor163853.body.bodyType === Body.StaticBody
            id: graphic122
            sizeScale: 5.4668713
            source: Util.getPathToImage("middleground_e1/deco_e1_platform09.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[0.0124992, 0.372715], [0.326773, 0.131791], [1.63468, 0.654617], [3.40533, -0.254014], [3.58401, -1.06981], [3.23614, -1.27824], [1.74397, -1.13974], [0.366142, -1.02056], [-0.290718, -0.986294], [-0.653229, -0.990355], [-1.00088, -1.02015], [-1.33238, -1.07972], [-1.64666, -1.17768], [-1.95597, -1.31737], [-2.22619, -1.40127], [-2.51302, -1.34467], [-2.65947, -1.10886], [-2.59448, -0.572561], [-2.16342, -0.00942618], [-1.52142, 0.355243], [-0.663694, 0.0192006]]
        id: actor163855
        objectName: "actor163855"
        visible: false
        x: 88.2089
        y: -14.316757
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.80782, 2.37682], [2.04059, 2.37682], [2.04059, 1.5286], [-1.80782, 1.5286]]
        id: actor163856
        objectName: "actor163856"
        property alias image: graphic124
        x: 88.654945
        y: -16.77734
        ImageRenderer {
            cacheRenderParams: actor163856.body.bodyType === Body.StaticBody
            id: graphic124
            sizeScale: 6.3598204
            source: Util.getPathToImage("middleground_e1/deco_e1_platform06.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164121
        objectName: "actor164121"
        x: 99.495056
        y: -21.250187
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164122
        objectName: "actor164122"
        x: 177.77
        y: -8.101811
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164123
        objectName: "actor164123"
        x: 80.14889
        y: -10.307079
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164125
        objectName: "actor164125"
        x: 85.58106
        y: -10.206507
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164126
        objectName: "actor164126"
        x: 123.577545
        y: -14.072022
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164127
        objectName: "actor164127"
        x: 122.709854
        y: -10.803619
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164128
        objectName: "actor164128"
        x: 105.003525
        y: -24.67569
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164129
        objectName: "actor164129"
        x: 119.36683
        y: -17.802217
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164130
        objectName: "actor164130"
        x: 66.68575
        y: -11.313017
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164131
        objectName: "actor164131"
        x: 110.720085
        y: -16.306679
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164132
        objectName: "actor164132"
        x: 40.496696
        y: -19.475094
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164133
        objectName: "actor164133"
        x: 47.67542
        y: -16.098
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164134
        objectName: "actor164134"
        x: 34.334747
        y: -16.66534
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164135
        objectName: "actor164135"
        x: 34.405746
        y: -18.740852
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164136
        objectName: "actor164136"
        x: 34.378273
        y: -20.911299
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164137
        objectName: "actor164137"
        x: 43.55042
        y: -14.537837
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164138
        objectName: "actor164138"
        x: 65.5197
        y: -20.658943
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164139
        objectName: "actor164139"
        x: 22.695536
        y: -16.256165
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164140
        objectName: "actor164140"
        x: 20.19725
        y: -16.59532
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164142
        objectName: "actor164142"
        x: 30.054071
        y: -20.062037
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164144
        objectName: "actor164144"
        x: 28.39748
        y: -17.900106
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164147
        objectName: "actor164147"
        x: 27.179747
        y: -18.50577
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164149
        objectName: "actor164149"
        x: 21.649458
        y: -12.98022
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164150
        objectName: "actor164150"
        x: 21.691292
        y: -19.185394
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164151
        objectName: "actor164151"
        x: 121.975395
        y: -15.63694
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164153
        objectName: "actor164153"
        x: 177.77
        y: -10.094093
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164154
        objectName: "actor164154"
        x: 57.566467
        y: -23.468615
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164155
        objectName: "actor164155"
        x: 47.893505
        y: -21.332054
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164157
        objectName: "actor164157"
        x: 57.88912
        y: -24.02201
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164158
        objectName: "actor164158"
        x: 61.998283
        y: -10.248108
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164159
        objectName: "actor164159"
        x: 61.380238
        y: -20.542122
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164160
        objectName: "actor164160"
        x: 24.994743
        y: -15.260962
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164162
        objectName: "actor164162"
        x: 180.46054
        y: -5.178816
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164163
        objectName: "actor164163"
        x: 70.69305
        y: -19.122452
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164164
        objectName: "actor164164"
        x: 78.84175
        y: -15.872875
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164165
        objectName: "actor164165"
        x: 66.264366
        y: -17.095081
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164166
        objectName: "actor164166"
        x: 100.14617
        y: -21.267275
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164167
        objectName: "actor164167"
        x: 93.45724
        y: -14.763509
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164168
        objectName: "actor164168"
        x: 93.48232
        y: -12.98458
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164169
        objectName: "actor164169"
        x: 94.65249
        y: -15.738141
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164170
        objectName: "actor164170"
        x: 109.34442
        y: -25.307146
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164172
        objectName: "actor164172"
        x: 105.90525
        y: -15.326026
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164174
        objectName: "actor164174"
        x: 107.857765
        y: -21.826014
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164176
        objectName: "actor164176"
        x: 108.92443
        y: -16.045343
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164179
        objectName: "actor164179"
        x: 123.63331
        y: -12.317082
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164182
        objectName: "actor164182"
        x: 153.56158
        y: -6.866641
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164183
        objectName: "actor164183"
        x: 155.66492
        y: -10.470957
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164184
        objectName: "actor164184"
        x: 144.0938
        y: -18.071117
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164187
        objectName: "actor164187"
        x: 176.22806
        y: -26.554249
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164188
        objectName: "actor164188"
        x: 147.94186
        y: -19.756563
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164189
        objectName: "actor164189"
        x: 152.9032
        y: -25.270475
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164190
        objectName: "actor164190"
        x: 184.51656
        y: -23.794506
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164191
        objectName: "actor164191"
        x: 143.98215
        y: -9.631386
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164192
        objectName: "actor164192"
        x: 189.03569
        y: -16.961416
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164193
        objectName: "actor164193"
        x: 179.01016
        y: -18.28839
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164194
        objectName: "actor164194"
        x: 140.02574
        y: -17.97065
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164195
        objectName: "actor164195"
        x: 69.33072
        y: -13.13251
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164196
        objectName: "actor164196"
        x: 60.976555
        y: -17.074348
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164197
        objectName: "actor164197"
        x: 186.66727
        y: -26.369923
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164198
        objectName: "actor164198"
        x: 123.06558
        y: -19.036541
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor166703
        objectName: "actor166703"
        x: 189.69012
        y: -25.612017
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.40124], [0.99452, 1.40124], [0.99452, 0.862092], [-1.00319, 0.862092]]
        id: actor169904
        objectName: "actor169904"
        property alias image: graphic186
        x: 14.733392
        y: -14.993998
        ImageRenderer {
            cacheRenderParams: actor169904.body.bodyType === Body.StaticBody
            id: graphic186
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.40124], [0.99452, 1.40124], [0.99452, 0.862092], [-1.00319, 0.862092]]
        id: actor170611
        objectName: "actor170611"
        property alias image: graphic187
        rotation: 19.8
        x: 17.627474
        y: -14.443821
        ImageRenderer {
            cacheRenderParams: actor170611.body.bodyType === Body.StaticBody
            id: graphic187
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.908088, 1.26841], [0.900239, 1.26841], [0.900239, 0.780366], [-0.908088, 0.780366]]
        id: actor170613
        objectName: "actor170613"
        property alias image: graphic188
        rotation: -34.2
        x: 10.532848
        y: -13.613571
        ImageRenderer {
            cacheRenderParams: actor170613.body.bodyType === Body.StaticBody
            id: graphic188
            sizeScale: 2.8061209
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.40124], [0.99452, 1.40124], [0.99452, 0.862092], [-1.00319, 0.862092]]
        id: actor170614
        objectName: "actor170614"
        property alias image: graphic189
        rotation: -48.6
        x: 8.720615
        y: -12.081316
        ImageRenderer {
            cacheRenderParams: actor170614.body.bodyType === Body.StaticBody
            id: graphic189
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.814087, 1.13711], [0.807051, 1.13711], [0.807051, 0.699586], [-0.814087, 0.699586]]
        id: actor170615
        objectName: "actor170615"
        property alias image: graphic190
        rotation: 53.99989
        x: 19.33554
        y: -13.0490265
        ImageRenderer {
            cacheRenderParams: actor170615.body.bodyType === Body.StaticBody
            id: graphic190
            sizeScale: 2.5156436
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.704936, 0.984647], [0.698844, 0.984647], [0.698844, 0.605787], [-0.704936, 0.605787]]
        id: actor170616
        objectName: "actor170616"
        property alias image: graphic191
        rotation: 33.29978
        x: 19.991913
        y: -12.161429
        ImageRenderer {
            cacheRenderParams: actor170616.body.bodyType === Body.StaticBody
            id: graphic191
            sizeScale: 2.1783533
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.784398, 1.09564], [0.777618, 1.09564], [0.777618, 0.674072], [-0.784398, 0.674072]]
        id: actor170617
        objectName: "actor170617"
        property alias image: graphic192
        rotation: 8.099781
        x: 21.267262
        y: -11.874834
        ImageRenderer {
            cacheRenderParams: actor170617.body.bodyType === Body.StaticBody
            id: graphic192
            sizeScale: 2.4239004
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.40124], [0.99452, 1.40124], [0.99452, 0.862092], [-1.00319, 0.862092]]
        id: actor170812
        objectName: "actor170812"
        property alias image: graphic193
        rotation: -18
        x: 12.40945
        y: -14.668212
        ImageRenderer {
            cacheRenderParams: actor170812.body.bodyType === Body.StaticBody
            id: graphic193
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.4834], [0.99452, 1.4834], [0.99452, 1.04727], [-1.00319, 1.04727]]
        id: actor173043
        objectName: "actor173043"
        property alias image: graphic194
        rotation: 3.599782
        x: 79.434875
        y: -5.07971
        ImageRenderer {
            cacheRenderParams: actor173043.body.bodyType === Body.StaticBody
            id: graphic194
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.998938, 0.957639], [2.02744, 0.957639], [2.02744, -2.277], [-0.998938, -2.277]]
        id: actor173464
        objectName: "actor173464"
        property alias image: graphic195
        x: 137.82516
        y: -1.3736376
        ImageRenderer {
            cacheRenderParams: actor173464.body.bodyType === Body.StaticBody
            id: graphic195
            sizeScale: 5.9087334
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.40124], [0.99452, 1.40124], [0.99452, 0.862092], [-1.00319, 0.862092]]
        id: actor173676
        objectName: "actor173676"
        property alias image: graphic196
        x: 52.230614
        y: -16.750404
        ImageRenderer {
            cacheRenderParams: actor173676.body.bodyType === Body.StaticBody
            id: graphic196
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.644145, 0.899734], [0.638578, 0.899734], [0.638578, 0.553546], [-0.644145, 0.553546]]
        id: actor173677
        objectName: "actor173677"
        property alias image: graphic197
        rotation: 25.200218
        x: 54.27854
        y: -16.0084
        ImageRenderer {
            cacheRenderParams: actor173677.body.bodyType === Body.StaticBody
            id: graphic197
            sizeScale: 1.9904994
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.875527, 1.22293], [0.86796, 1.22293], [0.86796, 0.752385], [-0.875527, 0.752385]]
        id: actor173678
        objectName: "actor173678"
        property alias image: graphic198
        rotation: -31.50011
        x: 49.960087
        y: -15.926782
        ImageRenderer {
            cacheRenderParams: actor173678.body.bodyType === Body.StaticBody
            id: graphic198
            sizeScale: 2.7055027
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.875527, 1.22293], [0.86796, 1.22293], [0.86796, 0.752385], [-0.875527, 0.752385]]
        id: actor173679
        objectName: "actor173679"
        property alias image: graphic199
        rotation: -54.00011
        x: 48.490925
        y: -14.568919
        ImageRenderer {
            cacheRenderParams: actor173679.body.bodyType === Body.StaticBody
            id: graphic199
            sizeScale: 2.7055027
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.746851, 1.04319], [0.740396, 1.04319], [0.740396, 0.641806], [-0.746851, 0.641806]]
        id: actor173680
        objectName: "actor173680"
        property alias image: graphic200
        rotation: -84.60022
        x: 47.956688
        y: -12.713915
        ImageRenderer {
            cacheRenderParams: actor173680.body.bodyType === Body.StaticBody
            id: graphic200
            sizeScale: 2.3078747
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187596
        objectName: "actor187596"
        property alias image: graphic201
        x: 41.885696
        y: -13.477747
        ImageRenderer {
            cacheRenderParams: actor187596.body.bodyType === Body.StaticBody
            id: graphic201
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.19643], [-1.19407, 1.19643]]
        id: actor187597
        objectName: "actor187597"
        property alias image: graphic202
        rotation: 6.2998896
        x: 86.86269
        y: -9.796741
        ImageRenderer {
            cacheRenderParams: actor187597.body.bodyType === Body.StaticBody
            id: graphic202
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor187598
        objectName: "actor187598"
        property alias image: graphic203
        rotation: -7.1999993
        x: 122.786156
        y: -10.757515
        ImageRenderer {
            cacheRenderParams: actor187598.body.bodyType === Body.StaticBody
            id: graphic203
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.23894], [-1.19407, 1.23894]]
        id: actor187600
        objectName: "actor187600"
        property alias image: graphic204
        rotation: -16.20011
        x: 198.18037
        y: -19.667643
        ImageRenderer {
            cacheRenderParams: actor187600.body.bodyType === Body.StaticBody
            id: graphic204
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.23894], [-1.19407, 1.23894]]
        id: actor187601
        objectName: "actor187601"
        property alias image: graphic205
        rotation: -16.20011
        x: 195.6861
        y: -19.069016
        ImageRenderer {
            cacheRenderParams: actor187601.body.bodyType === Body.StaticBody
            id: graphic205
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.954686, 1.48697], [0.946435, 1.48697], [0.946435, 1.07728], [-0.954686, 1.07728]]
        id: actor187636
        objectName: "actor187636"
        property alias image: graphic206
        rotation: 32.39978
        x: 23.498074
        y: -11.332205
        ImageRenderer {
            cacheRenderParams: actor187636.body.bodyType === Body.StaticBody
            id: graphic206
            sizeScale: 3.2561917
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.814893, 1.26923], [0.80785, 1.26923], [0.80785, 0.919537], [-0.814893, 0.919537]]
        id: actor187637
        objectName: "actor187637"
        property alias image: graphic207
        rotation: 72.89978
        x: 25.080742
        y: -9.086323
        ImageRenderer {
            cacheRenderParams: actor187637.body.bodyType === Body.StaticBody
            id: graphic207
            sizeScale: 2.7793925
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.16501, 1.62727], [1.15494, 1.62727], [1.15494, 1.00115], [-1.16501, 1.00115]]
        id: actor187638
        objectName: "actor187638"
        property alias image: graphic208
        rotation: -64.80001
        x: 7.1415644
        y: -9.827014
        ImageRenderer {
            cacheRenderParams: actor187638.body.bodyType === Body.StaticBody
            id: graphic208
            sizeScale: 3.6000428
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187639
        objectName: "actor187639"
        property alias image: graphic209
        rotation: -5.3998904
        x: 39.387547
        y: -13.225995
        ImageRenderer {
            cacheRenderParams: actor187639.body.bodyType === Body.StaticBody
            id: graphic209
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187640
        objectName: "actor187640"
        property alias image: graphic210
        rotation: 9.900109
        x: 44.306385
        y: -13.458381
        ImageRenderer {
            cacheRenderParams: actor187640.body.bodyType === Body.StaticBody
            id: graphic210
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187641
        objectName: "actor187641"
        property alias image: graphic211
        rotation: 45.899998
        x: 47.472645
        y: -12.015651
        ImageRenderer {
            cacheRenderParams: actor187641.body.bodyType === Body.StaticBody
            id: graphic211
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187642
        objectName: "actor187642"
        property alias image: graphic212
        rotation: -22.499891
        x: 36.84098
        y: -12.344864
        ImageRenderer {
            cacheRenderParams: actor187642.body.bodyType === Body.StaticBody
            id: graphic212
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.43523], [-1.19407, 1.43523]]
        id: actor187643
        objectName: "actor187643"
        property alias image: graphic213
        rotation: -40.499893
        x: 34.391243
        y: -10.718162
        ImageRenderer {
            cacheRenderParams: actor187643.body.bodyType === Body.StaticBody
            id: graphic213
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.29657], [-1.19407, 1.29657]]
        id: actor187644
        objectName: "actor187644"
        property alias image: graphic214
        rotation: -55.799892
        x: 32.619297
        y: -8.762244
        ImageRenderer {
            cacheRenderParams: actor187644.body.bodyType === Body.StaticBody
            id: graphic214
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.5432], [0.680646, 1.5432], [0.680646, 1.22739], [-0.868046, 1.22739]]
        id: actor187645
        objectName: "actor187645"
        property alias image: graphic215
        rotation: 63
        x: 48.864925
        y: -10.05154
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187645.body.bodyType === Body.StaticBody
            id: graphic215
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.62805], [0.680646, 1.62805], [0.680646, 1.34229], [-0.868046, 1.34229]]
        id: actor187646
        objectName: "actor187646"
        property alias image: graphic216
        rotation: 32.399887
        x: 49.378746
        y: -9.463136
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187646.body.bodyType === Body.StaticBody
            id: graphic216
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.5432], [0.680646, 1.5432], [0.680646, 1.22739], [-0.868046, 1.22739]]
        id: actor187647
        objectName: "actor187647"
        property alias image: graphic217
        rotation: 69.2999
        x: 51.052795
        y: -7.838809
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187647.body.bodyType === Body.StaticBody
            id: graphic217
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.5432], [0.680646, 1.5432], [0.680646, 1.22739], [-0.868046, 1.22739]]
        id: actor187648
        objectName: "actor187648"
        property alias image: graphic218
        rotation: 87.2999
        x: 51.492023
        y: -6.2144823
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187648.body.bodyType === Body.StaticBody
            id: graphic218
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187650
        objectName: "actor187650"
        property alias image: graphic219
        rotation: -4.5001097
        x: 57.71779
        y: -9.360736
        ImageRenderer {
            cacheRenderParams: actor187650.body.bodyType === Body.StaticBody
            id: graphic219
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.5432], [0.680646, 1.5432], [0.680646, 1.22739], [-0.868046, 1.22739]]
        id: actor187652
        objectName: "actor187652"
        property alias image: graphic220
        rotation: -30.599993
        x: 55.697075
        y: -8.611752
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187652.body.bodyType === Body.StaticBody
            id: graphic220
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.60608], [0.680646, 1.60608], [0.680646, 1.22739], [-0.868046, 1.22739]]
        id: actor187653
        objectName: "actor187653"
        property alias image: graphic221
        rotation: -49.499996
        x: 54.282295
        y: -7.52119
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187653.body.bodyType === Body.StaticBody
            id: graphic221
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22739], [-1.19407, 1.22739]]
        id: actor187654
        objectName: "actor187654"
        property alias image: graphic222
        rotation: 72.89978
        x: 61.235096
        y: -7.022415
        ImageRenderer {
            cacheRenderParams: actor187654.body.bodyType === Body.StaticBody
            id: graphic222
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.60608], [0.268601, 1.60608], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor187655
        objectName: "actor187655"
        property alias image: graphic223
        rotation: -68.40011
        x: 53.254227
        y: -5.9790893
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187655.body.bodyType === Body.StaticBody
            id: graphic223
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.64457], [0.268601, 1.64457], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor187656
        objectName: "actor187656"
        property alias image: graphic224
        rotation: -36.90022
        x: 81.64084
        y: -8.584793
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187656.body.bodyType === Body.StaticBody
            id: graphic224
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.09735, 1.62263], [1.08786, 1.62263], [1.08786, 1.14556], [-1.09735, 1.14556]]
        id: actor187657
        objectName: "actor187657"
        property alias image: graphic225
        rotation: -80.100105
        x: 80.41591
        y: -6.281294
        ImageRenderer {
            cacheRenderParams: actor187657.body.bodyType === Body.StaticBody
            id: graphic225
            sizeScale: 3.3909576
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.64457], [0.268601, 1.64457], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor187658
        objectName: "actor187658"
        property alias image: graphic226
        rotation: -43.20022
        x: 80.165474
        y: -5.352681
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187658.body.bodyType === Body.StaticBody
            id: graphic226
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.00319, 1.4834], [0.99452, 1.4834], [0.99452, 1.04727], [-1.00319, 1.04727]]
        id: actor187659
        objectName: "actor187659"
        property alias image: graphic227
        rotation: 8.099782
        x: 77.38153
        y: -5.2622294
        ImageRenderer {
            cacheRenderParams: actor187659.body.bodyType === Body.StaticBody
            id: graphic227
            sizeScale: 3.1
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.19643], [-1.19407, 1.19643]]
        id: actor187660
        objectName: "actor187660"
        property alias image: graphic228
        rotation: 36.89989
        x: 90.00334
        y: -8.629938
        ImageRenderer {
            cacheRenderParams: actor187660.body.bodyType === Body.StaticBody
            id: graphic228
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.64457], [0.268601, 1.64457], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor187661
        objectName: "actor187661"
        property alias image: graphic229
        rotation: 20.699673
        x: 91.23877
        y: -7.858555
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187661.body.bodyType === Body.StaticBody
            id: graphic229
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.52587], [0.268601, 1.52587], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor187662
        objectName: "actor187662"
        property alias image: graphic230
        rotation: -58.50033
        x: 90.71109
        y: -7.6459055
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor187662.body.bodyType === Body.StaticBody
            id: graphic230
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.61336], [0.268601, 1.61336], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor188191
        objectName: "actor188191"
        property alias image: graphic231
        rotation: -27.000332
        x: 92.350746
        y: -9.09901
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188191.body.bodyType === Body.StaticBody
            id: graphic231
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.19643], [-1.19407, 1.19643]]
        id: actor188192
        objectName: "actor188192"
        property alias image: graphic232
        rotation: -3.6001098
        x: 94.85357
        y: -9.739403
        ImageRenderer {
            cacheRenderParams: actor188192.body.bodyType === Body.StaticBody
            id: graphic232
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.61336], [0.268601, 1.61336], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor188193
        objectName: "actor188193"
        property alias image: graphic233
        rotation: 45.899555
        x: 97.84257
        y: -8.910462
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188193.body.bodyType === Body.StaticBody
            id: graphic233
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.868046, 1.61336], [0.268601, 1.61336], [0.268601, 1.22739], [-0.868046, 1.22739]]
        id: actor188194
        objectName: "actor188194"
        property alias image: graphic234
        rotation: 82.79956
        x: 98.81118
        y: -7.154993
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188194.body.bodyType === Body.StaticBody
            id: graphic234
            sizeScale: 2.2508068
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor188196
        objectName: "actor188196"
        property alias image: graphic235
        rotation: -11.699998
        x: 120.507095
        y: -10.422799
        ImageRenderer {
            cacheRenderParams: actor188196.body.bodyType === Body.StaticBody
            id: graphic235
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor188197
        objectName: "actor188197"
        property alias image: graphic236
        rotation: -27.899998
        x: 118.142555
        y: -9.551651
        ImageRenderer {
            cacheRenderParams: actor188197.body.bodyType === Body.StaticBody
            id: graphic236
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.900755, 1.67416], [0.278722, 1.67416], [0.278722, 1.27364], [-0.900755, 1.27364]]
        id: actor188198
        objectName: "actor188198"
        property alias image: graphic237
        rotation: 70.19956
        x: 126.205185
        y: -9.404078
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188198.body.bodyType === Body.StaticBody
            id: graphic237
            sizeScale: 2.3356209
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor188199
        objectName: "actor188199"
        property alias image: graphic238
        rotation: -40.5
        x: 116.0712
        y: -8.182861
        ImageRenderer {
            cacheRenderParams: actor188199.body.bodyType === Body.StaticBody
            id: graphic238
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.900755, 1.67416], [0.278722, 1.67416], [0.278722, 1.27364], [-0.900755, 1.27364]]
        id: actor188200
        objectName: "actor188200"
        property alias image: graphic239
        rotation: 17.999453
        x: 133.31097
        y: -8.504463
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188200.body.bodyType === Body.StaticBody
            id: graphic239
            sizeScale: 2.3356209
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.900755, 1.67416], [0.278722, 1.67416], [0.278722, 1.27364], [-0.900755, 1.27364]]
        id: actor188201
        objectName: "actor188201"
        property alias image: graphic240
        rotation: 17.999453
        x: 132.20523
        y: -8.994974
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188201.body.bodyType === Body.StaticBody
            id: graphic240
            sizeScale: 2.3356209
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.32125, 0.957639], [2.02744, 0.957639], [2.02744, -0.093183], [-2.32125, -0.093183]]
        id: actor188202
        objectName: "actor188202"
        property alias image: graphic241
        x: 128.20999
        y: -7.5734406
        ImageRenderer {
            cacheRenderParams: actor188202.body.bodyType === Body.StaticBody
            id: graphic241
            sizeScale: 5.9087334
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188203
        objectName: "actor188203"
        property alias image: graphic242
        rotation: 56.700115
        x: 135.18208
        y: -6.736285
        ImageRenderer {
            cacheRenderParams: actor188203.body.bodyType === Body.StaticBody
            id: graphic242
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.918603, 1.70733], [0.284245, 1.70733], [0.284245, 1.29888], [-0.918603, 1.29888]]
        id: actor188204
        objectName: "actor188204"
        property alias image: graphic243
        rotation: 75.59934
        x: 136.40427
        y: -5.228748
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188204.body.bodyType === Body.StaticBody
            id: graphic243
            sizeScale: 2.3819
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.918603, 1.64204], [0.402512, 1.64204], [0.402512, 1.29888], [-0.918603, 1.29888]]
        id: actor188205
        objectName: "actor188205"
        property alias image: graphic244
        rotation: -1.8007698
        x: 141.37343
        y: -5.210634
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188205.body.bodyType === Body.StaticBody
            id: graphic244
            sizeScale: 2.3819
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.918603, 1.64204], [0.402512, 1.64204], [0.402512, 1.29888], [-0.918603, 1.29888]]
        id: actor188207
        objectName: "actor188207"
        property alias image: graphic245
        rotation: 24.29912
        x: 143.62297
        y: -4.826338
        ImageRenderer {
            aspectRatio: 1.5524998
            cacheRenderParams: actor188207.body.bodyType === Body.StaticBody
            id: graphic245
            sizeScale: 2.3819
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188208
        objectName: "actor188208"
        property alias image: graphic246
        rotation: 72.90001
        x: 145.11165
        y: -2.7826595
        ImageRenderer {
            cacheRenderParams: actor188208.body.bodyType === Body.StaticBody
            id: graphic246
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 1.01884], [-0.937691, 1.01884]]
        id: actor188210
        objectName: "actor188210"
        property alias image: graphic247
        rotation: 0.9000091
        x: 168.51637
        y: -5.3472004
        ImageRenderer {
            cacheRenderParams: actor188210.body.bodyType === Body.StaticBody
            id: graphic247
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188211
        objectName: "actor188211"
        property alias image: graphic248
        rotation: 28.7999
        x: 170.89287
        y: -4.761942
        ImageRenderer {
            cacheRenderParams: actor188211.body.bodyType === Body.StaticBody
            id: graphic248
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188212
        objectName: "actor188212"
        property alias image: graphic249
        rotation: 39.5999
        x: 172.78166
        y: -3.5825589
        ImageRenderer {
            cacheRenderParams: actor188212.body.bodyType === Body.StaticBody
            id: graphic249
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188213
        objectName: "actor188213"
        property alias image: graphic250
        rotation: 45.899902
        x: 174.26253
        y: -2.2967653
        ImageRenderer {
            cacheRenderParams: actor188213.body.bodyType === Body.StaticBody
            id: graphic250
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188214
        objectName: "actor188214"
        property alias image: graphic251
        rotation: 45.899902
        x: 175.57494
        y: -0.94003165
        ImageRenderer {
            cacheRenderParams: actor188214.body.bodyType === Body.StaticBody
            id: graphic251
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.72693, 1.33407], [0.72693, 1.02725], [-0.937691, 1.02725]]
        id: actor188215
        objectName: "actor188215"
        property alias image: graphic252
        rotation: -18.00021
        x: 166.09943
        y: -4.9107027
        ImageRenderer {
            cacheRenderParams: actor188215.body.bodyType === Body.StaticBody
            id: graphic252
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188216
        objectName: "actor188216"
        property alias image: graphic253
        rotation: -35.100094
        x: 163.99368
        y: -3.8568816
        ImageRenderer {
            cacheRenderParams: actor188216.body.bodyType === Body.StaticBody
            id: graphic253
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188217
        objectName: "actor188217"
        property alias image: graphic254
        rotation: -63.000095
        x: 162.69595
        y: -2.303987
        ImageRenderer {
            cacheRenderParams: actor188217.body.bodyType === Body.StaticBody
            id: graphic254
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.937691, 1.33407], [0.929586, 1.33407], [0.929586, 0.90079], [-0.937691, 0.90079]]
        id: actor188218
        objectName: "actor188218"
        property alias image: graphic255
        rotation: -63.000095
        x: 162.0464
        y: -0.95524836
        ImageRenderer {
            cacheRenderParams: actor188218.body.bodyType === Body.StaticBody
            id: graphic255
            sizeScale: 2.8975978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.15445, 1.64245], [1.14447, 1.64245], [1.14447, 1.25435], [-1.15445, 1.25435]]
        id: actor188219
        objectName: "actor188219"
        property alias image: graphic256
        rotation: 0.9000091
        x: 187.43393
        y: -7.0372577
        ImageRenderer {
            cacheRenderParams: actor188219.body.bodyType === Body.StaticBody
            id: graphic256
            sizeScale: 3.5406442
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.05821, 1.50554], [1.04907, 1.50554], [1.04907, 1.14979], [-1.05821, 1.14979]]
        id: actor188220
        objectName: "actor188220"
        property alias image: graphic257
        rotation: -25.199991
        x: 184.90575
        y: -6.3462214
        ImageRenderer {
            cacheRenderParams: actor188220.body.bodyType === Body.StaticBody
            id: graphic257
            sizeScale: 3.2455022
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.05821, 1.50554], [1.04907, 1.50554], [1.04907, 1.14979], [-1.05821, 1.14979]]
        id: actor188221
        objectName: "actor188221"
        property alias image: graphic258
        rotation: 40.49979
        x: 190.17279
        y: -6.1861033
        ImageRenderer {
            cacheRenderParams: actor188221.body.bodyType === Body.StaticBody
            id: graphic258
            sizeScale: 3.2455022
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.05821, 1.50554], [1.04907, 1.50554], [1.04907, 1.14979], [-1.05821, 1.14979]]
        id: actor188222
        objectName: "actor188222"
        property alias image: graphic259
        rotation: -53.09999
        x: 183.06018
        y: -4.753466
        ImageRenderer {
            cacheRenderParams: actor188222.body.bodyType === Body.StaticBody
            id: graphic259
            sizeScale: 3.2455022
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.05821, 1.50554], [1.04907, 1.50554], [1.04907, 1.14979], [-1.05821, 1.14979]]
        id: actor188223
        objectName: "actor188223"
        property alias image: graphic260
        rotation: 71.09979
        x: 191.67285
        y: -3.986584
        ImageRenderer {
            cacheRenderParams: actor188223.body.bodyType === Body.StaticBody
            id: graphic260
            sizeScale: 3.2455022
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.05821, 1.50554], [1.04907, 1.50554], [1.04907, 1.14979], [-1.05821, 1.14979]]
        id: actor188224
        objectName: "actor188224"
        property alias image: graphic261
        rotation: -70.19999
        x: 182.12476
        y: -2.9584565
        ImageRenderer {
            cacheRenderParams: actor188224.body.bodyType === Body.StaticBody
            id: graphic261
            sizeScale: 3.2455022
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.852177, 1.44797], [0.844812, 1.44797], [0.844812, 1.06814], [-0.852177, 1.06814]]
        id: actor188225
        objectName: "actor188225"
        property alias image: graphic262
        rotation: -40.50022
        x: 193.83218
        y: -17.684443
        ImageRenderer {
            aspectRatio: 1.2399999
            cacheRenderParams: actor188225.body.bodyType === Body.StaticBody
            id: graphic262
            sizeScale: 2.6333485
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.852177, 1.49704], [0.555765, 1.49704], [0.555765, 1.11721], [-0.852177, 1.11721]]
        id: actor188226
        objectName: "actor188226"
        property alias image: graphic263
        rotation: 50.39967
        x: 194.05635
        y: -22.310421
        ImageRenderer {
            aspectRatio: 1.2399999
            cacheRenderParams: actor188226.body.bodyType === Body.StaticBody
            id: graphic263
            sizeScale: 2.6333485
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.09459, 1.5573], [1.08513, 1.5573], [1.08513, 1.18932], [-1.09459, 1.18932]]
        id: actor189118
        objectName: "actor189118"
        property alias image: graphic264
        rotation: 0.9000091
        x: 177.52013
        y: -12.235771
        ImageRenderer {
            cacheRenderParams: actor189118.body.bodyType === Body.StaticBody
            id: graphic264
            sizeScale: 3.3824544
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.639469, 1.25256], [0.633942, 1.25256], [0.633942, 0.946544], [-0.639469, 0.946544]]
        id: actor189119
        objectName: "actor189119"
        property alias image: graphic265
        rotation: -40.50022
        x: 175.05153
        y: -11.3834915
        ImageRenderer {
            aspectRatio: 1.4099998
            cacheRenderParams: actor189119.body.bodyType === Body.StaticBody
            id: graphic265
            sizeScale: 1.9760507
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.639469, 1.25256], [0.633942, 1.25256], [0.633942, 0.946544], [-0.639469, 0.946544]]
        id: actor189120
        objectName: "actor189120"
        property alias image: graphic266
        rotation: -25.20033
        x: 174.26292
        y: -10.869183
        ImageRenderer {
            aspectRatio: 1.4099998
            cacheRenderParams: actor189120.body.bodyType === Body.StaticBody
            id: graphic266
            sizeScale: 1.9760507
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.639469, 1.25256], [0.633942, 1.25256], [0.633942, 0.946544], [-0.639469, 0.946544]]
        id: actor189121
        objectName: "actor189121"
        property alias image: graphic267
        rotation: -47.700333
        x: 172.9943
        y: -9.89771
        ImageRenderer {
            aspectRatio: 1.4099998
            cacheRenderParams: actor189121.body.bodyType === Body.StaticBody
            id: graphic267
            sizeScale: 1.9760507
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.22971], [-1.19407, 1.22971]]
        id: actor189122
        objectName: "actor189122"
        property alias image: graphic268
        x: 172.05122
        y: -10.220904
        ImageRenderer {
            cacheRenderParams: actor189122.body.bodyType === Body.StaticBody
            id: graphic268
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor189423
        objectName: "actor189423"
        property alias image: graphic269
        rotation: 1.799891
        x: 132.30159
        y: -16.288542
        ImageRenderer {
            cacheRenderParams: actor189423.body.bodyType === Body.StaticBody
            id: graphic269
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.19407, 1.69883], [1.18375, 1.69883], [1.18375, 1.14708], [-1.19407, 1.14708]]
        id: actor189424
        objectName: "actor189424"
        property alias image: graphic270
        rotation: -7.1999993
        x: 139.85228
        y: -16.736294
        ImageRenderer {
            cacheRenderParams: actor189424.body.bodyType === Body.StaticBody
            id: graphic270
            sizeScale: 3.6898472
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.525402, 0.773783], [0.21083, 0.773783], [0.21083, -0.232778], [-0.525402, -0.232778]]
        id: actor189465
        objectName: "actor189465"
        property alias image: graphic271
        rotation: 7.1999993
        x: 70.169624
        y: -11.50328
        ImageRenderer {
            aspectRatio: 1.1975
            cacheRenderParams: actor189465.body.bodyType === Body.StaticBody
            id: graphic271
            sizeScale: 2.97782
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.22459, 2.18578], [1.93889, 2.18578], [1.93889, 1.31302], [-1.22459, 1.31302]]
        id: actor213008
        objectName: "actor213008"
        property alias image: graphic272
        x: 29.824429
        y: -20.826437
        ImageRenderer {
            cacheRenderParams: actor213008.body.bodyType === Body.StaticBody
            id: graphic272
            sizeScale: 6.0181856
            source: Util.getPathToImage("middleground_e1/deco_e1_platform13.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.377186, 1.504], [0.900469, 1.504], [0.900469, 0.00661501], [-0.377186, 0.00661501]]
        id: actor213009
        objectName: "actor213009"
        property alias image: graphic273
        rotation: -3.3185728
        x: 161.93495
        y: -15.464913
        ImageRenderer {
            cacheRenderParams: actor213009.body.bodyType === Body.StaticBody
            id: graphic273
            sizeScale: 4.1410294
            source: Util.getPathToImage("middleground_e1/deco_e1_platform14.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.748275, 1.3356], [1.18474, 1.3356], [1.18474, 0.80231], [-0.748275, 0.80231]]
        id: actor213010
        objectName: "actor213010"
        property alias image: graphic274
        rotation: 4.9466395
        x: 21.607607
        y: -19.379133
        ImageRenderer {
            cacheRenderParams: actor213010.body.bodyType === Body.StaticBody
            id: graphic274
            sizeScale: 3.6773655
            source: Util.getPathToImage("middleground_e1/deco_e1_platform15.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.10632, 1.10366], [0.162145, 1.10366], [0.162145, 0.00292525], [-1.10632, 0.00292525]]
        id: actor213013
        objectName: "actor213013"
        property alias image: graphic275
        x: 129.11037
        y: -39.52904
        ImageRenderer {
            cacheRenderParams: actor213013.body.bodyType === Body.StaticBody
            id: graphic275
            sizeScale: 3.6079383
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.340984, 0.619511], [0.41848, 0.619511], [0.41848, 0.259408], [-0.340984, 0.259408]]
        id: actor213051
        objectName: "actor213051"
        property alias image: graphic276
        x: 177.74411
        y: -6.078289
        ImageRenderer {
            cacheRenderParams: actor213051.body.bodyType === Body.StaticBody
            id: graphic276
            sizeScale: 1.5348523
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.09459, 1.5573], [1.08513, 1.5573], [1.08513, 1.18932], [-1.09459, 1.18932]]
        id: actor214308
        objectName: "actor214308"
        property alias image: graphic277
        rotation: -3.7266695
        x: 180.88156
        y: -10.297244
        ImageRenderer {
            cacheRenderParams: actor214308.body.bodyType === Body.StaticBody
            id: graphic277
            sizeScale: 3.3824544
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.09459, 1.5573], [1.08513, 1.5573], [1.08513, 1.18932], [-1.09459, 1.18932]]
        id: actor214309
        objectName: "actor214309"
        property alias image: graphic278
        rotation: 30.60001
        x: 183.59175
        y: -9.762863
        ImageRenderer {
            aspectRatio: 1.3949999
            cacheRenderParams: actor214309.body.bodyType === Body.StaticBody
            id: graphic278
            sizeScale: 2.431139
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.09459, 1.5573], [1.08513, 1.5573], [1.08513, 1.18932], [-1.09459, 1.18932]]
        id: actor214311
        objectName: "actor214311"
        property alias image: graphic279
        rotation: 30.60001
        x: 179.63623
        y: -11.843178
        ImageRenderer {
            aspectRatio: 1.3949999
            cacheRenderParams: actor214311.body.bodyType === Body.StaticBody
            id: graphic279
            sizeScale: 2.431139
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.554713, 0.990112], [0.878277, 0.990112], [0.878277, 0.59477], [-0.554713, 0.59477]]
        id: actor227713
        objectName: "actor227713"
        property alias image: graphic280
        x: 70.733055
        y: -19.118269
        ImageRenderer {
            cacheRenderParams: actor227713.body.bodyType === Body.StaticBody
            id: graphic280
            sizeScale: 2.7261126
            source: Util.getPathToImage("middleground_e1/deco_e1_platform15.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.37047, -0.798627], [0.456701, 0.0508381], [0.635432, 0.281069], [0.775862, 0.289881], [0.859522, 0.140772], [2.07721, 0.133455], [2.36268, 0.37469], [2.65818, 0.174797], [3.58875, 0.0821882], [4.31482, 0.285559], [4.94873, -0.0395718], [5.41094, -0.8536], [5.74061, -1.07083], [5.99534, -1.48885], [5.79992, -1.7715], [5.23197, -1.76305], [5.02676, -1.6108], [4.71675, -1.46165], [4.26007, -1.33029], [3.83134, -1.25003], [3.10161, -1.19937], [1.64498, -1.19185], [0.911518, -1.19877], [0.457114, -1.23796], [-0.0631423, -1.29565], [-0.488335, -1.36808], [-0.919353, -1.44256], [-1.28721, -1.44487], [-1.56475, -1.29267]]
        id: actor228178
        objectName: "actor228178"
        visible: false
        x: 76.434204
        y: -14.049155
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.10717, 2.7808], [1.16271, 2.7808], [1.16271, 2.24769], [-3.10717, 2.24769]]
        id: actor228179
        objectName: "actor228179"
        property alias image: graphic282
        x: 78.6314
        y: -17.487263
        ImageRenderer {
            cacheRenderParams: actor228179.body.bodyType === Body.StaticBody
            id: graphic282
            sizeScale: 7.651302
            source: Util.getPathToImage("middleground_e1/deco_e1_platform08.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.12391, 0.123895], [-0.897173, 0.195974], [-0.486863, 0.264036], [0.14099, 0.283288], [1.64073, 0.27719], [2.21729, 0.318349], [2.52918, 0.278515], [2.8778, 0.125636], [3.01887, -0.0666736], [3.02215, -0.27169], [2.86457, -0.302436], [2.6804, -0.276047], [2.50415, -0.203211], [2.35117, -0.163771], [2.12935, -0.167603], [1.85602, -0.142282], [-0.175904, -0.17046], [-0.446434, -0.208009], [-0.674851, -0.260123], [-0.871095, -0.310738], [-1.05982, -0.387111], [-1.22596, -0.386487], [-1.31483, -0.277818], [-1.26046, -0.0245129]]
        id: actor235672
        objectName: "actor235672"
        visible: false
        x: 151.34735
        y: -17.542576
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor235673
        objectName: "actor235673"
        property alias image: graphic284
        rotation: 2.6999998
        x: 152.21964
        y: -19.008701
        ImageRenderer {
            cacheRenderParams: actor235673.body.bodyType === Body.StaticBody
            id: graphic284
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.32500002
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor236428
        objectName: "actor236428"
        rotation: -180
        visible: false
        x: 161.25201
        y: -4.873832
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.33
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor236429
        objectName: "actor236429"
        rotation: -180
        visible: false
        x: 153.49684
        y: -4.751449
    }
    Polygon {
        body.bodyType: Body.DynamicBody
        body.density: 2
        body.vertices: [[-0.896736, 0.974956], [-0.571203, 1.14417], [-0.118448, 1.17599], [0.414588, 1.17472], [0.845595, 0.968507], [1.13492, 0.649686], [1.14988, 0.0692382], [0.969815, -0.436202], [0.686996, -0.770125], [0.360045, -0.904964], [0.0214277, -0.982469], [-0.285251, -0.916759], [-0.55164, -0.80003], [-0.981475, -0.400867], [-1.09338, -0.00519749], [-1.17519, 0.429197], [-1.10308, 0.690609]]
        id: actor236430
        objectName: "actor236430"
        property alias image: graphic287
        rotation: -1.2642754
        x: 93.61103
        y: -11.204194
        ImageRenderer {
            cacheRenderParams: actor236430.body.bodyType === Body.StaticBody
            id: graphic287
            sizeScale: 2.434936
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder01.png")
        }
    }
    WaterBody {
        body.vertices: [[3.11584, -0.392532], [2.39945, -0.0896062], [1.09191, 0.0622067], [0.024646, 0.100328], [-0.746567, 0.068234], [-1.23948, 0.0475218], [-2.31518, -0.143194], [-2.82061, -0.372123]]
        emitterLogic.layer: particleLayer1
        id: actor236811
        objectName: "actor236811"
        x: 106.726105
        y: -9.85378
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 0
        emitterLogic.spawnSpread: 0.43
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOn: 3
        id: actor240239
        objectName: "actor240239"
        rotation: -180
        visible: false
        x: 93.528786
        y: -9.825495
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[2.38325, -0.0902288], [2.35823, -0.319473], [2.20171, -0.41849], [1.93876, -0.31093], [1.62988, -0.24219], [1.30811, -0.213543], [0.913275, -0.204424], [0.545744, -0.251583], [0.238634, -0.297698], [-0.0900584, -0.317975], [-0.244251, -0.253603], [-0.310236, -0.0267421], [0.056483, 0.322191], [0.56856, 0.361864], [1.35975, 0.721137], [1.82966, 0.336882], [2.26019, 0.143176]]
        id: actor241398
        objectName: "actor241398"
        x: 158.95251
        y: -22.1771
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.554713, 0.990112], [0.878277, 0.990112], [0.878277, 0.59477], [-0.554713, 0.59477]]
        id: actor241399
        objectName: "actor241399"
        property alias image: graphic291
        x: 159.98363
        y: -22.839378
        ImageRenderer {
            cacheRenderParams: actor241399.body.bodyType === Body.StaticBody
            id: graphic291
            sizeScale: 2.7261126
            source: Util.getPathToImage("middleground_e1/deco_e1_platform15.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.628781, 0.620717], [0.350747, 0.620717], [0.350747, -1.67343], [-0.628781, -1.67343]]
        id: actor315162
        objectName: "actor315162"
        property alias image: graphic292
        x: -0.23771131
        y: -16.362036
        ImageRenderer {
            cacheRenderParams: actor315162.body.bodyType === Body.StaticBody
            id: graphic292
            sizeScale: 2.3887608
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.503326, 0.49687], [0.280765, 0.49687], [0.280765, -1.33954], [-0.503326, -1.33954]]
        id: actor315163
        objectName: "actor315163"
        property alias image: graphic293
        rotation: -18.963808
        x: 0.5200989
        y: -19.657032
        ImageRenderer {
            cacheRenderParams: actor315163.body.bodyType === Body.StaticBody
            id: graphic293
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.628781, 2.12224], [0.350747, 2.12224], [0.350747, -0.111835], [-0.628781, -0.111835]]
        id: actor316340
        objectName: "actor316340"
        property alias image: graphic294
        rotation: -165.2872
        x: 199.95258
        y: -25.427132
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor316340.body.bodyType === Body.StaticBody
            id: graphic294
            sizeScale: 2.3887608
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.503326, 1.54193], [0.280765, 1.54193], [0.280765, -0.294478], [-0.503326, -0.294478]]
        id: actor316341
        objectName: "actor316341"
        property alias image: graphic295
        rotation: -148.93591
        x: 199.99179
        y: -28.77632
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor316341.body.bodyType === Body.StaticBody
            id: graphic295
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.bodyType: Body.DynamicBody
        body.density: 5
        body.vertices: [[-0.467636, 0.266747], [-0.404675, 0.323691], [-0.0348723, 0.433083], [0.108383, 0.447048], [0.368729, 0.363867], [0.453389, 0.250687], [0.44826, 0.155068], [0.330154, 0.0664482], [-0.000467509, 0.0892044], [-0.336692, 0.164793], [-0.458649, 0.206136]]
        id: actor326828
        objectName: "actor326828"
        property alias image: graphic296
        rotation: -5.0787277
        x: 127.55546
        y: -13.136957
        ImageRenderer {
            cacheRenderParams: actor326828.body.bodyType === Body.StaticBody
            id: graphic296
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder02.png")
        }
    }
    Polygon {
        body.active: false
        body.bodyType: Body.DynamicBody
        body.density: 5
        body.restitution: 0.7
        body.vertices: [[-0.207489, 0.150337], [0.0102174, 0.287203], [0.120797, 0.280673], [0.207453, 0.240708], [0.252087, 0.164466], [0.278334, 0.0813121], [0.262219, 0.01463], [0.27687, -0.184179], [0.284577, -0.304267], [0.249394, -0.341496], [0.0902116, -0.364733], [0.00644307, -0.408254], [-0.0986558, -0.384708], [-0.276492, -0.237666], [-0.274243, -0.0101982]]
        id: actor326830
        objectName: "actor326830"
        property alias image: graphic297
        rotation: -89.34299
        x: 127.650505
        y: -12.416117
        ImageRenderer {
            cacheRenderParams: actor326830.body.bodyType === Body.StaticBody
            id: graphic297
            sizeScale: 0.6125923
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
        }
    }
    Polygon {
        body.active: false
        body.bodyType: Body.DynamicBody
        body.density: 5
        body.vertices: [[0.207489, 0.150337], [-0.0102174, 0.287203], [-0.120797, 0.280673], [-0.207453, 0.240708], [-0.252087, 0.164466], [-0.278334, 0.0813121], [-0.262219, 0.01463], [-0.27687, -0.184179], [-0.284577, -0.304267], [-0.249394, -0.341496], [-0.0902116, -0.364733], [-0.00644307, -0.408254], [0.0986558, -0.384708], [0.276492, -0.237666], [0.274243, -0.0101982]]
        id: actor326831
        objectName: "actor326831"
        property alias image: graphic298
        rotation: 130.43193
        x: 127.66995
        y: -13.44502
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor326831.body.bodyType === Body.StaticBody
            id: graphic298
            sizeScale: -0.6125923
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
        }
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 0
        emitterLogic.spawnSpread: 0.43
        emitterLogic.spawnVelocity: 4.5
        emitterLogic.timeOn: 3
        emitterLogic.transitionOnTime: 0
        id: actor348174
        objectName: "actor348174"
        rotation: -276.9729
        visible: false
        x: 133.5493
        y: -13.356467
    }
    Asteroid {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.magnetic: true
        body.magneticStrength: 1.8
        body.restitution: 0.1
        body.vertices: [[0.566376, -1.843], [0.888777, -1.68698], [1.09677, -1.49418], [1.35336, -1.3041], [1.56536, -1.11249], [1.79715, -0.758511], [1.86908, -0.573718], [1.91964, -0.351039], [1.93557, -0.0522838], [1.92339, 0.240299], [1.7803, 0.704852], [1.56829, 0.912654], [1.35443, 1.11046], [1.10361, 1.4183], [1.03092, 1.46236], [0.906463, 1.49525], [0.771176, 1.5506], [0.68802, 1.66081], [0.600116, 1.71561], [0.406334, 1.75227], [0.0873355, 1.86805], [-0.247905, 1.88954], [-0.609777, 1.84462], [-0.927565, 1.73945], [-1.28848, 1.5236], [-1.54322, 1.28717], [-1.71898, 1.02135], [-1.8669, 0.714941], [-1.93715, 0.305397], [-1.9495, -0.0423859], [-1.88886, -0.528291], [-1.80851, -0.820379], [-1.74085, -1.03511], [-1.61913, -1.19612], [-1.4043, -1.28345], [-1.22212, -1.40082], [-1.08899, -1.52051], [-0.96021, -1.71241], [-0.851836, -1.78967], [-0.504313, -1.90178], [-0.276098, -1.92543], [-0.00915563, -1.94306], [0.267087, -1.9282]]
        id: actor378227
        objectName: "actor378227"
        property alias image: graphic300
        rotation: -3078.4585
        x: 63.710197
        y: -18.341469
        ImageRenderer {
            cacheRenderParams: actor378227.body.bodyType === Body.StaticBody
            id: graphic300
            sizeScale: 4.408209
            source: Util.getPathToImage("middleground_e1/e1_asteroid.png")
        }
    }
    AsteroidSmall {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor378228
        objectName: "actor378228"
        property alias image: graphic301
        rotation: -30
        x: 107.269966
        y: -24.138262
        ImageRenderer {
            cacheRenderParams: actor378228.body.bodyType === Body.StaticBody
            id: graphic301
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.503326, 0.49687], [0.280765, 0.49687], [0.280765, -1.33954], [-0.503326, -1.33954]]
        id: actor415419
        objectName: "actor415419"
        property alias image: graphic302
        rotation: -48.588566
        x: -0.228143
        y: -22.873201
        ImageRenderer {
            cacheRenderParams: actor415419.body.bodyType === Body.StaticBody
            id: graphic302
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.503326, 1.54193], [0.280765, 1.54193], [0.280765, -0.294478], [-0.503326, -0.294478]]
        id: actor415420
        objectName: "actor415420"
        property alias image: graphic303
        rotation: -148.93591
        x: 200.99445
        y: -31.88145
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor415420.body.bodyType === Body.StaticBody
            id: graphic303
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420462
        objectName: "actor420462"
        x: 58.223606
        y: -23.462046
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420463
        objectName: "actor420463"
        x: 44.043568
        y: -20.09476
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420464
        objectName: "actor420464"
        x: 45.8139
        y: -20.925735
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420465
        objectName: "actor420465"
        x: 63.938923
        y: -15.509327
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420466
        objectName: "actor420466"
        x: 99.84724
        y: -20.686985
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420467
        objectName: "actor420467"
        x: 82.54349
        y: -16.8154
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420468
        objectName: "actor420468"
        x: 84.054115
        y: -17.146305
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420469
        objectName: "actor420469"
        x: 85.577446
        y: -16.654556
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420470
        objectName: "actor420470"
        x: 116.08786
        y: -10.938083
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420471
        objectName: "actor420471"
        x: 112.55735
        y: -16.043955
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420472
        objectName: "actor420472"
        x: 176.43948
        y: -5.345595
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420473
        objectName: "actor420473"
        x: 178.15338
        y: -25.891975
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420474
        objectName: "actor420474"
        x: 129.56471
        y: -12.208186
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor420475
        objectName: "actor420475"
        x: 129.70485
        y: -12.828613
    }
    Accelerator {
        acceleration: 0.5
        body.vertices: [[-1.40588, 0.118828], [-0.803932, -0.644729], [0.0889223, -1.46805], [0.734784, -1.83762], [1.68819, -2.1174], [3.22955, -2.25205], [2.30535, -2.34297], [1.43175, -2.32104], [0.602287, -2.13618], [-0.0788231, -1.77272], [-0.910118, -0.938357], [-1.28474, -0.352351]]
        id: actor421998
        objectName: "actor421998"
        x: 50.44376
        y: -13.043366
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[1.00578, -1.30257], [1.12447, -2.19903], [0.88335, -1.39079], [0.630392, -0.95444], [-0.112106, -0.596438], [0.358528, -0.683694], [0.770531, -0.912231]]
        id: actor421999
        objectName: "actor421999"
        x: 68.58585
        y: -10.158666
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[1.03801, -1.16251], [1.28799, -1.63843], [1.38105, -2.1632], [1.00659, -1.35331], [0.435539, -0.778244], [0.770531, -0.912231]]
        id: actor422000
        objectName: "actor422000"
        x: 63.92964
        y: -8.484751
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[1.53345, -0.98934], [1.43457, -1.68121], [1.07901, -2.2277], [0.50827, -2.60989], [-0.24353, -2.86323], [-1.077, -2.94339], [-1.90753, -2.9013], [-0.628497, -2.69811], [0.327035, -2.35792], [0.996693, -1.84173]]
        id: actor422001
        objectName: "actor422001"
        x: 182.49594
        y: -5.918513
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[-0.968788, 1.21449], [-0.449837, 1.03574], [0.0089798, 0.745524], [0.30513, 0.246809], [0.458244, -0.310718], [-0.17807, 0.602763]]
        id: actor422834
        objectName: "actor422834"
        x: 123.63899
        y: -11.515861
    }
    AsteroidSmall {
        body.angularVelocity: 0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor504829
        objectName: "actor504829"
        property alias image: graphic323
        rotation: 15
        x: 121.58093
        y: -17.578642
        ImageRenderer {
            cacheRenderParams: actor504829.body.bodyType === Body.StaticBody
            id: graphic323
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    AsteroidSmall {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor505274
        objectName: "actor505274"
        property alias image: graphic324
        rotation: -30
        x: 140.95172
        y: -10.912467
        ImageRenderer {
            cacheRenderParams: actor505274.body.bodyType === Body.StaticBody
            id: graphic324
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    AsteroidSmall {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor505275
        objectName: "actor505275"
        property alias image: graphic325
        rotation: -30
        x: 152.88124
        y: -23.185635
        ImageRenderer {
            cacheRenderParams: actor505275.body.bodyType === Body.StaticBody
            id: graphic325
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    AsteroidSmall {
        body.angularVelocity: 0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor505276
        objectName: "actor505276"
        property alias image: graphic326
        rotation: 15
        x: 162.7509
        y: -26.768433
        ImageRenderer {
            cacheRenderParams: actor505276.body.bodyType === Body.StaticBody
            id: graphic326
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    Asteroid {
        body.angularVelocity: 0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.magnetic: true
        body.magneticStrength: 1.8
        body.restitution: 0.1
        body.vertices: [[0.566376, -1.843], [0.888777, -1.68698], [1.09677, -1.49418], [1.35336, -1.3041], [1.56536, -1.11249], [1.79715, -0.758511], [1.86908, -0.573718], [1.91964, -0.351039], [1.93557, -0.0522838], [1.92339, 0.240299], [1.7803, 0.704852], [1.56829, 0.912654], [1.35443, 1.11046], [1.10361, 1.4183], [1.03092, 1.46236], [0.906463, 1.49525], [0.771176, 1.5506], [0.68802, 1.66081], [0.600116, 1.71561], [0.406334, 1.75227], [0.0873355, 1.86805], [-0.247905, 1.88954], [-0.609777, 1.84462], [-0.927565, 1.73945], [-1.28848, 1.5236], [-1.54322, 1.28717], [-1.71898, 1.02135], [-1.8669, 0.714941], [-1.93715, 0.305397], [-1.9495, -0.0423859], [-1.88886, -0.528291], [-1.80851, -0.820379], [-1.74085, -1.03511], [-1.61913, -1.19612], [-1.4043, -1.28345], [-1.22212, -1.40082], [-1.08899, -1.52051], [-0.96021, -1.71241], [-0.851836, -1.78967], [-0.504313, -1.90178], [-0.276098, -1.92543], [-0.00915563, -1.94306], [0.267087, -1.9282]]
        id: actor505277
        objectName: "actor505277"
        property alias image: graphic327
        rotation: -3078.4585
        x: 187.33334
        y: -23.81472
        ImageRenderer {
            cacheRenderParams: actor505277.body.bodyType === Body.StaticBody
            id: graphic327
            sizeScale: 4.408209
            source: Util.getPathToImage("middleground_e1/e1_asteroid.png")
        }
    }
    AsteroidSmall {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 6
        body.magnetic: true
        body.magneticStrength: 1.5
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor505279
        objectName: "actor505279"
        property alias image: graphic328
        rotation: -30
        x: 156.97076
        y: -12.790766
        ImageRenderer {
            cacheRenderParams: actor505279.body.bodyType === Body.StaticBody
            id: graphic328
            sizeScale: 2.928
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[3.04608, 2.56425], [3.26021, 2.57367], [3.25897, 2.01697], [2.48267, 2.13515]]
        id: actor505395
        objectName: "actor505395"
        property alias bodyRenderer: graphic329
        x: 124.87146
        y: -16.054447
        TerrainMeshRenderer {
            id: graphic329
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic329baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "3SBFQBwYHsCRFyVAczsKwJBoTEDr8QXAkGhMQOvxBcAtOUxAlRggwN0gRUAcGB7A"
            }
            PolygonVertexAttributeArray {
                id: graphic329baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "9e5xPmyenz/irD4+faWbP+CUfT78yZo/4JR9PvzJmj8PSX0+6wSgP/XucT5snp8/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic329baseMesha_position, graphic329baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic329edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "kRclQHM7CsCQsBhACREHwCPFQEAcISrAkRclQHM7CsAjxUBAHCEqwN0gRUAcGB7A3SBFQBwYHsAjxUBAHCEqwFQVVUCDVSnA3SBFQBwYHsBUFVVAg1UpwC05TECVGCDALTlMQJUYIMBUFVVAg1UpwGS9VECDdPi/LTlMQJUYIMBkvVRAg3T4v5BoTEDr8QXAkGhMQOvxBcBkvVRAg3T4v5CwGEAJEQfAkGhMQOvxBcCQsBhACREHwJEXJUBzOwrA"
            }
            PolygonVertexAttributeArray {
                id: graphic329edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "4qw+Pn2lmz/g1Co+aAObP8v1aj6fBqI/4qw+Pn2lmz/L9Wo+nwaiP/XucT5snp8/9e5xPmyenz/L9Wo+nwaiPw27hT7n3aE/9e5xPmyenz8Nu4U+592hPw9JfT7rBKA/D0l9PusEoD8Nu4U+592hP7N0hT502Jg/D0l9PusEoD+zdIU+dNiYP+CUfT78yZo/4JR9PvzJmj+zdIU+dNiYP+DUKj5oA5s/4JR9PvzJmj/g1Co+aAObP+KsPj59pZs/"
            }
            PolygonVertexAttributeArray {
                id: graphic329edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAACJNNT4AAAAAAAAAAAAAgD8iTTU+AAAAACJNNT4AAIA/Ik01PgAAgD8iTTU+AAAAALkrbD4AAAAAIk01PgAAgD+5K2w+AAAAALkrbD4AAIA/uStsPgAAgD+5K2w+AAAAANRXvT4AAAAAuStsPgAAgD/UV70+AAAAANRXvT4AAIA/1Fe9PgAAgD/UV70+AAAAAFntED8AAAAA1Fe9PgAAgD9Z7RA/AAAAAFntED8AAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic329edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAP9r5Bz8AAIA/AAAAAAAAgD/a+Qc/AACAP9r5Bz8AAIA/2vkHPwAAgD/a+Qc/AACAP8wgMT8AAIA/2vkHPwAAgD/MIDE/AACAP8wgMT8AAIA/zCAxPwAAgD/MIDE/AACAP+ABjj8AAIA/zCAxPwAAgD/gAY4/AACAP+ABjj8AAIA/4AGOPwAAgD/gAY4/AACAPwZk2T8AAIA/4AGOPwAAgD8GZNk/AACAPwZk2T8AAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic329edgeMesha_position, graphic329edgeMesha_texCoord, graphic329edgeMesha_maskTexCoord, graphic329edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic329bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic329bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic329bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic329bevelMesha_position, graphic329bevelMesha_texCoord, graphic329bevelMesha_blendTexCoord]
            }
        }
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor0
        objectName: "actor0"
        rollingMovementLogic.speed: 45
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 2.2276397
        y: -15.205151
        z: 1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.257939, 0.587513], [0.396865, 0.587513], [0.396865, 0.222403], [-0.257939, 0.222403]]
        id: actor240624
        objectName: "actor240624"
        property alias image: graphic331
        x: 34.357777
        y: -14.397678
        z: 1
        ImageRenderer {
            cacheRenderParams: actor240624.body.bodyType === Body.StaticBody
            id: graphic331
            sizeScale: 1.4555777
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[0.423049, 0.768608], [-0.519195, 0.768608], [-0.519195, 0.414796], [0.423049, 0.414796]]
        id: actor370913
        objectName: "actor370913"
        property alias image: graphic332
        rotation: -108.57588
        x: 133.32018
        y: -13.397313
        z: 1
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor370913.body.bodyType === Body.StaticBody
            id: graphic332
            sizeScale: -1.9042438
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.423049, 0.768608], [0.519195, 0.768608], [0.519195, 0.414796], [-0.423049, 0.414796]]
        id: actor189460
        objectName: "actor189460"
        property alias image: graphic333
        x: 61.964085
        y: -9.72424
        z: 2
        ImageRenderer {
            cacheRenderParams: actor189460.body.bodyType === Body.StaticBody
            id: graphic333
            sizeScale: 1.9042438
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.908398, 1.86464], [1.09531, 1.86464], [1.09531, 0.728792], [-0.908398, 0.728792]]
        id: actor213011
        objectName: "actor213011"
        property alias image: graphic334
        x: 49.65825
        y: -22.084011
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213011.body.bodyType === Body.StaticBody
            id: graphic334
            sizeScale: 5.1339803
            source: Util.getPathToImage("middleground_e1/deco_e1_platform16.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[0.423049, 0.672319], [-0.437972, 0.672319], [-0.437972, 0.277241], [0.423049, 0.277241]]
        id: actor235669
        objectName: "actor235669"
        property alias image: graphic335
        x: 153.48813
        y: -5.102213
        z: 2
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor235669.body.bodyType === Body.StaticBody
            id: graphic335
            sizeScale: -1.9042438
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.423049, 0.768608], [0.519195, 0.768608], [0.519195, 0.414796], [-0.423049, 0.414796]]
        id: actor235671
        objectName: "actor235671"
        property alias image: graphic336
        rotation: 6.3736567
        x: 161.24153
        y: -5.163299
        z: 2
        ImageRenderer {
            cacheRenderParams: actor235671.body.bodyType === Body.StaticBody
            id: graphic336
            sizeScale: 1.9042438
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.423049, 0.768608], [0.519195, 0.768608], [0.519195, 0.414796], [-0.423049, 0.414796]]
        id: actor240240
        objectName: "actor240240"
        property alias image: graphic337
        x: 93.54284
        y: -10.1009865
        z: 2
        ImageRenderer {
            cacheRenderParams: actor240240.body.bodyType === Body.StaticBody
            id: graphic337
            sizeScale: 1.9042438
            source: Util.getPathToImage("middleground_e1/deco_e1s3_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.186725, 0.175974], [0.144935, 0.175974], [0.144935, -0.0897705], [-0.186725, -0.0897705]]
        id: actor187579
        objectName: "actor187579"
        property alias image: graphic338
        x: 39.560444
        y: -13.64337
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187579.body.bodyType === Body.StaticBody
            id: graphic338
            sizeScale: 0.67721725
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.250191, 0.173975], [0.307052, 0.173975], [0.307052, -0.285943], [-0.250191, -0.285943]]
        id: actor38419
        objectName: "actor38419"
        property alias image: graphic339
        x: 178.89636
        y: -24.721453
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38419.body.bodyType === Body.StaticBody
            id: graphic339
            sizeScale: 1.1261717
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04.png")
        }
    }
    Portal {
        activationThreshold: 44
        id: actor139091
        objectName: "actor139091"
        x: 198.43442
        y: -27.596003
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.804135], [0.521351, 0.804135], [0.521351, 0.323152], [-0.424806, 0.323152]]
        id: actor168452
        objectName: "actor168452"
        property alias image: graphic341
        x: 16.547464
        y: -16.344692
        z: 2
        ImageRenderer {
            cacheRenderParams: actor168452.body.bodyType === Body.StaticBody
            id: graphic341
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.415363, 0.599389], [0.509762, 0.599389], [0.509762, 0.193785], [-0.415363, 0.193785]]
        id: actor171605
        objectName: "actor171605"
        property alias image: graphic342
        x: 1.9731412
        y: -15.088238
        z: 2
        ImageRenderer {
            cacheRenderParams: actor171605.body.bodyType === Body.StaticBody
            id: graphic342
            sizeScale: 1.8696495
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.49687], [0.663165, 0.49687], [0.663165, -0.149474], [-0.527226, -0.149474]]
        id: actor171805
        objectName: "actor171805"
        property alias image: graphic343
        x: -0.04332757
        y: -15.661759
        z: 2
        ImageRenderer {
            cacheRenderParams: actor171805.body.bodyType === Body.StaticBody
            id: graphic343
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.49687], [0.663165, 0.49687], [0.663165, -0.598641], [-0.527226, -0.598641]]
        id: actor171808
        objectName: "actor171808"
        property alias image: graphic344
        x: -1.0734625
        y: -16.189947
        z: 2
        ImageRenderer {
            cacheRenderParams: actor171808.body.bodyType === Body.StaticBody
            id: graphic344
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_bush01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor172219
        objectName: "actor172219"
        property alias image: graphic345
        rotation: -10.799999
        x: 3.0939777
        y: -15.071837
        z: 2
        ImageRenderer {
            cacheRenderParams: actor172219.body.bodyType === Body.StaticBody
            id: graphic345
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor172425
        objectName: "actor172425"
        property alias image: graphic346
        rotation: 9.109695
        x: 5.7865024
        y: -15.385562
        z: 2
        ImageRenderer {
            cacheRenderParams: actor172425.body.bodyType === Body.StaticBody
            id: graphic346
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.522666], [0.444512, 0.522666], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor187577
        objectName: "actor187577"
        property alias image: graphic347
        x: 28.747295
        y: -13.556043
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187577.body.bodyType === Body.StaticBody
            id: graphic347
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.49687], [0.663165, 0.49687], [0.663165, -0.149474], [-0.527226, -0.149474]]
        id: actor187578
        objectName: "actor187578"
        property alias image: graphic348
        rotation: -18
        x: 24.869818
        y: -13.768062
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187578.body.bodyType === Body.StaticBody
            id: graphic348
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor187580
        objectName: "actor187580"
        property alias image: graphic349
        rotation: -10.799999
        x: 32.27542
        y: -13.730488
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187580.body.bodyType === Body.StaticBody
            id: graphic349
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor187581
        objectName: "actor187581"
        property alias image: graphic350
        x: 36.863937
        y: -13.746374
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187581.body.bodyType === Body.StaticBody
            id: graphic350
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.186725, 0.122792], [0.144935, 0.122792], [0.144935, -0.0897705], [-0.186725, -0.0897705]]
        id: actor187582
        objectName: "actor187582"
        property alias image: graphic351
        x: 68.785515
        y: -10.729136
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187582.body.bodyType === Body.StaticBody
            id: graphic351
            sizeScale: 0.67721725
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0138434], [-0.137895, 0.0138434]]
        id: actor187583
        objectName: "actor187583"
        property alias image: graphic352
        x: 58.51759
        y: -9.579839
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187583.body.bodyType === Body.StaticBody
            id: graphic352
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.24779], [0.169234, 0.24779], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor187584
        objectName: "actor187584"
        property alias image: graphic353
        rotation: -10.799999
        x: 64.33537
        y: -9.371427
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187584.body.bodyType === Body.StaticBody
            id: graphic353
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.49687], [0.663165, 0.49687], [0.663165, -0.149474], [-0.527226, -0.149474]]
        id: actor187585
        objectName: "actor187585"
        property alias image: graphic354
        x: 70.520134
        y: -10.625627
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187585.body.bodyType === Body.StaticBody
            id: graphic354
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.522666], [0.444512, 0.522666], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor187586
        objectName: "actor187586"
        property alias image: graphic355
        x: 67.60252
        y: -10.896491
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187586.body.bodyType === Body.StaticBody
            id: graphic355
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.522666], [0.444512, 0.522666], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor187588
        objectName: "actor187588"
        property alias image: graphic356
        x: 107.167175
        y: -10.020272
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187588.body.bodyType === Body.StaticBody
            id: graphic356
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.186725, 0.175974], [0.144935, 0.175974], [0.144935, -0.0897705], [-0.186725, -0.0897705]]
        id: actor187589
        objectName: "actor187589"
        property alias image: graphic357
        x: 101.8522
        y: -10.79258
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187589.body.bodyType === Body.StaticBody
            id: graphic357
            sizeScale: 0.67721725
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, -0.000558048], [-0.137895, -0.000558048]]
        id: actor187590
        objectName: "actor187590"
        property alias image: graphic358
        x: 90.01797
        y: -9.696384
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187590.body.bodyType === Body.StaticBody
            id: graphic358
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.223479], [0.169234, 0.223479], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor187591
        objectName: "actor187591"
        property alias image: graphic359
        rotation: 25.2
        x: 100.474
        y: -11.721033
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187591.body.bodyType === Body.StaticBody
            id: graphic359
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.726117], [0.663165, 0.726117], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor187592
        objectName: "actor187592"
        property alias image: graphic360
        x: 78.901566
        y: -10.116664
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187592.body.bodyType === Body.StaticBody
            id: graphic360
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.726117], [0.663165, 0.726117], [0.663165, 0.226996], [-0.527226, 0.226996]]
        id: actor187593
        objectName: "actor187593"
        property alias image: graphic361
        rotation: 12.408019
        x: 102.62645
        y: -10.935637
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187593.body.bodyType === Body.StaticBody
            id: graphic361
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.726117], [0.663165, 0.726117], [0.663165, 0.418186], [-0.527226, 0.418186]]
        id: actor187594
        objectName: "actor187594"
        property alias image: graphic362
        x: 51.78815
        y: -17.568537
        z: 2
        ImageRenderer {
            cacheRenderParams: actor187594.body.bodyType === Body.StaticBody
            id: graphic362
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.24779], [0.169234, 0.24779], [0.169234, 0.0697701], [-0.137895, 0.0697701]]
        id: actor189464
        objectName: "actor189464"
        property alias image: graphic363
        rotation: 17.1
        x: 61.540424
        y: -9.70865
        z: 2
        ImageRenderer {
            cacheRenderParams: actor189464.body.bodyType === Body.StaticBody
            id: graphic363
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.518979], [0.444512, 0.518979], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor213400
        objectName: "actor213400"
        property alias image: graphic364
        x: 87.32641
        y: -10.028269
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213400.body.bodyType === Body.StaticBody
            id: graphic364
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.433111], [0.444512, 0.433111], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor213401
        objectName: "actor213401"
        property alias image: graphic365
        x: 142.35812
        y: -5.1530967
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213401.body.bodyType === Body.StaticBody
            id: graphic365
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.362196, 0.435118], [0.444512, 0.435118], [0.444512, 0.16898], [-0.362196, 0.16898]]
        id: actor213402
        objectName: "actor213402"
        property alias image: graphic366
        x: 181.67755
        y: -4.6541224
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213402.body.bodyType === Body.StaticBody
            id: graphic366
            sizeScale: 1.6303303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.812837], [0.663165, 0.812837], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor213404
        objectName: "actor213404"
        property alias image: graphic367
        x: 143.06963
        y: -17.921116
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213404.body.bodyType === Body.StaticBody
            id: graphic367
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.732669], [0.663165, 0.732669], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor213405
        objectName: "actor213405"
        property alias image: graphic368
        rotation: 16.20011
        x: 160.06854
        y: -40.826447
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213405.body.bodyType === Body.StaticBody
            id: graphic368
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.751754], [0.663165, 0.751754], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor213406
        objectName: "actor213406"
        property alias image: graphic369
        x: 158.25491
        y: -5.384766
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213406.body.bodyType === Body.StaticBody
            id: graphic369
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.745643], [0.663165, 0.745643], [0.663165, 0.373572], [-0.527226, 0.373572]]
        id: actor213407
        objectName: "actor213407"
        property alias image: graphic370
        x: 181.31287
        y: -18.904346
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213407.body.bodyType === Body.StaticBody
            id: graphic370
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513467, 0.420994], [0.645859, 0.420994], [0.645859, -0.145573], [-0.513467, -0.145573]]
        id: actor213410
        objectName: "actor213410"
        property alias image: graphic371
        rotation: -27.000002
        x: 127.04805
        y: -17.268763
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213410.body.bodyType === Body.StaticBody
            id: graphic371
            sizeScale: 1.8622513
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.468133, 0.38434], [0.588835, 0.38434], [0.588835, -0.13272], [-0.468133, -0.13272]]
        id: actor213411
        objectName: "actor213411"
        property alias image: graphic372
        rotation: -22.5
        x: 150.52061
        y: -5.2549815
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213411.body.bodyType === Body.StaticBody
            id: graphic372
            sizeScale: 1.6978303
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.527226, 0.533786], [0.663165, 0.533786], [0.663165, -0.206717], [-0.527226, -0.206717]]
        id: actor213412
        objectName: "actor213412"
        property alias image: graphic373
        x: 199.77188
        y: -25.216797
        z: 2
        ImageRenderer {
            cacheRenderParams: actor213412.body.bodyType === Body.StaticBody
            id: graphic373
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214263
        objectName: "actor214263"
        property alias image: graphic374
        x: 11.476033
        y: -15.082635
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214263.body.bodyType === Body.StaticBody
            id: graphic374
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214265
        objectName: "actor214265"
        property alias image: graphic375
        x: 37.475517
        y: -13.824226
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214265.body.bodyType === Body.StaticBody
            id: graphic375
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214266
        objectName: "actor214266"
        property alias image: graphic376
        rotation: -9.9
        x: 47.676956
        y: -15.277902
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214266.body.bodyType === Body.StaticBody
            id: graphic376
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214267
        objectName: "actor214267"
        property alias image: graphic377
        rotation: -5.3999996
        x: 44.294968
        y: -14.240196
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214267.body.bodyType === Body.StaticBody
            id: graphic377
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.221208], [0.169234, 0.221208], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214268
        objectName: "actor214268"
        property alias image: graphic378
        x: 52.187843
        y: -8.975716
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214268.body.bodyType === Body.StaticBody
            id: graphic378
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214269
        objectName: "actor214269"
        property alias image: graphic379
        x: 55.250637
        y: -9.441718
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214269.body.bodyType === Body.StaticBody
            id: graphic379
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214270
        objectName: "actor214270"
        property alias image: graphic380
        rotation: 8.614212
        x: 53.314507
        y: -16.957958
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214270.body.bodyType === Body.StaticBody
            id: graphic380
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214271
        objectName: "actor214271"
        property alias image: graphic381
        x: 80.78262
        y: -9.949705
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214271.body.bodyType === Body.StaticBody
            id: graphic381
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214272
        objectName: "actor214272"
        property alias image: graphic382
        rotation: 13.951279
        x: 71.91326
        y: -9.85301
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214272.body.bodyType === Body.StaticBody
            id: graphic382
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.174666, 0.315868], [0.214362, 0.315868], [0.214362, 0.109554], [-0.174666, 0.109554]]
        id: actor214273
        objectName: "actor214273"
        property alias image: graphic383
        x: 75.49268
        y: -9.788715
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214273.body.bodyType === Body.StaticBody
            id: graphic383
            sizeScale: 0.7862119
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214274
        objectName: "actor214274"
        property alias image: graphic384
        rotation: 3.0695248
        x: 115.06444
        y: -10.681828
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214274.body.bodyType === Body.StaticBody
            id: graphic384
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214276
        objectName: "actor214276"
        property alias image: graphic385
        x: 108.15615
        y: -9.898029
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214276.body.bodyType === Body.StaticBody
            id: graphic385
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214277
        objectName: "actor214277"
        property alias image: graphic386
        rotation: 22.5
        x: 144.29509
        y: -4.627023
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214277.body.bodyType === Body.StaticBody
            id: graphic386
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214278
        objectName: "actor214278"
        property alias image: graphic387
        x: 140.20721
        y: -4.890278
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214278.body.bodyType === Body.StaticBody
            id: graphic387
            sizeScale: 0.85
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214279
        objectName: "actor214279"
        property alias image: graphic388
        rotation: 18
        x: 137.35349
        y: -6.3152385
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214279.body.bodyType === Body.StaticBody
            id: graphic388
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214280
        objectName: "actor214280"
        property alias image: graphic389
        rotation: -5.279251
        x: 134.30531
        y: -17.273624
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214280.body.bodyType === Body.StaticBody
            id: graphic389
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214281
        objectName: "actor214281"
        property alias image: graphic390
        x: 132.79086
        y: -17.201033
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214281.body.bodyType === Body.StaticBody
            id: graphic390
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214282
        objectName: "actor214282"
        property alias image: graphic391
        x: 138.1034
        y: -17.70793
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214282.body.bodyType === Body.StaticBody
            id: graphic391
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214283
        objectName: "actor214283"
        property alias image: graphic392
        x: 174.9052
        y: -3.7186773
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214283.body.bodyType === Body.StaticBody
            id: graphic392
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214284
        objectName: "actor214284"
        property alias image: graphic393
        x: 174.02573
        y: -3.5872777
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214284.body.bodyType === Body.StaticBody
            id: graphic393
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214285
        objectName: "actor214285"
        property alias image: graphic394
        rotation: 10.213101
        x: 170.79976
        y: -5.0514526
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214285.body.bodyType === Body.StaticBody
            id: graphic394
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214286
        objectName: "actor214286"
        property alias image: graphic395
        x: 174.44133
        y: -17.54736
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214286.body.bodyType === Body.StaticBody
            id: graphic395
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214287
        objectName: "actor214287"
        property alias image: graphic396
        rotation: 18.89989
        x: 182.50903
        y: -18.112795
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214287.body.bodyType === Body.StaticBody
            id: graphic396
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214288
        objectName: "actor214288"
        property alias image: graphic397
        x: 185.8839
        y: -16.302952
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214288.body.bodyType === Body.StaticBody
            id: graphic397
            sizeScale: 0.8
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.364692], [0.31016, 0.364692], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214289
        objectName: "actor214289"
        property alias image: graphic398
        rotation: 7.1999993
        x: 26.089174
        y: -14.178169
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214289.body.bodyType === Body.StaticBody
            id: graphic398
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.193921, 0.279837], [0.237993, 0.279837], [0.237993, 0.0745744], [-0.193921, 0.0745744]]
        id: actor214292
        objectName: "actor214292"
        property alias image: graphic399
        x: 59.46611
        y: -9.665676
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214292.body.bodyType === Body.StaticBody
            id: graphic399
            sizeScale: 0.9031406
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214295
        objectName: "actor214295"
        property alias image: graphic400
        x: 120.113716
        y: -10.448809
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214295.body.bodyType === Body.StaticBody
            id: graphic400
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214297
        objectName: "actor214297"
        property alias image: graphic401
        x: 117.3601
        y: -10.319585
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214297.body.bodyType === Body.StaticBody
            id: graphic401
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.153506], [0.169234, 0.153506], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214298
        objectName: "actor214298"
        property alias image: graphic402
        x: 131.42734
        y: -12.17607
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214298.body.bodyType === Body.StaticBody
            id: graphic402
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214299
        objectName: "actor214299"
        property alias image: graphic403
        x: 129.49432
        y: -11.994566
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214299.body.bodyType === Body.StaticBody
            id: graphic403
            sizeScale: 0.85
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214301
        objectName: "actor214301"
        property alias image: graphic404
        rotation: 16.200003
        x: 128.1419
        y: -17.289902
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214301.body.bodyType === Body.StaticBody
            id: graphic404
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214302
        objectName: "actor214302"
        property alias image: graphic405
        rotation: 36.9
        x: 134.00989
        y: -9.058904
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214302.body.bodyType === Body.StaticBody
            id: graphic405
            sizeScale: 0.62069714
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.252724, 0.376187], [0.31016, 0.376187], [0.31016, 0.0971876], [-0.252724, 0.0971876]]
        id: actor214305
        objectName: "actor214305"
        property alias image: graphic406
        rotation: 17.09989
        x: 173.10822
        y: -3.8355544
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214305.body.bodyType === Body.StaticBody
            id: graphic406
            sizeScale: 1.177
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214306
        objectName: "actor214306"
        property alias image: graphic407
        x: 167.07173
        y: -5.639807
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214306.body.bodyType === Body.StaticBody
            id: graphic407
            sizeScale: 0.7
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.198989], [0.169234, 0.198989], [0.169234, 0.0315293], [-0.137895, 0.0315293]]
        id: actor214307
        objectName: "actor214307"
        property alias image: graphic408
        x: 166.42096
        y: -5.6571918
        z: 2
        ImageRenderer {
            cacheRenderParams: actor214307.body.bodyType === Body.StaticBody
            id: graphic408
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor406556
        objectName: "actor406556"
        property alias image: graphic409
        x: 8.087763
        y: -13.179173
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406556.body.bodyType === Body.StaticBody
            id: graphic409
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.938616, 0.649938], [0.734597, 0.649938], [0.734597, -0.538002], [-0.938616, -0.538002]]
        id: actor406557
        objectName: "actor406557"
        property alias image: graphic410
        rotation: 38.864975
        x: 68.58357
        y: -8.487011
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406557.body.bodyType === Body.StaticBody
            id: graphic410
            sizeScale: 4.2249393
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.964464], [0.554868, 0.964464], [0.554868, 0.238172], [-0.708971, 0.238172]]
        id: actor406558
        objectName: "actor406558"
        property alias image: graphic411
        x: 130.22397
        y: -11.566788
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406558.body.bodyType === Body.StaticBody
            id: graphic411
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor406559
        objectName: "actor406559"
        property alias image: graphic412
        x: 170.08578
        y: -15.090359
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406559.body.bodyType === Body.StaticBody
            id: graphic412
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor406560
        objectName: "actor406560"
        property alias image: graphic413
        x: 167.67075
        y: -15.78156
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406560.body.bodyType === Body.StaticBody
            id: graphic413
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.137895, 0.257323], [0.169234, 0.257323], [0.169234, 0.0565289], [-0.137895, 0.0565289]]
        id: actor406561
        objectName: "actor406561"
        property alias image: graphic414
        x: 194.3475
        y: -25.220757
        z: 2
        ImageRenderer {
            cacheRenderParams: actor406561.body.bodyType === Body.StaticBody
            id: graphic414
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor450601
        objectName: "actor450601"
        property alias image: graphic415
        x: 151.56302
        y: -3.6612024
        z: 2
        ImageRenderer {
            cacheRenderParams: actor450601.body.bodyType === Body.StaticBody
            id: graphic415
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor450602
        objectName: "actor450602"
        property alias image: graphic416
        x: 100.317986
        y: -9.7209635
        z: 2
        ImageRenderer {
            cacheRenderParams: actor450602.body.bodyType === Body.StaticBody
            id: graphic416
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708971, 0.490922], [0.554868, 0.490922], [0.554868, -0.406373], [-0.708971, -0.406373]]
        id: actor450603
        objectName: "actor450603"
        property alias image: graphic417
        x: 102.79923
        y: -8.831146
        z: 2
        ImageRenderer {
            cacheRenderParams: actor450603.body.bodyType === Body.StaticBody
            id: graphic417
            sizeScale: 3.1912506
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor222190
        objectName: "actor222190"
        property alias image: graphic419
        property alias parallaxTransform: parallaxTransform418
        rotation: 24.300001
        x: -30.437632
        y: -7.1387134
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform418
            zDepth: 0.7
            ImageRenderer {
                id: graphic419
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor222191
        objectName: "actor222191"
        property alias image: graphic421
        property alias parallaxTransform: parallaxTransform420
        x: -20.70761
        y: -6.3634024
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform420
            zDepth: 0.7
            ImageRenderer {
                id: graphic421
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.96324, 1.88406], [1.9206, 1.88406], [1.9206, -4.06694], [-1.96324, -4.06694]]
        id: actor222192
        objectName: "actor222192"
        property alias image: graphic423
        property alias parallaxTransform: parallaxTransform422
        x: -5.644518
        y: -3.2861838
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform422
            zDepth: 0.7
            ImageRenderer {
                id: graphic423
                sizeScale: 6.372036
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor223345
        objectName: "actor223345"
        property alias image: graphic425
        property alias parallaxTransform: parallaxTransform424
        x: 13.659199
        y: -4.485792
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform424
            zDepth: 0.7
            ImageRenderer {
                id: graphic425
                sizeScale: 7.010665
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor223346
        objectName: "actor223346"
        property alias image: graphic427
        property alias parallaxTransform: parallaxTransform426
        x: 37.347107
        y: 1.6601627
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform426
            zDepth: 0.7
            ImageRenderer {
                id: graphic427
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.88442, 1.80841], [1.84349, 1.80841], [1.84349, -3.90365], [-1.88442, -3.90365]]
        id: actor224979
        objectName: "actor224979"
        property alias image: graphic429
        property alias parallaxTransform: parallaxTransform428
        x: 75.95632
        y: -0.35198808
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform428
            zDepth: 0.7
            ImageRenderer {
                id: graphic429
                sizeScale: 6.1162
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.95745, 1.87849], [1.91493, 1.87849], [1.91493, -4.05493], [-1.95745, -4.05493]]
        id: actor225754
        objectName: "actor225754"
        property alias image: graphic431
        property alias parallaxTransform: parallaxTransform430
        x: 105.26174
        y: -0.91760755
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform430
            zDepth: 0.7
            ImageRenderer {
                id: graphic431
                sizeScale: 6.3532233
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor226143
        objectName: "actor226143"
        property alias image: graphic433
        property alias parallaxTransform: parallaxTransform432
        x: 141.72092
        y: 0.74648213
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform432
            zDepth: 0.7
            ImageRenderer {
                id: graphic433
                sizeScale: 7.010665
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor226144
        objectName: "actor226144"
        property alias image: graphic435
        property alias parallaxTransform: parallaxTransform434
        x: 166.69745
        y: 6.6433287
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform434
            zDepth: 0.7
            ImageRenderer {
                id: graphic435
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor226535
        objectName: "actor226535"
        property alias image: graphic437
        property alias parallaxTransform: parallaxTransform436
        x: 191.51555
        y: 7.0446424
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform436
            zDepth: 0.7
            ImageRenderer {
                id: graphic437
                sizeScale: 7.010665
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor226536
        objectName: "actor226536"
        property alias image: graphic439
        property alias parallaxTransform: parallaxTransform438
        x: 209.34296
        y: 6.5723906
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform438
            zDepth: 0.7
            ImageRenderer {
                id: graphic439
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor226537
        objectName: "actor226537"
        property alias image: graphic441
        property alias parallaxTransform: parallaxTransform440
        x: 230.57732
        y: 5.022939
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform440
            zDepth: 0.7
            ImageRenderer {
                id: graphic441
                sizeScale: 7.010665
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor227324
        objectName: "actor227324"
        property alias image: graphic443
        property alias parallaxTransform: parallaxTransform442
        x: 242.60814
        y: -9.806424
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform442
            zDepth: 0.7
            ImageRenderer {
                id: graphic443
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor227325
        objectName: "actor227325"
        property alias image: graphic445
        property alias parallaxTransform: parallaxTransform444
        rotation: -36.900105
        x: 249.13081
        y: -21.612135
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform444
            zDepth: 0.7
            ImageRenderer {
                id: graphic445
                sizeScale: 7.010665
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor397545
        objectName: "actor397545"
        property alias image: graphic447
        property alias parallaxTransform: parallaxTransform446
        rotation: 24.300001
        x: -33.80728
        y: -9.834433
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform446
            zDepth: 0.7
            ImageRenderer {
                id: graphic447
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor398761
        objectName: "actor398761"
        property alias image: graphic449
        property alias parallaxTransform: parallaxTransform448
        rotation: 30.210892
        x: 29.194115
        y: -0.8809073
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform448
            zDepth: 0.7
            ImageRenderer {
                id: graphic449
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.97446, 1.89482], [1.93157, 1.89482], [1.93157, -4.09018], [-1.97446, -4.09018]]
        id: actor399980
        objectName: "actor399980"
        property alias image: graphic451
        property alias parallaxTransform: parallaxTransform450
        rotation: 42.64804
        x: 52.6637
        y: 0.99389046
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform450
            zDepth: 0.7
            ImageRenderer {
                id: graphic451
                sizeScale: 6.408449
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.95, 1.87135], [1.90764, 1.87135], [1.90764, -4.0395], [-1.95, -4.0395]]
        id: actor401202
        objectName: "actor401202"
        property alias image: graphic453
        property alias parallaxTransform: parallaxTransform452
        rotation: 40.81903
        x: 91.238144
        y: 0.4871261
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform452
            zDepth: 0.7
            ImageRenderer {
                id: graphic453
                sizeScale: 6.329048
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor401203
        objectName: "actor401203"
        property alias image: graphic455
        property alias parallaxTransform: parallaxTransform454
        x: 88.38368
        y: 1.0440929
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform454
            zDepth: 0.7
            ImageRenderer {
                id: graphic455
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.95, 1.87135], [1.90764, 1.87135], [1.90764, -4.0395], [-1.95, -4.0395]]
        id: actor402431
        objectName: "actor402431"
        property alias image: graphic457
        property alias parallaxTransform: parallaxTransform456
        rotation: 40.81903
        x: 122.381516
        y: -0.6869701
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform456
            zDepth: 0.7
            ImageRenderer {
                id: graphic457
                sizeScale: 6.329048
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor403252
        objectName: "actor403252"
        property alias image: graphic459
        property alias parallaxTransform: parallaxTransform458
        x: 178.72932
        y: 6.7115574
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform458
            zDepth: 0.7
            ImageRenderer {
                id: graphic459
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.95, 1.87135], [1.90764, 1.87135], [1.90764, -4.0395], [-1.95, -4.0395]]
        id: actor403664
        objectName: "actor403664"
        property alias image: graphic461
        property alias parallaxTransform: parallaxTransform460
        rotation: 40.81903
        x: 154.36906
        y: 3.9580772
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform460
            zDepth: 0.7
            ImageRenderer {
                id: graphic461
                sizeScale: 6.329048
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor404901
        objectName: "actor404901"
        property alias image: graphic463
        property alias parallaxTransform: parallaxTransform462
        x: 160.3525
        y: 4.4268866
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform462
            zDepth: 0.7
            ImageRenderer {
                id: graphic463
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.70275, 1.63407], [1.66576, 1.63407], [1.66576, -3.52732], [-1.70275, -3.52732]]
        id: actor406141
        objectName: "actor406141"
        property alias image: graphic465
        property alias parallaxTransform: parallaxTransform464
        rotation: 36.245956
        x: 203.22705
        y: 6.0117645
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform464
            zDepth: 0.7
            ImageRenderer {
                id: graphic465
                sizeScale: 5.526562
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.88442, 1.80841], [1.84349, 1.80841], [1.84349, -3.90365], [-1.88442, -3.90365]]
        id: actor448836
        objectName: "actor448836"
        property alias image: graphic467
        property alias parallaxTransform: parallaxTransform466
        rotation: 15.359726
        x: 75.22531
        y: 2.8157623
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform466
            zDepth: 0.7
            ImageRenderer {
                id: graphic467
                sizeScale: 6.1162
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    ThoughtBubble {
        id: thoughtBubble468
        objectName: "thoughtBubble468"
        playerActor: actor0
        portal: actor139091
        x: 2.22764
        y: -15.2052
        z: 10
    }
    ParticleLayer {
        density: 20
        gravityScale: 0.7
        id: particleLayer0
        radius: 0.075
    }
    ParticleLayer {
        density: 0.2
        gravityScale: 1.5
        id: particleLayer1
        radius: 0.08
    }
    ParticleLayer {
        density: 5
        id: particleLayer2
        radius: 0.075
    }
    ParticleLayer {
        id: particleLayer3
    }
}
