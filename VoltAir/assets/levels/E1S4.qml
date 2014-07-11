import QtQuick 2.2
import VoltAir 1.0
Level {
    cameraBoundary: Qt.rect(-0.95768, -28.9984, 175.197, 24.4552)
    fileName: "E1S4"
    parallaxOrigin.x: 50.406414
    parallaxOrigin.y: -22.128035
    parallaxStrength.y: 1
    Polygon {
        body.active: false
        body.vertices: [[-10.0774, 10.1402], [10.2866, 10.1402], [10.2866, -1.30735], [-10.0774, -1.30735]]
        id: actor123104
        objectName: "actor123104"
        property alias image: graphic1
        property alias parallaxTransform: parallaxTransform0
        x: 50.307472
        y: -26.61059
        z: -10
        ParallaxTransformItem {
            id: parallaxTransform0
            zDepth: 50
            ImageRenderer {
                id: graphic1
                sizeScale: 20.367157
                source: Util.getPathToImage("background_e1/bg_e1_flat.jpg")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.58531, 7.30363], [7.16675, 7.30363], [7.16675, -0.934777], [-3.58531, -0.934777]]
        id: actor211540
        objectName: "actor211540"
        property alias image: graphic2
        x: 161.24945
        y: -14.186634
        z: -2
        ImageRenderer {
            cacheRenderParams: actor211540.body.bodyType === Body.StaticBody
            id: graphic2
            sizeScale: 14.674097
            source: Util.getPathToImage("middleground_e1/deco_e1_column04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.58531, 7.30363], [7.16675, 7.30363], [7.16675, -0.934777], [-3.58531, -0.934777]]
        id: actor412481
        objectName: "actor412481"
        property alias image: graphic3
        rotation: -23.132202
        x: 171.08852
        y: -22.020433
        z: -2
        ImageRenderer {
            cacheRenderParams: actor412481.body.bodyType === Body.StaticBody
            id: graphic3
            sizeScale: 14.674097
            source: Util.getPathToImage("middleground_e1/deco_e1_column04.png")
        }
    }
    Polygon {
        body.vertices: [[-1, 3.88092], [0.00511932, 3.88092], [0.00511932, -23.3667], [-1, -23.3667]]
        id: actor2
        objectName: "actor2"
        visible: false
        y: -10.638224
        z: -2
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.1946, 0.277337], [0.238826, 0.277337], [0.238826, 0.0313088], [-0.1946, 0.0313088]]
        id: actor61434
        objectName: "actor61434"
        property alias image: graphic5
        x: 25.148209
        y: -14.603198
        z: -1
        ImageRenderer {
            cacheRenderParams: actor61434.body.bodyType === Body.StaticBody
            id: graphic5
            sizeScale: 0.8759394
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.212002, 0.293959], [0.260184, 0.293959], [0.260184, -0.278256], [-0.212002, -0.278256]]
        id: actor60719
        objectName: "actor60719"
        property alias image: graphic6
        x: 1.2282193
        y: -16.487398
        z: -1
        ImageRenderer {
            cacheRenderParams: actor60719.body.bodyType === Body.StaticBody
            id: graphic6
            sizeScale: 0.9542724
            source: Util.getPathToImage("middleground_e1/deco_e1_grass02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.185245, 0.264006], [0.227346, 0.264006], [0.227346, 0.0298038], [-0.185245, 0.0298038]]
        id: actor63438
        objectName: "actor63438"
        property alias image: graphic7
        rotation: 10.7998905
        x: 33.326077
        y: -15.513931
        z: -1
        ImageRenderer {
            aspectRatio: 0.855
            cacheRenderParams: actor63438.body.bodyType === Body.StaticBody
            id: graphic7
            sizeScale: 0.83383435
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor39980.image) { actor39980.image.cacheRenderParams = false; }if (actor59504.image) { actor59504.image.cacheRenderParams = false; }}
        body.vertices: [[-1, -0.100378], [5.26396, -0.100378], [5.26396, -1], [-1, -1]]
        id: actor59504
        inputs: [actor0]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor39980
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor59504
                targetProperty: "body.active"
            }
        ]
        objectName: "actor59504"
        visible: false
        x: 146.30421
        y: -15.505779
        z: -1
    }
    Polygon {
        body.vertices: [[-1, -0.45373], [2.19229, -0.45373], [2.18036, -0.999052], [-0.936226, -0.992493]]
        id: actor45041
        objectName: "actor45041"
        rotation: -11.944655
        visible: false
        x: 141.51202
        y: -11.354817
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor75858
        objectName: "actor75858"
        property alias image: graphic10
        x: 4.424874
        y: -16.684711
        z: -1
        ImageRenderer {
            aspectRatio: 0.79750013
            cacheRenderParams: actor75858.body.bodyType === Body.StaticBody
            id: graphic10
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.01017, 1.13048], [0.948368, 1.13048], [0.948368, -3.28703], [-1.01017, -3.28703]]
        id: actor77574
        objectName: "actor77574"
        property alias image: graphic11
        rotation: 8.100001
        x: 60.65218
        y: -7.842292
        z: -1
        ImageRenderer {
            aspectRatio: 1.2975001
            cacheRenderParams: actor77574.body.bodyType === Body.StaticBody
            id: graphic11
            sizeScale: 3.1444488
            source: Util.getPathToImage("middleground_e1/deco_e1_column01.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor235879.image) { actor235879.image.cacheRenderParams = false; }if (actor45041.image) { actor45041.image.cacheRenderParams = false; }if (actor94689.image) { actor94689.image.cacheRenderParams = false; }if (actor94690.image) { actor94690.image.cacheRenderParams = false; }}
        body.vertices: [[0.171021, -0.340466], [3.85022, -0.340466], [3.85022, -0.995764], [0.171021, -0.995764]]
        id: actor94690
        inputs: [actor39980]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 3
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.spawnRate"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor235879
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor45041
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94690
                targetProperty: "body.active"
            }
        ]
        objectName: "actor94690"
        visible: false
        x: 140.6876
        y: -15.125604
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor103301.image) { actor103301.image.cacheRenderParams = false; }if (actor39980.image) { actor39980.image.cacheRenderParams = false; }if (actor73713.image) { actor73713.image.cacheRenderParams = false; }if (actor94689.image) { actor94689.image.cacheRenderParams = false; }}
        body.vertices: [[-0.772341, 1.2093], [0.124098, 1.2093], [0.374189, -1.36841], [1.29257, -2.45379], [-0.772341, -2.40435]]
        id: actor50838
        inputs: [actor39980]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor39980
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor39980
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor103301
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73713
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73713
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 3.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOn"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 2.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOff"
            }
        ]
        objectName: "actor50838"
        rotation: -153.29541
        visible: false
        x: 143.91379
        y: -10.240492
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor207439.image) { actor207439.image.cacheRenderParams = false; }if (actor39980.image) { actor39980.image.cacheRenderParams = false; }if (actor45041.image) { actor45041.image.cacheRenderParams = false; }if (actor73711.image) { actor73711.image.cacheRenderParams = false; }if (actor73712.image) { actor73712.image.cacheRenderParams = false; }if (actor73713.image) { actor73713.image.cacheRenderParams = false; }if (actor73714.image) { actor73714.image.cacheRenderParams = false; }}
        body.vertices: [[-1.64011, 0.0126576], [2.64959, 0.0126576], [2.64959, -0.884757], [-1.64011, -0.884757]]
        id: actor46635
        inputs: [actor39980]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor45041
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 0.2
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor39980
                targetProperty: "body.restitution"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73714
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73713
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73712
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73711
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207439
                targetProperty: "body.bodyType"
            }
        ]
        objectName: "actor46635"
        visible: false
        x: 142.02266
        y: -12.71623
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.610302, 1.13048], [1.055, 1.13048], [1.055, -6.05943], [-0.610302, -6.05943]]
        id: actor110846
        objectName: "actor110846"
        property alias image: graphic15
        x: 42.87007
        y: -2.4453878
        z: -1
        ImageRenderer {
            cacheRenderParams: actor110846.body.bodyType === Body.StaticBody
            id: graphic15
            sizeScale: 4.1344495
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.00168566, 1.63215], [1.89198, 1.63215], [1.89198, -6.50725], [-0.00168566, -6.50725]]
        id: actor110847
        objectName: "actor110847"
        property alias image: graphic16
        x: 49.194653
        y: -5.274216
        z: -1
        ImageRenderer {
            cacheRenderParams: actor110847.body.bodyType === Body.StaticBody
            id: graphic16
            sizeScale: 5.9692054
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor111150
        objectName: "actor111150"
        property alias image: graphic17
        x: 6.1332088
        y: -16.63471
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor111150.body.bodyType === Body.StaticBody
            id: graphic17
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.39717, 1.16493], [0.807783, 1.16493], [0.807783, 0.145769], [-1.39717, 0.145769]]
        id: actor115088
        objectName: "actor115088"
        property alias image: graphic18
        x: 1.6452883
        y: -14.0848255
        z: -1
        ImageRenderer {
            cacheRenderParams: actor115088.body.bodyType === Body.StaticBody
            id: graphic18
            sizeScale: 5.0240717
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.17919, 0.983184], [0.681754, 0.983184], [0.681754, 0.123026], [-1.17919, 0.123026]]
        id: actor115699
        objectName: "actor115699"
        property alias image: graphic19
        x: 11.211953
        y: -13.993158
        z: -1
        ImageRenderer {
            cacheRenderParams: actor115699.body.bodyType === Body.StaticBody
            id: graphic19
            sizeScale: 4.2402267
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.770659, -0.287095], [0.945806, -0.287095], [0.945806, -1.96095], [-0.770659, -1.96095]]
        id: actor116312
        objectName: "actor116312"
        property alias image: graphic20
        x: 12.015948
        y: -10.734344
        z: -1
        ImageRenderer {
            cacheRenderParams: actor116312.body.bodyType === Body.StaticBody
            id: graphic20
            sizeScale: 3.468922
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor116620
        objectName: "actor116620"
        property alias image: graphic21
        rotation: 7.1999993
        x: 12.266542
        y: -14.826376
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor116620.body.bodyType === Body.StaticBody
            id: graphic21
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.01017, 1.13048], [0.948368, 1.13048], [0.948368, -3.28703], [-1.01017, -3.28703]]
        id: actor119170
        objectName: "actor119170"
        property alias image: graphic22
        x: 62.48445
        y: -1.2023456
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119170.body.bodyType === Body.StaticBody
            id: graphic22
            sizeScale: 4.1344495
            source: Util.getPathToImage("middleground_e1/deco_e1_column01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.399276, 0.739589], [0.69021, 0.739589], [0.69021, -3.96425], [-0.399276, -3.96425]]
        id: actor119171
        objectName: "actor119171"
        property alias image: graphic23
        rotation: 8.100001
        x: 84.23163
        y: -1.391197
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119171.body.bodyType === Body.StaticBody
            id: graphic23
            sizeScale: 2.70487
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.00130831, 1.26678], [1.46844, 1.26678], [1.46844, -5.05054], [-0.00130831, -5.05054]]
        id: actor119454
        objectName: "actor119454"
        property alias image: graphic24
        rotation: -14.399999
        x: 115.50612
        y: -1.5698023
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119454.body.bodyType === Body.StaticBody
            id: graphic24
            sizeScale: 4.6329412
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.836656, 0.936301], [0.785472, 0.936301], [0.785472, -2.72244], [-0.836656, -2.72244]]
        id: actor119455
        objectName: "actor119455"
        property alias image: graphic25
        rotation: -29.699999
        x: 132.32718
        y: -2.0246966
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119455.body.bodyType === Body.StaticBody
            id: graphic25
            sizeScale: 3.4243004
            source: Util.getPathToImage("middleground_e1/deco_e1_column01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.358291, 0.663671], [0.619361, 0.663671], [0.619361, -4.80828], [-0.358291, -4.80828]]
        id: actor119785
        objectName: "actor119785"
        property alias image: graphic26
        rotation: -6.2998896
        x: 56.49919
        y: -6.9004073
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119785.body.bodyType === Body.StaticBody
            id: graphic26
            sizeScale: 2.4272182
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.32962, 1.10861], [0.768729, 1.10861], [0.768729, 0.138721], [-1.32962, 0.138721]]
        id: actor119786
        objectName: "actor119786"
        property alias image: graphic27
        x: 56.70388
        y: -12.218269
        z: -1
        ImageRenderer {
            cacheRenderParams: actor119786.body.bodyType === Body.StaticBody
            id: graphic27
            sizeScale: 4.781171
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.141536, 0.201713], [0.173703, 0.201713], [0.173703, 0.0227715], [-0.141536, 0.0227715]]
        id: actor120454
        objectName: "actor120454"
        property alias image: graphic28
        rotation: -8.100001
        x: 61.9322
        y: -6.9515176
        z: -1
        ImageRenderer {
            cacheRenderParams: actor120454.body.bodyType === Body.StaticBody
            id: graphic28
            sizeScale: 0.6370875
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.141536, 0.201713], [0.173703, 0.201713], [0.173703, 0.0227715], [-0.141536, 0.0227715]]
        id: actor120456
        objectName: "actor120456"
        property alias image: graphic29
        rotation: 7.1999993
        x: 57.61921
        y: -6.753648
        z: -1
        ImageRenderer {
            cacheRenderParams: actor120456.body.bodyType === Body.StaticBody
            id: graphic29
            sizeScale: 0.6370875
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.983554, 0.820067], [0.568647, 0.820067], [0.568647, 0.102615], [-0.983554, 0.102615]]
        id: actor125389
        objectName: "actor125389"
        property alias image: graphic30
        x: 101.781166
        y: -6.6106277
        z: -1
        ImageRenderer {
            cacheRenderParams: actor125389.body.bodyType === Body.StaticBody
            id: graphic30
            sizeScale: 3.5367424
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.341491], [0.310578, 0.341491], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor127098
        objectName: "actor127098"
        property alias image: graphic31
        x: 96.319916
        y: -9.401835
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor127098.body.bodyType === Body.StaticBody
            id: graphic31
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.341491], [0.310578, 0.341491], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor127102
        objectName: "actor127102"
        property alias image: graphic32
        x: 128.86919
        y: -13.55695
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor127102.body.bodyType === Body.StaticBody
            id: graphic32
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.501378, -0.186779], [0.615326, -0.186779], [0.615326, -1.27576], [-0.501378, -1.27576]]
        id: actor128193
        objectName: "actor128193"
        property alias image: graphic33
        x: 123.6008
        y: -9.755358
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128193.body.bodyType === Body.StaticBody
            id: graphic33
            sizeScale: 2.256824
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.618619, 0.805707], [0.759212, 0.805707], [0.759212, -1.57409], [-0.618619, -1.57409]]
        id: actor128574
        objectName: "actor128574"
        property alias image: graphic34
        x: 114.985985
        y: -6.3826632
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128574.body.bodyType === Body.StaticBody
            id: graphic34
            sizeScale: 2.7845542
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.618619, 0.805707], [0.759212, 0.805707], [0.759212, -1.57409], [-0.618619, -1.57409]]
        id: actor128576
        objectName: "actor128576"
        property alias image: graphic35
        x: 118.98147
        y: -5.5559225
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128576.body.bodyType === Body.StaticBody
            id: graphic35
            sizeScale: 2.7845542
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.39717, 1.16493], [0.807783, 1.16493], [0.807783, 0.145769], [-1.39717, 0.145769]]
        id: actor128955
        objectName: "actor128955"
        property alias image: graphic36
        x: 23.247692
        y: -13.096844
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128955.body.bodyType === Body.StaticBody
            id: graphic36
            sizeScale: 5.0240717
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.18339, 1.59347], [0.674228, 1.59758], [0.677556, 0.117732], [-1.17919, 0.123026]]
        id: actor128956
        objectName: "actor128956"
        property alias image: graphic37
        x: 21.364998
        y: -13.359407
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128956.body.bodyType === Body.StaticBody
            id: graphic37
            sizeScale: 4.2402267
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.770659, -0.287095], [0.945806, -0.287095], [0.945806, -1.96095], [-0.770659, -1.96095]]
        id: actor128957
        objectName: "actor128957"
        property alias image: graphic38
        x: 24.475609
        y: -11.221488
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128957.body.bodyType === Body.StaticBody
            id: graphic38
            sizeScale: 3.468922
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.39717, 1.2401], [0.807783, 1.2401], [0.807783, 0.145769], [-1.39717, 0.145769]]
        id: actor128958
        objectName: "actor128958"
        property alias image: graphic39
        x: 35.68606
        y: -11.362034
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128958.body.bodyType === Body.StaticBody
            id: graphic39
            sizeScale: 5.0240717
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.153818, 0.219217], [0.188777, 0.219217], [0.188777, 0.0247476], [-0.153818, 0.0247476]]
        id: actor132029
        objectName: "actor132029"
        property alias image: graphic40
        rotation: 18.9
        x: 70.89269
        y: -14.724314
        z: -1
        ImageRenderer {
            cacheRenderParams: actor132029.body.bodyType === Body.StaticBody
            id: graphic40
            sizeScale: 0.6923737
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.304044], [-0.3053, 0.304044]]
        id: actor132034
        objectName: "actor132034"
        property alias image: graphic41
        x: 83.644165
        y: -9.974322
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor132034.body.bodyType === Body.StaticBody
            id: graphic41
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.308238, 0.439291], [0.378291, 0.439291], [0.378291, -0.300355], [-0.308238, -0.300355]]
        id: actor132853
        objectName: "actor132853"
        property alias image: graphic42
        x: 110.0359
        y: -13.316004
        z: -1
        ImageRenderer {
            cacheRenderParams: actor132853.body.bodyType === Body.StaticBody
            id: graphic42
            sizeScale: 1.3874537
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.308238, 0.439291], [0.378291, 0.439291], [0.378291, -0.300355], [-0.308238, -0.300355]]
        id: actor134080
        objectName: "actor134080"
        property alias image: graphic43
        x: 102.46343
        y: -9.136422
        z: -1
        ImageRenderer {
            cacheRenderParams: actor134080.body.bodyType === Body.StaticBody
            id: graphic43
            sizeScale: 1.3874537
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.308238, 0.439291], [0.378291, 0.439291], [0.378291, -0.448099], [-0.308238, -0.448099]]
        id: actor134081
        objectName: "actor134081"
        property alias image: graphic44
        x: 88.77574
        y: -8.933492
        z: -1
        ImageRenderer {
            cacheRenderParams: actor134081.body.bodyType === Body.StaticBody
            id: graphic44
            sizeScale: 1.3874537
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor134903
        objectName: "actor134903"
        property alias image: graphic45
        x: 138.73123
        y: -12.416874
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor134903.body.bodyType === Body.StaticBody
            id: graphic45
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.249736], [-0.3053, 0.249736]]
        id: actor134904
        objectName: "actor134904"
        property alias image: graphic46
        rotation: -5.3999996
        x: 139.79335
        y: -12.4823475
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor134904.body.bodyType === Body.StaticBody
            id: graphic46
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.341491], [0.310578, 0.341491], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor135277
        objectName: "actor135277"
        property alias image: graphic47
        x: 115.27891
        y: -9.277518
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor135277.body.bodyType === Body.StaticBody
            id: graphic47
            sizeScale: 0.91910386
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.26641, 0.379679], [0.326957, 0.379679], [0.326957, -0.419978], [-0.26641, -0.419978]]
        id: actor135281
        objectName: "actor135281"
        property alias image: graphic48
        x: 121.641556
        y: -8.514646
        z: -1
        ImageRenderer {
            cacheRenderParams: actor135281.body.bodyType === Body.StaticBody
            id: graphic48
            sizeScale: 1.1991746
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.26641, 0.379679], [0.326957, 0.379679], [0.326957, -0.419978], [-0.26641, -0.419978]]
        id: actor135283
        objectName: "actor135283"
        property alias image: graphic49
        x: 119.91978
        y: -8.910433
        z: -1
        ImageRenderer {
            aspectRatio: 0.7025001
            cacheRenderParams: actor135283.body.bodyType === Body.StaticBody
            id: graphic49
            sizeScale: 1.1991746
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.186688, 0.251922], [0.229117, 0.251922], [0.229117, 0.00759599], [-0.186688, 0.00759599]]
        id: actor135713
        objectName: "actor135713"
        property alias image: graphic50
        rotation: -12.600109
        x: 117.469795
        y: -9.816039
        z: -1
        ImageRenderer {
            aspectRatio: 1.1775001
            cacheRenderParams: actor135713.body.bodyType === Body.StaticBody
            id: graphic50
            sizeScale: 0.6780323
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.26641, 0.379679], [0.326957, 0.379679], [0.326957, -0.419978], [-0.26641, -0.419978]]
        id: actor136139
        objectName: "actor136139"
        property alias image: graphic51
        rotation: -21.599998
        x: 116.771904
        y: -8.995321
        z: -1
        ImageRenderer {
            aspectRatio: 0.7025001
            cacheRenderParams: actor136139.body.bodyType === Body.StaticBody
            id: graphic51
            sizeScale: 1.1991746
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.706267, 0.58887], [0.408332, 0.58887], [0.408332, 0.0736857], [-0.706267, 0.0736857]]
        id: actor128572
        objectName: "actor128572"
        property alias image: graphic52
        x: 124.9368
        y: -10.797205
        z: -1
        ImageRenderer {
            cacheRenderParams: actor128572.body.bodyType === Body.StaticBody
            id: graphic52
            sizeScale: 2.5396512
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.249736], [-0.3053, 0.249736]]
        id: actor136142
        objectName: "actor136142"
        property alias image: graphic53
        rotation: 7.2000003
        x: 133.99641
        y: -12.966818
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor136142.body.bodyType === Body.StaticBody
            id: graphic53
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor129345
        objectName: "actor129345"
        property alias image: graphic54
        rotation: -20.699894
        x: 150.7735
        y: -16.36923
        z: -1
        ImageRenderer {
            cacheRenderParams: actor129345.body.bodyType === Body.StaticBody
            id: graphic54
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.23923, 1.03324], [0.716465, 1.03324], [0.716465, 0.12929], [-1.23923, 0.12929]]
        id: actor136578
        objectName: "actor136578"
        property alias image: graphic55
        x: 163.95447
        y: -14.740141
        z: -1
        ImageRenderer {
            cacheRenderParams: actor136578.body.bodyType === Body.StaticBody
            id: graphic55
            sizeScale: 4.45611
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.796962, -0.296893], [0.978087, -0.296893], [0.978087, -2.02788], [-0.796962, -2.02788]]
        id: actor136579
        objectName: "actor136579"
        property alias image: graphic56
        x: 161.49709
        y: -12.289609
        z: -1
        ImageRenderer {
            cacheRenderParams: actor136579.body.bodyType === Body.StaticBody
            id: graphic56
            sizeScale: 3.5873163
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.147604, 0.208575], [0.18115, 0.208575], [0.18115, -0.0711051], [-0.147604, -0.0711051]]
        id: actor139079
        objectName: "actor139079"
        property alias image: graphic57
        rotation: 17.1
        x: 72.0684
        y: -7.8054676
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor139079.body.bodyType === Body.StaticBody
            id: graphic57
            sizeScale: 0.66440064
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.642433, -0.239326], [0.788438, -0.239326], [0.788438, -1.63468], [-0.642433, -1.63468]]
        id: actor139530
        objectName: "actor139530"
        property alias image: graphic58
        x: 59.952156
        y: -10.517907
        z: -1
        ImageRenderer {
            cacheRenderParams: actor139530.body.bodyType === Body.StaticBody
            id: graphic58
            sizeScale: 2.8917456
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.00158622, 1.53587], [1.78037, 1.53587], [1.78037, -6.12339], [-0.00158622, -6.12339]]
        id: actor140432
        objectName: "actor140432"
        property alias image: graphic59
        x: 146.60971
        y: -6.2637625
        z: -1
        ImageRenderer {
            cacheRenderParams: actor140432.body.bodyType === Body.StaticBody
            id: graphic59
            sizeScale: 5.6170793
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.01608, 1.1371], [0.953923, 1.1371], [0.953923, -3.30629], [-1.01608, -3.30629]]
        id: actor141341
        objectName: "actor141341"
        property alias image: graphic60
        x: 153.23473
        y: -8.268004
        z: -1
        ImageRenderer {
            cacheRenderParams: actor141341.body.bodyType === Body.StaticBody
            id: graphic60
            sizeScale: 4.1586676
            source: Util.getPathToImage("middleground_e1/deco_e1_column01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.249736], [-0.3053, 0.249736]]
        id: actor142261
        objectName: "actor142261"
        property alias image: graphic61
        x: 150.12308
        y: -7.7532177
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor142261.body.bodyType === Body.StaticBody
            id: graphic61
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.249736], [-0.3053, 0.249736]]
        id: actor142263
        objectName: "actor142263"
        property alias image: graphic62
        rotation: 14.399999
        x: 141.87288
        y: -8.921139
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor142263.body.bodyType === Body.StaticBody
            id: graphic62
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.126171, 0.178288], [0.154845, 0.178288], [0.154845, -0.0607801], [-0.126171, -0.0607801]]
        id: actor142265
        objectName: "actor142265"
        property alias image: graphic63
        rotation: 34.2
        x: 151.0651
        y: -7.369649
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor142265.body.bodyType === Body.StaticBody
            id: graphic63
            sizeScale: 0.5679246
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.5464, -0.203551], [0.67058, -0.203551], [0.67058, -1.39032], [-0.5464, -1.39032]]
        id: actor142267
        objectName: "actor142267"
        property alias image: graphic64
        x: 94.91332
        y: -6.2483087
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142267.body.bodyType === Body.StaticBody
            id: graphic64
            sizeScale: 2.4594767
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.5464, -0.203551], [0.67058, -0.203551], [0.67058, -1.39032], [-0.5464, -1.39032]]
        id: actor142270
        objectName: "actor142270"
        property alias image: graphic65
        x: 88.58862
        y: -7.127022
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142270.body.bodyType === Body.StaticBody
            id: graphic65
            sizeScale: 2.4594767
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.983554, 0.820067], [0.568647, 0.820067], [0.568647, 0.102615], [-0.983554, 0.102615]]
        id: actor142271
        objectName: "actor142271"
        property alias image: graphic66
        x: 87.68944
        y: -7.8943863
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142271.body.bodyType === Body.StaticBody
            id: graphic66
            sizeScale: 3.5367424
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.5464, -0.203551], [0.67058, -0.203551], [0.67058, -1.39032], [-0.5464, -1.39032]]
        id: actor142272
        objectName: "actor142272"
        property alias image: graphic67
        x: 88.58862
        y: -7.127022
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142272.body.bodyType === Body.StaticBody
            id: graphic67
            sizeScale: 2.4594767
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.364894, 0.125212], [0.962966, 0.125212], [0.962966, -1.0094], [-0.364894, -1.0094]]
        id: actor142671
        objectName: "actor142671"
        property alias image: graphic68
        x: 154.64091
        y: -11.703341
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142671.body.bodyType === Body.StaticBody
            id: graphic68
            sizeScale: 2.8038604
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.98431, 2.10075], [1.5409, 2.10075], [1.5409, 1.09942], [-1.98431, 1.09942]]
        id: actor142672
        objectName: "actor142672"
        property alias image: graphic69
        x: 163.6815
        y: -16.147137
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142672.body.bodyType === Body.StaticBody
            id: graphic69
            sizeScale: 5.6515512
            source: Util.getPathToImage("middleground_e2/deco_e2_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.37794, 0.877222], [0.608279, 0.877222], [0.608279, 0.109767], [-0.37794, 0.109767]]
        id: actor142673
        objectName: "actor142673"
        property alias image: graphic70
        x: 157.34515
        y: -12.559354
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142673.body.bodyType === Body.StaticBody
            id: graphic70
            sizeScale: 3.7832406
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.30951, 0.106207], [0.816806, 0.106207], [0.816806, -0.856196], [-0.30951, -0.856196]]
        id: actor142674
        objectName: "actor142674"
        property alias image: graphic71
        x: 117.53428
        y: -6.111278
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142674.body.bodyType === Body.StaticBody
            id: graphic71
            sizeScale: 2.3782873
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.791843, 0.537635], [0.971804, 0.537635], [0.971804, -0.299148], [-0.791843, -0.299148]]
        id: actor142675
        objectName: "actor142675"
        property alias image: graphic72
        x: 127.562744
        y: -10.94089
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142675.body.bodyType === Body.StaticBody
            id: graphic72
            sizeScale: 3.564274
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.11965, 0.760206], [1.37411, 0.760206], [1.37411, -0.42299], [-1.11965, -0.42299]]
        id: actor142676
        objectName: "actor142676"
        property alias image: graphic73
        x: 57.338425
        y: -12.133111
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142676.body.bodyType === Body.StaticBody
            id: graphic73
            sizeScale: 5.0398154
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.413749, 0.141976], [1.09189, 0.141976], [1.09189, -1.14455], [-0.413749, -1.14455]]
        id: actor142677
        objectName: "actor142677"
        property alias image: graphic74
        x: 46.738453
        y: -10.97717
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142677.body.bodyType === Body.StaticBody
            id: graphic74
            sizeScale: 3.1792595
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.30951, 0.106207], [0.816806, 0.106207], [0.816806, -0.870516], [-0.30951, -0.870516]]
        id: actor142678
        objectName: "actor142678"
        property alias image: graphic75
        x: 40.25969
        y: -8.803155
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142678.body.bodyType === Body.StaticBody
            id: graphic75
            sizeScale: 2.3782873
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.11965, 0.760206], [1.37411, 0.760206], [1.37411, -0.42299], [-1.11965, -0.42299]]
        id: actor142679
        objectName: "actor142679"
        property alias image: graphic76
        x: 32.533638
        y: -10.324546
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142679.body.bodyType === Body.StaticBody
            id: graphic76
            sizeScale: 5.0398154
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.39717, 1.75589], [0.807783, 1.75589], [0.807783, 0.145769], [-1.39717, 0.145769]]
        id: actor142680
        objectName: "actor142680"
        property alias image: graphic77
        x: 31.907063
        y: -11.400906
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142680.body.bodyType === Body.StaticBody
            id: graphic77
            sizeScale: 5.0240717
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.147604, 0.208575], [0.18115, 0.208575], [0.18115, -0.0711051], [-0.147604, -0.0711051]]
        id: actor127093
        objectName: "actor127093"
        property alias image: graphic78
        x: 79.635475
        y: -9.7731085
        z: -1
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor127093.body.bodyType === Body.StaticBody
            id: graphic78
            sizeScale: 0.66440064
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.706267, 0.58887], [0.408332, 0.58887], [0.408332, 0.0736857], [-0.706267, 0.0736857]]
        id: actor144040
        objectName: "actor144040"
        property alias image: graphic79
        x: 128.97968
        y: -10.398397
        z: -1
        ImageRenderer {
            cacheRenderParams: actor144040.body.bodyType === Body.StaticBody
            id: graphic79
            sizeScale: 2.5396512
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.11584, 0.757617], [1.36943, 0.757617], [1.36943, -0.42155], [-1.11584, -0.42155]]
        id: actor144041
        objectName: "actor144041"
        property alias image: graphic80
        rotation: -3.5998898
        x: 149.68292
        y: -11.534239
        z: -1
        ImageRenderer {
            cacheRenderParams: actor144041.body.bodyType === Body.StaticBody
            id: graphic80
            sizeScale: 5.0226502
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.608204, 0.894018], [0.791006, 0.894018], [0.791006, -0.518819], [-0.608204, -0.518819]]
        id: actor144043
        objectName: "actor144043"
        property alias image: graphic81
        x: 152.14896
        y: -6.979738
        z: -1
        ImageRenderer {
            cacheRenderParams: actor144043.body.bodyType === Body.StaticBody
            id: graphic81
            sizeScale: 2.431205
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.608204, 1.12607], [0.267732, 1.12607], [0.267732, 0.40024], [-0.608204, 0.40024]]
        id: actor144048
        objectName: "actor144048"
        property alias image: graphic82
        rotation: -14.399999
        x: 167.00067
        y: -8.5829735
        z: -1
        ImageRenderer {
            cacheRenderParams: actor144048.body.bodyType === Body.StaticBody
            id: graphic82
            sizeScale: 2.431205
            source: Util.getPathToImage("middleground_e2/deco_e2_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.254985, 0.363397], [0.312935, 0.363397], [0.312935, -0.248464], [-0.254985, -0.248464]]
        id: actor160098
        objectName: "actor160098"
        property alias image: graphic83
        x: 143.58498
        y: -12.645244
        z: -1
        ImageRenderer {
            cacheRenderParams: actor160098.body.bodyType === Body.StaticBody
            id: graphic83
            sizeScale: 1.1477493
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.262426, 0.374001], [0.322067, 0.374001], [0.322067, -0.255714], [-0.262426, -0.255714]]
        id: actor160099
        objectName: "actor160099"
        property alias image: graphic84
        rotation: -54.000004
        x: 144.05507
        y: -12.886939
        z: -1
        ImageRenderer {
            cacheRenderParams: actor160099.body.bodyType === Body.StaticBody
            id: graphic84
            sizeScale: 1.1812423
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.445677, 0.681735], [0.546966, 0.681735], [0.546966, 0.15023], [-0.445677, 0.15023]]
        id: actor161676
        objectName: "actor161676"
        property alias image: graphic85
        x: 158.94572
        y: -7.3367643
        z: -1
        ImageRenderer {
            cacheRenderParams: actor161676.body.bodyType === Body.StaticBody
            id: graphic85
            sizeScale: 2.006101
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor207440.image) { actor207440.image.cacheRenderParams = false; }if (actor73712.image) { actor73712.image.cacheRenderParams = false; }if (actor94689.image) { actor94689.image.cacheRenderParams = false; }}
        body.vertices: [[-0.772341, 1.2093], [0.124098, 1.2093], [0.370535, -1.36902], [1.33184, -2.51841], [-0.772341, -2.40435]]
        id: actor207443
        inputs: [actor73712]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73712
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73712
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207440
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 3.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOn"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 2.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOff"
            }
        ]
        objectName: "actor207443"
        rotation: -153.29541
        visible: false
        x: 143.91676
        y: -10.2456665
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor207439.image) { actor207439.image.cacheRenderParams = false; }if (actor207441.image) { actor207441.image.cacheRenderParams = false; }if (actor73714.image) { actor73714.image.cacheRenderParams = false; }if (actor94689.image) { actor94689.image.cacheRenderParams = false; }}
        body.vertices: [[-0.772341, 1.2093], [0.124098, 1.2093], [0.37292, -1.36334], [1.28518, -2.51628], [-0.772341, -2.40435]]
        id: actor210054
        inputs: [actor207439]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207439
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207439
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207441
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73714
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73714
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 3.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOn"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 2.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOff"
            }
        ]
        objectName: "actor210054"
        rotation: -153.29541
        visible: false
        x: 143.91423
        y: -10.238757
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor207442.image) { actor207442.image.cacheRenderParams = false; }if (actor235879.image) { actor235879.image.cacheRenderParams = false; }if (actor73711.image) { actor73711.image.cacheRenderParams = false; }if (actor94689.image) { actor94689.image.cacheRenderParams = false; }}
        body.vertices: [[-0.772341, 1.2093], [0.124098, 1.2093], [0.369433, -1.36608], [1.31759, -2.47535], [-0.772341, -2.40435]]
        id: actor210055
        inputs: [actor73711]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73711
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor73711
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor207442
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor235879
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 3.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOn"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 2.0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor94689
                targetProperty: "emitterLogic.timeOff"
            }
        ]
        objectName: "actor210055"
        rotation: -153.29541
        visible: false
        x: 143.9154
        y: -10.243519
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.01608, 1.75484], [1.51551, 1.75484], [1.51551, 0.498414], [-1.01608, 0.498414]]
        id: actor218043
        objectName: "actor218043"
        property alias image: graphic89
        x: 166.55795
        y: -7.578653
        z: -1
        ImageRenderer {
            cacheRenderParams: actor218043.body.bodyType === Body.StaticBody
            id: graphic89
            sizeScale: 4.1586676
            source: Util.getPathToImage("middleground_e2/deco_e2_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.49958, 0.641888], [0.453211, 0.641888], [0.453211, -0.613277], [-0.49958, -0.613277]]
        id: actor218044
        objectName: "actor218044"
        property alias image: graphic90
        rotation: -180
        x: 167.27643
        y: -13.03236
        z: -1
        ImageRenderer {
            cacheRenderParams: actor218044.body.bodyType === Body.StaticBody
            id: graphic90
            sizeScale: 1.6622362
            source: Util.getPathToImage("middleground_e2/deco_e2_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.42899, 0.551191], [0.389173, 0.551191], [0.389173, -0.637165], [-0.42899, -0.637165]]
        id: actor218045
        objectName: "actor218045"
        property alias image: graphic91
        rotation: -180
        x: 165.52899
        y: -13.687307
        z: -1
        ImageRenderer {
            cacheRenderParams: actor218045.body.bodyType === Body.StaticBody
            id: graphic91
            sizeScale: 1.4273664
            source: Util.getPathToImage("middleground_e2/deco_e2_rock04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[0.0799408, 2.68104], [0.709015, 2.68104], [0.709015, -1], [0.0799408, -1]]
        id: actor235879
        objectName: "actor235879"
        visible: false
        x: 139.67862
        y: -14.296454
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.486827, 0.67315], [0.559149, 0.67315], [0.559149, -0.133857], [-0.486827, -0.133857]]
        id: actor312197
        objectName: "actor312197"
        property alias image: graphic93
        x: 30.604574
        y: -14.428825
        z: -1
        ImageRenderer {
            cacheRenderParams: actor312197.body.bodyType === Body.StaticBody
            id: graphic93
            sizeScale: 1.6045117
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.41025, 0.567265], [0.471196, 0.567265], [0.471196, -0.112801], [-0.41025, -0.112801]]
        id: actor312198
        objectName: "actor312198"
        property alias image: graphic94
        x: 144.59009
        y: -16.485945
        z: -1
        ImageRenderer {
            cacheRenderParams: actor312198.body.bodyType === Body.StaticBody
            id: graphic94
            sizeScale: 1.3521252
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.585041, 0.808952], [0.671952, 0.808952], [0.671952, -0.160861], [-0.585041, -0.160861]]
        id: actor312199
        objectName: "actor312199"
        property alias image: graphic95
        x: 66.92306
        y: -8.643979
        z: -1
        ImageRenderer {
            cacheRenderParams: actor312199.body.bodyType === Body.StaticBody
            id: graphic95
            sizeScale: 1.9282086
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.379443, 0.524666], [0.435811, 0.524666], [0.435811, -0.104331], [-0.379443, -0.104331]]
        id: actor312200
        objectName: "actor312200"
        property alias image: graphic96
        x: 101.60786
        y: -9.68477
        z: -1
        ImageRenderer {
            cacheRenderParams: actor312200.body.bodyType === Body.StaticBody
            id: graphic96
            sizeScale: 1.2505871
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.friction: 0
        body.vertices: [[-1, 6.52781], [1.59739, 6.52781], [1.63033, 5.56842], [1.83721, 4.65622], [2.48453, 3.70811], [2.46292, 1.49164], [1.99564, 0.0422921], [1.21321, -1.29021], [-0.131694, -3.24465], [-0.988155, -3.24465]]
        id: actor317978
        objectName: "actor317978"
        property alias bodyRenderer: graphic97
        x: -0.95263577
        y: -22.983654
        z: -1
        TerrainMeshRenderer {
            id: graphic97
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic97baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "GuNtv++gzsBs4Gq/JiFLQNKBNr4y/klAGuNtv++gzsDSgTa+Mv5JQDx+kD/uRZ4/GuNtv++gzsA8fpA/7kWePxbD8z9wY6q9GuNtv++gzsAWw/M/cGOqvU1PF0DR+sC/GuNtv++gzsBNTxdA0frAv63iGEDPdWvAGuNtv++gzsCt4hhAz3VrwNFt3z9suJPAGuNtv++gzsDRbd8/bLiTwPz8wz9px7HA/PzDP2nHscA2ksM/upbOwBrjbb/voM7A"
            }
            PolygonVertexAttributeArray {
                id: graphic97baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "Z5cevlDgBECelRy+IinxPsNX87wSrfI+Z5cevlDgBEDDV/O8Eq3yPlCoQD4GPks/Z5cevlDgBEBQqEA+Bj5LPw+Coj5exoE/Z5cevlDgBEAPgqI+XsaBPxK/yT7OKaA/Z5cevlDgBEASv8k+zimgP+fYyz6afM4/Z5cevlDgBEDn2Ms+mnzOP+HzlD7zeuI/Z5cevlDgBEDh85Q+83riP6iogj7xhPY/qKiCPvGE9j96YYI+6dwEQGeXHr5Q4ARA"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic97baseMesha_position, graphic97baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic97edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "bOBqvyYhS0B/h4e/mi9UQHQOib/BJtPAbOBqvyYhS0B0Dom/wSbTwBrjbb/voM7AGuNtv++gzsB0Dom/wSbTwBdc1T/2MNPAGuNtv++gzsAXXNU/9jDTwDaSwz+6ls7ANpLDP7qWzsAXXNU/9jDTwGhg3T+lmbLANpLDP7qWzsBoYN0/pZmywPz8wz9px7HA/PzDP2nHscBoYN0/pZmywI/l9j8OR5bA/PzDP2nHscCP5fY/DkeWwNFt3z9suJPA0W3fP2y4k8CP5fY/DkeWwEIiJUBqLW/A0W3fP2y4k8BCIiVAai1vwK3iGEDPdWvAreIYQM91a8BCIiVAai1vwNLxI0Bv4by/reIYQM91a8DS8SNAb+G8v01PF0DR+sC/TU8XQNH6wL/S8SNAb+G8v6iPBUAAxLW6TU8XQNH6wL+ojwVAAMS1uhbD8z9wY6q9FsPzP3Bjqr2ojwVAAMS1uucWpj/zBKw/FsPzP3Bjqr3nFqY/8wSsPzx+kD/uRZ4/PH6QP+5Fnj/nFqY/8wSsPw1nrr2PUlVAPH6QP+5Fnj8NZ669j1JVQNKBNr4y/klA0oE2vjL+SUANZ669j1JVQH+Hh7+aL1RA0oE2vjL+SUB/h4e/mi9UQGzgar8mIUtA"
            }
            PolygonVertexAttributeArray {
                id: graphic97edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "npUcviIp8T6qtDS+3BXlPvC9Nr5AYgZAnpUcviIp8T7wvTa+QGIGQGeXHr5Q4ARAZ5cevlDgBEDwvTa+QGIGQGU9jj6oZQZAZ5cevlDgBEBlPY4+qGUGQHphgj7p3ARAemGCPuncBEBlPY4+qGUGQJuVkz4ZEfc/emGCPuncBECblZM+GRH3P6iogj7xhPY/qKiCPvGE9j+blZM+GRH3PwqZpD5fL+Q/qKiCPvGE9j8KmaQ+Xy/kP+HzlD7zeuI/4fOUPvN64j8KmaQ+Xy/kP64t3D7Ouc8/4fOUPvN64j+uLdw+zrnPP+fYyz6afM4/59jLPpp8zj+uLdw+zrnPP8OX2j7oep8/59jLPpp8zj/Dl9o+6HqfPxK/yT7OKaA/Er/JPs4poD/Dl9o+6HqfP+AUsj6TB4A/Er/JPs4poD/gFLI+kweAPw+Coj5exoE/D4KiPl7GgT/gFLI+kweAP99zXT4EqUY/D4KiPl7GgT/fc10+BKlGP1CoQD4GPks/UKhAPgY+Sz/fc10+BKlGP2eJaLzskeM+UKhAPgY+Sz9niWi87JHjPsNX87wSrfI+w1fzvBKt8j5niWi87JHjPqq0NL7cFeU+w1fzvBKt8j6qtDS+3BXlPp6VHL4iKfE+"
            }
            PolygonVertexAttributeArray {
                id: graphic97edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAAAtcHEAAAAAAAAAAAAAAgD8LXBxAAAAAAAtcHEAAAIA/C1wcQAAAgD8LXBxAAAAAAPDqRUAAAAAAC1wcQAAAgD/w6kVAAAAAAPDqRUAAAIA/8OpFQAAAgD/w6kVAAAAAAOpGVUAAAAAA8OpFQAAAgD/qRlVAAAAAAOpGVUAAAIA/6kZVQAAAgD/qRlVAAAAAADE+ZEAAAAAA6kZVQAAAgD8xPmRAAAAAADE+ZEAAAIA/MT5kQAAAgD8xPmRAAAAAAHScdkAAAAAAMT5kQAAAgD90nHZAAAAAAHScdkAAAIA/dJx2QAAAgD90nHZAAAAAAMMJjUAAAAAAdJx2QAAAgD/DCY1AAAAAAMMJjUAAAIA/wwmNQAAAgD/DCY1AAAAAAH04mUAAAAAAwwmNQAAAgD99OJlAAAAAAH04mUAAAIA/fTiZQAAAgD99OJlAAAAAACCVpUAAAAAAfTiZQAAAgD8glaVAAAAAACCVpUAAAIA/IJWlQAAAgD8glaVAAAAAAPSPuEAAAAAAIJWlQAAAgD/0j7hAAAAAAPSPuEAAAIA/9I+4QAAAgD/0j7hAAAAAAPxpv0AAAAAA9I+4QAAAgD/8ab9AAAAAAPxpv0AAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic97edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAPxCK6kAAAIA/AAAAAAAAgD8QiupAAACAPxCK6kAAAIA/EIrqQAAAgD8QiupAAACAPzRwFEEAAIA/EIrqQAAAgD80cBRBAACAPzRwFEEAAIA/NHAUQQAAgD80cBRBAACAPwAAIEEAAIA/NHAUQQAAgD8AACBBAACAPwAAIEEAAIA/AAAAAAAAgD8AAAAAAACAP1SXMz8AAIA/AAAAAAAAgD9UlzM/AACAP1SXMz8AAIA/VJczPwAAgD9UlzM/AACAPzsByD8AAIA/VJczPwAAgD87Acg/AACAPzsByD8AAIA/OwHIPwAAgD87Acg/AACAP9JlTkAAAIA/OwHIPwAAgD/SZU5AAACAP9JlTkAAAIA/0mVOQAAAgD/SZU5AAACAPxe/i0AAAIA/0mVOQAAAgD8Xv4tAAACAPxe/i0AAAIA/F7+LQAAAgD8Xv4tAAACAPwDVsEAAAIA/F7+LQAAAgD8A1bBAAACAPwDVsEAAAIA/ANWwQAAAgD8A1bBAAACAP3zF6UAAAIA/ANWwQAAAgD98xelAAACAP3zF6UAAAIA/fMXpQAAAgD98xelAAACAP5VT/kAAAIA/fMXpQAAAgD+VU/5AAACAP5VT/kAAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic97edgeMesha_position, graphic97edgeMesha_texCoord, graphic97edgeMesha_maskTexCoord, graphic97edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic97bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic97bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic97bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic97bevelMesha_position, graphic97bevelMesha_texCoord, graphic97bevelMesha_blendTexCoord]
            }
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor319013.image) { actor319013.image.cacheRenderParams = false; }if (actor319014.image) { actor319014.image.cacheRenderParams = false; }if (actor45931.image) { actor45931.image.cacheRenderParams = false; }}
        body.vertices: [[-4.82233, 1], [9.88012, 1], [9.88012, 0.0677719], [-4.82233, 0.0677719]]
        id: actor319015
        inputs: [actor319013]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor319014
                targetProperty: "visible"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: true
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor319014
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: 0
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor45931
                targetProperty: "emitterLogic.spawnRate"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor319013
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor319013
                targetProperty: "visible"
            }
        ]
        objectName: "actor319015"
        visible: false
        x: 66.12115
        y: -17.129435
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.508043], [0.521351, 0.508043], [0.521351, -0.00350833], [-0.424806, -0.00350833]]
        id: actor38406
        objectName: "actor38406"
        property alias image: graphic99
        x: 137.9462
        y: -19.988297
        z: -1
        ImageRenderer {
            cacheRenderParams: actor38406.body.bodyType === Body.StaticBody
            id: graphic99
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.vertices: [[-0.00387573, 3.88092], [1, 3.88092], [1, -23.3534], [-0.00387573, -23.3534]]
        id: actor5
        objectName: "actor5"
        visible: false
        x: 174.17499
        y: -10.638224
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[11.0841, 0.214382], [12.9795, 3.6211], [14.2353, 10.2829], [18.0549, 10.2842], [18.3809, 3.71038], [18.5049, 1.37896], [19.1827, -0.389792], [20.5036, -1.47211], [22.4166, -1.67088], [23.952, -1.18689], [24.5527, 0.332543], [24.4186, 4.38231], [23.017, 10.2886], [25.0933, 10.2892], [27.3661, 4.22215], [29.7455, 1.48479], [31.5411, 0.946896], [33.7235, 1.07604], [35.1283, 2.11332], [35.5385, 4.27079], [33.8935, 7.47227], [31.3074, 10.3506], [40.1395, 10.3498], [38.4505, 8.04802], [38.1547, 5.4339], [39.2782, 2.75887], [41.6156, 0.83549], [42.8342, 0.119844], [44.008, -0.324522], [45.2058, -0.556263], [46.393, -0.507453], [47.615, -0.266829], [48.6472, 0.18986], [49.6583, 0.980557], [50.6987, 2.11828], [51.4461, 3.25578], [52.1703, 4.82501], [52.9176, 5.94743], [53.7191, 6.42406], [54.6219, 6.53754], [55.2365, 6.89626], [55.4522, 7.71344], [54.5885, 8.59404], [51.6026, 9.22416], [51.1867, 10.3486], [58.4118, 10.3479], [57.8609, 9.25537], [58.2208, 8.06518], [58.9932, 7.53977], [59.918, 7.26584], [61.1822, 7.1191], [62.2396, 6.86888], [63.0088, 6.27887], [63.7819, 5.48595], [64.8013, 5.23421], [66.1292, 5.47963], [66.8863, 6.08709], [67.358, 6.90038], [68.2107, 10.3469], [76.1439, 10.3462], [80.7792, 6.90526], [85.8445, 4.38665], [87.6642, 3.86409], [89.5813, 3.62468], [91.305, 3.81146], [92.9435, 4.35325], [95.3976, 5.86985], [98.9558, 10.3439], [100.663, 10.3437], [99.6965, 6.1874], [100.196, 5.19459], [101.186, 4.84084], [102.518, 5.19886], [103.226, 6.26007], [104.061, 10.3433], [107.475, 10.3429], [110.022, 6.90214], [112.39, 5.13299], [115.337, 4.5288], [117.581, 5.03417], [119.129, 6.27465], [121.088, 10.3417], [128.306, 10.3409], [129.198, 6.68847], [131.691, 4.58881], [133.543, 4.84872], [135.534, 7.32692], [139.608, 9.03373], [140.773, 10.3165], [173.082, 10.3365], [173.094, -3.91588], [170.89, -3.10916], [168.437, -2.83593], [166.365, -3.22793], [165.081, -4.22583], [164.683, -5.44147], [164.9, -6.70549], [167.698, -7.54512], [170.664, -8.85185], [173.135, -10.8566], [173.163, -22.4094], [148.661, -22.3741], [148.597, -19.7408], [149.354, -16.9946], [149.966, -15.2599], [151.02, -14.1577], [151.603, -12.7937], [151.555, -11.8888], [151.406, -11.164], [151.013, -10.0792], [150.966, -8.53993], [150.797, -7.14705], [150.882, -5.64823], [150.567, -4.94114], [149.864, -4.38896], [148.147, -4.13061], [146.758, -4.13131], [145.686, -4.16784], [145.18, -4.2461], [144.83, -4.41015], [144.604, -4.56055], [144.429, -4.69374], [144.26, -4.97606], [144.12, -4.98875], [143.989, -4.88995], [143.333, -4.87986], [143.228, -4.91019], [143.104, -4.87362], [142.93, -4.69762], [142.812, -4.3639], [143.196, -4.04278], [143.511, -3.56256], [143.634, -2.93259], [143.533, -2.24862], [143.259, -1.70971], [142.83, -1.37184], [142.393, -1.18614], [142.351, -1.01829], [142.391, -0.666811], [142.706, -0.00486183], [143.752, 0.4977], [145.599, 0.72852], [147.557, 0.578933], [149.172, 0.175989], [150.979, 0.11583], [153.028, 0.19431], [154.278, -0.146905], [155.097, -0.783854], [155.949, -0.939489], [156.976, -0.767074], [158.875, -0.949285], [159.911, -1.85044], [160.323, -3.08236], [161.525, -3.40653], [162.692, -3.17274], [164.861, -1.94955], [166.117, -1.68037], [167.016, -1.15869], [167.225, -0.152214], [166.921, 1.49011], [166.42, 2.44976], [166.247, 3.1861], [166.217, 4.10653], [165.804, 4.43863], [164.427, 4.58398], [162.844, 4.65499], [161.392, 4.57682], [159.832, 4.51079], [156.002, 4.51666], [151.834, 4.39089], [149.996, 4.27169], [148.525, 4.22627], [147.527, 4.0806], [147.16, 3.96755], [146.809, 3.80528], [146.548, 3.8306], [146.342, 3.99106], [145.819, 4.80964], [145.215, 5.26153], [144.457, 5.37117], [143.518, 5.27485], [142.887, 4.64322], [142.508, 4.04248], [142.323, 3.58049], [142.088, 3.43204], [141.294, 3.27344], [140.554, 2.95395], [140.008, 2.30817], [139.664, 1.48679], [139.51, 0.463961], [139.465, -0.334097], [139.345, -0.534696], [138.319, -0.425015], [137.036, -0.399542], [135.041, -0.629368], [132.902, -0.950388], [131.164, -1.21538], [130.106, -1.39154], [129.162, -1.56251], [128.138, -1.69452], [127.201, -1.75232], [126.406, -1.74306], [125.829, -1.67933], [125.273, -1.51795], [124.662, -1.4044], [123.901, -1.45439], [123.44, -1.63503], [123.102, -1.90825], [122.85, -1.97019], [122.575, -1.92851], [121.876, -1.80883], [120.998, -1.69494], [119.751, -1.56701], [118.769, -1.39103], [118.369, -1.33088], [118.083, -1.07953], [118.019, -0.715683], [118.367, -0.538922], [118.658, -0.272707], [118.824, 0.273729], [119.223, 0.744294], [120.277, 0.855267], [121.138, 0.825504], [122.633, 0.627933], [123.408, 0.441608], [124.394, 0.517963], [125.064, 0.567983], [125.671, 0.614623], [126.395, 0.991137], [127.131, 1.25047], [127.291, 1.66515], [127.606, 2.12877], [128.103, 2.69762], [128.437, 3.42469], [128.233, 4.36666], [128.114, 4.71279], [127.937, 5.04006], [127.654, 5.28944], [127.369, 5.47404], [126.994, 5.62655], [126.593, 5.73296], [126.074, 5.81179], [125.57, 5.85017], [124.091, 5.85306], [123.534, 5.79257], [123.117, 5.68428], [122.701, 5.53561], [122.284, 5.31565], [121.958, 5.08838], [121.665, 4.80462], [121.441, 4.4489], [121.3, 4.09385], [121.213, 3.71483], [121.151, 3.32688], [120.767, 3.01158], [120.06, 2.92472], [119.477, 2.79939], [118.655, 2.36222], [118.197, 1.89239], [117.76, 1.38625], [117.539, 0.670949], [117.194, 0.574484], [116.974, 0.781346], [116.972, 1.13833], [116.943, 1.49385], [116.74, 1.85906], [116.488, 2.11229], [116.141, 2.33278], [115.641, 2.4967], [115.08, 2.57892], [114.254, 2.58078], [110.408, 2.59927], [107.522, 2.60579], [106.888, 2.54584], [106.685, 2.41524], [106.516, 2.416], [106.254, 2.5313], [105.913, 3.16686], [105.789, 3.40103], [105.58, 3.65302], [105.262, 3.77378], [104.891, 3.8427], [104.488, 3.83083], [104.041, 3.75456], [103.73, 3.50456], [103.611, 3.1236], [103.609, 2.82311], [103.531, 2.34064], [103.256, 2.23376], [102.979, 2.43264], [102.766, 2.48489], [102.55, 2.4989], [102.083, 2.42467], [101.652, 2.30292], [101.391, 2.13564], [101.219, 1.83659], [101.071, 1.79049], [100.981, 1.78433], [100.922, 1.93567], [100.833, 2.14036], [100.242, 2.1381], [100.133, 1.93079], [100.083, 1.79093], [99.9605, 1.78658], [99.8487, 1.83469], [99.8126, 1.97131], [99.7086, 2.14765], [99.4972, 2.27457], [99.0189, 2.38029], [98.3487, 2.45532], [94.5446, 2.4829], [92.8812, 2.42412], [91.5252, 2.2015], [90.6212, 2.01455], [89.7895, 1.9788], [88.9561, 2.03983], [88.2866, 2.23844], [87.6243, 2.38516], [86.8269, 2.51408], [85.9952, 2.56003], [85.0763, 2.481], [84.2743, 2.32493], [83.5079, 2.15321], [82.5944, 2.05676], [81.5749, 2.05385], [79.8213, 2.06969], [79.1035, 2.01471], [78.3463, 1.86972], [77.7712, 1.69753], [77.343, 1.46221], [77.0384, 1.15122], [76.8327, 0.819513], [76.645, 0.338408], [76.4254, 0.246207], [76.0259, 0.263015], [75.7263, 0.947681], [75.6567, 1.60515], [75.4671, 2.29735], [75.0591, 2.90345], [74.5116, 3.39594], [74.1437, 3.63041], [73.4745, 3.7835], [71.2913, 3.81932], [69.4121, 3.83732], [68.2964, 3.71035], [67.6845, 3.49308], [67.1539, 3.14694], [66.5977, 2.84168], [66.3928, 2.8056], [66.2374, 2.95997], [66.0985, 3.1654], [65.5117, 3.17279], [65.3917, 2.945], [65.2651, 2.79599], [65.0996, 2.82216], [64.4727, 3.09505], [63.9943, 3.49173], [63.4972, 3.8621], [62.89, 4.21538], [62.3291, 4.42285], [61.7845, 4.59788], [61.068, 4.80187], [60.5838, 4.8935], [60.1677, 4.93677], [59.655, 4.99384], [58.6702, 5.038], [57.7596, 5.07], [56.5646, 5.02609], [55.77, 4.92748], [54.9573, 4.70943], [54.2148, 4.32325], [53.6573, 3.7169], [53.4141, 2.83693], [53.4053, 1.96083], [53.5393, 1.07298], [53.8245, 0.468057], [54.3891, -0.085192], [55.1859, -0.412803], [56.1126, -0.606948], [57.0273, -0.642099], [57.8061, -0.631656], [58.6057, -0.46267], [59.6262, -0.0885947], [60.525, 0.57092], [61.1596, 1.32672], [61.9314, 1.67175], [62.5701, 1.75743], [63.0725, 1.54376], [63.3657, 1.21035], [63.6458, 1.00683], [63.9112, 0.94879], [64.0351, 0.784821], [64.1181, -0.11411], [64.1007, -0.99321], [64.2686, -1.7454], [64.0288, -2.08268], [63.4185, -2.38007], [62.7909, -2.70118], [62.2821, -3.05699], [61.8629, -3.44859], [61.5274, -3.80678], [61.2742, -4.19811], [61.1075, -4.52252], [60.8048, -4.58617], [60.3761, -4.48341], [60.002, -4.16072], [59.9221, -3.70493], [59.6052, -3.28135], [59.0853, -2.98861], [58.3362, -2.84612], [57.636, -2.75588], [55.9864, -2.69078], [52.9442, -2.66415], [50.2309, -2.71957], [48.2283, -2.94224], [46.8383, -3.40951], [46.0818, -3.84338], [45.083, -4.51024], [44.738, -4.68155], [44.4941, -4.68238], [44.3354, -4.4656], [44.3188, -3.76917], [44.155, -3.23071], [43.7998, -2.76951], [43.0406, -2.29987], [41.9667, -2.00573], [40.0914, -1.89158], [38.5116, -1.86176], [37.0238, -1.86768], [35.2348, -2.31627], [34.2419, -2.75607], [33.1752, -3.45292], [32.0949, -3.72666], [31.68, -3.79125], [31.3074, -3.5622], [30.9222, -3.19798], [30.6266, -2.98643], [30.3618, -2.93209], [30.1293, -2.96578], [30.002, -2.8048], [29.75, -2.74274], [29.3747, -2.7358], [29.1282, -2.78407], [29.0554, -2.9515], [28.8566, -2.91582], [28.5902, -2.97956], [28.2966, -3.17314], [27.8617, -3.62284], [27.4693, -3.84632], [27.0937, -3.80702], [26.4168, -3.45967], [25.6351, -3.05676], [24.7526, -2.81408], [20.4302, -2.81543], [19.2263, -2.80325], [18.7084, -2.64157], [18.1965, -2.27449], [17.5846, -2.1064], [16.8331, -2.04543], [15.5989, -2.03816], [14.8861, -2.18062], [14.3698, -2.3523], [13.8697, -2.61118], [13.096, -2.85063], [12.4037, -2.86958], [11.5061, -2.88873], [10.8329, -2.9885], [10.3152, -3.31359], [9.94448, -3.79644], [9.63703, -4.23145], [9.21548, -4.60252], [8.62881, -4.8924], [7.9654, -4.98293], [7.42535, -5.00756], [6.86176, -4.94076], [6.49132, -4.82069], [6.09078, -4.73089], [5.53815, -4.72818], [5.02109, -4.81021], [4.69281, -4.84166], [0.601374, -4.85152], [-2.14346, -4.86144], [-2.13117, -1.34902], [2.46625, -2.65277], [4.50229, -2.98558], [6.54778, -2.92743], [8.26611, -2.44598], [9.71096, -1.44721]]
        id: actor30
        objectName: "actor30"
        property alias bodyRenderer: graphic101
        x: 1.0456265
        y: -11.597358
        TerrainMeshRenderer {
            id: graphic101
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic101baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic101baseMesha_position, graphic101baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic101edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic101edgeMesha_position, graphic101edgeMesha_texCoord, graphic101edgeMesha_maskTexCoord, graphic101edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic101bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic101bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic101bevelMesha_position, graphic101bevelMesha_texCoord, graphic101bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.vertices: [[-1, 1], [175.237, 1], [175.237, -1], [-1, -1]]
        id: actor14856
        objectName: "actor14856"
        y: -35
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[0.571103, -0.320971], [0.0680246, 0.338035], [-0.872375, 0.480381], [-2.33947, 0.38559], [-3.76043, 0.6353], [-5.14227, 0.531137], [-5.7967, 0.638336], [-7.01784, -0.777063], [-6.99321, -0.981027], [-6.78823, -0.967827], [-6.46957, -0.786602], [-6.15392, -0.631241], [-5.77813, -0.46397], [-5.45078, -0.39397], [-5.03318, -0.375992], [-3.94012, -0.46735], [-2.76447, -0.6587], [-2.20658, -0.677515], [-1.42231, -0.765095], [0.690508, -0.950679], [0.848165, -0.870123], [0.936319, -0.712238]]
        id: actor36627
        objectName: "actor36627"
        x: 110.6629
        y: -12.544608
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.377018, 0.00159645], [-0.0680246, 0.338035], [0.872375, 0.480381], [2.33947, 0.38559], [3.76043, 0.6353], [5.14227, 0.531137], [5.7967, 0.638336], [7.01784, -0.777063], [6.99321, -0.981027], [6.78028, -0.984679], [6.46199, -0.820118], [6.15392, -0.631241], [5.77869, -0.488963], [5.45078, -0.39397], [5.0417, -0.384134], [4.25471, -0.437193], [1.5761, -0.588234], [-0.0897152, -0.870313], [-0.533859, -0.844015], [-0.805981, -0.771084], [-0.900282, -0.601578]]
        id: actor36630
        objectName: "actor36630"
        visible: false
        x: 133.50845
        y: -20.461147
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[0.410355, 0.118265], [0.0680246, 0.338035], [-0.872375, 0.480381], [-2.27044, 0.592717], [-3.76043, 0.6353], [-5.08186, 0.729633], [-5.7967, 0.638336], [-6.59571, 0.287949], [-6.91904, -0.152811], [-6.92654, -0.622693], [-6.72194, -0.818013], [-6.45366, -0.711784], [-6.11226, -0.539576], [-5.77036, -0.422297], [-5.45078, -0.39397], [-5.0417, -0.384134], [-4.25471, -0.437193], [-1.56747, -0.545082], [0.0230496, -0.603645], [0.694271, -0.838352], [0.905983, -0.68775], [1.00028, -0.518244], [0.704584, -0.0570255]]
        id: actor36633
        objectName: "actor36633"
        visible: false
        x: 121.66179
        y: -21.678076
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[1.37283, 0.151336], [1.09588, 0.239379], [0.594695, 0.322516], [-0.172217, 0.346031], [-2.00412, 0.338583], [-2.70838, 0.388857], [-3.08935, 0.340201], [-3.51518, 0.153462], [-3.6875, -0.0814406], [-3.6915, -0.331864], [-3.49902, -0.36942], [-3.27407, -0.337187], [-3.05877, -0.248219], [-2.87191, -0.200044], [-2.60096, -0.204724], [-2.26709, -0.173796], [0.214864, -0.208214], [0.545311, -0.25408], [0.824319, -0.317735], [1.06403, -0.379561], [1.29455, -0.472849], [1.49749, -0.472087], [1.60605, -0.339349], [1.53963, -0.0299421]]
        id: actor36675
        objectName: "actor36675"
        visible: false
        x: 38.262703
        y: -24.418474
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.12391, 0.123895], [-0.897173, 0.195974], [-0.486863, 0.264036], [0.14099, 0.283288], [1.64073, 0.27719], [2.21729, 0.318349], [2.52918, 0.278515], [2.8778, 0.125636], [3.01887, -0.0666736], [3.02215, -0.27169], [2.86285, -0.273105], [2.6804, -0.276047], [2.50415, -0.203211], [2.35117, -0.163771], [2.12935, -0.167603], [1.85602, -0.142282], [-0.175904, -0.17046], [-0.446434, -0.208009], [-0.674851, -0.260123], [-0.871095, -0.310738], [-1.05982, -0.387111], [-1.22596, -0.386487], [-1.31483, -0.277818], [-1.26046, -0.0245129]]
        id: actor36677
        objectName: "actor36677"
        visible: false
        x: 60.93968
        y: -25.181107
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.706267, 0.58887], [0.408332, 0.58887], [0.408332, 0.0736857], [-0.706267, 0.0736857]]
        id: actor38174
        objectName: "actor38174"
        property alias image: graphic108
        x: 37.845448
        y: -23.853146
        ImageRenderer {
            cacheRenderParams: actor38174.body.bodyType === Body.StaticBody
            id: graphic108
            sizeScale: 2.5396512
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.80171, 3.19134], [2.56794, 3.19134], [2.56794, 2.39327], [-2.80171, 2.39327]]
        id: actor38185
        objectName: "actor38185"
        property alias image: graphic109
        rotation: -0.75
        x: 136.52231
        y: -23.205044
        ImageRenderer {
            cacheRenderParams: actor38185.body.bodyType === Body.StaticBody
            id: graphic109
            sizeScale: 7.9707203
            source: Util.getPathToImage("middleground_e1/deco_e1_platform01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, -0.158253], [0.521351, -0.158253], [0.521351, -1.08092], [-0.424806, -1.08092]]
        id: actor38186
        objectName: "actor38186"
        property alias image: graphic110
        x: 94.99871
        y: -37.88969
        ImageRenderer {
            cacheRenderParams: actor38186.body.bodyType === Body.StaticBody
            id: graphic110
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.341066, 0.0862524], [0.41858, 0.0862524], [0.41858, -1.08584], [-0.341066, -1.08584]]
        id: actor38187
        objectName: "actor38187"
        property alias image: graphic111
        x: 119.2811
        y: -20.656126
        ImageRenderer {
            cacheRenderParams: actor38187.body.bodyType === Body.StaticBody
            id: graphic111
            sizeScale: 1.5352212
            source: Util.getPathToImage("middleground_e1/deco_e1_vines03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor38106
        objectName: "actor38106"
        property alias image: graphic112
        rotation: 2.6999998
        x: 61.811954
        y: -26.647228
        ImageRenderer {
            cacheRenderParams: actor38106.body.bodyType === Body.StaticBody
            id: graphic112
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.92689, 2.31646], [1.76611, 2.31646], [1.76611, 1.76625], [-1.92689, 1.76625]]
        id: actor38105
        objectName: "actor38105"
        property alias image: graphic113
        x: 37.211433
        y: -26.198343
        ImageRenderer {
            cacheRenderParams: actor38105.body.bodyType === Body.StaticBody
            id: graphic113
            sizeScale: 5.4818897
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.80171, 2.27946], [2.56794, 2.27946], [2.56794, 1.23202], [-2.80171, 1.23202]]
        id: actor37993
        objectName: "actor37993"
        property alias image: graphic114
        x: 118.66524
        y: -23.221968
        ImageRenderer {
            cacheRenderParams: actor37993.body.bodyType === Body.StaticBody
            id: graphic114
            sizeScale: 7.9707203
            source: Util.getPathToImage("middleground_e1/deco_e1_platform02.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.536827, 2.23757], [-1.26414, 2.09473], [-1.9561, 1.86243], [-2.11207, 2.13862], [-1.60947, 2.60817], [-1.33761, 3.12592], [-0.639282, 3.65777], [0.466063, 3.43565], [1.78933, 2.69615], [2.32137, 2.57957], [2.77691, 2.60748], [3.15329, 2.21787], [3.54111, 1.28378], [3.70847, 0.434036], [3.49608, -0.259852], [3.33374, -0.635308], [2.86943, -0.885938], [2.37041, -1.01822], [1.83541, -1.12506], [1.27215, -1.25373], [0.522256, -1.43821], [-0.153091, -1.70404], [-0.580292, -1.9468], [-0.936362, -2.34179], [-1.14642, -2.71829], [-1.42568, -2.75143], [-1.69412, -2.40011], [-2.40711, -1.78269], [-2.74724, -1.30658], [-2.39362, -0.513967], [-2.08861, -0.321155], [-1.69177, -0.614386], [-1.23239, -0.829469], [-0.560232, -0.89696], [0.169225, -0.870228], [0.79759, -0.746286], [1.30854, -0.480495], [1.59376, -0.109571], [1.69751, 0.365912], [1.69595, 0.974399], [1.60891, 1.49745], [1.28086, 1.89421], [0.800535, 2.14826], [0.123712, 2.24151]]
        id: actor38924
        objectName: "actor38924"
        visible: false
        x: 70.6103
        y: -12.97536
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[6.1863, -0.0818149], [6.51935, -0.231906], [6.82808, -0.821226], [7.47956, -1.21192], [7.58785, -1.78722], [7.08296, -1.92657], [5.00452, -1.85612], [3.64071, -1.9037], [1.59928, -1.99283], [0.0810202, -2.11502], [-1.14711, -2.29692], [-1.97389, -2.47173], [-2.4897, -2.68797], [-2.92652, -2.96279], [-3.2588, -2.76998], [-3.33161, -2.47514], [-3.06067, -2.27318], [-2.90284, -2.0504], [-2.77002, -1.64528], [-2.80207, -1.24239], [-2.96387, -0.943814], [-3.26464, -0.696053], [-3.19189, -0.433838], [-2.95363, -0.390053], [-2.50692, -0.441725], [-2.08481, -0.757124], [-1.51871, -1.02218], [-0.603519, -1.10535], [0.278034, -1.10715], [1.41723, -0.989166], [2.38956, -0.605907], [3.7815, -0.27396], [5.07849, -0.0196011]]
        id: actor38959
        objectName: "actor38959"
        visible: false
        x: 30.419617
        y: -17.915077
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-2.94421, -0.49113], [-3.27726, -0.481279], [-3.81444, -0.492666], [-4.28984, -0.996212], [-4.67388, -1.37041], [-4.76362, -2.06826], [-4.57132, -2.41253], [-4.31613, -2.43882], [-3.61537, -2.32043], [-2.73091, -2.0118], [-1.82782, -1.90585], [-0.727525, -1.93509], [0.120668, -2.01052], [1.20326, -2.10127], [2.0521, -2.1785], [2.71996, -2.24348], [3.18861, -2.14147], [3.14584, -1.64172], [2.78618, -1.08349], [2.42952, -0.701146], [2.06893, -0.598228], [1.36527, -0.725737], [0.427685, -0.638866], [-0.46617, -0.505333], [-1.51566, -0.853828], [-2.42647, -0.716636]]
        id: actor38960
        objectName: "actor38960"
        visible: false
        x: 18.768986
        y: -18.544367
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[4.61341, -0.899589], [5.16892, -0.761795], [5.77863, -0.78843], [6.32542, -1.36233], [6.26359, -1.88528], [5.26145, -2.0508], [3.94198, -2.08504], [1.59928, -2.03208], [0.0941046, -2.04959], [-1.17783, -2.18371], [-2.08856, -2.52562], [-2.67789, -2.58331], [-3.3504, -2.37741], [-3.28036, -1.8154], [-2.72938, -1.30538], [-2.08481, -0.665521], [-1.47945, -0.681946], [-0.407233, -0.79129], [0.539749, -0.780008], [1.49575, -0.688196], [2.67971, -0.607565], [3.98978, -0.902803]]
        id: actor38962
        objectName: "actor38962"
        visible: false
        x: 52.795048
        y: -17.284868
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[1.83401, -0.982026], [2.24819, -1.18577], [2.55169, -1.76593], [3.01604, -2.08073], [3.21676, -2.45492], [3.02427, -2.67236], [2.61633, -2.676], [2.37727, -2.56959], [2.18462, -2.48455], [1.96038, -2.41446], [1.73586, -2.36556], [1.22634, -2.30374], [0.548866, -2.26673], [-1.02474, -2.26615], [-2.2181, -2.3843], [-3.03121, -2.46554], [-3.30328, -2.31853], [-3.18615, -1.88606], [-2.68227, -1.5527], [-2.09659, -1.41926], [-1.47945, -1.04704], [-0.594338, -1.07865], [1.02194, -0.997018]]
        id: actor38963
        objectName: "actor38963"
        visible: false
        x: 53.155846
        y: -22.516592
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.83401, -0.982026], [-2.24819, -1.18577], [-2.55169, -1.76593], [-3.01604, -2.08073], [-3.21676, -2.45492], [-2.9945, -2.75007], [-2.49201, -2.72799], [-2.13014, -2.52265], [-1.73966, -2.40502], [-1.22634, -2.30374], [-0.548866, -2.26673], [1.02474, -2.26615], [2.2181, -2.3843], [3.03121, -2.46554], [3.30328, -2.31853], [3.18615, -1.88606], [2.68227, -1.5527], [2.09659, -1.41926], [1.47945, -1.04704], [0.594338, -1.07865], [-1.02194, -0.997018]]
        id: actor38965
        objectName: "actor38965"
        visible: false
        x: 78.29561
        y: -14.745759
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[1.60381, -0.858768], [1.96601, -1.03694], [2.37972, -1.20724], [2.92087, -1.67493], [2.70602, -2.12516], [2.18571, -2.22718], [1.86278, -2.20602], [1.11686, -2.1436], [0.384848, -2.13592], [-0.328923, -2.27882], [-0.833955, -2.25813], [-1.2736, -2.1435], [-1.99363, -2.19289], [-2.73164, -2.22348], [-2.90216, -2.01404], [-2.78624, -1.64933], [-2.33212, -1.45219], [-1.793, -1.36246], [-1.21286, -1.10436], [-0.371441, -1.07808], [0.893669, -0.871879]]
        id: actor38967
        objectName: "actor38967"
        visible: false
        x: 95.49454
        y: -11.786798
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.999061, -0.794234], [-1.37305, -0.899305], [-1.76478, -0.892407], [-2.01353, -1.15463], [-1.86543, -1.465], [-1.54225, -1.60636], [-1.24862, -1.60953], [-0.769917, -1.53098], [-0.265299, -1.47242], [0.120212, -1.46439], [0.574896, -1.46788], [0.877973, -1.47764], [1.37433, -1.51169], [1.88309, -1.53278], [2.00063, -1.3884], [1.92073, -1.13699], [1.62543, -0.983326], [1.37808, -0.804084], [0.924874, -0.697191], [0.286071, -0.603866], [-0.603802, -0.586015]]
        id: actor38969
        objectName: "actor38969"
        visible: false
        x: 115.51693
        y: -13.713027
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[4.61341, -0.899589], [5.16892, -0.761795], [5.77863, -0.78843], [6.32542, -1.36233], [6.26359, -1.88528], [5.26145, -1.98948], [3.94198, -2.08504], [1.59928, -2.01001], [0.0941046, -2.04959], [-1.18617, -2.16704], [-2.08856, -2.52562], [-2.67789, -2.58331], [-3.3504, -2.37741], [-3.27301, -1.82275], [-2.67053, -1.32745], [-2.08481, -0.665521], [-1.47945, -0.681946], [-0.407233, -0.79129], [0.539749, -0.794721], [1.49575, -0.688196], [2.67971, -0.607565], [3.98978, -0.902803]]
        id: actor38970
        objectName: "actor38970"
        visible: false
        x: 134.6505
        y: -14.18466
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.706267, 0.58887], [0.408332, 0.58887], [0.408332, 0.0736857], [-0.706267, 0.0736857]]
        id: actor38979
        objectName: "actor38979"
        property alias image: graphic124
        x: 92.64093
        y: -38.6903
        ImageRenderer {
            cacheRenderParams: actor38979.body.bodyType === Body.StaticBody
            id: graphic124
            sizeScale: 2.5396512
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, -0.158253], [0.521351, -0.158253], [0.521351, -1.08092], [-0.424806, -1.08092]]
        id: actor38980
        objectName: "actor38980"
        property alias image: graphic125
        x: 110.24431
        y: -11.577817
        ImageRenderer {
            cacheRenderParams: actor38980.body.bodyType === Body.StaticBody
            id: graphic125
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.82456, 3.22708], [2.58889, 3.22708], [2.58854, 2.46025], [-2.85133, 2.43312]]
        id: actor38981
        objectName: "actor38981"
        property alias image: graphic126
        rotation: -0.75
        x: 107.57324
        y: -15.386544
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor38981.body.bodyType === Body.StaticBody
            id: graphic126
            sizeScale: -8.035722
            source: Util.getPathToImage("middleground_e1/deco_e1_platform03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.84921, 4.3845], [3.52804, 4.3845], [3.52804, 3.28805], [-3.84921, 3.28805]]
        id: actor39055
        objectName: "actor39055"
        property alias image: graphic127
        x: 32.503613
        y: -23.207834
        ImageRenderer {
            cacheRenderParams: actor39055.body.bodyType === Body.StaticBody
            id: graphic127
            sizeScale: 10.950779
            source: Util.getPathToImage("middleground_e1/deco_e1_platform05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.86841, 3.26731], [2.62907, 3.26731], [2.62907, 2.45024], [-2.86841, 2.45024]]
        id: actor39136
        objectName: "actor39136"
        property alias image: graphic128
        x: 17.967056
        y: -22.344486
        ImageRenderer {
            cacheRenderParams: actor39136.body.bodyType === Body.StaticBody
            id: graphic128
            sizeScale: 8.160457
            source: Util.getPathToImage("middleground_e1/deco_e1_platform06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.40396, 3.87734], [3.11994, 3.87734], [3.11994, 2.90771], [-3.40396, 2.90771]]
        id: actor39218
        objectName: "actor39218"
        property alias image: graphic129
        x: 54.263382
        y: -22.327522
        ImageRenderer {
            cacheRenderParams: actor39218.body.bodyType === Body.StaticBody
            id: graphic129
            sizeScale: 9.684077
            source: Util.getPathToImage("middleground_e1/deco_e1_platform07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-3.40396, 3.87734], [3.11994, 3.87734], [3.11994, 2.90771], [-3.40396, 2.90771]]
        id: actor39219
        objectName: "actor39219"
        property alias image: graphic130
        x: 136.11862
        y: -19.204405
        ImageRenderer {
            cacheRenderParams: actor39219.body.bodyType === Body.StaticBody
            id: graphic130
            sizeScale: 9.684077
            source: Util.getPathToImage("middleground_e1/deco_e1_platform07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.31242, 2.634], [2.11947, 2.634], [2.11947, 1.9753], [-2.31242, 1.9753]]
        id: actor39220
        objectName: "actor39220"
        property alias image: graphic131
        x: 53.061703
        y: -26.643017
        ImageRenderer {
            cacheRenderParams: actor39220.body.bodyType === Body.StaticBody
            id: graphic131
            sizeScale: 6.5786977
            source: Util.getPathToImage("middleground_e1/deco_e1_platform08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.31242, 2.634], [2.11947, 2.634], [2.11947, 1.9753], [-2.31242, 1.9753]]
        id: actor39221
        objectName: "actor39221"
        property alias image: graphic132
        x: 78.33165
        y: -18.588512
        ImageRenderer {
            cacheRenderParams: actor39221.body.bodyType === Body.StaticBody
            id: graphic132
            sizeScale: 6.5786977
            source: Util.getPathToImage("middleground_e1/deco_e1_platform09.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[1.6846, 1.96564], [2.83721, 1.96564], [2.83721, -1.30036], [1.6846, -1.30036]]
        id: actor39392
        objectName: "actor39392"
        property alias image: graphic133
        x: 71.10984
        y: -12.561542
        ImageRenderer {
            cacheRenderParams: actor39392.body.bodyType === Body.StaticBody
            id: graphic133
            sizeScale: 6.5786977
            source: Util.getPathToImage("middleground_e1/deco_e1_platform10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.08306, 2.37274], [1.90925, 2.37274], [1.90925, 1.77938], [-2.08306, 1.77938]]
        id: actor39407
        objectName: "actor39407"
        property alias image: graphic134
        x: 95.48149
        y: -15.389784
        ImageRenderer {
            cacheRenderParams: actor39407.body.bodyType === Body.StaticBody
            id: graphic134
            sizeScale: 5.926182
            source: Util.getPathToImage("middleground_e1/deco_e1_platform12.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.43251, 1.68257], [1.31299, 1.68257], [1.31299, 0.951516], [-1.43251, 0.951516]]
        id: actor39421
        objectName: "actor39421"
        property alias image: graphic135
        x: 115.51245
        y: -16.006847
        ImageRenderer {
            cacheRenderParams: actor39421.body.bodyType === Body.StaticBody
            id: graphic135
            sizeScale: 4.075423
            source: Util.getPathToImage("middleground_e1/deco_e1_platform11.png")
        }
    }
    Polygon {
        body.density: 2
        body.friction: 0.1
        body.vertices: [[-0.442596, 0.770918], [-0.000545487, 0.812722], [0.37679, 0.815828], [0.645743, 0.720197], [0.963255, 0.424225], [1.02053, 0.04594], [0.892083, -0.372041], [0.649974, -0.739885], [0.215911, -0.926727], [-0.0522287, -0.931413], [-0.349049, -0.818612], [-0.509301, -0.674906], [-0.776819, -0.403785], [-0.902842, 0.238944], [-0.749211, 0.600293]]
        id: actor39980
        objectName: "actor39980"
        property alias image: graphic136
        rotation: -5.956248
        x: 144.49911
        y: -17.324152
        ImageRenderer {
            cacheRenderParams: actor39980.body.bodyType === Body.StaticBody
            id: graphic136
            sizeScale: 1.9499998
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder01.png")
            x: 0.0525
            y: -0.14000008
        }
    }
    WaterBody {
        body.vertices: [[-1.22659, -0.592641], [-1.12545, -0.222634], [-0.843729, 0.0260118], [-0.187959, 0.121434], [0.606709, -0.0177886], [0.832774, -0.286394], [1.00659, -0.586268]]
        emitterLogic.decayTime: 1.66666675359011
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer1
        emitterLogic.spawnRate: 1
        emitterLogic.spawnStride: 2.6
        id: actor45057
        objectName: "actor45057"
        x: 105.95162
        y: -7.9124384
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.pauseDistance: 12
        emitterLogic.requestedMaxEntityCount: 700
        emitterLogic.spawnRate: 7
        emitterLogic.spawnSpread: 0.40749997
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 5
        emitterLogic.timeOn: 5
        id: actor45265
        objectName: "actor45265"
        rotation: -180
        visible: false
        x: 30.615374
        y: -14.418662
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.pauseDistance: 16
        emitterLogic.requestedMaxEntityCount: 700
        emitterLogic.spawnRate: 5
        emitterLogic.spawnSpread: 0.40749997
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 5
        emitterLogic.timeOn: 4
        id: actor45931
        objectName: "actor45931"
        rotation: -180
        visible: false
        x: 66.881546
        y: -8.526088
    }
    WaterBody {
        body.vertices: [[-4.08409, 0.00426865], [-2.97359, 0.102285], [-0.0205588, 0.151837], [2.98948, 0.115386], [4.58892, 0.0270896], [5.70633, -0.176642], [-5.19514, -0.176498]]
        emitterLogic.layer: particleLayer1
        emitterLogic.spawnRate: 2
        emitterLogic.spawnStride: 2
        id: actor45932
        objectName: "actor45932"
        x: 54.46601
        y: -14.446171
    }
    WaterBody {
        body.vertices: [[-1.01901, 0.0502161], [-0.021295, 0.118681], [0.736422, 0.0913659], [1.55982, -0.0454646], [2.10398, -0.159949], [-2.15138, -0.193658], [-1.73207, -0.0734659]]
        emitterLogic.layer: particleLayer1
        emitterLogic.spawnRate: 2
        emitterLogic.spawnStride: 1.5
        id: actor46030
        objectName: "actor46030"
        x: 87.13466
        y: -9.199487
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.requestedMaxEntityCount: 700
        emitterLogic.spawnRate: 5
        emitterLogic.spawnSpread: 0.42499998
        emitterLogic.spawnVelocity: 10
        emitterLogic.timeOff: 4
        emitterLogic.timeOn: 4
        id: actor46619
        objectName: "actor46619"
        rotation: -180
        visible: false
        x: 101.58026
        y: -9.52496
    }
    Polygon {
        body.active: false
        body.vertices: [[1.6846, 1.96564], [2.83721, 1.96564], [2.83721, -1.30036], [1.6846, -1.30036]]
        id: actor59520
        objectName: "actor59520"
        property alias image: graphic143
        x: 62.08879
        y: -13.075184
        ImageRenderer {
            cacheRenderParams: actor59520.body.bodyType === Body.StaticBody
            id: graphic143
            sizeScale: 6.5786977
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.53085, 1.80163], [1.47258, 1.80163], [1.47258, -0.292887], [-1.53085, -0.292887]]
        id: actor65714
        objectName: "actor65714"
        property alias image: graphic144
        x: 121.73397
        y: -12.596114
        ImageRenderer {
            cacheRenderParams: actor65714.body.bodyType === Body.StaticBody
            id: graphic144
            sizeScale: 5.370876
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.487043, 0.970334], [0.297157, 0.970334], [0.297157, -0.285569], [-0.487043, -0.285569]]
        id: actor65859
        objectName: "actor65859"
        property alias image: graphic145
        x: 118.527695
        y: -10.100515
        ImageRenderer {
            cacheRenderParams: actor65859.body.bodyType === Body.StaticBody
            id: graphic145
            sizeScale: 2.8926861
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique04.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67710
        objectName: "actor67710"
        x: 12.058615
        y: -15.080269
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67711
        objectName: "actor67711"
        x: 10.023527
        y: -17.264479
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67712
        objectName: "actor67712"
        x: 12.782858
        y: -16.649979
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67713
        objectName: "actor67713"
        x: 14.9688
        y: -15.061468
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67714
        objectName: "actor67714"
        x: 21.281301
        y: -15.487013
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67715
        objectName: "actor67715"
        x: 30.672647
        y: -16.36269
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67716
        objectName: "actor67716"
        x: 30.63584
        y: -18.368711
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67717
        objectName: "actor67717"
        x: 26.94111
        y: -19.60314
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67719
        objectName: "actor67719"
        x: 24.528114
        y: -20.79645
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67720
        objectName: "actor67720"
        x: 116.02882
        y: -22.469692
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67721
        objectName: "actor67721"
        x: 20.166548
        y: -21.294226
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67722
        objectName: "actor67722"
        x: 15.577825
        y: -21.309586
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67724
        objectName: "actor67724"
        x: 35.98021
        y: -24.923048
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67725
        objectName: "actor67725"
        x: 47.13788
        y: -23.990183
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67726
        objectName: "actor67726"
        x: 42.407978
        y: -23.768837
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67727
        objectName: "actor67727"
        x: 38.555763
        y: -25.014177
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67728
        objectName: "actor67728"
        x: 53.09358
        y: -25.198803
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67729
        objectName: "actor67729"
        x: 62.047745
        y: -26.210926
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67730
        objectName: "actor67730"
        x: 44.90825
        y: -18.064411
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67731
        objectName: "actor67731"
        x: 44.931313
        y: -20.287642
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67732
        objectName: "actor67732"
        x: 41.95631
        y: -19.263638
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67733
        objectName: "actor67733"
        x: 39.234985
        y: -20.255306
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67734
        objectName: "actor67734"
        x: 35.293728
        y: -20.39813
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67735
        objectName: "actor67735"
        x: 29.97994
        y: -20.714952
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67736
        objectName: "actor67736"
        x: 33.58737
        y: -15.93876
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67737
        objectName: "actor67737"
        x: 27.941381
        y: -15.954311
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67738
        objectName: "actor67738"
        x: 38.865677
        y: -14.123599
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67739
        objectName: "actor67739"
        x: 42.042206
        y: -14.099717
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67740
        objectName: "actor67740"
        x: 44.88437
        y: -15.676042
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67741
        objectName: "actor67741"
        x: 51.098717
        y: -20.137169
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67742
        objectName: "actor67742"
        x: 53.91093
        y: -19.811888
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67743
        objectName: "actor67743"
        x: 56.832386
        y: -19.806734
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67745
        objectName: "actor67745"
        x: 51.611443
        y: -14.612237
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67746
        objectName: "actor67746"
        x: 56.639122
        y: -14.569222
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67747
        objectName: "actor67747"
        x: 60.741592
        y: -17.159798
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67748
        objectName: "actor67748"
        x: 61.53702
        y: -19.307743
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67749
        objectName: "actor67749"
        x: 62.489914
        y: -17.159798
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67750
        objectName: "actor67750"
        x: 63.80985
        y: -15.232266
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67751
        objectName: "actor67751"
        x: 65.44406
        y: -14.038035
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67752
        objectName: "actor67752"
        x: 69.445786
        y: -11.356254
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67753
        objectName: "actor67753"
        x: 71.142845
        y: -11.146739
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67754
        objectName: "actor67754"
        x: 71.91805
        y: -12.466679
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67755
        objectName: "actor67755"
        x: 70.68193
        y: -13.493297
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67756
        objectName: "actor67756"
        x: 69.04771
        y: -13.116172
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67757
        objectName: "actor67757"
        x: 66.76045
        y: -15.598324
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67758
        objectName: "actor67758"
        x: 66.781395
        y: -12.204786
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67759
        objectName: "actor67759"
        x: 66.84928
        y: -9.625248
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67760
        objectName: "actor67760"
        x: 63.205944
        y: -7.6729283
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67761
        objectName: "actor67761"
        x: 59.273865
        y: -7.062681
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67762
        objectName: "actor67762"
        x: 55.631683
        y: -7.724535
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67763
        objectName: "actor67763"
        x: 54.952858
        y: -9.67616
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67764
        objectName: "actor67764"
        x: 56.276566
        y: -11.475048
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67765
        objectName: "actor67765"
        x: 58.313046
        y: -11.729608
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67766
        objectName: "actor67766"
        x: 60.156746
        y: -11.444568
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67767
        objectName: "actor67767"
        x: 61.664494
        y: -10.215435
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67768
        objectName: "actor67768"
        x: 84.11288
        y: -18.590292
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67769
        objectName: "actor67769"
        x: 88.46855
        y: -14.321209
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67771
        objectName: "actor67771"
        x: 69.99581
        y: -8.214768
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67772
        objectName: "actor67772"
        x: 83.876274
        y: -9.98404
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67773
        objectName: "actor67773"
        x: 73.021576
        y: -8.259928
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67774
        objectName: "actor67774"
        x: 75.66348
        y: -9.253463
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67775
        objectName: "actor67775"
        x: 87.59218
        y: -20.503239
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67776
        objectName: "actor67776"
        x: 90.53351
        y: -17.712109
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67777
        objectName: "actor67777"
        x: 94.12089
        y: -14.327204
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67778
        objectName: "actor67778"
        x: 61.402275
        y: -26.207752
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor67779
        objectName: "actor67779"
        x: 94.713585
        y: -18.636253
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72836
        objectName: "actor72836"
        x: 87.23539
        y: -9.40146
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72837
        objectName: "actor72837"
        x: 90.480316
        y: -10.0074415
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72838
        objectName: "actor72838"
        x: 94.10824
        y: -18.669909
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72840
        objectName: "actor72840"
        x: 94.4254
        y: -19.219637
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72841
        objectName: "actor72841"
        x: 84.56669
        y: -15.224465
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72842
        objectName: "actor72842"
        x: 125.05454
        y: -19.433159
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72843
        objectName: "actor72843"
        x: 125.27082
        y: -23.277876
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72845
        objectName: "actor72845"
        x: 101.581215
        y: -11.219405
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72846
        objectName: "actor72846"
        x: 101.60076
        y: -13.174185
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72847
        objectName: "actor72847"
        x: 101.60076
        y: -15.148511
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72848
        objectName: "actor72848"
        x: 104.693886
        y: -13.95852
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72849
        objectName: "actor72849"
        x: 107.72148
        y: -13.526046
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72850
        objectName: "actor72850"
        x: 111.04461
        y: -14.034288
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72851
        objectName: "actor72851"
        x: 110.91629
        y: -9.574971
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72852
        objectName: "actor72852"
        x: 117.36768
        y: -10.25496
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72853
        objectName: "actor72853"
        x: 103.4652
        y: -9.643012
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72854
        objectName: "actor72854"
        x: 117.91071
        y: -12.364483
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72855
        objectName: "actor72855"
        x: 119.31546
        y: -13.587786
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72856
        objectName: "actor72856"
        x: 76.96374
        y: -17.604977
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72857
        objectName: "actor72857"
        x: 115.65989
        y: -15.563606
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72858
        objectName: "actor72858"
        x: 122.7227
        y: -8.174567
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72859
        objectName: "actor72859"
        x: 124.28951
        y: -10.454076
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72860
        objectName: "actor72860"
        x: 126.66916
        y: -10.442438
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72861
        objectName: "actor72861"
        x: 128.79417
        y: -8.460283
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72862
        objectName: "actor72862"
        x: 127.27631
        y: -6.2995543
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72863
        objectName: "actor72863"
        x: 124.56201
        y: -6.317412
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72864
        objectName: "actor72864"
        x: 79.65822
        y: -17.643553
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72865
        objectName: "actor72865"
        x: 124.99619
        y: -13.85295
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72866
        objectName: "actor72866"
        x: 112.0301
        y: -23.120277
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72867
        objectName: "actor72867"
        x: 96.79263
        y: -14.33258
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72868
        objectName: "actor72868"
        x: 112.63309
        y: -23.328253
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72869
        objectName: "actor72869"
        x: 136.60275
        y: -21.413841
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72870
        objectName: "actor72870"
        x: 133.98975
        y: -21.812363
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72871
        objectName: "actor72871"
        x: 139.38005
        y: -21.557636
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72872
        objectName: "actor72872"
        x: 142.75623
        y: -15.888331
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72873
        objectName: "actor72873"
        x: 144.20798
        y: -14.491994
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72874
        objectName: "actor72874"
        x: 142.79506
        y: -13.020458
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72875
        objectName: "actor72875"
        x: 128.36116
        y: -13.911774
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72877
        objectName: "actor72877"
        x: 140.20999
        y: -16.672663
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72878
        objectName: "actor72878"
        x: 136.35625
        y: -16.758944
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72879
        objectName: "actor72879"
        x: 132.41621
        y: -17.27661
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72880
        objectName: "actor72880"
        x: 146.79529
        y: -16.129084
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72881
        objectName: "actor72881"
        x: 131.09273
        y: -20.466322
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72882
        objectName: "actor72882"
        x: 151.20152
        y: -16.81812
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72883
        objectName: "actor72883"
        x: 148.89265
        y: -8.090568
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72884
        objectName: "actor72884"
        x: 128.61679
        y: -18.089504
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72885
        objectName: "actor72885"
        x: 142.33778
        y: -8.767498
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72886
        objectName: "actor72886"
        x: 145.62415
        y: -9.171537
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor72887
        objectName: "actor72887"
        x: 129.81978
        y: -23.619858
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor73431
        objectName: "actor73431"
        x: 23.835304
        y: -16.121822
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.03835, 0.835734], [0.288433, 0.835734], [0.288433, -0.082889], [-1.03835, -0.082889]]
        id: actor78143
        objectName: "actor78143"
        property alias image: graphic262
        x: 46.46125
        y: -15.509565
        ImageRenderer {
            cacheRenderParams: actor78143.body.bodyType === Body.StaticBody
            id: graphic262
            sizeScale: 2.7970703
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique05.png")
        }
    }
    Polygon {
        body.bodyType: Body.DynamicBody
        body.density: 2
        body.friction: 0.5
        body.magneticStrength: 0
        body.vertices: [[0.473087, -0.923344], [0.727791, -0.702898], [0.889098, -0.466451], [0.942969, -0.328296], [0.959363, -0.0251094], [0.952633, 0.255493], [0.88982, 0.47752], [0.72731, 0.696135], [0.534467, 0.856496], [0.286621, 0.949468], [-0.154357, 0.940346], [-0.431626, 0.886911], [-0.701806, 0.706946], [-0.86983, 0.516053], [-0.967832, 0.25305], [-0.983172, -0.192886], [-0.915739, -0.504972], [-0.654707, -0.800426], [-0.416528, -0.972437], [-0.0565725, -1.05746], [0.285171, -1.03306]]
        id: actor86596
        objectName: "actor86596"
        property alias image: graphic263
        rotation: 371559.6
        x: 113.50706
        y: -10.027787
        ImageRenderer {
            cacheRenderParams: actor86596.body.bodyType === Body.StaticBody
            id: graphic263
            sizeScale: 1.9713446
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder03.png")
            x: -0.0125
            y: -0.024999924
        }
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 0
        emitterLogic.spawnSpread: 0.42499998
        emitterLogic.spawnVelocity: 15
        id: actor94689
        objectName: "actor94689"
        rotation: -180
        visible: false
        x: 144.7378
        y: -16.61688
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor109616
        objectName: "actor109616"
        x: 144.69241
        y: -18.70891
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor109617
        objectName: "actor109617"
        x: 144.6924
        y: -20.161413
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor109618
        objectName: "actor109618"
        x: 144.67073
        y: -21.505522
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor109619
        objectName: "actor109619"
        x: 149.29376
        y: -16.146065
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor110844
        objectName: "actor110844"
        property alias image: graphic269
        x: 33.72925
        y: -12.325462
        ImageRenderer {
            cacheRenderParams: actor110844.body.bodyType === Body.StaticBody
            id: graphic269
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor117862
        objectName: "actor117862"
        property alias image: graphic270
        rotation: -17.1
        x: 31.053007
        y: -11.933179
        ImageRenderer {
            cacheRenderParams: actor117862.body.bodyType === Body.StaticBody
            id: graphic270
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor117863
        objectName: "actor117863"
        property alias image: graphic271
        rotation: -44.100113
        x: 28.78648
        y: -10.41635
        ImageRenderer {
            cacheRenderParams: actor117863.body.bodyType === Body.StaticBody
            id: graphic271
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.742851, 1.46379], [0.911678, 1.46379], [0.911678, 0.642901], [-0.742851, 0.642901]]
        id: actor117864
        objectName: "actor117864"
        property alias image: graphic272
        rotation: 36.9
        x: 36.54498
        y: -11.122461
        ImageRenderer {
            cacheRenderParams: actor117864.body.bodyType === Body.StaticBody
            id: graphic272
            sizeScale: 3.3437517
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.742851, 1.46379], [0.911678, 1.46379], [0.911678, 0.642901], [-0.742851, 0.642901]]
        id: actor117865
        objectName: "actor117865"
        property alias image: graphic273
        rotation: 77.4
        x: 37.878742
        y: -8.594413
        ImageRenderer {
            cacheRenderParams: actor117865.body.bodyType === Body.StaticBody
            id: graphic273
            sizeScale: 3.3437517
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.564266, 1.11189], [0.692506, 1.11189], [0.692506, 0.488344], [-0.564266, 0.488344]]
        id: actor117866
        objectName: "actor117866"
        property alias image: graphic274
        rotation: 64.80001
        x: 37.12033
        y: -9.875873
        ImageRenderer {
            cacheRenderParams: actor117866.body.bodyType === Body.StaticBody
            id: graphic274
            sizeScale: 2.5398967
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513781, 0.968632], [0.630548, 0.968632], [0.630548, 0.633816], [-0.513781, 0.633816]]
        id: actor60729
        objectName: "actor60729"
        property alias image: graphic275
        x: 57.730724
        y: -13.312757
        ImageRenderer {
            cacheRenderParams: actor60729.body.bodyType === Body.StaticBody
            id: graphic275
            sizeScale: 2.3126535
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.700812, 1.38095], [0.860085, 1.38095], [0.860085, 0.606519], [-0.700812, 0.606519]]
        id: actor76423
        objectName: "actor76423"
        property alias image: graphic276
        rotation: -15.299999
        x: 55.81729
        y: -13.326361
        ImageRenderer {
            cacheRenderParams: actor76423.body.bodyType === Body.StaticBody
            id: graphic276
            sizeScale: 3.154525
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513781, 0.968632], [0.630548, 0.968632], [0.630548, 0.633816], [-0.513781, 0.633816]]
        id: actor76424
        objectName: "actor76424"
        property alias image: graphic277
        rotation: 14.399999
        x: 59.394222
        y: -13.162963
        ImageRenderer {
            cacheRenderParams: actor76424.body.bodyType === Body.StaticBody
            id: graphic277
            sizeScale: 2.3126535
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.540388, 1.06484], [0.663202, 1.06484], [0.663202, 0.46768], [-0.540388, 0.46768]]
        id: actor130858
        objectName: "actor130858"
        property alias image: graphic278
        rotation: -48.60011
        x: 54.136013
        y: -11.814435
        ImageRenderer {
            cacheRenderParams: actor130858.body.bodyType === Body.StaticBody
            id: graphic278
            sizeScale: 2.4324176
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.26641, 0.379679], [0.326957, 0.379679], [0.326957, -0.259596], [-0.26641, -0.259596]]
        id: actor143080
        objectName: "actor143080"
        property alias image: graphic279
        x: 79.55726
        y: -9.098223
        ImageRenderer {
            cacheRenderParams: actor143080.body.bodyType === Body.StaticBody
            id: graphic279
            sizeScale: 1.1991746
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.40689, 1.35512], [0.323949, 1.35512], [0.323949, -0.64301], [-1.40689, -0.64301]]
        id: actor143081
        objectName: "actor143081"
        property alias image: graphic280
        x: 78.21958
        y: -9.33184
        ImageRenderer {
            cacheRenderParams: actor143081.body.bodyType === Body.StaticBody
            id: graphic280
            sizeScale: 4.53539
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128180
        objectName: "actor128180"
        property alias image: graphic281
        rotation: 3.8117383
        x: 125.38748
        y: -12.669876
        ImageRenderer {
            cacheRenderParams: actor128180.body.bodyType === Body.StaticBody
            id: graphic281
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.505972, 0.997018], [0.620964, 0.997018], [0.620964, 0.674953], [-0.505972, 0.674953]]
        id: actor128190
        objectName: "actor128190"
        property alias image: graphic282
        rotation: -28.799997
        x: 123.172005
        y: -11.699734
        ImageRenderer {
            cacheRenderParams: actor128190.body.bodyType === Body.StaticBody
            id: graphic282
            sizeScale: 2.2775013
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.720551, 1.41985], [0.88431, 1.41985], [0.88431, 0.961197], [-0.720551, 0.961197]]
        id: actor128191
        objectName: "actor128191"
        property alias image: graphic283
        rotation: 24.300001
        x: 127.69447
        y: -12.1613655
        ImageRenderer {
            cacheRenderParams: actor128191.body.bodyType === Body.StaticBody
            id: graphic283
            sizeScale: 3.2433746
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.586138, 1.15498], [0.719349, 1.15498], [0.719349, 0.781893], [-0.586138, 0.781893]]
        id: actor128192
        objectName: "actor128192"
        property alias image: graphic284
        rotation: 55.8
        x: 129.72867
        y: -10.115075
        ImageRenderer {
            cacheRenderParams: actor128192.body.bodyType === Body.StaticBody
            id: graphic284
            sizeScale: 2.6383479
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128189
        objectName: "actor128189"
        property alias image: graphic285
        x: 151.89194
        y: -12.912988
        ImageRenderer {
            cacheRenderParams: actor128189.body.bodyType === Body.StaticBody
            id: graphic285
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor136573
        objectName: "actor136573"
        property alias image: graphic286
        rotation: -11.7
        x: 148.92258
        y: -12.748726
        ImageRenderer {
            cacheRenderParams: actor136573.body.bodyType === Body.StaticBody
            id: graphic286
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor136574
        objectName: "actor136574"
        property alias image: graphic287
        rotation: -1.8000001
        x: 147.41896
        y: -12.533921
        ImageRenderer {
            cacheRenderParams: actor136574.body.bodyType === Body.StaticBody
            id: graphic287
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.715482, 1.40986], [0.878089, 1.40986], [0.878089, 0.954434], [-0.715482, 0.954434]]
        id: actor136575
        objectName: "actor136575"
        property alias image: graphic288
        rotation: 8.10011
        x: 145.7637
        y: -12.496015
        ImageRenderer {
            cacheRenderParams: actor136575.body.bodyType === Body.StaticBody
            id: graphic288
            sizeScale: 3.2205555
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.668247, 1.31678], [0.820119, 1.31678], [0.820119, 0.891424], [-0.668247, 0.891424]]
        id: actor136576
        objectName: "actor136576"
        property alias image: graphic289
        rotation: -14.399999
        x: 154.16634
        y: -12.925622
        ImageRenderer {
            cacheRenderParams: actor136576.body.bodyType === Body.StaticBody
            id: graphic289
            sizeScale: 3.0079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.668247, 1.31678], [0.820119, 1.31678], [0.820119, 0.891424], [-0.668247, 0.891424]]
        id: actor136577
        objectName: "actor136577"
        property alias image: graphic290
        rotation: -1.7999984
        x: 158.57614
        y: -13.7722025
        ImageRenderer {
            cacheRenderParams: actor136577.body.bodyType === Body.StaticBody
            id: graphic290
            sizeScale: 3.0079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.466498, 0.919235], [0.572519, 0.919235], [0.572519, 0.622297], [-0.466498, 0.622297]]
        id: actor139071
        objectName: "actor139071"
        property alias image: graphic291
        rotation: 12.600001
        x: 157.32895
        y: -13.418387
        ImageRenderer {
            cacheRenderParams: actor139071.body.bodyType === Body.StaticBody
            id: graphic291
            sizeScale: 2.0998218
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.466498, 0.919235], [0.572519, 0.919235], [0.572519, 0.622297], [-0.466498, 0.622297]]
        id: actor139072
        objectName: "actor139072"
        property alias image: graphic292
        rotation: -29.700108
        x: 155.56874
        y: -13.029192
        ImageRenderer {
            cacheRenderParams: actor139072.body.bodyType === Body.StaticBody
            id: graphic292
            sizeScale: 2.0998218
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.507512, 1.00005], [0.622854, 1.00005], [0.622854, 0.677008], [-0.507512, 0.677008]]
        id: actor139073
        objectName: "actor139073"
        property alias image: graphic293
        rotation: -37.8
        x: 159.6995
        y: -13.710284
        ImageRenderer {
            cacheRenderParams: actor139073.body.bodyType === Body.StaticBody
            id: graphic293
            sizeScale: 2.2844338
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.507512, 1.00005], [0.622854, 1.00005], [0.622854, 0.677008], [-0.507512, 0.677008]]
        id: actor139074
        objectName: "actor139074"
        property alias image: graphic294
        rotation: -67.5
        x: 160.28328
        y: -14.479832
        ImageRenderer {
            cacheRenderParams: actor139074.body.bodyType === Body.StaticBody
            id: graphic294
            sizeScale: 2.2844338
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.471225, 0.928549], [0.57832, 0.928549], [0.57832, 0.628602], [-0.471225, 0.628602]]
        id: actor139075
        objectName: "actor139075"
        property alias image: graphic295
        rotation: -17.100113
        x: 161.6543
        y: -15.76241
        ImageRenderer {
            cacheRenderParams: actor139075.body.bodyType === Body.StaticBody
            id: graphic295
            sizeScale: 2.1210978
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.585655, 1.15403], [0.718757, 1.15403], [0.718757, 0.781249], [-0.585655, 0.781249]]
        id: actor139076
        objectName: "actor139076"
        property alias image: graphic296
        rotation: 19.799778
        x: 163.91872
        y: -15.753562
        ImageRenderer {
            cacheRenderParams: actor139076.body.bodyType === Body.StaticBody
            id: graphic296
            sizeScale: 2.6361754
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.585655, 1.15403], [0.718757, 1.15403], [0.718757, 0.781249], [-0.585655, 0.781249]]
        id: actor139077
        objectName: "actor139077"
        property alias image: graphic297
        rotation: 29.699776
        x: 165.90007
        y: -14.939789
        ImageRenderer {
            cacheRenderParams: actor139077.body.bodyType === Body.StaticBody
            id: graphic297
            sizeScale: 2.6361754
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.585655, 1.15403], [0.718757, 1.15403], [0.718757, 0.781249], [-0.585655, 0.781249]]
        id: actor140430
        objectName: "actor140430"
        property alias image: graphic298
        rotation: 23.399885
        x: 167.45352
        y: -14.388317
        ImageRenderer {
            cacheRenderParams: actor140430.body.bodyType === Body.StaticBody
            id: graphic298
            sizeScale: 2.6361754
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.501627, 0.988456], [0.615631, 0.988456], [0.615631, 0.669157], [-0.501627, 0.669157]]
        id: actor140431
        objectName: "actor140431"
        property alias image: graphic299
        rotation: 71.09978
        x: 168.95464
        y: -12.974838
        ImageRenderer {
            cacheRenderParams: actor140431.body.bodyType === Body.StaticBody
            id: graphic299
            sizeScale: 2.2579439
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor164788
        objectName: "actor164788"
        x: 61.72688
        y: -25.660255
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.573129, 0.262375], [0.190512, 0.262375], [0.190512, -1.48516], [-0.573129, -1.48516]]
        id: actor317250
        objectName: "actor317250"
        property alias image: graphic301
        x: 0.5356455
        y: -16.981731
        ImageRenderer {
            cacheRenderParams: actor317250.body.bodyType === Body.StaticBody
            id: graphic301
            sizeScale: 2.1902316
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.500363, 0.605419], [0.166324, 0.605419], [0.166324, -1.2966], [-0.500363, -1.2966]]
        id: actor317253
        objectName: "actor317253"
        property alias image: graphic302
        rotation: -19.452911
        x: 1.2014921
        y: -20.02805
        ImageRenderer {
            cacheRenderParams: actor317253.body.bodyType === Body.StaticBody
            id: graphic302
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.774946, 2.27051], [0.401174, 2.27051], [0.401174, -0.112722], [-0.774946, -0.112722]]
        id: actor317254
        objectName: "actor317254"
        property alias image: graphic303
        rotation: -162.54341
        x: 152.3378
        y: -16.742577
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor317254.body.bodyType === Body.StaticBody
            id: graphic303
            sizeScale: 2.5128984
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.500363, 1.54898], [0.166324, 1.54898], [0.166324, -0.523567], [-0.500363, -0.523567]]
        id: actor317255
        objectName: "actor317255"
        property alias image: graphic304
        rotation: -156.87485
        x: 152.36635
        y: -20.592398
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor317255.body.bodyType === Body.StaticBody
            id: graphic304
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.density: 4
        body.friction: 0.1
        body.vertices: [[-0.216341, 0.376825], [-0.000266634, 0.397259], [0.184175, 0.398777], [0.315639, 0.352032], [0.470839, 0.207361], [0.498833, 0.0224555], [0.43605, -0.181854], [0.317707, -0.361655], [0.105537, -0.452984], [-0.0255294, -0.455274], [-0.170615, -0.400137], [-0.248946, -0.329894], [-0.379709, -0.19737], [-0.441309, 0.116796], [-0.366214, 0.293423]]
        id: actor319013
        objectName: "actor319013"
        property alias image: graphic305
        rotation: -53.588894
        x: 63.990307
        y: -25.916063
        ImageRenderer {
            cacheRenderParams: actor319013.body.bodyType === Body.StaticBody
            id: graphic305
            sizeScale: 0.95315963
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder01.png")
            x: 0.027499922
            y: -0.062499925
        }
    }
    Polygon {
        body.active: false
        body.density: 2
        body.friction: 0.1
        body.vertices: [[-0.216341, 0.376825], [-0.000266634, 0.397259], [0.184175, 0.398777], [0.315639, 0.352032], [0.470839, 0.207361], [0.498833, 0.0224555], [0.43605, -0.181854], [0.317707, -0.361655], [0.105537, -0.452984], [-0.0255294, -0.455274], [-0.170615, -0.400137], [-0.248946, -0.329894], [-0.379709, -0.19737], [-0.441309, 0.116796], [-0.366214, 0.293423]]
        id: actor319014
        objectName: "actor319014"
        property alias image: graphic306
        rotation: 182.80714
        visible: false
        x: 66.88609
        y: -8.652305
        ImageRenderer {
            cacheRenderParams: actor319014.body.bodyType === Body.StaticBody
            id: graphic306
            sizeScale: 0.95315963
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder01.png")
            x: 0.027499922
            y: -0.062499925
        }
    }
    Bumper {
        body.vertices: [[0.400853, 0.809752], [0.458679, 0.785589], [0.211262, 0.506861], [0.162319, 0.207363], [0.107602, 0.206674], [0.140717, 0.538507]]
        id: actor322137
        kickbackForce: 200
        objectName: "actor322137"
        property alias image: graphic307
        visible: false
        x: 63.380157
        y: -26.223078
        ImageRenderer {
            cacheRenderParams: actor322137.body.bodyType === Body.StaticBody
            id: graphic307
            source: Util.getPathToImage("nullbox.png")
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor319013.image) { actor319013.image.cacheRenderParams = false; }if (actor322137.image) { actor322137.image.cacheRenderParams = false; }if (actor322138.image) { actor322138.image.cacheRenderParams = false; }}
        body.vertices: [[-0.099751, 0.0263217], [-0.049788, 0.357584], [0.197048, 0.637183], [0.258234, 0.611863], [0.00322074, 0.33189], [-0.041491, 0.0253536]]
        id: actor322138
        inputs: [actor0]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: false
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor322137
                targetProperty: "body.active"
            },
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                endValue: Body.DynamicBody
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor319013
                targetProperty: "body.bodyType"
            },
            InterpolationLogic {
                backwardDuration: 0.0333333350718021
                endValue: false
                forwardDuration: 0.0333333350718021
                smoothing: 0
                target: actor322138
                targetProperty: "body.active"
            }
        ]
        objectName: "actor322138"
        x: 63.570663
        y: -26.042154
    }
    Asteroid {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.magnetic: true
        body.magneticStrength: 1.8
        body.restitution: 0.1
        body.vertices: [[0.566376, -1.843], [0.888777, -1.68698], [1.09677, -1.49418], [1.35336, -1.3041], [1.56536, -1.11249], [1.79715, -0.758511], [1.86908, -0.573718], [1.91964, -0.351039], [1.93557, -0.0522838], [1.92339, 0.240299], [1.7803, 0.704852], [1.56829, 0.912654], [1.35443, 1.11046], [1.10361, 1.4183], [1.03092, 1.46236], [0.906463, 1.49525], [0.771176, 1.5506], [0.68802, 1.66081], [0.600116, 1.71561], [0.406334, 1.75227], [0.0873355, 1.86805], [-0.247905, 1.88954], [-0.609777, 1.84462], [-0.927565, 1.73945], [-1.28848, 1.5236], [-1.54322, 1.28717], [-1.71898, 1.02135], [-1.8669, 0.714941], [-1.93715, 0.305397], [-1.9495, -0.0423859], [-1.88886, -0.528291], [-1.80851, -0.820379], [-1.74085, -1.03511], [-1.61913, -1.19612], [-1.4043, -1.28345], [-1.22212, -1.40082], [-1.08899, -1.52051], [-0.96021, -1.71241], [-0.851836, -1.78967], [-0.504313, -1.90178], [-0.276098, -1.92543], [-0.00915563, -1.94306], [0.267087, -1.9282]]
        id: actor379708
        objectName: "actor379708"
        property alias image: graphic309
        x: 87.28949
        y: -17.44802
        ImageRenderer {
            cacheRenderParams: actor379708.body.bodyType === Body.StaticBody
            id: graphic309
            sizeScale: 4.4042077
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
        id: actor381544
        objectName: "actor381544"
        property alias image: graphic310
        x: 44.866886
        y: -23.098215
        ImageRenderer {
            cacheRenderParams: actor381544.body.bodyType === Body.StaticBody
            id: graphic310
            sizeScale: 2.864627
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.500363, 0.605419], [0.166324, 0.605419], [0.166324, -1.2966], [-0.500363, -1.2966]]
        id: actor415930
        objectName: "actor415930"
        property alias image: graphic311
        rotation: -44.411118
        x: 0.47217178
        y: -23.328753
        ImageRenderer {
            cacheRenderParams: actor415930.body.bodyType === Body.StaticBody
            id: graphic311
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor423344
        objectName: "actor423344"
        x: 112.150856
        y: -23.745636
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor423345
        objectName: "actor423345"
        x: 119.32087
        y: -22.538029
    }
    Accelerator {
        acceleration: 0.7
        body.vertices: [[1.8851, -0.545076], [2.93091, 0.0794897], [4.04699, 0.933663], [3.41238, 0.177868], [2.51363, -0.481647], [1.49309, -0.855722], [0.693455, -1.02471], [-1, -1], [0.693455, -0.872064]]
        id: actor424297
        objectName: "actor424297"
        x: 58.15823
        y: -11.204306
    }
    Accelerator {
        acceleration: 0.7
        body.vertices: [[0.408073, -0.819046], [1.14371, -0.61708], [1.82615, -0.280103], [1.54092, -0.651027], [1.02998, -0.916818], [0.401619, -1.04076], [-0.327843, -1.06749], [-1, -1], [-1.45938, -0.784918], [-1.85622, -0.491687], [-0.711189, -0.851148]]
        id: actor424298
        objectName: "actor424298"
        x: 70.37791
        y: -12.804829
    }
    Accelerator {
        acceleration: 0.7
        body.vertices: [[-0.323425, 2.33306], [0.0444336, 2.09858], [0.592003, 1.60609], [1, 1], [1.18957, 0.307797], [1.25915, -0.349674], [1.0716, 0.29179], [0.846924, 0.932944], [0.416194, 1.56533]]
        id: actor424299
        objectName: "actor424299"
        x: 75.51275
        y: -10.300003
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[-1, 1], [-0.634788, 1.20353], [-0.279265, 1.23248], [-0.616696, 1.10811], [-0.944357, 0.921562], [-1.19612, 0.702602], [-1.47372, 0.401352], [-1.25323, 0.74826]]
        id: actor424300
        objectName: "actor424300"
        rotation: -90
        x: 116.78547
        y: -10.738294
    }
    Accelerator {
        acceleration: 0.1
        body.vertices: [[-1.97794, 1.03337], [-1.42649, 0.543811], [-1.06009, 0.288895], [-0.575912, 0.0795479], [0.0108347, -0.0996857], [-0.37711, -0.0379791], [-0.756133, 0.0494308], [-1.11118, 0.190414], [-1.4669, 0.414322], [-1.75067, 0.707497]]
        id: actor424301
        objectName: "actor424301"
        rotation: -90
        x: 122.29613
        y: -8.259643
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[0.3069, -1.77334], [0.759098, -1.13537], [1.12941, -0.342026], [1.00682, -0.972001], [0.691162, -1.45222]]
        id: actor424302
        objectName: "actor424302"
        x: 143.55025
        y: -14.187919
    }
    Accelerator {
        acceleration: 0.7
        body.vertices: [[-0.292435, 1.51568], [0.135803, 1.751], [-0.185036, 1.46051], [-0.443695, 1.19197], [-0.71122, 0.845694], [-0.990433, 0.391875], [-0.802757, 0.87298], [-0.597023, 1.20469]]
        id: actor424303
        objectName: "actor424303"
        x: 78.68104
        y: -11.650825
    }
    Accelerator {
        acceleration: 0.5
        body.vertices: [[-0.146744, 1.19631], [0.373177, 0.90357], [0.690132, 0.479986], [0.769997, 0.0241976], [0.456245, 0.671262]]
        id: actor424822
        objectName: "actor424822"
        x: 60.277637
        y: -15.782276
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor440326
        objectName: "actor440326"
        x: 140.71933
        y: -12.694224
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.999061, -0.794234], [-1.37305, -0.899305], [-1.76478, -0.892407], [-2.01353, -1.15463], [-1.86543, -1.465], [-1.54225, -1.60636], [-1.24862, -1.60953], [-0.769917, -1.53098], [-0.265299, -1.47242], [0.120212, -1.46439], [0.574896, -1.46788], [0.877973, -1.47764], [1.37433, -1.51169], [1.88309, -1.53278], [2.00063, -1.3884], [1.92073, -1.13699], [1.62543, -0.983326], [1.37808, -0.804084], [0.924874, -0.697191], [0.286071, -0.603866], [-0.603802, -0.586015]]
        id: actor38968
        objectName: "actor38968"
        visible: false
        x: 94.40375
        y: -16.815535
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.43251, 1.64011], [1.31299, 1.64011], [1.31299, 1.22368], [-1.43251, 1.22368]]
        id: actor501145
        objectName: "actor501145"
        property alias image: graphic324
        x: 94.39731
        y: -19.087543
        ImageRenderer {
            cacheRenderParams: actor501145.body.bodyType === Body.StaticBody
            id: graphic324
            sizeScale: 4.075423
            source: Util.getPathToImage("middleground_e1/deco_e1_platform11.png")
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
        id: actor507365
        objectName: "actor507365"
        property alias image: graphic325
        rotation: 375694.6
        x: 125.752014
        y: -8.37858
        ImageRenderer {
            cacheRenderParams: actor507365.body.bodyType === Body.StaticBody
            id: graphic325
            sizeScale: 2.864627
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
        id: actor507366
        objectName: "actor507366"
        property alias image: graphic326
        rotation: 375694.6
        x: 127.80483
        y: -21.183306
        ImageRenderer {
            cacheRenderParams: actor507366.body.bodyType === Body.StaticBody
            id: graphic326
            sizeScale: 4.4042077
            source: Util.getPathToImage("middleground_e1/e1_asteroid.png")
        }
    }
    Accelerator {
        acceleration: 0.4
        body.vertices: [[-0.114391, 1.93084], [1, 1], [1.18041, -0.234895], [0.787226, 0.807937]]
        id: actor563933
        objectName: "actor563933"
        x: 44.200653
        y: -15.828063
    }
    Accelerator {
        acceleration: 1
        body.vertices: [[-0.922607, 0.629961], [-0.53986, 0.331909], [-0.761677, 0.328077], [-1.09091, 0.440353]]
        id: actor568594
        objectName: "actor568594"
        rotation: 180
        x: 62.52917
        y: -25.0168
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor0
        objectName: "actor0"
        rollingMovementLogic.speed: 45
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 3.784423
        y: -16.767164
        z: 1
    }
    Polygon {
        body.vertices: [[-0.741027, 0.0836559], [-0.412296, 0.208624], [-0.0830816, 0.282614], [-0.0161592, 0.346224], [0.218112, 0.345826], [0.347038, 0.19668], [0.489478, 0.199021], [0.64584, 0.0990487], [0.790516, -0.0514851], [0.785507, -0.135769], [0.621008, -0.302086], [0.557164, -0.36695], [0.471623, -0.37632], [-0.0542462, -0.30862], [-0.489959, -0.200443], [-0.786459, -0.13219], [-0.855092, -0.0490853]]
        id: actor207442
        objectName: "actor207442"
        property alias image: graphic330
        rotation: 17.376656
        visible: false
        x: 146.61221
        y: -7.4344068
        z: 1
        ImageRenderer {
            cacheRenderParams: actor207442.body.bodyType === Body.StaticBody
            id: graphic330
            sizeScale: 1.7114186
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder02.png")
            x: -0.0325
            y: -0.465
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.470275, 0.719361], [0.577154, 0.719361], [0.577154, 0.262913], [-0.470275, 0.262913]]
        id: actor38407
        objectName: "actor38407"
        property alias image: graphic331
        x: 120.48599
        y: -22.635
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38407.body.bodyType === Body.StaticBody
            id: graphic331
            sizeScale: 2.1168218
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.485509], [-0.424806, -0.485509]]
        id: actor38408
        objectName: "actor38408"
        property alias image: graphic332
        x: 81.77428
        y: -38.235477
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38408.body.bodyType === Body.StaticBody
            id: graphic332
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor38409
        objectName: "actor38409"
        property alias image: graphic333
        x: 110.76223
        y: -13.7503605
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38409.body.bodyType === Body.StaticBody
            id: graphic333
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.485509], [-0.424806, -0.485509]]
        id: actor38766
        objectName: "actor38766"
        property alias image: graphic334
        x: 83.8319
        y: -38.278725
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38766.body.bodyType === Body.StaticBody
            id: graphic334
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04b.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.273358, 0.190085], [0.335484, 0.190085], [0.335484, -0.31242], [-0.273358, -0.31242]]
        id: actor38992
        objectName: "actor38992"
        property alias image: graphic335
        rotation: 29.69989
        x: 9.671646
        y: -16.038935
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38992.body.bodyType === Body.StaticBody
            id: graphic335
            sizeScale: 1.2304513
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04b.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.498665, 0.691442], [0.611996, 0.691442], [0.611996, 0.234344], [-0.498665, 0.234344]]
        id: actor38993
        objectName: "actor38993"
        property alias image: graphic336
        x: 0.75533557
        y: -16.686897
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38993.body.bodyType === Body.StaticBody
            id: graphic336
            sizeScale: 2.2446115
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.445677, 0.681735], [0.546966, 0.681735], [0.546966, 0.249161], [-0.445677, 0.249161]]
        id: actor39002
        objectName: "actor39002"
        property alias image: graphic337
        x: 58.79452
        y: -6.9260693
        z: 2
        ImageRenderer {
            cacheRenderParams: actor39002.body.bodyType === Body.StaticBody
            id: graphic337
            sizeScale: 2.006101
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.352494, 0.245113], [0.432605, 0.245113], [0.432605, -0.402864], [-0.352494, -0.402864]]
        id: actor39438
        objectName: "actor39438"
        property alias image: graphic338
        rotation: 6.2998896
        x: 69.68057
        y: -7.2840023
        z: 2
        ImageRenderer {
            cacheRenderParams: actor39438.body.bodyType === Body.StaticBody
            id: graphic338
            sizeScale: 1.5866594
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04b.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, -0.381757], [-0.424806, -0.381757]]
        id: actor60717
        objectName: "actor60717"
        property alias image: graphic339
        x: 14.655324
        y: -20.383255
        z: 2
        ImageRenderer {
            cacheRenderParams: actor60717.body.bodyType === Body.StaticBody
            id: graphic339
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_bush01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor60718
        objectName: "actor60718"
        property alias image: graphic340
        rotation: -5.3998904
        x: 20.268148
        y: -14.53657
        z: 2
        ImageRenderer {
            cacheRenderParams: actor60718.body.bodyType === Body.StaticBody
            id: graphic340
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.308238, 0.439291], [0.378291, 0.439291], [0.378291, -0.300355], [-0.308238, -0.300355]]
        id: actor60727
        objectName: "actor60727"
        property alias image: graphic341
        x: 10.368063
        y: -15.544963
        z: 2
        ImageRenderer {
            cacheRenderParams: actor60727.body.bodyType === Body.StaticBody
            id: graphic341
            sizeScale: 1.3874537
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.13585, 1.73964], [1.07811, 1.73964], [1.07811, 0.778031], [-1.13585, 0.778031]]
        id: actor60795
        objectName: "actor60795"
        property alias image: graphic342
        x: 30.71587
        y: -15.102048
        z: 2
        ImageRenderer {
            cacheRenderParams: actor60795.body.bodyType === Body.StaticBody
            id: graphic342
            sizeScale: 3.9541726
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.608204, 0.894018], [0.791006, 0.894018], [0.791006, -0.214506], [-0.608204, -0.214506]]
        id: actor60796
        objectName: "actor60796"
        property alias image: graphic343
        x: 28.467768
        y: -14.843309
        z: 2
        ImageRenderer {
            cacheRenderParams: actor60796.body.bodyType === Body.StaticBody
            id: graphic343
            sizeScale: 2.431205
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor61432
        objectName: "actor61432"
        property alias image: graphic344
        x: 3.66654
        y: -16.626379
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor61432.body.bodyType === Body.StaticBody
            id: graphic344
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.187003, 0.266511], [0.229504, 0.266511], [0.229504, 0.0300867], [-0.187003, 0.0300867]]
        id: actor61433
        objectName: "actor61433"
        property alias image: graphic345
        x: 24.722792
        y: -14.593585
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor61433.body.bodyType === Body.StaticBody
            id: graphic345
            sizeScale: 0.84174734
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.232178, 0.330893], [0.284946, 0.330893], [0.284946, 0.0373548], [-0.232178, 0.0373548]]
        id: actor61435
        objectName: "actor61435"
        property alias image: graphic346
        rotation: -7.20011
        x: 25.988104
        y: -14.588556
        z: 2
        ImageRenderer {
            aspectRatio: 0.855
            cacheRenderParams: actor61435.body.bodyType === Body.StaticBody
            id: graphic346
            sizeScale: 1.0450912
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.140934, 0.195417], [0.172964, 0.195417], [0.172964, -0.184978], [-0.140934, -0.184978]]
        id: actor61696
        objectName: "actor61696"
        property alias image: graphic347
        x: 26.575935
        y: -14.495285
        z: 2
        ImageRenderer {
            cacheRenderParams: actor61696.body.bodyType === Body.StaticBody
            id: graphic347
            sizeScale: 0.63437694
            source: Util.getPathToImage("middleground_e1/deco_e1_grass02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.473865, 0.69655], [0.61629, 0.69655], [0.61629, -0.167126], [-0.473865, -0.167126]]
        id: actor62489
        objectName: "actor62489"
        property alias image: graphic348
        rotation: -17.100002
        x: 147.71027
        y: -7.2871337
        z: 2
        ImageRenderer {
            cacheRenderParams: actor62489.body.bodyType === Body.StaticBody
            id: graphic348
            sizeScale: 1.894206
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.535172, 0.786667], [0.696023, 0.786667], [0.696023, -0.188748], [-0.535172, -0.188748]]
        id: actor63296
        objectName: "actor63296"
        property alias image: graphic349
        rotation: -9.9
        x: 32.74344
        y: -14.827163
        z: 2
        ImageRenderer {
            cacheRenderParams: actor63296.body.bodyType === Body.StaticBody
            id: graphic349
            sizeScale: 2.1392715
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.162188, 0.224888], [0.199049, 0.224888], [0.199049, -0.212875], [-0.162188, -0.212875]]
        id: actor63298
        objectName: "actor63298"
        property alias image: graphic350
        x: 32.06319
        y: -14.696272
        z: 2
        ImageRenderer {
            aspectRatio: 0.8025
            cacheRenderParams: actor63298.body.bodyType === Body.StaticBody
            id: graphic350
            sizeScale: 0.74254936
            source: Util.getPathToImage("middleground_e1/deco_e1_grass02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.329261, 0.228957], [0.404091, 0.228957], [0.404091, -0.376311], [-0.329261, -0.376311]]
        id: actor63436
        objectName: "actor63436"
        property alias image: graphic351
        rotation: 19.79989
        x: 33.217197
        y: -14.79747
        z: 2
        ImageRenderer {
            cacheRenderParams: actor63436.body.bodyType === Body.StaticBody
            id: graphic351
            sizeScale: 1.4820812
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04b.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.185245, 0.264006], [0.227346, 0.264006], [0.227346, 0.0298038], [-0.185245, 0.0298038]]
        id: actor63440
        objectName: "actor63440"
        property alias image: graphic352
        rotation: 22.5
        x: 33.772793
        y: -15.350843
        z: 2
        ImageRenderer {
            cacheRenderParams: actor63440.body.bodyType === Body.StaticBody
            id: graphic352
            sizeScale: 0.83383435
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.33944, 0.470662], [0.416584, 0.470662], [0.416584, -0.305041], [-0.33944, -0.305041]]
        id: actor63441
        objectName: "actor63441"
        property alias image: graphic353
        x: 33.76904
        y: -14.570823
        z: 2
        ImageRenderer {
            cacheRenderParams: actor63441.body.bodyType === Body.StaticBody
            id: graphic353
            sizeScale: 1.5278995
            source: Util.getPathToImage("middleground_e1/deco_e1_bush01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.316697, 0.605419], [0.61401, 0.605419], [0.61401, -0.240522], [-0.316697, -0.240522]]
        id: actor63722
        objectName: "actor63722"
        property alias image: graphic354
        x: -0.017924368
        y: -16.560236
        z: 2
        ImageRenderer {
            cacheRenderParams: actor63722.body.bodyType === Body.StaticBody
            id: graphic354
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.481943, 0.738132], [0.457444, 0.738132], [0.457444, 0.33012], [-0.481943, 0.33012]]
        id: actor67700
        objectName: "actor67700"
        property alias image: graphic355
        x: 66.88675
        y: -8.88776
        z: 2
        ImageRenderer {
            cacheRenderParams: actor67700.body.bodyType === Body.StaticBody
            id: graphic355
            sizeScale: 1.677761
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238957, 0.331334], [0.293265, 0.331334], [0.293265, 0.112296], [-0.238957, 0.112296]]
        id: actor67705
        objectName: "actor67705"
        property alias image: graphic356
        rotation: -11.7
        x: 65.87035
        y: -8.831534
        z: 2
        ImageRenderer {
            cacheRenderParams: actor67705.body.bodyType === Body.StaticBody
            id: graphic356
            sizeScale: 1.0756028
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor76133
        objectName: "actor76133"
        property alias image: graphic357
        x: 5.6571608
        y: -16.207636
        z: 2
        ImageRenderer {
            cacheRenderParams: actor76133.body.bodyType === Body.StaticBody
            id: graphic357
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor76134
        objectName: "actor76134"
        property alias image: graphic358
        rotation: -13.500109
        x: 2.999604
        y: -15.825928
        z: 2
        ImageRenderer {
            cacheRenderParams: actor76134.body.bodyType === Body.StaticBody
            id: graphic358
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.677272, 1.33456], [0.831195, 1.33456], [0.831195, 0.586146], [-0.677272, 0.586146]]
        id: actor76135
        objectName: "actor76135"
        property alias image: graphic359
        rotation: -18.000109
        x: 0.6877445
        y: -14.70961
        z: 2
        ImageRenderer {
            cacheRenderParams: actor76135.body.bodyType === Body.StaticBody
            id: graphic359
            sizeScale: 3.0485651
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.835959, 1.64726], [1.02595, 1.64726], [1.02595, 0.723482], [-0.835959, 0.723482]]
        id: actor76413
        objectName: "actor76413"
        property alias image: graphic360
        rotation: 15.299999
        x: 8.432159
        y: -15.849301
        z: 2
        ImageRenderer {
            cacheRenderParams: actor76413.body.bodyType === Body.StaticBody
            id: graphic360
            sizeScale: 3.762855
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.700266, 1.37987], [0.859415, 1.37987], [0.859415, 0.606046], [-0.700266, 0.606046]]
        id: actor76414
        objectName: "actor76414"
        property alias image: graphic361
        rotation: 36.9
        x: 11.340491
        y: -14.1909685
        z: 2
        ImageRenderer {
            cacheRenderParams: actor76414.body.bodyType === Body.StaticBody
            id: graphic361
            sizeScale: 3.1520677
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor77288
        objectName: "actor77288"
        property alias image: graphic362
        x: 4.8537083
        y: -16.51672
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor77288.body.bodyType === Body.StaticBody
            id: graphic362
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.226427, 0.233312], [0.277887, 0.233312], [0.277887, 0.00921289], [-0.226427, 0.00921289]]
        id: actor77289
        objectName: "actor77289"
        property alias image: graphic363
        rotation: 5.40011
        x: 6.554518
        y: -16.446787
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor77289.body.bodyType === Body.StaticBody
            id: graphic363
            sizeScale: 1.0192024
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.485509], [-0.424806, -0.485509]]
        id: actor86015
        objectName: "actor86015"
        property alias image: graphic364
        x: 85.94878
        y: -38.295795
        z: 2
        ImageRenderer {
            cacheRenderParams: actor86015.body.bodyType === Body.StaticBody
            id: graphic364
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock09.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -1.09349], [-0.424806, -1.09349]]
        id: actor86016
        objectName: "actor86016"
        property alias image: graphic365
        x: 87.94616
        y: -38.261654
        z: 2
        ImageRenderer {
            cacheRenderParams: actor86016.body.bodyType === Body.StaticBody
            id: graphic365
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.485509], [-0.424806, -0.485509]]
        id: actor86017
        objectName: "actor86017"
        property alias image: graphic366
        x: 90.14839
        y: -38.364082
        z: 2
        ImageRenderer {
            cacheRenderParams: actor86017.body.bodyType === Body.StaticBody
            id: graphic366
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.299401, 0.420071], [0.367446, 0.420071], [0.367446, -0.108004], [-0.299401, -0.108004]]
        id: actor110842
        objectName: "actor110842"
        property alias image: graphic367
        x: 142.92401
        y: -7.965568
        z: 2
        ImageRenderer {
            cacheRenderParams: actor110842.body.bodyType === Body.StaticBody
            id: graphic367
            sizeScale: 1.3476769
            source: Util.getPathToImage("middleground_e1/deco_e1_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.731799, 1.44201], [0.898114, 1.44201], [0.898114, 0.930577], [-0.731799, 0.930577]]
        id: actor110843
        objectName: "actor110843"
        property alias image: graphic368
        x: 22.335728
        y: -14.7043915
        z: 2
        ImageRenderer {
            cacheRenderParams: actor110843.body.bodyType === Body.StaticBody
            id: graphic368
            sizeScale: 3.2940035
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor110845
        objectName: "actor110845"
        property alias image: graphic369
        x: 46.31506
        y: -13.708531
        z: 2
        ImageRenderer {
            cacheRenderParams: actor110845.body.bodyType === Body.StaticBody
            id: graphic369
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor110848
        objectName: "actor110848"
        property alias image: graphic370
        x: 13.222675
        y: -14.624919
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor110848.body.bodyType === Body.StaticBody
            id: graphic370
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210118, 0.20637], [0.257872, 0.20637], [0.257872, 0.00854931], [-0.210118, 0.00854931]]
        id: actor112656
        objectName: "actor112656"
        property alias image: graphic371
        rotation: 14.399999
        x: 9.595377
        y: -16.566721
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor112656.body.bodyType === Body.StaticBody
            id: graphic371
            sizeScale: 0.9457924
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.498665, 0.691442], [0.611996, 0.691442], [0.611996, 0.234344], [-0.498665, 0.234344]]
        id: actor112959
        objectName: "actor112959"
        property alias image: graphic372
        x: 8.387601
        y: -16.791811
        z: 2
        ImageRenderer {
            cacheRenderParams: actor112959.body.bodyType === Body.StaticBody
            id: graphic372
            sizeScale: 2.2446115
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.536073, 1.05633], [0.657906, 1.05633], [0.657906, 0.463945], [-0.536073, 0.463945]]
        id: actor113564
        objectName: "actor113564"
        property alias image: graphic373
        rotation: 52.2
        x: 12.548826
        y: -12.607635
        z: 2
        ImageRenderer {
            cacheRenderParams: actor113564.body.bodyType === Body.StaticBody
            id: graphic373
            sizeScale: 2.4129925
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.536073, 1.05633], [0.657906, 1.05633], [0.657906, 0.463945], [-0.536073, 0.463945]]
        id: actor113565
        objectName: "actor113565"
        property alias image: graphic374
        rotation: 63
        x: 13.623828
        y: -10.8743
        z: 2
        ImageRenderer {
            cacheRenderParams: actor113565.body.bodyType === Body.StaticBody
            id: graphic374
            sizeScale: 2.4129925
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.211844, 0.210375], [0.25999, 0.210375], [0.25999, 0.00861955], [-0.211844, 0.00861955]]
        id: actor116929
        objectName: "actor116929"
        property alias image: graphic375
        x: 13.899872
        y: -14.584713
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor116929.body.bodyType === Body.StaticBody
            id: graphic375
            sizeScale: 0.9535629
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor117239
        objectName: "actor117239"
        property alias image: graphic376
        x: 17.937042
        y: -13.69172
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor117239.body.bodyType === Body.StaticBody
            id: graphic376
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209007, 0.207557], [0.256508, 0.207557], [0.256508, 0.0085041], [-0.209007, 0.0085041]]
        id: actor117550
        objectName: "actor117550"
        property alias image: graphic377
        x: 17.389341
        y: -13.708252
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor117550.body.bodyType === Body.StaticBody
            id: graphic377
            sizeScale: 0.94079036
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671589, 1.32337], [0.82422, 1.32337], [0.82422, 0.854012], [-0.671589, 0.854012]]
        id: actor118183
        objectName: "actor118183"
        property alias image: graphic378
        rotation: 13.500001
        x: 24.510729
        y: -14.337725
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118183.body.bodyType === Body.StaticBody
            id: graphic378
            sizeScale: 3.0229816
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671589, 1.32337], [0.82422, 1.32337], [0.82422, 0.854012], [-0.671589, 0.854012]]
        id: actor118184
        objectName: "actor118184"
        property alias image: graphic379
        rotation: 63.9
        x: 26.544064
        y: -12.521056
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118184.body.bodyType === Body.StaticBody
            id: graphic379
            sizeScale: 3.0229816
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.731799, 1.44201], [0.898114, 1.44201], [0.898114, 0.930577], [-0.731799, 0.930577]]
        id: actor118185
        objectName: "actor118185"
        property alias image: graphic380
        rotation: -37.8
        x: 19.669058
        y: -13.521058
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118185.body.bodyType === Body.StaticBody
            id: graphic380
            sizeScale: 3.2940035
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671589, 1.32337], [0.82422, 1.32337], [0.82422, 0.854012], [-0.671589, 0.854012]]
        id: actor118186
        objectName: "actor118186"
        property alias image: graphic381
        rotation: 91.8001
        x: 26.902395
        y: -9.937722
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118186.body.bodyType === Body.StaticBody
            id: graphic381
            sizeScale: 3.0229816
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.731799, 1.44201], [0.898114, 1.44201], [0.898114, 0.930577], [-0.731799, 0.930577]]
        id: actor118187
        objectName: "actor118187"
        property alias image: graphic382
        rotation: -69.3
        x: 18.352392
        y: -11.429388
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118187.body.bodyType === Body.StaticBody
            id: graphic382
            sizeScale: 3.2940035
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.463811, 0.913939], [0.569221, 0.913939], [0.569221, 0.589796], [-0.463811, 0.589796]]
        id: actor118188
        objectName: "actor118188"
        property alias image: graphic383
        rotation: 45.9
        x: 25.444063
        y: -13.371056
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118188.body.bodyType === Body.StaticBody
            id: graphic383
            sizeScale: 2.0877237
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor118834
        objectName: "actor118834"
        property alias image: graphic384
        rotation: 17.999998
        x: 48.923393
        y: -13.391865
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118834.body.bodyType === Body.StaticBody
            id: graphic384
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.692925, 1.36541], [0.850406, 1.36541], [0.850406, 0.924345], [-0.692925, 0.924345]]
        id: actor118835
        objectName: "actor118835"
        property alias image: graphic385
        rotation: 39.599888
        x: 51.21506
        y: -11.95853
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118835.body.bodyType === Body.StaticBody
            id: graphic385
            sizeScale: 3.1190245
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor118836
        objectName: "actor118836"
        property alias image: graphic386
        rotation: -22.5
        x: 43.515057
        y: -13.041863
        z: 2
        ImageRenderer {
            cacheRenderParams: actor118836.body.bodyType === Body.StaticBody
            id: graphic386
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor120117
        objectName: "actor120117"
        property alias image: graphic387
        x: 57.36161
        y: -6.675685
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor120117.body.bodyType === Body.StaticBody
            id: graphic387
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.25305, 0.251295], [0.31056, 0.251295], [0.31056, 0.0102961], [-0.25305, 0.0102961]]
        id: actor120118
        objectName: "actor120118"
        property alias image: graphic388
        x: 60.537144
        y: -6.699639
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor120118.body.bodyType === Body.StaticBody
            id: graphic388
            sizeScale: 1.1390378
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.25305, 0.251295], [0.31056, 0.251295], [0.31056, 0.0102961], [-0.25305, 0.0102961]]
        id: actor120120
        objectName: "actor120120"
        property alias image: graphic389
        rotation: 26.1
        x: 55.734436
        y: -7.155734
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor120120.body.bodyType === Body.StaticBody
            id: graphic389
            sizeScale: 1.1390378
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.153818, 0.219217], [0.188777, 0.219217], [0.188777, 0.0247476], [-0.153818, 0.0247476]]
        id: actor120453
        objectName: "actor120453"
        property alias image: graphic390
        rotation: -8.100001
        x: 61.51874
        y: -6.854685
        z: 2
        ImageRenderer {
            cacheRenderParams: actor120453.body.bodyType === Body.StaticBody
            id: graphic390
            sizeScale: 0.6923737
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.153818, 0.219217], [0.188777, 0.219217], [0.188777, 0.0247476], [-0.153818, 0.0247476]]
        id: actor120457
        objectName: "actor120457"
        property alias image: graphic391
        rotation: -19.80011
        x: 63.929832
        y: -7.550322
        z: 2
        ImageRenderer {
            cacheRenderParams: actor120457.body.bodyType === Body.StaticBody
            id: graphic391
            sizeScale: 0.6923737
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.26641, 0.379679], [0.326957, 0.379679], [0.326957, -0.259596], [-0.26641, -0.259596]]
        id: actor120458
        objectName: "actor120458"
        property alias image: graphic392
        x: 81.06941
        y: -16.971323
        z: 2
        ImageRenderer {
            cacheRenderParams: actor120458.body.bodyType === Body.StaticBody
            id: graphic392
            sizeScale: 1.1991746
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor122144
        objectName: "actor122144"
        property alias image: graphic393
        rotation: -36
        x: 41.412987
        y: -11.658447
        z: 2
        ImageRenderer {
            cacheRenderParams: actor122144.body.bodyType === Body.StaticBody
            id: graphic393
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor123421
        objectName: "actor123421"
        property alias image: graphic394
        x: 38.932972
        y: -13.859402
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor123421.body.bodyType === Body.StaticBody
            id: graphic394
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.147604, 0.208575], [0.18115, 0.208575], [0.18115, -0.0711051], [-0.147604, -0.0711051]]
        id: actor123740
        objectName: "actor123740"
        property alias image: graphic395
        x: 34.73364
        y: -14.726288
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor123740.body.bodyType === Body.StaticBody
            id: graphic395
            sizeScale: 0.66440064
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor123741
        objectName: "actor123741"
        property alias image: graphic396
        x: 40.231415
        y: -13.5408945
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor123741.body.bodyType === Body.StaticBody
            id: graphic396
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor123742
        objectName: "actor123742"
        property alias image: graphic397
        rotation: 23.4
        x: 47.649216
        y: -15.242625
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor123742.body.bodyType === Body.StaticBody
            id: graphic397
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.845001, 1.66508], [1.03704, 1.66508], [1.03704, 1.12721], [-0.845001, 1.12721]]
        id: actor124705
        objectName: "actor124705"
        property alias image: graphic398
        rotation: 54.899887
        x: 53.43173
        y: -9.88353
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124705.body.bodyType === Body.StaticBody
            id: graphic398
            sizeScale: 3.8035536
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.692925, 1.36541], [0.850406, 1.36541], [0.850406, 0.924345], [-0.692925, 0.924345]]
        id: actor124706
        objectName: "actor124706"
        property alias image: graphic399
        rotation: 62.099777
        x: 54.50673
        y: -7.516863
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124706.body.bodyType === Body.StaticBody
            id: graphic399
            sizeScale: 3.1190245
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.692925, 1.36541], [0.850406, 1.36541], [0.850406, 0.924345], [-0.692925, 0.924345]]
        id: actor124707
        objectName: "actor124707"
        property alias image: graphic400
        rotation: 17.09967
        x: 55.56506
        y: -6.5001955
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124707.body.bodyType === Body.StaticBody
            id: graphic400
            sizeScale: 3.1190245
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.692925, 1.36541], [0.850406, 1.36541], [0.850406, 0.924345], [-0.692925, 0.924345]]
        id: actor124708
        objectName: "actor124708"
        property alias image: graphic401
        rotation: -34.200443
        x: 63.015064
        y: -6.3751945
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124708.body.bodyType === Body.StaticBody
            id: graphic401
            sizeScale: 3.1190245
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513282, 1.01142], [0.629936, 1.01142], [0.629936, 0.684705], [-0.513282, 0.684705]]
        id: actor124709
        objectName: "actor124709"
        property alias image: graphic402
        rotation: -9.000554
        x: 65.106735
        y: -7.1501956
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124709.body.bodyType === Body.StaticBody
            id: graphic402
            sizeScale: 2.3104076
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513282, 1.01142], [0.629936, 1.01142], [0.629936, 0.684705], [-0.513282, 0.684705]]
        id: actor124710
        objectName: "actor124710"
        property alias image: graphic403
        rotation: 10.799444
        x: 67.28173
        y: -7.033529
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124710.body.bodyType === Body.StaticBody
            id: graphic403
            sizeScale: 2.3104076
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.513282, 1.01142], [0.629936, 1.01142], [0.629936, 0.684705], [-0.513282, 0.684705]]
        id: actor124711
        objectName: "actor124711"
        property alias image: graphic404
        rotation: 57.59944
        x: 68.8234
        y: -5.733528
        z: 2
        ImageRenderer {
            cacheRenderParams: actor124711.body.bodyType === Body.StaticBody
            id: graphic404
            sizeScale: 2.3104076
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor125039
        objectName: "actor125039"
        property alias image: graphic405
        x: 90.45177
        y: -9.458268
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125039.body.bodyType === Body.StaticBody
            id: graphic405
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor125040
        objectName: "actor125040"
        property alias image: graphic406
        rotation: 15.29989
        x: 93.48528
        y: -8.982424
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125040.body.bodyType === Body.StaticBody
            id: graphic406
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.889981, 1.75371], [1.09225, 1.75371], [1.09225, 1.18721], [-0.889981, 1.18721]]
        id: actor125041
        objectName: "actor125041"
        property alias image: graphic407
        rotation: 30.59978
        x: 96.31655
        y: -7.971255
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125041.body.bodyType === Body.StaticBody
            id: graphic407
            sizeScale: 4.006019
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.889981, 1.75371], [1.09225, 1.75371], [1.09225, 1.18721], [-0.889981, 1.18721]]
        id: actor125042
        objectName: "actor125042"
        property alias image: graphic408
        rotation: 52.19978
        x: 98.75525
        y: -5.8061633
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125042.body.bodyType === Body.StaticBody
            id: graphic408
            sizeScale: 4.006019
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor125044
        objectName: "actor125044"
        property alias image: graphic409
        rotation: -10.799999
        x: 87.96548
        y: -9.160866
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125044.body.bodyType === Body.StaticBody
            id: graphic409
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816764, 1.60943], [1.00239, 1.60943], [1.00239, 1.08954], [-0.816764, 1.08954]]
        id: actor125045
        objectName: "actor125045"
        property alias image: graphic410
        rotation: -20.69989
        x: 85.74091
        y: -8.530373
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125045.body.bodyType === Body.StaticBody
            id: graphic410
            sizeScale: 3.6764507
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816764, 1.60943], [1.00239, 1.60943], [1.00239, 1.08954], [-0.816764, 1.08954]]
        id: actor125046
        objectName: "actor125046"
        property alias image: graphic411
        rotation: -26.1
        x: 83.67099
        y: -7.519203
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125046.body.bodyType === Body.StaticBody
            id: graphic411
            sizeScale: 3.6764507
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.97971, 1.93052], [1.20237, 1.93052], [1.20237, 1.30691], [-0.97971, 1.30691]]
        id: actor125047
        objectName: "actor125047"
        property alias image: graphic412
        rotation: -30.599998
        x: 81.053856
        y: -6.51993
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125047.body.bodyType === Body.StaticBody
            id: graphic412
            sizeScale: 4.40991
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.67257, 1.3253], [0.825425, 1.3253], [0.825425, 0.897191], [-0.67257, 0.897191]]
        id: actor125385
        objectName: "actor125385"
        property alias image: graphic413
        rotation: 54.89989
        x: 105.13214
        y: -6.5814834
        z: 2
        ImageRenderer {
            cacheRenderParams: actor125385.body.bodyType === Body.StaticBody
            id: graphic413
            sizeScale: 3.0273993
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.67257, 1.20419], [0.825425, 1.20419], [0.825425, 0.845288], [-0.67257, 0.845288]]
        id: actor125386
        objectName: "actor125386"
        property alias image: graphic414
        rotation: 11.7
        x: 103.419075
        y: -7.7101846
        z: 2
        ImageRenderer {
            aspectRatio: 1.2025
            cacheRenderParams: actor125386.body.bodyType === Body.StaticBody
            id: graphic414
            sizeScale: 2.1678686
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.67257, 1.20419], [0.825425, 1.20419], [0.825425, 0.845288], [-0.67257, 0.845288]]
        id: actor125387
        objectName: "actor125387"
        property alias image: graphic415
        rotation: -12.600001
        x: 101.44985
        y: -7.694175
        z: 2
        ImageRenderer {
            aspectRatio: 1.2025
            cacheRenderParams: actor125387.body.bodyType === Body.StaticBody
            id: graphic415
            sizeScale: 2.1678686
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.67257, 1.20419], [0.825425, 1.20419], [0.825425, 0.845288], [-0.67257, 0.845288]]
        id: actor125388
        objectName: "actor125388"
        property alias image: graphic416
        rotation: -56.70001
        x: 100.008965
        y: -6.565473
        z: 2
        ImageRenderer {
            aspectRatio: 1.2025
            cacheRenderParams: actor125388.body.bodyType === Body.StaticBody
            id: graphic416
            sizeScale: 2.1678686
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor127094
        objectName: "actor127094"
        property alias image: graphic417
        x: 84.08253
        y: -9.926573
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor127094.body.bodyType === Body.StaticBody
            id: graphic417
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor127095
        objectName: "actor127095"
        property alias image: graphic418
        x: 82.10819
        y: -9.572684
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor127095.body.bodyType === Body.StaticBody
            id: graphic418
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor127096
        objectName: "actor127096"
        property alias image: graphic419
        x: 94.509674
        y: -9.274683
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor127096.body.bodyType === Body.StaticBody
            id: graphic419
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.211844, 0.210375], [0.25999, 0.210375], [0.25999, 0.00861955], [-0.211844, 0.00861955]]
        id: actor127097
        objectName: "actor127097"
        property alias image: graphic420
        x: 96.775826
        y: -9.263054
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor127097.body.bodyType === Body.StaticBody
            id: graphic420
            sizeScale: 0.9535629
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor127100
        objectName: "actor127100"
        property alias image: graphic421
        x: 123.27063
        y: -13.800786
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127100.body.bodyType === Body.StaticBody
            id: graphic421
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.211844, 0.210375], [0.25999, 0.210375], [0.25999, 0.00861955], [-0.211844, 0.00861955]]
        id: actor127101
        objectName: "actor127101"
        property alias image: graphic422
        rotation: 6.3
        x: 129.39558
        y: -13.377954
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor127101.body.bodyType === Body.StaticBody
            id: graphic422
            sizeScale: 0.9535629
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251308], [0.310578, 0.251308], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor127103
        objectName: "actor127103"
        property alias image: graphic423
        x: 138.31126
        y: -12.129138
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor127103.body.bodyType === Body.StaticBody
            id: graphic423
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.445677, 0.681735], [0.546966, 0.681735], [0.546966, 0.249161], [-0.445677, 0.249161]]
        id: actor127456
        objectName: "actor127456"
        property alias image: graphic424
        x: 126.04397
        y: -6.10896
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127456.body.bodyType === Body.StaticBody
            id: graphic424
            sizeScale: 2.006101
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.445677, 0.681735], [0.546966, 0.681735], [0.546966, 0.249161], [-0.445677, 0.249161]]
        id: actor127457
        objectName: "actor127457"
        property alias image: graphic425
        x: 152.8845
        y: -7.586073
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127457.body.bodyType === Body.StaticBody
            id: graphic425
            sizeScale: 2.006101
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127812
        objectName: "actor127812"
        property alias image: graphic426
        x: 116.32582
        y: -8.52131
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127812.body.bodyType === Body.StaticBody
            id: graphic426
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127813
        objectName: "actor127813"
        property alias image: graphic427
        rotation: 21.599998
        x: 118.961266
        y: -7.9285617
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127813.body.bodyType === Body.StaticBody
            id: graphic427
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127814
        objectName: "actor127814"
        property alias image: graphic428
        rotation: 48.60011
        x: 121.03133
        y: -6.6062803
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127814.body.bodyType === Body.StaticBody
            id: graphic428
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127815
        objectName: "actor127815"
        property alias image: graphic429
        rotation: 63.90022
        x: 122.2077
        y: -4.8189197
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127815.body.bodyType === Body.StaticBody
            id: graphic429
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127816
        objectName: "actor127816"
        property alias image: graphic430
        rotation: -11.7
        x: 114.15545
        y: -8.247733
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127816.body.bodyType === Body.StaticBody
            id: graphic430
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127817
        objectName: "actor127817"
        property alias image: graphic431
        rotation: -28.800112
        x: 111.957726
        y: -7.3358145
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127817.body.bodyType === Body.StaticBody
            id: graphic431
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor127818
        objectName: "actor127818"
        property alias image: graphic432
        rotation: -42.300114
        x: 110.1886
        y: -5.913221
        z: 2
        ImageRenderer {
            cacheRenderParams: actor127818.body.bodyType === Body.StaticBody
            id: graphic432
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128182
        objectName: "actor128182"
        property alias image: graphic433
        rotation: 8.099891
        x: 133.89267
        y: -8.436127
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128182.body.bodyType === Body.StaticBody
            id: graphic433
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128183
        objectName: "actor128183"
        property alias image: graphic434
        rotation: -34.20022
        x: 131.34329
        y: -7.7103877
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128183.body.bodyType === Body.StaticBody
            id: graphic434
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128184
        objectName: "actor128184"
        property alias image: graphic435
        rotation: -42.300217
        x: 129.51964
        y: -6.2775183
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128184.body.bodyType === Body.StaticBody
            id: graphic435
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128185
        objectName: "actor128185"
        property alias image: graphic436
        rotation: -72.90033
        x: 128.44963
        y: -4.230562
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128185.body.bodyType === Body.StaticBody
            id: graphic436
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128186
        objectName: "actor128186"
        property alias image: graphic437
        rotation: 46.799892
        x: 136.34903
        y: -6.9474306
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128186.body.bodyType === Body.StaticBody
            id: graphic437
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128187
        objectName: "actor128187"
        property alias image: graphic438
        rotation: 30.599895
        x: 138.0238
        y: -5.319171
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128187.body.bodyType === Body.StaticBody
            id: graphic438
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.756906, 1.49148], [0.928928, 1.49148], [0.928928, 1.00969], [-0.756906, 1.00969]]
        id: actor128188
        objectName: "actor128188"
        property alias image: graphic439
        rotation: 22.499893
        x: 139.94981
        y: -4.41665
        z: 2
        ImageRenderer {
            cacheRenderParams: actor128188.body.bodyType === Body.StaticBody
            id: graphic439
            sizeScale: 3.4070182
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor129343
        objectName: "actor129343"
        property alias image: graphic440
        x: 107.78067
        y: -9.527261
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor129343.body.bodyType === Body.StaticBody
            id: graphic440
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.347753, 0.747875], [0.426786, 0.747875], [0.426786, 0.383899], [-0.347753, 0.383899]]
        id: actor129346
        objectName: "actor129346"
        property alias image: graphic441
        rotation: -7.1999993
        x: 149.98268
        y: -16.271835
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor129346.body.bodyType === Body.StaticBody
            id: graphic441
            sizeScale: 1.5653187
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.368469, 0.563632], [0.45221, 0.563632], [0.45221, 0.205997], [-0.368469, 0.205997]]
        id: actor131633
        objectName: "actor131633"
        property alias image: graphic442
        x: 58.310074
        y: -14.557626
        z: 2
        ImageRenderer {
            cacheRenderParams: actor131633.body.bodyType === Body.StaticBody
            id: graphic442
            sizeScale: 1.6585661
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.25305, 0.251295], [0.31056, 0.251295], [0.31056, 0.0102961], [-0.25305, 0.0102961]]
        id: actor131634
        objectName: "actor131634"
        property alias image: graphic443
        x: 54.353733
        y: -14.377289
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor131634.body.bodyType === Body.StaticBody
            id: graphic443
            sizeScale: 1.1390378
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor131635
        objectName: "actor131635"
        property alias image: graphic444
        x: 52.943264
        y: -14.332834
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor131635.body.bodyType === Body.StaticBody
            id: graphic444
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.200559, 0.199168], [0.24614, 0.199168], [0.24614, 0.00816038], [-0.200559, 0.00816038]]
        id: actor132026
        objectName: "actor132026"
        property alias image: graphic445
        x: 70.42802
        y: -10.829018
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor132026.body.bodyType === Body.StaticBody
            id: graphic445
            sizeScale: 0.9027654
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor132027
        objectName: "actor132027"
        property alias image: graphic446
        rotation: 15.299999
        x: 69.33698
        y: -11.191586
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132027.body.bodyType === Body.StaticBody
            id: graphic446
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.112177, 0.159871], [0.137672, 0.159871], [0.137672, 0.018048], [-0.112177, 0.018048]]
        id: actor132028
        objectName: "actor132028"
        property alias image: graphic447
        rotation: 14.806981
        x: 72.40655
        y: -14.248146
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132028.body.bodyType === Body.StaticBody
            id: graphic447
            sizeScale: 0.50493675
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.112177, 0.159871], [0.137672, 0.159871], [0.137672, 0.018048], [-0.112177, 0.018048]]
        id: actor132030
        objectName: "actor132030"
        property alias image: graphic448
        rotation: 21.59989
        x: 70.5831
        y: -14.794386
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132030.body.bodyType === Body.StaticBody
            id: graphic448
            sizeScale: 0.50493675
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.120903, 0.0840723], [0.148381, 0.0840723], [0.148381, -0.355371], [-0.120903, -0.355371]]
        id: actor132031
        objectName: "actor132031"
        property alias image: graphic449
        rotation: -54.900112
        x: 67.71378
        y: -8.451005
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132031.body.bodyType === Body.StaticBody
            id: graphic449
            sizeScale: 0.5442147
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.192213, 0.190879], [0.235897, 0.190879], [0.235897, 0.00782077], [-0.192213, 0.00782077]]
        id: actor132035
        objectName: "actor132035"
        property alias image: graphic450
        x: 67.60071
        y: -8.758749
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor132035.body.bodyType === Body.StaticBody
            id: graphic450
            sizeScale: 0.8651954
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.126032, 0.178093], [0.154676, 0.178093], [0.154676, -0.0607134], [-0.126032, -0.0607134]]
        id: actor132433
        objectName: "actor132433"
        property alias image: graphic451
        x: 67.343575
        y: -8.53774
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor132433.body.bodyType === Body.StaticBody
            id: graphic451
            sizeScale: 0.5673019
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.153818, 0.219217], [0.188777, 0.219217], [0.188777, 0.0247476], [-0.153818, 0.0247476]]
        id: actor132443
        objectName: "actor132443"
        property alias image: graphic452
        rotation: 17.09989
        x: 69.42444
        y: -8.01358
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132443.body.bodyType === Body.StaticBody
            id: graphic452
            sizeScale: 0.6923737
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.122419, 0.172987], [0.150241, 0.172987], [0.150241, -0.0589727], [-0.122419, -0.0589727]]
        id: actor132444
        objectName: "actor132444"
        property alias image: graphic453
        x: 89.221245
        y: -9.404655
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor132444.body.bodyType === Body.StaticBody
            id: graphic453
            sizeScale: 0.55103636
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.456523, 0.917834], [0.433316, 0.917834], [0.433316, 0.573958], [-0.456523, 0.573958]]
        id: actor132445
        objectName: "actor132445"
        property alias image: graphic454
        x: 101.60726
        y: -9.934618
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132445.body.bodyType === Body.StaticBody
            id: graphic454
            sizeScale: 1.5892674
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253499, 0.270209], [0.20993, 0.270209], [0.20993, -0.0556829], [-0.253499, -0.0556829]]
        id: actor132446
        objectName: "actor132446"
        property alias image: graphic455
        rotation: -86.400116
        x: 100.75352
        y: -9.454809
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132446.body.bodyType === Body.StaticBody
            id: graphic455
            sizeScale: 0.76995677
            source: Util.getPathToImage("middleground_e1/deco_e1_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.0974735, 0.06778], [0.119626, 0.06778], [0.119626, -0.260344], [-0.0974735, -0.260344]]
        id: actor132447
        objectName: "actor132447"
        property alias image: graphic456
        rotation: -24.300114
        x: 102.196785
        y: -9.5220375
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132447.body.bodyType === Body.StaticBody
            id: graphic456
            sizeScale: 0.4387519
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.33944, 0.470662], [0.416584, 0.470662], [0.416584, -0.305041], [-0.33944, -0.305041]]
        id: actor132852
        objectName: "actor132852"
        property alias image: graphic457
        x: 140.89513
        y: -8.667832
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132852.body.bodyType === Body.StaticBody
            id: graphic457
            sizeScale: 1.5278995
            source: Util.getPathToImage("middleground_e1/deco_e1_bush01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.146196, 0.202714], [0.179422, 0.202714], [0.179422, -0.191885], [-0.146196, -0.191885]]
        id: actor132857
        objectName: "actor132857"
        property alias image: graphic458
        x: 102.197365
        y: -9.666745
        z: 2
        ImageRenderer {
            cacheRenderParams: actor132857.body.bodyType === Body.StaticBody
            id: graphic458
            sizeScale: 0.6580654
            source: Util.getPathToImage("middleground_e1/deco_e1_grass02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor134077
        objectName: "actor134077"
        property alias image: graphic459
        rotation: -15.299999
        x: 100.16907
        y: -9.774084
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor134077.body.bodyType === Body.StaticBody
            id: graphic459
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor134078
        objectName: "actor134078"
        property alias image: graphic460
        x: 100.97758
        y: -9.737058
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor134078.body.bodyType === Body.StaticBody
            id: graphic460
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor134079
        objectName: "actor134079"
        property alias image: graphic461
        rotation: 11.699889
        x: 103.117226
        y: -9.241389
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor134079.body.bodyType === Body.StaticBody
            id: graphic461
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251309], [0.310578, 0.251309], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor134905
        objectName: "actor134905"
        property alias image: graphic462
        rotation: 16.200003
        x: 123.83783
        y: -6.1807246
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor134905.body.bodyType === Body.StaticBody
            id: graphic462
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.138178, 0.0960843], [0.169581, 0.0960843], [0.169581, -0.355682], [-0.138178, -0.355682]]
        id: actor135272
        objectName: "actor135272"
        property alias image: graphic463
        rotation: -12.6
        x: 104.36079
        y: -8.91109
        z: 2
        ImageRenderer {
            cacheRenderParams: actor135272.body.bodyType === Body.StaticBody
            id: graphic463
            sizeScale: 0.62197095
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor135275
        objectName: "actor135275"
        property alias image: graphic464
        x: 103.94514
        y: -9.2402725
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor135275.body.bodyType === Body.StaticBody
            id: graphic464
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.211844, 0.210375], [0.25999, 0.210375], [0.25999, 0.00861955], [-0.211844, 0.00861955]]
        id: actor135276
        objectName: "actor135276"
        property alias image: graphic465
        x: 115.895485
        y: -9.166681
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor135276.body.bodyType === Body.StaticBody
            id: graphic465
            sizeScale: 0.9535629
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.318243, 0.467795], [0.413894, 0.467795], [0.413894, -0.11224], [-0.318243, -0.11224]]
        id: actor135280
        objectName: "actor135280"
        property alias image: graphic466
        x: 121.70594
        y: -8.492973
        z: 2
        ImageRenderer {
            cacheRenderParams: actor135280.body.bodyType === Body.StaticBody
            id: graphic466
            sizeScale: 1.2721276
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.337033], [-0.3053, 0.337033]]
        id: actor135282
        objectName: "actor135282"
        property alias image: graphic467
        x: 120.9466
        y: -9.100206
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor135282.body.bodyType === Body.StaticBody
            id: graphic467
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor135712
        objectName: "actor135712"
        property alias image: graphic468
        x: 119.67674
        y: -9.306642
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor135712.body.bodyType === Body.StaticBody
            id: graphic468
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.146196, 0.202714], [0.179422, 0.202714], [0.179422, -0.191885], [-0.146196, -0.191885]]
        id: actor136138
        objectName: "actor136138"
        property alias image: graphic469
        x: 117.32812
        y: -9.393561
        z: 2
        ImageRenderer {
            cacheRenderParams: actor136138.body.bodyType === Body.StaticBody
            id: graphic469
            sizeScale: 0.6580654
            source: Util.getPathToImage("middleground_e1/deco_e1_grass02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor136143
        objectName: "actor136143"
        property alias image: graphic470
        x: 134.319
        y: -12.48084
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor136143.body.bodyType === Body.StaticBody
            id: graphic470
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.456523, 0.443242], [0.433316, 0.443242], [0.433316, 0.266636], [-0.456523, 0.266636]]
        id: actor137553
        objectName: "actor137553"
        property alias image: graphic471
        rotation: -6.3
        x: 144.66312
        y: -16.686184
        z: 2
        ImageRenderer {
            aspectRatio: 0.77
            cacheRenderParams: actor137553.body.bodyType === Body.StaticBody
            id: graphic471
            sizeScale: 1.5892674
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.213209, 0.303859], [0.261665, 0.303859], [0.261665, -0.207757], [-0.213209, -0.207757]]
        id: actor137557
        objectName: "actor137557"
        property alias image: graphic472
        x: 145.24486
        y: -16.38565
        z: 2
        ImageRenderer {
            cacheRenderParams: actor137557.body.bodyType === Body.StaticBody
            id: graphic472
            sizeScale: 0.95970696
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.166187, 0.0825056], [0.145616, 0.0825056], [0.145616, -0.305416], [-0.166187, -0.305416]]
        id: actor137558
        objectName: "actor137558"
        property alias image: graphic473
        rotation: -135.89989
        x: 144.25803
        y: -16.11914
        z: 2
        ImageRenderer {
            cacheRenderParams: actor137558.body.bodyType === Body.StaticBody
            id: graphic473
            sizeScale: 0.5340733
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor137559
        objectName: "actor137559"
        property alias image: graphic474
        x: 144.08264
        y: -16.442213
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor137559.body.bodyType === Body.StaticBody
            id: graphic474
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Portal {
        activationThreshold: 60
        id: actor138009
        objectName: "actor138009"
        x: 165.70198
        y: -9.52
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.147604, 0.208575], [0.18115, 0.208575], [0.18115, -0.0711051], [-0.147604, -0.0711051]]
        id: actor139078
        objectName: "actor139078"
        property alias image: graphic476
        x: 74.59249
        y: -7.861737
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor139078.body.bodyType === Body.StaticBody
            id: graphic476
            sizeScale: 0.66440064
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor139080
        objectName: "actor139080"
        property alias image: graphic477
        x: 72.61072
        y: -7.841273
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor139080.body.bodyType === Body.StaticBody
            id: graphic477
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.406058, 0.62113], [0.498342, 0.62113], [0.498342, 0.227012], [-0.406058, 0.227012]]
        id: actor139531
        objectName: "actor139531"
        property alias image: graphic478
        x: 91.19189
        y: -9.832847
        z: 2
        ImageRenderer {
            cacheRenderParams: actor139531.body.bodyType === Body.StaticBody
            id: graphic478
            sizeScale: 1.8277628
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251308], [0.310578, 0.251308], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor140886
        objectName: "actor140886"
        property alias image: graphic479
        x: 156.59897
        y: -7.203131
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor140886.body.bodyType === Body.StaticBody
            id: graphic479
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.126171, 0.178288], [0.154845, 0.178288], [0.154845, -0.0607801], [-0.126171, -0.0607801]]
        id: actor142262
        objectName: "actor142262"
        property alias image: graphic480
        x: 150.84251
        y: -7.3545604
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor142262.body.bodyType === Body.StaticBody
            id: graphic480
            sizeScale: 0.5679246
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.253064, 0.251308], [0.310578, 0.251308], [0.310578, 0.0102967], [-0.253064, 0.0102967]]
        id: actor142264
        objectName: "actor142264"
        property alias image: graphic481
        rotation: 13.50011
        x: 142.70265
        y: -8.36376
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor142264.body.bodyType === Body.StaticBody
            id: graphic481
            sizeScale: 1.1391039
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.209008, 0.207558], [0.256509, 0.207558], [0.256509, 0.00850413], [-0.209008, 0.00850413]]
        id: actor142266
        objectName: "actor142266"
        property alias image: graphic482
        x: 145.8702
        y: -6.3023324
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor142266.body.bodyType === Body.StaticBody
            id: graphic482
            sizeScale: 0.94079405
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.300938, 0.417276], [0.369332, 0.417276], [0.369332, -0.270441], [-0.300938, -0.270441]]
        id: actor143082
        objectName: "actor143082"
        property alias image: graphic483
        rotation: -18.90011
        x: 76.019936
        y: -8.221168
        z: 2
        ImageRenderer {
            cacheRenderParams: actor143082.body.bodyType === Body.StaticBody
            id: graphic483
            sizeScale: 1.3545939
            source: Util.getPathToImage("middleground_e1/deco_e1_bush01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[0.147604, 0.208575], [-0.18115, 0.208575], [-0.18115, -0.0711051], [0.147604, -0.0711051]]
        id: actor143083
        objectName: "actor143083"
        property alias image: graphic484
        rotation: -22.038239
        x: 45.15459
        y: -14.73428
        z: 2
        ImageRenderer {
            aspectRatio: -1.2799999
            cacheRenderParams: actor143083.body.bodyType === Body.StaticBody
            id: graphic484
            sizeScale: -0.66440064
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.174126, 0.121082], [0.2137, 0.121082], [0.2137, -0.449007], [-0.174126, -0.449007]]
        id: actor161639
        objectName: "actor161639"
        property alias image: graphic485
        rotation: -94.4999
        x: 143.96829
        y: -12.542092
        z: 2
        ImageRenderer {
            cacheRenderParams: actor161639.body.bodyType === Body.StaticBody
            id: graphic485
            sizeScale: 0.78378314
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.density: 2
        body.friction: 0.1
        body.vertices: [[-0.442596, 0.770918], [-0.000545487, 0.812722], [0.37679, 0.815828], [0.645743, 0.720197], [0.963255, 0.424225], [1.02053, 0.04594], [0.892083, -0.372041], [0.649974, -0.739885], [0.215911, -0.926727], [-0.0522287, -0.931413], [-0.349049, -0.818612], [-0.509301, -0.674906], [-0.776819, -0.403785], [-0.902842, 0.238944], [-0.749211, 0.600293]]
        id: actor103301
        objectName: "actor103301"
        property alias image: graphic486
        rotation: -5.956248
        visible: false
        x: 145.2589
        y: -6.9915676
        z: 2
        ImageRenderer {
            cacheRenderParams: actor103301.body.bodyType === Body.StaticBody
            id: graphic486
            sizeScale: 1.9499998
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder01.png")
            x: 0.0525
            y: -0.14000008
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.174126, 0.121082], [0.2137, 0.121082], [0.2137, -0.449007], [-0.174126, -0.449007]]
        id: actor110841
        objectName: "actor110841"
        property alias image: graphic487
        x: 140.16693
        y: -11.522959
        z: 2
        ImageRenderer {
            cacheRenderParams: actor110841.body.bodyType === Body.StaticBody
            id: graphic487
            sizeScale: 0.78378314
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.165075, 0.233263], [0.202592, 0.233263], [0.202592, -0.0795215], [-0.165075, -0.0795215]]
        id: actor211541
        objectName: "actor211541"
        property alias image: graphic488
        x: 139.70203
        y: -12.051161
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor211541.body.bodyType === Body.StaticBody
            id: graphic488
            sizeScale: 0.7430434
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.3053, 0.656576], [0.374685, 0.656576], [0.374685, 0.249736], [-0.3053, 0.249736]]
        id: actor136141
        objectName: "actor136141"
        property alias image: graphic489
        rotation: 7.19989
        x: 134.8435
        y: -12.796069
        z: 2
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor136141.body.bodyType === Body.StaticBody
            id: graphic489
            sizeScale: 1.3742274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.349285, 0.528296], [0.428667, 0.528296], [0.428667, 0.258547], [-0.349285, 0.258547]]
        id: actor212700
        objectName: "actor212700"
        property alias image: graphic490
        rotation: -4.5001097
        x: 165.99756
        y: -7.3489156
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor212700.body.bodyType === Body.StaticBody
            id: graphic490
            sizeScale: 1.5722173
            source: Util.getPathToImage("middleground_e2/deco_e2_rock13.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.327156, 0.488286], [0.401508, 0.488286], [0.401508, 0.251505], [-0.327156, 0.251505]]
        id: actor212701
        objectName: "actor212701"
        property alias image: graphic491
        x: 161.30573
        y: -7.3306165
        z: 2
        ImageRenderer {
            aspectRatio: 0.6250001
            cacheRenderParams: actor212701.body.bodyType === Body.StaticBody
            id: graphic491
            sizeScale: 1.4726076
            source: Util.getPathToImage("middleground_e2/deco_e2_rock12.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.780809, 0.652482], [0.958263, 0.652482], [0.958263, -0.376316], [-0.780809, -0.376316]]
        id: actor411142
        objectName: "actor411142"
        property alias image: graphic492
        rotation: -16.598724
        x: 147.19846
        y: -13.992829
        z: 2
        ImageRenderer {
            cacheRenderParams: actor411142.body.bodyType === Body.StaticBody
            id: graphic492
            sizeScale: 3.8221364
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.780809, 0.652482], [0.958263, 0.652482], [0.958263, -0.0421811], [-0.780809, -0.0421811]]
        id: actor411143
        objectName: "actor411143"
        property alias image: graphic493
        rotation: -18.62181
        x: 150.22705
        y: -14.856308
        z: 2
        ImageRenderer {
            cacheRenderParams: actor411143.body.bodyType === Body.StaticBody
            id: graphic493
            sizeScale: 3.8221364
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.780809, 1.1551], [0.958263, 1.1551], [0.958263, 0.33251], [-0.780809, 0.33251]]
        id: actor411144
        objectName: "actor411144"
        property alias image: graphic494
        rotation: 0.48471162
        x: 153.56499
        y: -13.851062
        z: 2
        ImageRenderer {
            cacheRenderParams: actor411144.body.bodyType === Body.StaticBody
            id: graphic494
            sizeScale: 3.929858
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.780809, 1.1551], [0.958263, 1.1551], [0.958263, 0.33251], [-0.780809, 0.33251]]
        id: actor454681
        objectName: "actor454681"
        property alias image: graphic495
        rotation: 18.51413
        x: 14.408631
        y: -13.451515
        z: 2
        ImageRenderer {
            cacheRenderParams: actor454681.body.bodyType === Body.StaticBody
            id: graphic495
            sizeScale: 3.929858
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.vertices: [[-0.362524, 0.2265], [-0.316384, 0.358893], [-0.168084, 0.445633], [-0.0906821, 0.525392], [0.045257, 0.57773], [0.177899, 0.557066], [0.305683, 0.3325], [0.328478, 0.213491], [0.374731, 0.070687], [0.356962, -0.0830257], [0.359399, -0.264321], [0.239638, -0.317966], [0.132692, -0.32614], [0.043455, -0.385949], [-0.0255956, -0.402019], [-0.122075, -0.375816], [-0.277242, -0.27623], [-0.385395, -0.179105], [-0.390945, 0.0217708]]
        id: actor207441
        objectName: "actor207441"
        property alias image: graphic496
        rotation: 393.80692
        visible: false
        x: 146.45482
        y: -6.810736
        z: 3
        ImageRenderer {
            cacheRenderParams: actor207441.body.bodyType === Body.StaticBody
            id: graphic496
            sizeScale: 0.87699455
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
            x: -0.0024998486
            y: 0.15500008
        }
    }
    Polygon {
        body.vertices: [[-0.571954, 0.160597], [-0.477462, 0.453593], [-0.251525, 0.594551], [-0.045992, 0.761372], [0.189486, 0.797228], [0.437404, 0.651089], [0.589055, 0.34691], [0.568148, 0.0650443], [0.577432, -0.224005], [0.614051, -0.480111], [0.548912, -0.581527], [0.227967, -0.584286], [0.00307647, -0.739794], [-0.272087, -0.626743], [-0.429383, -0.535111], [-0.612933, -0.355576], [-0.62758, -0.106528]]
        id: actor207440
        objectName: "actor207440"
        property alias image: graphic497
        rotation: -101.45235
        visible: false
        x: 144.11003
        y: -7.386133
        z: 3
        ImageRenderer {
            cacheRenderParams: actor207440.body.bodyType === Body.StaticBody
            id: graphic497
            sizeScale: 1.3489101
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
            x: -0.0024998486
            y: 0.15500008
        }
    }
    Polygon {
        body.bodyType: Body.KinematicBody
        body.vertices: [[-0.43196, 0.353686], [-0.392113, 0.466365], [-0.271882, 0.577095], [-0.0854403, 0.60953], [0.186691, 0.610228], [0.373373, 0.523518], [0.434813, 0.442869], [0.476767, 0.198058], [0.449436, -0.0383688], [0.400547, -0.198837], [0.284786, -0.275329], [0.172385, -0.339793], [0.0243828, -0.35016], [-0.140501, -0.341972], [-0.26283, -0.281157], [-0.356476, -0.163302], [-0.432276, -0.00738913], [-0.451386, 0.186309]]
        id: actor73712
        objectName: "actor73712"
        property alias image: graphic498
        rotation: -3.678526
        x: 141.16316
        y: -11.3688965
        z: 3
        ImageRenderer {
            cacheRenderParams: actor73712.body.bodyType === Body.StaticBody
            id: graphic498
            sizeScale: 1.3489101
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
            x: -0.0024998486
            y: 0.15500008
        }
    }
    Polygon {
        body.bodyType: Body.KinematicBody
        body.vertices: [[-0.23211, 0.247188], [-0.206203, 0.320447], [-0.128035, 0.392438], [-0.0068197, 0.413525], [0.170107, 0.413979], [0.291478, 0.357604], [0.331423, 0.30517], [0.3587, 0.146006], [0.34093, -0.00770648], [0.309145, -0.112035], [0.233883, -0.161767], [0.160805, -0.203677], [0.0645818, -0.210418], [-0.0426175, -0.205094], [-0.122149, -0.165555], [-0.183033, -0.0889322], [-0.232315, 0.0124349], [-0.244739, 0.138368]]
        id: actor207439
        objectName: "actor207439"
        property alias image: graphic499
        rotation: 38.522217
        x: 141.88412
        y: -11.889172
        z: 3
        ImageRenderer {
            cacheRenderParams: actor207439.body.bodyType === Body.StaticBody
            id: graphic499
            sizeScale: 0.87699455
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder04.png")
            x: -0.0024998486
            y: 0.15500008
        }
    }
    Polygon {
        body.bodyType: Body.KinematicBody
        body.vertices: [[-0.178416, 0.234497], [-0.133396, 0.304066], [-0.0435911, 0.356331], [0.0667625, 0.375529], [0.227836, 0.375942], [0.338331, 0.324619], [0.374697, 0.276884], [0.399529, 0.131981], [0.383352, -0.00795811], [0.354415, -0.102938], [0.285897, -0.148214], [0.219689, -0.186869], [0.131429, -0.199298], [0.033835, -0.194452], [-0.0382332, -0.151663], [-0.0936617, -0.0819056], [-0.138528, 0.0103785], [-0.177767, 0.102913]]
        id: actor73711
        objectName: "actor73711"
        property alias image: graphic500
        rotation: 1.7267572
        x: 142.87115
        y: -12.005334
        z: 3
        ImageRenderer {
            cacheRenderParams: actor73711.body.bodyType === Body.StaticBody
            id: graphic500
            sizeScale: 1.7114186
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder02.png")
            x: -0.0325
            y: -0.465
        }
    }
    Polygon {
        body.bodyType: Body.KinematicBody
        body.vertices: [[-0.450245, 0.101459], [-0.36299, 0.2059], [-0.227693, 0.208085], [-0.102063, 0.162394], [0.102461, 0.107212], [0.244242, 0.0558541], [0.395241, -0.0138585], [0.665123, -0.187684], [0.607628, -0.286434], [0.488815, -0.292848], [0.330512, -0.290201], [0.152354, -0.28749], [-0.0351354, -0.276935], [-0.196421, -0.239113], [-0.397497, -0.200852], [-0.466314, -0.151907], [-0.475612, -0.0533378]]
        id: actor73713
        objectName: "actor73713"
        property alias image: graphic501
        rotation: -2.584015
        x: 141.02487
        y: -11.955236
        z: 4
        ImageRenderer {
            cacheRenderParams: actor73713.body.bodyType === Body.StaticBody
            id: graphic501
            sizeScale: 1.490015
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder05.png")
            x: -0.0275
            y: -0.4775
        }
    }
    Polygon {
        body.bodyType: Body.KinematicBody
        body.vertices: [[-0.392665, 0.177256], [-0.187591, 0.234171], [-0.00341445, 0.216925], [0.0981082, 0.215825], [0.236388, 0.177252], [0.360638, 0.0687597], [0.541291, -0.0122963], [0.745827, -0.103069], [0.775165, -0.208565], [0.723734, -0.307992], [0.581618, -0.324216], [0.43409, -0.318123], [0.278747, -0.307211], [0.0631465, -0.252198], [-0.25486, -0.158729], [-0.474868, -0.0855498], [-0.735074, 0.00196863], [-0.790271, 0.104768], [-0.669623, 0.15445]]
        id: actor73714
        objectName: "actor73714"
        property alias image: graphic502
        rotation: 4.6561537
        x: 142.47366
        y: -12.304732
        z: 4
        ImageRenderer {
            cacheRenderParams: actor73714.body.bodyType === Body.StaticBody
            id: graphic502
            sizeScale: 1.9114077
            source: Util.getPathToImage("middleground_e1/deco_e1_boulder06.png")
            x: 0.052500077
            y: -0.7
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.215736, 0.19618], [0.170384, 0.19618], [0.170384, -0.0668794], [-0.215736, -0.0668794]]
        id: actor161640
        objectName: "actor161640"
        property alias image: graphic503
        x: 143.40155
        y: -12.803857
        z: 5
        ImageRenderer {
            aspectRatio: 1.2799999
            cacheRenderParams: actor161640.body.bodyType === Body.StaticBody
            id: graphic503
            sizeScale: 0.6249165
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor62090
        objectName: "actor62090"
        property alias image: graphic505
        property alias parallaxTransform: parallaxTransform504
        x: 52.416897
        y: 3.0483742
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform504
            zDepth: 0.7
            ImageRenderer {
                id: graphic505
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor60732
        objectName: "actor60732"
        property alias image: graphic507
        property alias parallaxTransform: parallaxTransform506
        x: 41.353336
        y: -5.5768266
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform506
            zDepth: 0.7
            ImageRenderer {
                id: graphic507
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor62490
        objectName: "actor62490"
        property alias image: graphic509
        property alias parallaxTransform: parallaxTransform508
        rotation: 54.899887
        x: -1.5751023
        y: -6.4186296
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform508
            zDepth: 0.7
            ImageRenderer {
                aspectRatio: 1.175
                id: graphic509
                sizeScale: 5.5028195
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.397635, 1.30051], [1.08119, 1.30051], [1.08119, -0.323443], [-0.397635, -0.323443]]
        id: actor65284
        objectName: "actor65284"
        property alias image: graphic511
        property alias parallaxTransform: parallaxTransform510
        rotation: 32.400005
        x: -20.218828
        y: -15.333057
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform510
            zDepth: 0.7
            ImageRenderer {
                id: graphic511
                sizeScale: 3.5595822
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor60733
        objectName: "actor60733"
        property alias image: graphic513
        property alias parallaxTransform: parallaxTransform512
        rotation: 24.300001
        x: -19.78252
        y: -10.054099
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform512
            zDepth: 0.7
            ImageRenderer {
                id: graphic513
                sizeScale: 5.5028195
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.481152, 1.57366], [1.30828, 1.57366], [1.30828, -0.391378], [-0.481152, -0.391378]]
        id: actor64147
        objectName: "actor64147"
        property alias image: graphic515
        property alias parallaxTransform: parallaxTransform514
        rotation: 42.300003
        x: -19.931314
        y: -17.021885
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform514
            zDepth: 0.7
            ImageRenderer {
                id: graphic515
                sizeScale: 4.3072195
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor126410
        objectName: "actor126410"
        property alias image: graphic517
        property alias parallaxTransform: parallaxTransform516
        x: 93.32309
        y: 1.7898836
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform516
            zDepth: 0.7
            ImageRenderer {
                id: graphic517
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor147925
        objectName: "actor147925"
        property alias image: graphic519
        property alias parallaxTransform: parallaxTransform518
        rotation: 27.899775
        x: 16.526857
        y: -6.430572
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform518
            zDepth: 0.7
            ImageRenderer {
                aspectRatio: 1.3225
                id: graphic519
                sizeScale: 5.5028195
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.375566, 1.22833], [1.02118, 1.22833], [1.02118, -0.305492], [-0.375566, -0.305492]]
        id: actor149894
        objectName: "actor149894"
        property alias image: graphic521
        property alias parallaxTransform: parallaxTransform520
        rotation: -45.899998
        x: 82.81811
        y: 2.1345286
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform520
            zDepth: 0.7
            ImageRenderer {
                id: graphic521
                sizeScale: 4.012038
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.494527, 1.6174], [1.34465, 1.6174], [1.34465, -0.402258], [-0.494527, -0.402258]]
        id: actor150883
        objectName: "actor150883"
        property alias image: graphic523
        property alias parallaxTransform: parallaxTransform522
        x: 114.93097
        y: 2.0426064
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform522
            zDepth: 0.7
            ImageRenderer {
                id: graphic523
                sizeScale: 6.00265
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.494527, 1.6174], [1.34465, 1.6174], [1.34465, -0.402258], [-0.494527, -0.402258]]
        id: actor151883
        objectName: "actor151883"
        property alias image: graphic525
        property alias parallaxTransform: parallaxTransform524
        x: 214.52554
        y: 2.2335231
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform524
            zDepth: 0.7
            ImageRenderer {
                id: graphic525
                sizeScale: 6.00265
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.494527, 1.6174], [1.34465, 1.6174], [1.34465, -0.402258], [-0.494527, -0.402258]]
        id: actor153509
        objectName: "actor153509"
        property alias image: graphic527
        property alias parallaxTransform: parallaxTransform526
        rotation: -39.6
        x: 201.27885
        y: 3.4665701
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform526
            zDepth: 0.7
            ImageRenderer {
                id: graphic527
                sizeScale: 6.00265
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.494527, 1.6174], [1.34465, 1.6174], [1.34465, -0.402258], [-0.494527, -0.402258]]
        id: actor153510
        objectName: "actor153510"
        property alias image: graphic529
        property alias parallaxTransform: parallaxTransform528
        rotation: -39.6
        x: 164.43549
        y: 2.599372
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform528
            zDepth: 0.7
            ImageRenderer {
                id: graphic529
                sizeScale: 6.00265
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor410314
        objectName: "actor410314"
        property alias image: graphic531
        property alias parallaxTransform: parallaxTransform530
        rotation: 28.099627
        x: 68.58517
        y: 3.411796
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform530
            zDepth: 0.7
            ImageRenderer {
                id: graphic531
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor410315
        objectName: "actor410315"
        property alias image: graphic533
        property alias parallaxTransform: parallaxTransform532
        rotation: 30.22023
        x: 108.10434
        y: 3.5521865
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform532
            zDepth: 0.7
            ImageRenderer {
                id: graphic533
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.61471, 2.01048], [1.67143, 2.01048], [1.67143, -0.500017], [-0.61471, -0.500017]]
        id: actor410316
        objectName: "actor410316"
        property alias image: graphic535
        property alias parallaxTransform: parallaxTransform534
        rotation: 30.22023
        x: 135.22403
        y: 1.9275904
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform534
            zDepth: 0.7
            ImageRenderer {
                id: graphic535
                sizeScale: 7.461451
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.494527, 1.6174], [1.34465, 1.6174], [1.34465, -0.402258], [-0.494527, -0.402258]]
        id: actor456762
        objectName: "actor456762"
        property alias image: graphic537
        property alias parallaxTransform: parallaxTransform536
        rotation: 23.916172
        x: 202.93646
        y: 3.8155434
        z: 6
        ParallaxTransformItem {
            id: parallaxTransform536
            zDepth: 0.7
            ImageRenderer {
                id: graphic537
                sizeScale: 6.00265
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    ThoughtBubble {
        id: thoughtBubble538
        objectName: "thoughtBubble538"
        playerActor: actor0
        portal: actor138009
        x: 3.78442
        y: -16.7672
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
        id: particleLayer2
    }
    ParticleLayer {
        id: particleLayer3
    }
}
