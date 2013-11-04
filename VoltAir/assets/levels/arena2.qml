import QtQuick 2.2
import VoltAir 1.0
Level {
    cameraBoundary: Qt.rect(0.21014, -24.2574, 20.7089, 11.6926)
    completionThreshold: 25
    fileName: "arena2"
    fillCamera: true
    parallaxOrigin.x: 11.220729
    parallaxOrigin.y: -19.160648
    Polygon {
        body.active: false
        body.vertices: [[-12.1123, 12.0156], [12.1731, 12.0156], [12.1731, -1.70233], [-12.1123, -1.70233]]
        id: actor39986
        objectName: "actor39986"
        property alias image: graphic0
        x: 10.592566
        y: -23.612015
        z: -10
        ImageRenderer {
            cacheRenderParams: actor39986.body.bodyType === Body.StaticBody
            id: graphic0
            sizeScale: 23.742374
            source: Util.getPathToImage("background_mp/bg_mp1_flat.jpg")
        }
    }
    Accelerator {
        body.vertices: [[-2.13251, -0.640773], [-2.84937, -0.341774], [-3.90745, 0.163819], [-4.49939, -0.011353], [-4.92448, -0.623709], [-4.9272, -1.72304], [-4.59168, -2.76435], [-3.94731, -3.83419], [-5.43289, -2.1396], [-5.1752, -0.587885], [-4.99053, -0.183029], [-4.74542, 0.270193], [-3.96587, 0.516284], [-3.13519, 0.231597], [-1.73259, -0.690348]]
        id: actor36704
        objectName: "actor36704"
        x: 5.9709635
        y: -15.5802555
        z: -3
    }
    Accelerator {
        body.vertices: [[1.8564, -0.356845], [2.57221, -0.098702], [3.21597, 0.150548], [3.90745, 0.163819], [4.42345, 0.0983492], [4.7508, -0.221375], [4.93178, -0.584519], [5.15139, -1.61563], [5.26427, -2.56671], [5.39411, -3.8211], [5.60816, -1.82825], [5.15435, -0.124521], [4.71031, 0.539329], [3.93077, 0.656703], [2.97405, 0.50677], [2.05856, 0.22528], [1.52909, -0.341251]]
        id: actor36707
        objectName: "actor36707"
        x: 14.918912
        y: -15.578643
        z: -3
    }
    Accelerator {
        body.vertices: [[-1.8112, 0.75513], [-3.07859, 0.504995], [-3.9926, 0.19788], [-4.23183, 0.0120558], [-4.40011, -0.34609], [-4.527, -0.788605], [-4.76755, -1.16272], [-4.68102, -0.834066], [-4.6552, -0.29097], [-4.50105, 0.164083], [-4.31038, 0.387316], [-4.18339, 0.533017], [-3.8541, 0.747251], [-3.24116, 0.89324], [-2.27468, 0.92937]]
        id: actor36709
        objectName: "actor36709"
        x: 11.396141
        y: -14.4400425
        z: -3
    }
    Accelerator {
        body.vertices: [[1.05518, 0.289677], [2.69233, 0.539606], [3.71104, 0.449104], [4.08564, 0.200042], [4.21504, -0.149275], [4.17826, -0.677421], [4.24865, -1.19747], [4.34001, -1.42602], [4.62178, -0.654696], [4.58958, -0.336906], [4.45511, 0.118147], [4.31038, 0.387316], [4.18339, 0.533017], [3.8541, 0.747251], [3.14711, 0.813619], [1.68595, 0.781401], [-0.199112, 0.441988], [0.113535, 0.301917]]
        id: actor39963
        objectName: "actor39963"
        x: 11.741997
        y: -14.143009
        z: -3
    }
    TriggerArea {
        Component.onCompleted: {if (actor38259.image) { actor38259.image.cacheRenderParams = false; }}
        body.vertices: [[-0.771163, 0.126436], [-0.377463, 0.509577], [-0.0123358, -0.519672], [-0.536678, -0.64547]]
        id: actor37977
        inputs: [actor0, actor37580, actor37581, actor37582]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0
                beginValue: 0.01
                endValue: 50
                forwardDuration: 0
                smoothing: 0
                target: actor38259
                targetProperty: "emitterLogic.spawnRate"
            }
        ]
        objectName: "actor37977"
        rotation: -90.266556
        visible: false
        x: 4.1797814
        y: -13.724193
        z: -1
    }
    TriggerArea {
        Component.onCompleted: {if (actor37978.image) { actor37978.image.cacheRenderParams = false; }}
        body.vertices: [[-0.616283, 0.435416], [-0.262842, 0.70204], [-0.209831, -0.603509], [-0.630122, -0.358964]]
        id: actor38260
        inputs: [actor0, actor37580, actor37581, actor37582]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0
                beginValue: 0.01
                endValue: 50
                forwardDuration: 0
                smoothing: 0
                target: actor37978
                targetProperty: "emitterLogic.spawnRate"
            }
        ]
        objectName: "actor38260"
        rotation: -90.266556
        visible: false
        x: 10.412087
        y: -13.254223
        z: -1
    }
    Polygon {
        body.restitution: 0
        body.vertices: [[-4.95046, 1.19919], [16.9655, 0.817441], [17.522, 0.900006], [17.5201, -22.7314], [14.055, -23.2183], [13.9925, -18.9717], [14.0418, -13.3398], [14.08, -12.4444], [14.1416, -11.3525], [14.3186, -10.4395], [14.5443, -9.90998], [14.7112, -9.55633], [14.9896, -9.27935], [15.3215, -9.08179], [15.7156, -8.72697], [15.9278, -8.28547], [16.0203, -7.76035], [16.0455, -7.04081], [15.9927, -6.1365], [15.9229, -5.5381], [15.793, -4.92695], [15.6527, -4.56828], [15.4737, -4.22783], [15.2058, -3.9611], [14.8157, -3.82145], [14.4383, -3.78388], [14.0056, -3.84041], [13.5566, -3.95799], [13.1107, -4.11918], [12.817, -4.29776], [12.5881, -4.47832], [12.3885, -4.65074], [12.2037, -4.72628], [12.0128, -4.68607], [11.8739, -4.58481], [11.7661, -4.3812], [11.7525, -4.05912], [11.7767, -3.7671], [11.8692, -3.42126], [11.9019, -3.06514], [11.8453, -2.74331], [11.6688, -2.45764], [11.3893, -2.29542], [10.9982, -2.18554], [10.4348, -2.18601], [9.81066, -2.26215], [8.96694, -2.43568], [8.04862, -2.56158], [7.53428, -2.556], [7.19932, -2.51525], [6.96603, -2.43333], [6.79931, -2.30102], [6.71201, -2.08464], [6.64243, -1.83691], [6.56886, -1.66954], [6.4385, -1.5441], [6.28498, -1.50767], [6.14783, -1.50604], [6.01027, -1.50795], [5.84362, -1.54306], [5.76018, -1.65215], [5.70302, -1.83406], [5.69453, -2.03252], [5.70018, -2.23828], [5.65164, -2.38648], [5.48453, -2.48376], [5.24461, -2.49567], [4.91181, -2.42583], [4.51822, -2.38317], [3.995, -2.39562], [3.52542, -2.45179], [3.14303, -2.57051], [2.79244, -2.83157], [2.61655, -3.13973], [2.51278, -3.45203], [2.48578, -3.75447], [2.46783, -4.08047], [2.4336, -4.23998], [2.33826, -4.38539], [2.20177, -4.4199], [2.02017, -4.36128], [1.76016, -4.16424], [1.28735, -3.62104], [0.841796, -2.99154], [0.564731, -2.48077], [0.299034, -2.03233], [0.0654605, -1.87413], [-0.245127, -1.84836], [-0.488219, -2.01573], [-0.568143, -2.22891], [-0.557027, -2.49085], [-0.419421, -2.91329], [-0.220713, -3.3654], [-0.0321842, -3.85213], [0.114452, -4.26191], [0.194212, -4.57927], [0.212866, -4.8352], [0.185359, -4.96782], [0.0970235, -5.06522], [-0.0402556, -5.09846], [-0.233615, -5.04806], [-0.490355, -4.91857], [-0.92735, -4.60248], [-1.31307, -4.33505], [-1.71529, -4.07778], [-2.03566, -3.97702], [-2.28007, -3.96395], [-2.47646, -3.95834], [-2.70173, -4.00756], [-2.94493, -4.1372], [-3.09993, -4.3402], [-3.29806, -4.63097], [-3.42722, -5.0114], [-3.47219, -5.43743], [-3.45339, -5.78634], [-3.40035, -6.19533], [-3.29002, -6.66321], [-2.99123, -7.14693], [-2.58296, -7.56463], [-2.14404, -7.88109], [-1.94813, -8.16141], [-1.85737, -8.53035], [-1.90457, -8.95249], [-2.06377, -9.51888], [-2.36475, -10.7656], [-2.45681, -11.9153], [-2.46775, -12.6267], [-2.46515, -13.4516], [-2.39596, -18.8386], [-2.63077, -23.1954], [-4.94925, -23.0083]]
        id: actor36699
        objectName: "actor36699"
        property alias image: graphic7
        x: 4.301097
        y: -11.239576
        z: -1
        ImageRenderer {
            cacheRenderParams: actor36699.body.bodyType === Body.StaticBody
            id: graphic7
            sizeScale: 23.7189
            source: Util.getPathToImage("middleground_mp/mg_mp1_flat.png")
            x: 6.293761
            y: -12.388269
        }
    }
    Bumper {
        body.restitution: 0.5
        body.vertices: [[-0.757412, 0.398638], [-0.689484, 0.634516], [-0.556786, 0.769148], [-0.386994, 0.764883], [-0.166099, 0.611245], [0.0749195, 0.378427], [0.212971, 0.1633], [0.255146, -0.0903916], [0.16616, -0.305319], [-0.0199322, -0.631177], [-0.170522, -0.829362], [-0.335779, -0.891809], [-0.472716, -0.801266], [-0.597957, -0.597957], [-0.682257, -0.332062], [-0.737055, -0.0740799]]
        id: actor36802
        objectName: "actor36802"
        property alias image: graphic8
        rotation: -360.9
        x: 2.5540836
        y: -17.009968
        ImageRenderer {
            cacheRenderParams: actor36802.body.bodyType === Body.StaticBody
            id: graphic8
            sizeScale: 1.0404567
            source: Util.getPathToImage("middleground_mp/deco_mp_bumper01.png")
            x: -0.26
            y: 0.26250008
        }
    }
    SnowflakeEmitter {
        emitterLogic.spawnSpray: 0.55
        emitterLogic.spawnSpread: 7
        emitterLogic.spawnVelocity: 2.3024242
        id: actor36806
        objectName: "actor36806"
        x: 10.234096
        y: -25.609304
    }
    ParticleEmitter {
        emitterLogic.decayTime: 0.833333376795053
        emitterLogic.decayTimeRandomLength: 0.333333350718021
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRandom: false
        emitterLogic.spawnRate: 0.01
        emitterLogic.spawnSpread: 0.215
        emitterLogic.timeOn: 0.6
        id: actor37978
        objectName: "actor37978"
        rotation: -180
        visible: false
        x: 10.47099
        y: -12.879263
    }
    ParticleEmitter {
        emitterLogic.decayTime: 0.833333376795053
        emitterLogic.decayTimeRandomLength: 0.333333350718021
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRandom: false
        emitterLogic.spawnRate: 0.01
        emitterLogic.spawnSpread: 0.53999996
        emitterLogic.timeOn: 0.6
        id: actor38259
        objectName: "actor38259"
        rotation: -155
        visible: false
        x: 4.0948324
        y: -13.346675
    }
    Polygon {
        body.vertices: [[-6.69038, 2.27093], [15.779, 2.54789], [8.10957, -0.125572], [-0.44415, -0.0660362]]
        id: actor39983
        objectName: "actor39983"
        x: 6.0422273
        y: -36.518845
    }
    Bumper {
        body.restitution: 0.5
        body.vertices: [[-0.641601, 0.102121], [-0.517555, 0.429667], [-0.298537, 0.622326], [0.0431848, 0.680667], [0.499927, 0.6812], [0.663645, 0.589644], [0.691774, 0.418708], [0.602417, 0.239943], [0.553742, 0.114385], [0.361162, -0.0993594], [0.183851, -0.273126], [0.0609596, -0.362917], [-0.127932, -0.498088], [-0.32471, -0.585491], [-0.508267, -0.588735], [-0.658498, -0.462885], [-0.689742, -0.179523]]
        id: actor40129
        objectName: "actor40129"
        property alias image: graphic13
        x: 8.699832
        y: -15.518651
        ImageRenderer {
            cacheRenderParams: actor40129.body.bodyType === Body.StaticBody
            id: graphic13
            sizeScale: 1.3992103
            source: Util.getPathToImage("middleground_mp/deco_mp_bumper02.png")
        }
    }
    Bumper {
        body.restitution: 0.5
        body.vertices: [[-0.672597, 0.816005], [-0.0141471, 1.0818], [0.58351, 1.17801], [0.998724, 1.11304], [1.16277, 0.94387], [1.17758, 0.732219], [1.04813, 0.44588], [0.760916, 0.0124046], [0.465299, -0.281872], [0.182831, -0.389639], [-0.0879559, -0.356619], [-0.501873, -0.238804], [-0.881213, -0.0724371], [-1.15391, 0.145225], [-1.16452, 0.369867], [-0.99485, 0.593483]]
        id: actor40130
        objectName: "actor40130"
        property alias image: graphic14
        x: 13.036603
        y: -15.999974
        ImageRenderer {
            cacheRenderParams: actor40130.body.bodyType === Body.StaticBody
            id: graphic14
            sizeScale: 2.392453
            source: Util.getPathToImage("middleground_mp/deco_mp_bumper03.png")
        }
    }
    Bumper {
        body.restitution: 0.5
        body.vertices: [[0.72708, 0.0374667], [0.518393, 0.409242], [0.286092, 0.668746], [-0.00792592, 0.937201], [-0.259817, 1.05634], [-0.497197, 1.0835], [-0.619754, 0.973484], [-0.747496, 0.609306], [-0.780926, 0.0920732], [-0.68864, -0.367069], [-0.490985, -0.680973], [-0.123314, -0.800681], [0.20807, -0.764481], [0.518117, -0.692175], [0.721551, -0.496621], [0.776278, -0.265988]]
        id: actor40131
        objectName: "actor40131"
        property alias image: graphic15
        rotation: -180
        x: 18.51696
        y: -17.317469
        ImageRenderer {
            cacheRenderParams: actor40131.body.bodyType === Body.StaticBody
            id: graphic15
            sizeScale: -1.587247
            source: Util.getPathToImage("middleground_mp/deco_mp_bumper04.png")
        }
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor0
        objectName: "actor0"
        playerId: 3
        rollingMovementLogic.speed: 40
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 11.556555
        y: -26.213076
        z: 1
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor37581
        objectName: "actor37581"
        playerId: 1
        rollingMovementLogic.speed: 40
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 10.792843
        y: -26.22438
        z: 1
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor37580
        objectName: "actor37580"
        playerId: 0
        rollingMovementLogic.speed: 40
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 10.069444
        y: -26.220085
        z: 1
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor37582
        objectName: "actor37582"
        playerId: 2
        rollingMovementLogic.speed: 40
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 9.330684
        y: -26.219818
        z: 1
    }
    ParticleLayer {
        id: particleLayer0
        radius: 0.075
    }
    ParticleLayer {
        id: particleLayer1
    }
    ParticleLayer {
        id: particleLayer2
    }
    ParticleLayer {
        id: particleLayer3
    }
}
