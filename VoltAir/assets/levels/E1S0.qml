import QtQuick 2.2
import VoltAir 1.0
Level {
    cameraBoundary: Qt.rect(-4.83268, -30, 41.3274, 16.8874)
    fileName: "E1S0"
    parallaxOrigin.x: 15
    parallaxOrigin.y: -21.697891
    parallaxStrength.y: 1
    Polygon {
        body.active: false
        body.vertices: [[-10.0774, 10.219], [10.2866, 10.219], [10.2866, -1.14761], [-10.0774, -1.14761]]
        id: actor36924
        objectName: "actor36924"
        property alias image: graphic1
        property alias parallaxTransform: parallaxTransform0
        x: 14.990372
        y: -26.841135
        z: -10
        ParallaxTransformItem {
            id: parallaxTransform0
            zDepth: 50
            ImageRenderer {
                id: graphic1
                sizeScale: 20.63347
                source: Util.getPathToImage("background_e1/bg_e1_flat.jpg")
            }
        }
    }
    Polygon {
        body.friction: 0.1
        body.vertices: [[2.5227, 1.04084], [-1.7774, 1.00239], [-1.80952, -16.7683], [1.82322, -16.7301], [2.1585, -15.0961], [2.20922, -13.1146], [2.54088, -11.0154], [2.79417, -9.29448], [3.0527, -7.92974], [3.05885, -7.02183], [2.92892, -5.8317], [2.65951, -4.8592], [2.49726, -3.86865], [2.49888, -2.51581], [2.42842, -1.7788], [2.25999, -0.821339], [2.2242, 0.0237219], [2.26241, 0.468906]]
        id: actor286231
        objectName: "actor286231"
        property alias bodyRenderer: graphic2
        x: -3.2575088
        y: -17.717457
        z: -2
        TerrainMeshRenderer {
            id: graphic2
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic2baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "bJoKQMUP/b4YFhxA2YB8v4ts2r9Zk26/bJoKQMUP/b6LbNq/WZNuv2Sb3r/5k4VBZJvev/mThUHTOuE/QzmFQRDJA0A4W3FBZJvev/mThUEQyQNAOFtxQVIEB0BQsFFBZJvev/mThUFSBAdAULBRQTJKHEA6ATBBZJvev/mThUEyShxAOgEwQfqDLEA4chRBZJvev/mThUH6gyxAOHIUQbsAPUAecf1AZJvev/mThUG7AD1AHnH9QPhfPUCc3OBAZJvev/mThUH4Xz1AnNzgQFcqNUCVN7tAZJvev/mThUFXKjVAlTe7QEL1I0BbLpxAZJvev/mThUFC9SNAWy6cQApyGUDRG3hAZJvev/mThUEKchlA0Rt4QA6JGUARUCFAZJvev/mThUEOiRlAEVAhQMITFUC6Z+U/ZJvev/mThUHCExVAumflP95GCkAuB1U/ZJvev/mThUHeRgpALgdVP07zB0DfDtS8ZJvev/mThUFO8wdA3w7UvGyaCkDFD/2+"
            }
            PolygonVertexAttributeArray {
                id: graphic2baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "GJDEvhM3iz9bW92+e2GWP5Lhmj5zJZU/GJDEvhM3iz+S4Zo+cyWVP+XYnT5i3/q/5didPmLf+r//tJ++GN75v+Hkur7CSNa/5didPmLf+r/h5Lq+wkjWvxJ6v77KX6m/5didPmLf+r8Ser++yl+pvz6l3b6UNXO/5didPmLf+r8+pd2+lDVzvwKo9L4wCyW/5didPmLf+r8CqPS+MAslv+EEBr/c2M6+5didPmLf+r/hBAa/3NjOvmlIBr+IkXu+5didPmLf+r9pSAa/iJF7vi12AL8AFxi95didPmLf+r8tdgC/ABcYvTOF6L70CAo+5didPmLf+r8zhei+9AgKPpic2b7MI6A+5didPmLf+r+YnNm+zCOgPjy92b6WnQ0/5didPmLf+r88vdm+lp0NP69q076Iqi4/5didPmLf+r+vatO+iKouP5kZxL58PFo/5didPmLf+r+ZGcS+fDxaP/3MwL5eloA/5didPmLf+r/9zMC+XpaAPxiQxL4TN4s/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic2baseMesha_position, graphic2baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic2edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "GBYcQNmAfL+a0SZAxDOMvyT8FkAKGeO+GBYcQNmAfL8k/BZAChnjvmyaCkDFD/2+bJoKQMUP/b4k/BZAChnjvla/FEDgmbC8bJoKQMUP/b5WvxRA4JmwvE7zB0DfDtS8TvMHQN8O1LxWvxRA4JmwvH4AF0BZf08/TvMHQN8O1Lx+ABdAWX9PP95GCkAuB1U/3kYKQC4HVT9+ABdAWX9PP97CIUB89+E/3kYKQC4HVT/ewiFAfPfhP8ITFUC6Z+U/whMVQLpn5T/ewiFAfPfhPzpSJkDvtSBAwhMVQLpn5T86UiZA77UgQA6JGUARUCFADokZQBFQIUA6UiZA77UgQDU0JkAOFHdADokZQBFQIUA1NCZADhR3QApyGUDRG3hACnIZQNEbeEA1NCZADhR3QLN1MEC5zppACnIZQNEbeECzdTBAuc6aQEL1I0BbLpxAQvUjQFsunECzdTBAuc6aQHy8QUD4ArpAQvUjQFsunEB8vEFA+AK6QFcqNUCVN7tAVyo1QJU3u0B8vEFA+AK6QIMoSkAdieBAVyo1QJU3u0CDKEpAHYngQPhfPUCc3OBA+F89QJzc4ECDKEpAHYngQCG+SUDKD/5A+F89QJzc4EAhvklAyg/+QLsAPUAecf1AuwA9QB5x/UAhvklAyg/+QF4jOUAg+hRBuwA9QB5x/UBeIzlAIPoUQfqDLEA4chRB+oMsQDhyFEFeIzlAIPoUQYHxKEDLfDBB+oMsQDhyFEGB8ShAy3wwQTJKHEA6ATBBMkocQDoBMEGB8ShAy3wwQYXDE0Dg+lFBMkocQDoBMEGFwxNA4PpRQVIEB0BQsFFBUgQHQFCwUUGFwxNA4PpRQZmAEEBluHFBUgQHQFCwUUGZgBBAZbhxQRDJA0A4W3FBEMkDQDhbcUGZgBBAZbhxQbGD8T9OdYZBEMkDQDhbcUGxg/E/TnWGQdM64T9DOYVB0zrhP0M5hUGxg/E/TnWGQUyh8L/ctoZB0zrhP0M5hUFMofC/3LaGQWSb3r/5k4VBZJvev/mThUFMofC/3LaGQSKX7L83U4m/ZJvev/mThUEil+y/N1OJv4ts2r9Zk26/i2zav1mTbr8il+y/N1OJv5rRJkDEM4y/i2zav1mTbr+a0SZAxDOMvxgWHEDZgHy/"
            }
            PolygonVertexAttributeArray {
                id: graphic2edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "W1vdvnthlj/Jk+y+lNqYP0sf1r6BEIo/W1vdvnthlj9LH9a+gRCKPxiQxL4TN4s/GJDEvhM3iz9LH9a+gRCKP/Xy0r46fYA/GJDEvhM3iz/18tK+On2AP/3MwL5eloA//czAvl6WgD/18tK+On2AP3Yl1r54N1s//czAvl6WgD92Jda+eDdbP5kZxL58PFo/mRnEvnw8Wj92Jda+eDdbP6Jn5b6d4i8/mRnEvnw8Wj+iZ+W+neIvP69q076Iqi4/r2rTvoiqLj+iZ+W+neIvPybf677iCg4/r2rTvoiqLj8m3+u+4goOPzy92b6WnQ0/PL3ZvpadDT8m3+u+4goOP5O0677cmaE+PL3ZvpadDT+TtOu+3JmhPpic2b7MI6A+mJzZvswjoD6TtOu+3JmhPvg/+r6o0xE+mJzZvswjoD74P/q+qNMRPjOF6L70CAo+M4XovvQICj74P/q+qNMRPh1gCb/AePm8M4XovvQICj4dYAm/wHj5vC12AL8AFxi9LXYAvwAXGL0dYAm/wHj5vOtYD7/gt3m+LXYAvwAXGL3rWA+/4Ld5vmlIBr+IkXu+aUgGv4iRe77rWA+/4Ld5vnwND7/omtC+aUgGv4iRe758DQ+/6JrQvuEEBr/c2M6+4QQGv9zYzr58DQ+/6JrQvlZHA7+qjCa/4QQGv9zYzr5WRwO/qowmvwKo9L4wCyW/Aqj0vjALJb9WRwO/qowmvyKX774OlHS/Aqj0vjALJb8il+++DpR0vz6l3b6UNXO/PqXdvpQ1c78il+++DpR0v9eN0b6Iyam/PqXdvpQ1c7/XjdG+iMmpvxJ6v77KX6m/Enq/vspfqb/XjdG+iMmpv8ftzL7mzNa/Enq/vspfqb/H7cy+5szWv+Hkur7CSNa/4eS6vsJI1r/H7cy+5szWvxRBq76AXv2/4eS6vsJI1r8UQau+gF79v/+0n74Y3vm//7Sfvhje+b8UQau+gF79v4ugqj5uGP6//7Sfvhje+b+LoKo+bhj+v+XYnT5i3/q/5didPmLf+r+LoKo+bhj+vzzDpz4CWJg/5didPmLf+r88w6c+AliYP5Lhmj5zJZU/kuGaPnMllT88w6c+AliYP8mT7L6U2pg/kuGaPnMllT/Jk+y+lNqYP1tb3b57YZY/"
            }
            PolygonVertexAttributeArray {
                id: graphic2edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAABzdoD4AAAAAAAAAAAAAgD8c3aA+AAAAABzdoD4AAIA/HN2gPgAAgD8c3aA+AAAAAPafCT8AAAAAHN2gPgAAgD/2nwk/AAAAAPafCT8AAIA/9p8JPwAAgD/2nwk/AAAAALzjdT8AAAAA9p8JPwAAgD+843U/AAAAALzjdT8AAIA/vON1PwAAgD+843U/AAAAAL0puT8AAAAAvON1PwAAgD+9Kbk/AAAAAL0puT8AAIA/vSm5PwAAgD+9Kbk/AAAAAPyL6D8AAAAAvSm5PwAAgD/8i+g/AAAAAPyL6D8AAIA//IvoPwAAgD/8i+g/AAAAAHiQH0AAAAAA/IvoPwAAgD94kB9AAAAAAHiQH0AAAIA/eJAfQAAAgD94kB9AAAAAAAAAQEAAAAAAeJAfQAAAgD8AAEBAAAAAAAAAQEAAAIA/AAAAAAAAgD8AAAAAAAAAAB4rAT8AAAAAAAAAAAAAgD8eKwE/AAAAAB4rAT8AAIA/HisBPwAAgD8eKwE/AAAAAJY0jT8AAAAAHisBPwAAgD+WNI0/AAAAAJY0jT8AAIA/ljSNPwAAgD+WNI0/AAAAAB5Qxz8AAAAAljSNPwAAgD8eUMc/AAAAAB5Qxz8AAIA/HlDHPwAAgD8eUMc/AAAAAMgaEEAAAAAAHlDHPwAAgD/IGhBAAAAAAMgaEEAAAIA/yBoQQAAAgD/IGhBAAAAAAFTER0AAAAAAyBoQQAAAgD9UxEdAAAAAAFTER0AAAIA/VMRHQAAAgD9UxEdAAAAAAGfjhUAAAAAAVMRHQAAAgD9n44VAAAAAAGfjhUAAAIA/Z+OFQAAAgD9n44VAAAAAAEaapUAAAAAAZ+OFQAAAgD9GmqVAAAAAAEaapUAAAIA/RpqlQAAAgD9GmqVAAAAAAAAAwEAAAAAARpqlQAAAgD8AAMBAAAAAAAAAwEAAAIA/AAAAAAAAgD8AAAAAAAAAABWC6D8AAAAAAAAAAAAAgD8Vgug/AAAAABWC6D8AAIA/FYLoPwAAgD8Vgug/AAAAAKM6K0EAAAAAFYLoPwAAgD+jOitBAAAAAKM6K0EAAIA/ozorQQAAgD+jOitBAAAAAJahTUEAAAAAozorQQAAgD+WoU1BAAAAAJahTUEAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic2edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAP6pLcT8AAIA/AAAAAAAAgD+qS3E/AACAP6pLcT8AAIA/qktxPwAAgD+qS3E/AACAP/Bvzj8AAIA/qktxPwAAgD/wb84/AACAP/Bvzj8AAIA/8G/OPwAAgD/wb84/AACAP8xqOEAAAIA/8G/OPwAAgD/MajhAAACAP8xqOEAAAIA/zGo4QAAAgD/MajhAAACAP07fikAAAIA/zGo4QAAAgD9O34pAAACAP07fikAAAIA/Tt+KQAAAgD9O34pAAACAP/1orkAAAIA/Tt+KQAAAgD/9aK5AAACAP/1orkAAAIA//WiuQAAAgD/9aK5AAACAP7RY70AAAIA//WiuQAAAgD+0WO9AAACAP7RY70AAAIA/tFjvQAAAgD+0WO9AAACAP2LDD0EAAIA/tFjvQAAAgD9iww9BAACAP2LDD0EAAIA/YsMPQQAAgD9iww9BAACAP3j7J0EAAIA/YsMPQQAAgD94+ydBAACAP3j7J0EAAIA/ePsnQQAAgD94+ydBAACAPxu3REEAAIA/ePsnQQAAgD8bt0RBAACAPxu3REEAAIA/G7dEQQAAgD8bt0RBAACAP26BWkEAAIA/G7dEQQAAgD9ugVpBAACAP26BWkEAAIA/boFaQQAAgD9ugVpBAACAP3nXe0EAAIA/boFaQQAAgD9513tBAACAP3nXe0EAAIA/edd7QQAAgD9513tBAACAP1HLkkEAAIA/edd7QQAAgD9Ry5JBAACAP1HLkkEAAIA/UcuSQQAAgD9Ry5JBAACAPz5MrEEAAIA/UcuSQQAAgD8+TKxBAACAPz5MrEEAAIA/PkysQQAAgD8+TKxBAACAP2UVxEEAAIA/PkysQQAAgD9lFcRBAACAP2UVxEEAAIA/ZRXEQQAAgD9lFcRBAACAP4wZ2EEAAIA/ZRXEQQAAgD+MGdhBAACAP4wZ2EEAAIA/jBnYQQAAgD+MGdhBAACAP/jYAUIAAIA/jBnYQQAAgD/42AFCAACAP/jYAUIAAIA/+NgBQgAAgD/42AFCAACAP8B4bEIAAIA/+NgBQgAAgD/AeGxCAACAP8B4bEIAAIA/wHhsQgAAgD/AeGxCAACAP/sig0IAAIA/wHhsQgAAgD/7IoNCAACAP/sig0IAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic2edgeMesha_position, graphic2edgeMesha_texCoord, graphic2edgeMesha_maskTexCoord, graphic2edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic2bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic2bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic2bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic2bevelMesha_position, graphic2bevelMesha_texCoord, graphic2bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor38186
        objectName: "actor38186"
        property alias image: graphic3
        x: 7.295967
        y: -12.396402
        z: -1
        ImageRenderer {
            cacheRenderParams: actor38186.body.bodyType === Body.StaticBody
            id: graphic3
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.60348, 1.49744], [0.651513, 1.49744], [0.651513, -0.192952], [-1.60348, -0.192952]]
        id: actor140611
        objectName: "actor140611"
        property alias image: graphic4
        x: 5.801718
        y: -13.372617
        z: -1
        ImageRenderer {
            cacheRenderParams: actor140611.body.bodyType === Body.StaticBody
            id: graphic4
            sizeScale: 4.0186696
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.532932, 0.738957], [0.654051, 0.738957], [0.654051, -0.302259], [-0.532932, -0.302259]]
        id: actor179255
        objectName: "actor179255"
        property alias image: graphic5
        x: -0.49287435
        y: -16.95851
        z: -1
        ImageRenderer {
            cacheRenderParams: actor179255.body.bodyType === Body.StaticBody
            id: graphic5
            sizeScale: 2.3988564
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.friction: 0.1
        body.vertices: [[-1.71482, 1.01673], [3.18093, 1.00062], [3.16378, -12.5559], [1.89268, -11.7551], [0.863479, -10.7045], [0.180243, -9.84352], [-1.00591, -8.11153], [-1.11052, -7.56231], [-1.11807, -5.81314], [-1.18819, -3.06221], [-1.18583, -2.36933], [-1.30226, -1.65933], [-1.35423, -0.845442], [-1.41632, -0.00038129], [-1.45453, 0.444803]]
        id: actor199834
        objectName: "actor199834"
        property alias bodyRenderer: graphic6
        x: 33.534397
        y: -21.568342
        z: -1
        TerrainMeshRenderer {
            id: graphic6
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic6baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "cZKgv/itVj+w+Jm/CvPSP70Gi7/uIBdAn4eov6in97txkqC/+K1WP70Gi7/uIBdASMytv4S48L6fh6i/qKf3u70Gi7/uIBdAvQaLv+4gF0ATSou/K+lDQIdQgr8C+blAh1CCvwL5uUAFaIG/sK/xQHLgab95KwFBvQaLv+4gF0CHUIK/Avm5QHLgab95KwFBvQaLv+4gF0By4Gm/eSsBQQd8hT7kixxBSMytv4S48L69Bou/7iAXQAd8hT7kixxBSMytv4S48L4HfIU+5IscQTc/cD+ZNipBSMytv4S48L43P3A/mTYqQQ1N+j9L1jpBSMytv4S48L4NTfo/S9Y6QZ9kR0AifkdBSMytv4S48L6fZEdAIn5HQSkLR0AGGW6/SMytv4S48L4pC0dABhluv5i+0L/BZHa/"
            }
            PolygonVertexAttributeArray {
                id: graphic6baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "6LdjvonxWT+MW1q+ojU1P7QpRb5E1hQ/+QBvvucrgD/ot2O+ifFZP7QpRb5E1hQ/mnl2vhCrij/5AG++5yuAP7QpRb5E1hQ/tClFvkTWFD8ziUW+TirqPuPOOL7AtPe84844vsC097wnhTe+GIGtvqTWJb4kvdy+tClFvkTWFD/jzji+wLT3vKTWJb4kvdy+tClFvkTWFD+k1iW+JL3cvrtNPT3SBDy/mnl2vhCrij+0KUW+RNYUP7tNPT3SBDy/mnl2vhCrij+7TT090gQ8v/9aKj5YyGK/mnl2vhCrij//Wio+WMhivxB8sT5494i/mnl2vhCrij8QfLE+ePeIv/diDT8c6pq/mnl2vhCrij/3Yg0/HOqav4gjDT+cGpU/mnl2vhCrij+IIw0/nBqVP38ElL7Z1pU/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic6baseMesha_position, graphic6baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic6edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "SMytv4S48L64j8a/zMHWvqw/5r8wFom/SMytv4S48L6sP+a/MBaJv5i+0L/BZHa/mL7Qv8Fkdr+sP+a/MBaJv3sdUEAKHIm/mL7Qv8Fkdr97HVBAChyJvykLR0AGGW6/KQtHQAYZbr97HVBAChyJvzSSTUCYS0pBKQtHQAYZbr80kk1AmEtKQZ9kR0AifkdBn2RHQCJ+R0E0kk1AmEtKQaM56j/VUz1Bn2RHQCJ+R0GjOeo/1VM9QQ1N+j9L1jpBDU36P0vWOkGjOeo/1VM9QaXaST+UVCxBDU36P0vWOkGl2kk/lFQsQTc/cD+ZNipBNz9wP5k2KkGl2kk/lFQsQWNWzD0/ch5BNz9wP5k2KkFjVsw9P3IeQQd8hT7kixxBB3yFPuSLHEFjVsw9P3IeQcuSjL85ZgJBB3yFPuSLHEHLkoy/OWYCQXLgab95KwFBcuBpv3krAUHLkoy/OWYCQUbjmr8tTfJAcuBpv3krAUFG45q/LU3yQAVogb+wr/FABWiBv7Cv8UBG45q/LU3yQGbpm79rEbpABWiBv7Cv8UBm6Zu/axG6QIdQgr8C+blAh1CCvwL5uUBm6Zu/axG6QEbjpL9UDURAh1CCvwL5uUBG46S/VA1EQBNKi78r6UNAE0qLvyvpQ0BG46S/VA1EQJuLpL9hJRhAE0qLvyvpQ0Cbi6S/YSUYQL0Gi7/uIBdAvQaLv+4gF0Cbi6S/YSUYQGBos78N19U/vQaLv+4gF0BgaLO/DdfVP7D4mb8K89I/sPiZvwrz0j9gaLO/DdfVP6Ycur/QL1o/sPiZvwrz0j+mHLq/0C9aP3GSoL/4rVY/cZKgv/itVj+mHLq/0C9aP4kMwr9SUgg8cZKgv/itVj+JDMK/UlIIPJ+HqL+op/e7n4eov6in97uJDMK/UlIIPLiPxr/Mwda+n4eov6in97u4j8a/zMHWvkjMrb+EuPC+"
            }
            PolygonVertexAttributeArray {
                id: graphic6edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "mnl2vhCrij8AzIy+f4SJPxBEo74wTZg/mnl2vhCrij8QRKO+ME2YP38ElL7Z1pU/fwSUvtnWlT8QRKO+ME2YP0GSEz86Tpg/fwSUvtnWlT9BkhM/Ok6YP4gjDT+cGpU/iCMNP5walT9BkhM/Ok6YP3HEET+Y456/iCMNP5walT9xxBE/mOOev/diDT8c6pq/92INPxzqmr9xxBE/mOOev+MVpj6cf4y/92INPxzqmr/jFaY+nH+MvxB8sT5494i/EHyxPnj3iL/jFaY+nH+Mv7UhDz6UyWi/EHyxPnj3iL+1IQ8+lMlov/9aKj5YyGK//1oqPljIYr+1IQ8+lMlov4DkkDxKaEG//1oqPljIYr+A5JA8SmhBv7tNPT3SBDy/u009PdIEPL+A5JA8SmhBv2BbR76ctuO+u009PdIEPL9gW0e+nLbjvqTWJb4kvdy+pNYlviS93L5gW0e+nLbjvjuoW77IP6++pNYlviS93L47qFu+yD+vvieFN74Yga2+J4U3vhiBrb47qFu+yD+vvvgbXb6ACPy8J4U3vhiBrb74G12+gAj8vOPOOL7AtPe84844vsC097z4G12+gAj8vL/Wab4G9+k+4844vsC097y/1mm+BvfpPjOJRb5OKuo+M4lFvk4q6j6/1mm+BvfpPmtaab6WHRQ/M4lFvk4q6j5rWmm+lh0UP7QpRb5E1hQ/tClFvkTWFD9rWmm+lh0UPzpufr5ELzQ/tClFvkTWFD86bn6+RC80P4xbWr6iNTU/jFtavqI1NT86bn6+RC80Pxn4g75gUlk/jFtavqI1NT8Z+IO+YFJZP+i3Y76J8Vk/6LdjvonxWT8Z+IO+YFJZP+CYib5Wn38/6LdjvonxWT/gmIm+Vp9/P/kAb77nK4A/+QBvvucrgD/gmIm+Vp9/PwDMjL5/hIk/+QBvvucrgD8AzIy+f4SJP5p5dr4Qq4o/"
            }
            PolygonVertexAttributeArray {
                id: graphic6edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAABzdoD4AAAAAAAAAAAAAgD8c3aA+AAAAABzdoD4AAIA/HN2gPgAAgD8c3aA+AAAAAM7FMEAAAAAAHN2gPgAAgD/OxTBAAAAAAM7FMEAAAIA/zsUwQAAAgD/OxTBAAAAAACylGEEAAAAAzsUwQAAAgD8spRhBAAAAACylGEEAAIA/LKUYQQAAgD8spRhBAAAAANypJEEAAAAALKUYQQAAgD/cqSRBAAAAANypJEEAAIA/3KkkQQAAgD/cqSRBAAAAAPhtMEEAAAAA3KkkQQAAgD/4bTBBAAAAAPhtMEEAAIA/+G0wQQAAgD/4bTBBAAAAAPo4OUEAAAAA+G0wQQAAgD/6ODlBAAAAAPo4OUEAAIA/+jg5QQAAgD/6ODlBAAAAAC4ESkEAAAAA+jg5QQAAgD8uBEpBAAAAAC4ESkEAAIA/LgRKQQAAgD8uBEpBAAAAADh9TkEAAAAALgRKQQAAgD84fU5BAAAAADh9TkEAAIA/OH1OQQAAgD84fU5BAAAAAI97XEEAAAAAOH1OQQAAgD+Pe1xBAAAAAI97XEEAAIA/j3tcQQAAgD+Pe1xBAAAAAEl/ckEAAAAAj3tcQQAAgD9Jf3JBAAAAAEl/ckEAAIA/SX9yQQAAgD9Jf3JBAAAAAE4KeEEAAAAASX9yQQAAgD9OCnhBAAAAAE4KeEEAAIA/Tgp4QQAAgD9OCnhBAAAAAM/LfUEAAAAATgp4QQAAgD/Py31BAAAAAM/LfUEAAIA/z8t9QQAAgD/Py31BAAAAAAcpgkEAAAAAz8t9QQAAgD8HKYJBAAAAAAcpgkEAAIA/BymCQQAAgD8HKYJBAAAAALSMhUEAAAAABymCQQAAgD+0jIVBAAAAALSMhUEAAIA/tIyFQQAAgD+0jIVBAAAAAD9Wh0EAAAAAtIyFQQAAgD8/VodBAAAAAD9Wh0EAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic6edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAP6pLcT8AAIA/AAAAAAAAgD+qS3E/AACAP6pLcT8AAIA/qktxPwAAgD+qS3E/AACAP1qUBEEAAIA/qktxPwAAgD9alARBAACAP1qUBEEAAIA/WpQEQQAAgD9alARBAACAP8L35EEAAIA/WpQEQQAAgD/C9+RBAACAP8L35EEAAIA/wvfkQQAAgD/C9+RBAACAP8v+9kEAAIA/wvfkQQAAgD/L/vZBAACAP8v+9kEAAIA/y/72QQAAgD/L/vZBAACAP3tSBEIAAIA/y/72QQAAgD97UgRCAACAP3tSBEIAAIA/e1IEQgAAgD97UgRCAACAP73qCkIAAIA/e1IEQgAAgD+96gpCAACAP73qCkIAAIA/veoKQgAAgD+96gpCAACAPySDF0IAAIA/veoKQgAAgD8kgxdCAACAPySDF0IAAIA/JIMXQgAAgD8kgxdCAACAP+zdGkIAAIA/JIMXQgAAgD/s3RpCAACAP+zdGkIAAIA/7N0aQgAAgD/s3RpCAACAP61cJUIAAIA/7N0aQgAAgD+tXCVCAACAP61cJUIAAIA/rVwlQgAAgD+tXCVCAACAP3nfNUIAAIA/rVwlQgAAgD953zVCAACAP3nfNUIAAIA/ed81QgAAgD953zVCAACAP70HOkIAAIA/ed81QgAAgD+9BzpCAACAP70HOkIAAIA/vQc6QgAAgD+9BzpCAACAP95YPkIAAIA/vQc6QgAAgD/eWD5CAACAP95YPkIAAIA/3lg+QgAAgD/eWD5CAACAP409Q0IAAIA/3lg+QgAAgD+NPUNCAACAP409Q0IAAIA/jT1DQgAAgD+NPUNCAACAPxBTSEIAAIA/jT1DQgAAgD8QU0hCAACAPxBTSEIAAIA/EFNIQgAAgD8QU0hCAACAP2EBS0IAAIA/EFNIQgAAgD9hAUtCAACAP2EBS0IAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic6edgeMesha_position, graphic6edgeMesha_texCoord, graphic6edgeMesha_maskTexCoord, graphic6edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic6bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic6bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic6bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic6bevelMesha_position, graphic6bevelMesha_texCoord, graphic6bevelMesha_blendTexCoord]
            }
        }
    }
    TriggerArea {
        Component.onCompleted: {if (actor382377.image) { actor382377.image.cacheRenderParams = false; }}
        body.vertices: [[-2.78617, 2.70249], [-1.86305, 3.50552], [-0.887691, 3.91482], [0.0078814, 4.07757], [0.875564, 3.95688], [1.68674, 3.68866], [2.53274, 3.22959], [3.24841, 2.72204], [3.71112, 1.98877], [4.11917, 0.916526], [4.32958, -0.0673981], [4.36519, -1.02059], [4.2034, -1.77335], [3.80118, -2.75845], [3.06972, -3.51453], [2.27749, -4.01869], [1.33234, -4.2051], [0.344473, -4.3278], [-0.484993, -4.32742], [-1.12444, -4.19772], [-1.56605, -3.99998], [-2.29754, -3.49969], [-2.97292, -2.89765], [-3.38186, -2.16192], [-3.69622, -1.48408], [-3.88621, -0.30974], [-3.74857, 0.783567], [-3.46066, 1.84602]]
        id: actor316232
        inputs: [actor0]
        interpolators: [
            InterpolationLogic {
                backwardDuration: 0.0166666675359011
                beginValue: 0.8
                endValue: 2.2
                forwardDuration: 0.0166666675359011
                smoothing: 0
                target: actor382377
                targetProperty: "body.magneticStrength"
            }
        ]
        objectName: "actor316232"
        x: 4.033045
        y: -20.882833
        z: -1
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.66581, 0.795794], [2.04851, 0.795794], [2.04851, -0.178904], [-2.66581, -0.178904]]
        id: actor382583
        objectName: "actor382583"
        property alias image: graphic8
        x: 12.667846
        y: -14.923389
        z: -1
        ImageRenderer {
            cacheRenderParams: actor382583.body.bodyType === Body.StaticBody
            id: graphic8
            sizeScale: 7.5133033
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.312298], [0.34526, 0.312298], [0.34526, 0.049705], [-0.207222, 0.049705]]
        id: actor389503
        objectName: "actor389503"
        property alias image: graphic9
        x: 15.641634
        y: -17.371695
        z: -1
        ImageRenderer {
            cacheRenderParams: actor389503.body.bodyType === Body.StaticBody
            id: graphic9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.312298], [0.34526, 0.312298], [0.34526, 0.049705], [-0.207222, 0.049705]]
        id: actor389505
        objectName: "actor389505"
        property alias image: graphic10
        rotation: -3.4712527
        x: 5.5507464
        y: -14.820593
        z: -1
        ImageRenderer {
            cacheRenderParams: actor389505.body.bodyType === Body.StaticBody
            id: graphic10
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.20761, 0.360493], [0.927972, 0.360493], [0.927972, -1.2873], [-1.20761, -1.2873]]
        id: actor413578
        objectName: "actor413578"
        property alias image: graphic11
        x: 27.645016
        y: -13.740803
        z: -1
        ImageRenderer {
            cacheRenderParams: actor413578.body.bodyType === Body.StaticBody
            id: graphic11
            sizeScale: 3.4035134
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.38282, 1.29137], [0.561856, 1.29137], [0.561856, -0.166399], [-1.38282, -0.166399]]
        id: actor413579
        objectName: "actor413579"
        property alias image: graphic12
        x: 24.807165
        y: -14.876555
        z: -1
        ImageRenderer {
            cacheRenderParams: actor413579.body.bodyType === Body.StaticBody
            id: graphic12
            sizeScale: 5
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.vertices: [[-1, 3.88092], [0.00511932, 3.88092], [0.00511932, -23.3641], [-1, -23.3641]]
        id: actor2
        objectName: "actor2"
        visible: false
        x: -5
        y: -10.638224
    }
    Polygon {
        body.vertices: [[-0.00387573, 3.88092], [1, 3.88092], [1, -23.2929], [-0.00387573, -23.2929]]
        id: actor5
        objectName: "actor5"
        visible: false
        x: 36.577503
        y: -10.737098
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-5.94317, 4.79481], [3.29332, 4.78283], [3.04655, 0.980459], [2.60347, -0.607995], [3.28035, -1.08644], [4.50142, -1.3992], [5.93657, -1.47821], [7.09324, -1.76864], [8.23137, -2.29752], [9.06104, -2.86299], [9.71922, -3.58934], [11.0997, -3.60874], [12.4419, -3.46174], [13.7282, -3.05208], [14.7078, -2.22862], [15.4065, -0.70362], [17.1766, 4.76483], [21.1264, 4.75971], [21.1843, 0.504469], [21.7999, -1.60545], [23.3909, -3.09769], [25.5183, -3.55738], [26.9854, -3.25733], [28.1355, -2.52782], [27.7123, -1.20054], [27.1984, 4.75183], [35.7513, 4.74074], [35.6893, -9.0738], [32.938, -9.06925], [32.3425, -9.03035], [31.7146, -9.03052], [30.6896, -9.04597], [29.7902, -9.08179], [28.0641, -9.07461], [27.31, -9.04822], [26.8675, -8.9865], [26.2171, -8.95983], [25.6199, -8.95348], [25.1581, -8.99234], [24.6847, -9.03904], [24.5015, -8.99352], [24.3554, -8.80251], [24.3138, -8.55793], [24.4631, -8.34715], [24.8192, -8.23966], [25.2279, -8.04837], [25.5171, -7.80805], [25.6928, -7.44712], [25.8009, -6.96027], [25.7918, -6.45122], [25.6621, -6.07869], [25.4374, -5.7749], [25.0941, -5.55903], [24.6991, -5.40029], [24.2557, -5.29106], [23.6984, -5.23966], [23.0831, -5.18103], [22.7012, -5.14306], [22.3477, -5.11805], [21.998, -5.08103], [21.6551, -5.03106], [21.4204, -4.98498], [21.159, -4.9062], [20.7692, -4.84222], [20.2439, -4.80207], [19.5844, -4.83143], [19.0588, -4.92015], [18.607, -5.01046], [18.1801, -5.05806], [17.7437, -5.10241], [17.3436, -5.17756], [16.7199, -5.34003], [16.1908, -5.49483], [15.6199, -5.55292], [15.0051, -5.55039], [14.345, -5.47855], [13.8126, -5.38448], [13.3797, -5.23121], [12.9235, -5.12958], [12.3816, -5.07408], [11.7493, -5.06124], [11.1227, -5.05868], [10.5712, -5.07703], [10.2575, -5.09869], [10.0157, -5.13952], [9.7357, -5.21583], [9.44954, -5.29139], [9.15647, -5.3236], [8.73513, -5.33089], [8.18173, -5.31164], [7.61099, -5.30322], [7.21697, -5.31025], [6.78337, -5.34097], [6.34084, -5.42131], [5.94705, -5.54026], [5.61253, -5.56042], [5.29929, -5.47754], [5.14702, -5.23093], [5.24163, -4.93886], [5.50065, -4.61219], [5.7131, -4.03109], [5.69028, -3.40662], [5.15702, -3.0939], [4.3179, -2.92569], [3.06893, -2.93118], [2.49375, -3.33163], [2.11993, -3.78501], [1.93737, -4.24332], [1.76384, -4.52443], [1.30873, -4.87098], [0.984781, -5.06884], [0.795059, -5.17491], [-5.88631, -5.19749]]
        id: actor30
        objectName: "actor30"
        property alias bodyRenderer: graphic15
        x: 0.9119129
        y: -11.579806
        TerrainMeshRenderer {
            id: graphic15
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic15baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "5em7wBgtl8D7G7rA+gukQAdWPj/7Tp9A5em7wBgtl8AHVj4/+06fQHAPWD8jf5pA5em7wBgtl8BwD1g/I3+aQNTkjT/Gf5JA5em7wBgtl8DU5I0/xn+SQOVVvj/Ev4hA5em7wBgtl8DlVb4/xL+IQIQVyz/YI4JA5em7wBgtl8CEFcs/2COCQBfR1T/YwnNA5em7wBgtl8AX0dU/2MJzQFDh4j9UD2VA5em7wBgtl8BQ4eI/VA9lQLq79T8yBlhA5em7wBgtl8C6u/U/MgZYQFByAEDjSUtA5em7wBgtl8BQcgBA40lLQAU4B0B84kJA5em7wBgtl8AFOAdAfOJCQLtwD0Bh5DtA5em7wBgtl8C7cA9AYeQ7QILSGEB1jjZA5em7wBgtl8CC0hhAdY42QOAKLUDciidA5em7wBgtl8DgCi1A3IonQHLCNkDDziJA5em7wBgtl8BywjZAw84iQLA4QUDyFiBA5em7wBgtl8CwOEFA8hYgQKkDTEDwfh9A5em7wBgtl8CpA0xA8H4fQOJ2g0ApTB5A5em7wBgtl8DidoNAKUweQJI/k0DbiSNA5em7wBgtl8CSP5NA24kjQHPtoUCRvidA5em7wBgtl8Bz7aFAkb4nQPwSp0DCDitA5em7wBgtl8D8EqdAwg4rQJvIq0B+XjBAm8irQH5eMEBF3a9Ac3Y3QKuUukBkaUFA5em7wBgtl8CbyKtAfl4wQKuUukBkaUFAAKnBQNc2V0CB58FA29xdQDLtw0A13nVAiY/DQCz+gkAYJsFA57CKQAztvkCDwZJAxem0QL7ApEAwAbxAZGikQPXdx0DA3aBAEl/mQPIHnUAciPNAkc6cQLa2/kCScZhAVHTXQNoWnkASX+ZA8gedQLa2/kCScZhAVHTXQNoWnkC2tv5AknGYQDw7A0GDS5ZAMz4HQeTAlUAS2gtBiRGWQFveEUH9V5ZAMz4HQeTAlUBb3hFB/VeWQG5aFUF5iZVAIY8ZQbdqlkCX4B5BCPyXQCxeI0Eje5ZAbloVQXmJlUAhjxlBt2qWQCxeI0Eje5ZAbloVQXmJlUAsXiNBI3uWQJTRKEHF6JVAbloVQXmJlUCU0ShBxeiVQG/fMUE8f5VAb98xQTx/lUA5EDxB0sSVQAjKQkEFSpFAbloVQXmJlUBv3zFBPH+VQAjKQkEFSpFAMz4HQeTAlUBuWhVBeYmVQAjKQkEFSpFAMz4HQeTAlUAIykJBBUqRQL++RkEwuo9AQMVKQV0ykEDyOVBBlTySQN+5VEFs8pJAwx5cQRoOmUB86V5BeM2dQG6DZkELYKFAMeNZQYH/lUDDHlxBGg6ZQG6DZkELYKFAMeNZQYH/lUBug2ZBC2ChQCV0cEFnZ6RA+mJXQaLuk0Ax41lBgf+VQCV0cEFnZ6RA+mJXQaLuk0AldHBBZ2ekQOiYeUHDfKRA+mJXQaLuk0DomHlBw3ykQI/kgEGs3aJA37lUQWzykkD6YldBou6TQI/kgEGs3aJA37lUQWzykkCP5IBBrN2iQG3ChEEoa5xAQMVKQV0ykEDfuVRBbPKSQG3ChEEoa5xAQMVKQV0ykEBtwoRBKGucQGjjiUGWT5ZAv75GQTC6j0BAxUpBXTKQQGjjiUGWT5ZAv75GQTC6j0Bo44lBlk+WQD9hjUG0gJNAv75GQTC6j0A/YY1BtICTQKICkUFXr5FAv75GQTC6j0CiApFBV6+RQMo6lEGGN5BAv75GQTC6j0DKOpRBhjeQQMm6l0GiW41Av75GQTC6j0DJupdBoluNQOA9nEEQS4pAv75GQTC6j0DgPZxBEEuKQMkFokG0rodAyQWiQbSuh0CRvKZB0IWHQIO8qEF+u4VAv75GQTC6j0DJBaJBtK6HQIO8qEF+u4VAv75GQTC6j0CDvKhBfruFQJ66qkE6t4RA8LusQRMyhUCU/KxB91mFQOBtrkFYLoVAnrqqQTq3hEDwu6xBEzKFQOBtrkFYLoVA4G2uQVguhUDJ2LBBfSeHQJNgs0EDyohA4G2uQVguhUCTYLNBA8qIQJ8ttkGg3IlA4G2uQVguhUCfLbZBoNyJQKxOuUHRYotAbRK+QVb7kkBGksJBvs+cQPiOxEFiaJ9AbRK+QVb7kkD4jsRBYmifQNgyyEFOCqZAbRK+QVb7kkDYMshBTgqmQLgjyEGE0KRA+uXJQRyyqEBncstBRdCtQAyPy0GqhqxATgvNQcb3sUC2Ks5BRqi4QChdzkGl+bZAV5rPQdaEwEBT2c9B5tTFQJsY0EFu48RA9RnPQX2Au0BXms9B1oTAQJsY0EFu48RA/YnOQUKb70Dwf81BF3/2QDYNzkErjfVAWS/PQVX850D9ic5BQpvvQDYNzkErjfVA2nTMQcsv/kA7ZstBosMAQWsNzEEFTgBBkVnNQf4m+kDadMxByy/+QGsNzEEFTgBBaw3MQQVOAEF3nshBxmgEQXLSyEFufARBGRHFQdY9B0FRb8RBWJUHQTe0w0FneAlBctLIQW58BEEZEcVB1j0HQTe0w0FneAlBctLIQW58BEE3tMNBZ3gJQRzrw0FW5wtBaw3MQQVOAEFy0shBbnwEQRzrw0FW5wtBaw3MQQVOAEEc68NBVucLQVaZxEGTGw5Baw3MQQVOAEFWmcRBkxsOQUWKxUHr5g5Baw3MQQVOAEFFisVB6+YOQSgcyUEgfwxBkVnNQf4m+kBrDcxBBU4AQSgcyUEgfwxBNg3OQSuN9UCRWc1B/ib6QCgcyUEgfwxBNg3OQSuN9UAoHMlBIH8MQSwGy0HxtApBNg3OQSuN9UAsBstB8bQKQVfLzkHDCAhBWS/PQVX850A2Dc5BK431QFfLzkHDCAhB4avPQf8830BZL89BVfznQFfLzkHDCAhBACvQQcPi1EDhq89B/zzfQFfLzkHDCAhBACvQQcPi1EBXy85BwwgIQWDzz0GuwwZBHVfQQUTfzEAAK9BBw+LUQGDzz0GuwwZBHVfQQUTfzEBg889BrsMGQULl0UFkwgVBHVfQQUTfzEBC5dFBZMIFQV3m00E1fgVBmxjQQW7jxEAdV9BBRN/MQF3m00E1fgVBmxjQQW7jxEBd5tNBNX4FQRRl10FergVBmxjQQW7jxEAUZddBXq4FQWvt2kHPfQZB9RnPQX2Au0CbGNBBbuPEQGvt2kHPfQZB9RnPQX2Au0Br7dpBz30GQZKd4EFQqQZBKF3OQaX5tkD1Gc9BfYC7QJKd4EFQqQZBKF3OQaX5tkCSneBBUKkGQbc07kFaUARBTgvNQcb3sUAoXc5Bpfm2QLc07kFaUARBDI/LQaqGrEBOC81BxvexQLc07kFaUARBDI/LQaqGrEC3NO5BWlAEQcQx80EoOQNB+uXJQRyyqEAMj8tBqoasQMQx80EoOQNB+uXJQRyyqEDEMfNBKDkDQTc39EFEMANB+uXJQRyyqEA3N/RBRDADQRM59UEUhwNBuCPIQYTQpED65clBHLKoQBM59UEUhwNBuCPIQYTQpEATOfVBFIcDQaku9kGqOgRBtA/3QftEBUEAtv1Bb+MOQQtiAULu4g5BqS72Qao6BEG0D/dB+0QFQQtiAULu4g5BuCPIQYTQpECpLvZBqjoEQQtiAULu4g5BuCPIQYTQpEALYgFC7uIOQe7DA0JKgg9BuCPIQYTQpEDuwwNCSoIPQZt5DkLECxBBbRK+QVb7kkC4I8hBhNCkQJt5DkLECxBBrE65QdFii0BtEr5BVvuSQJt5DkLECxBBm3kOQsQLEEGruA5ClnKVwCst2kHY5JXAm3kOQsQLEEErLdpB2OSVwPYa4kEeclU/m3kOQsQLEEH2GuJBHnJVP+Ra4kEUmao/m3kOQsQLEEHkWuJBFJmqP+zV4UFE9yNAm3kOQsQLEEHs1eFBRPcjQMQu2EF2Z1ZArE65QdFii0CbeQ5CxAsQQcQu2EF2Z1ZArE65QdFii0DELthBdmdWQEckzEGQEmpA4G2uQVguhUCsTrlB0WKLQEckzEGQEmpAnrqqQTq3hEDgba5BWC6FQEckzEGQEmpAv75GQTC6j0CeuqpBOreEQEckzEGQEmpAMz4HQeTAlUC/vkZBMLqPQEckzEGQEmpAMz4HQeTAlUBHJMxBkBJqQHHBukGB60tAPDsDQYNLlkAzPgdB5MCVQHHBukGB60tAPDsDQYNLlkBxwbpBgetLQMS3rUH0MdQ/VHTXQNoWnkA8OwNBg0uWQMS3rUH0MdQ/9d3HQMDdoEBUdNdA2haeQMS3rUH0MdQ/xem0QL7ApED13cdAwN2gQMS3rUH0MdQ/466oQRiz+r7gcqhBtgiWwPfhiUGy4pXAxLetQfQx1D/jrqhBGLP6vvfhiUGy4pXAxLetQfQx1D/34YlBsuKVwIL+d0FXaj0/xLetQfQx1D+C/ndBV2o9PzqZbEEsghJAxLetQfQx1D86mWxBLIISQIpsXEE58EhAxLetQfQx1D+KbFxBOfBIQMxmR0ED0GNAxem0QL7ApEDEt61B9DHUP8xmR0ED0GNAxem0QL7ApEDMZkdBA9BjQKGrMUEdWm1Axem0QL7ApEChqzFBHVptQE3ZGkHujGtAxem0QL7ApEBN2RpB7oxrQAjtD0HiDjxAxem0QL7ApEAI7Q9B4g48QGDpAkEZmxhAYOkCQRmbGEBC6uFAbHPuP5R9vUDP3ck/YOkCQRmbGECUfb1Az93JP+aOj0Cjv78/JoMdQNL5qr+PGU5AKt2WwOXpu8AYLZfAHu8aQC1eVr8mgx1A0vmqv+Xpu8AYLZfAiJcgQM85JD8e7xpALV5Wv+Xpu8AYLZfAz0FPQOKulj+IlyBAzzkkP+Xpu8AYLZfAz0FPQOKulj/l6bvAGC2XwKuUukBkaUFA5o6PQKO/vz/PQU9A4q6WP6uUukBkaUFA5o6PQKO/vz+rlLpAZGlBQAElvUD6q0VAYOkCQRmbGEDmjo9Ao7+/PwElvUD6q0VAYOkCQRmbGEABJb1A+qtFQDk7v0C/3kpAYOkCQRmbGEA5O79Av95KQM3BwEAUzFBAYOkCQRmbGEDNwcBAFMxQQACpwUDXNldAYOkCQRmbGEAAqcFA1zZXQDLtw0A13nVAYOkCQRmbGEAy7cNANd51QImPw0As/oJAYOkCQRmbGECJj8NALP6CQAztvkCDwZJAYOkCQRmbGEAM7b5Ag8GSQIkAt0Dup6BAYOkCQRmbGECJALdA7qegQJPVs0DmhqRAxem0QL7ApEBg6QJBGZsYQJPVs0DmhqRAxem0QL7ApECT1bNA5oakQI+qqkDXq6ZAj6qqQNerpkBnkLFAQoOkQMXptEC+wKRA"
            }
            PolygonVertexAttributeArray {
                id: graphic15baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic15baseMesha_position, graphic15baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic15edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic15edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic15edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic15edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic15edgeMesha_position, graphic15edgeMesha_texCoord, graphic15edgeMesha_maskTexCoord, graphic15edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic15bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic15bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic15bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic15bevelMesha_position, graphic15bevelMesha_texCoord, graphic15bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.vertices: [[-6.02004, 1], [37.5738, 1], [37.5738, -1], [-6.02004, -1]]
        id: actor14856
        objectName: "actor14856"
        visible: false
        y: -35
    }
    WaterBody {
        body.vertices: [[-1.18145, 0.0760412], [-0.620929, 0.0986794], [-0.00397098, 0.0939293], [0.64387, 0.0819635], [1.16444, 0.0226306], [1.62511, -0.0646409], [1.74831, -0.108416], [-2.1158, -0.0944283], [-1.81685, -0.0178815], [-1.51236, 0.0519571]]
        emitterLogic.decayTime: 1.66666675359011
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer1
        emitterLogic.spawnSpread: 1
        id: actor60522
        objectName: "actor60522"
        x: 12.645579
        y: -16.764948
    }
    WaterBody {
        body.vertices: [[-0.628284, 0.0500296], [0.000663877, 0.0683918], [0.508487, 0.0330038], [0.896039, -0.0284787], [1.08251, -0.071242], [-1.32781, -0.0726629], [-1.18436, -0.0340532]]
        emitterLogic.decayTime: 1.66666675359011
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer1
        emitterLogic.spawnSpread: 1
        id: actor199836
        objectName: "actor199836"
        x: 21.150532
        y: -16.473005
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199991
        objectName: "actor199991"
        x: 20.89068
        y: -16.96889
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199992
        objectName: "actor199992"
        x: 18.71201
        y: -22.400646
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199993
        objectName: "actor199993"
        x: 21.847752
        y: -20.860212
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199994
        objectName: "actor199994"
        x: 5.6531577
        y: -22.455753
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199998
        objectName: "actor199998"
        x: 19.145664
        y: -25.236944
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor199999
        objectName: "actor199999"
        x: 22.70914
        y: -25.72579
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200000
        objectName: "actor200000"
        x: 25.698536
        y: -17.737797
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200002
        objectName: "actor200002"
        x: 4.3797836
        y: -18.899536
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200010
        objectName: "actor200010"
        x: 4.342468
        y: -16.924839
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200011
        objectName: "actor200011"
        x: 26.941803
        y: -21.028093
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200012
        objectName: "actor200012"
        x: 23.952827
        y: -23.068882
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor200013
        objectName: "actor200013"
        x: 12.465171
        y: -17.05952
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-1.12391, 0.123895], [-0.897173, 0.195974], [-0.486863, 0.264036], [0.14099, 0.283288], [1.64073, 0.27719], [2.21729, 0.318349], [2.52918, 0.278515], [2.8778, 0.125636], [3.01887, -0.0666736], [3.02215, -0.27169], [2.86457, -0.302436], [2.6804, -0.276047], [2.50415, -0.203211], [2.35117, -0.163771], [2.12935, -0.167603], [1.85602, -0.142282], [-0.175904, -0.17046], [-0.446434, -0.208009], [-0.674851, -0.260123], [-0.871095, -0.310738], [-1.05982, -0.387111], [-1.22596, -0.386487], [-1.31483, -0.277818], [-1.26046, -0.0245129]]
        id: actor200017
        objectName: "actor200017"
        visible: false
        x: 11.605669
        y: -20.280197
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor200018
        objectName: "actor200018"
        property alias image: graphic32
        rotation: 2.6999998
        x: 12.477945
        y: -21.746315
        ImageRenderer {
            cacheRenderParams: actor200018.body.bodyType === Body.StaticBody
            id: graphic32
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor286217
        objectName: "actor286217"
        x: 25.9032
        y: -19.092768
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor286218
        objectName: "actor286218"
        x: 1.9944721
        y: -21.376234
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor286219
        objectName: "actor286219"
        x: 16.464369
        y: -17.637499
    }
    AsteroidSmall {
        body.angularVelocity: -0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.friction: 0.1
        body.magnetic: true
        body.magneticStrength: 0.8
        body.restitution: 0.1
        body.vertices: [[0.377453, -1.22824], [0.592313, -1.12426], [0.730926, -0.995772], [0.901929, -0.869099], [1.04321, -0.741405], [1.19769, -0.505498], [1.24562, -0.382346], [1.27932, -0.233945], [1.28993, -0.0348438], [1.28181, 0.160144], [1.18646, 0.469738], [1.04516, 0.608225], [0.902643, 0.740053], [0.735483, 0.945203], [0.687041, 0.974566], [0.6041, 0.99649], [0.513939, 1.03337], [0.458521, 1.10682], [0.399938, 1.14334], [0.270795, 1.16777], [0.0582035, 1.24493], [-0.165213, 1.25926], [-0.406377, 1.22932], [-0.618163, 1.15923], [-0.85869, 1.01538], [-1.02845, 0.857815], [-1.14559, 0.680662], [-1.24417, 0.476462], [-1.29099, 0.203527], [-1.29922, -0.0282475], [-1.2588, -0.352072], [-1.20525, -0.54673], [-1.16017, -0.689835], [-1.07905, -0.797139], [-0.935877, -0.855337], [-0.814463, -0.933559], [-0.72574, -1.01332], [-0.639918, -1.14121], [-0.567694, -1.1927], [-0.336092, -1.26741], [-0.184002, -1.28317], [-0.00610164, -1.29492], [0.177996, -1.28502]]
        id: actor382377
        objectName: "actor382377"
        property alias image: graphic36
        x: 4.1372356
        y: -20.947353
        ImageRenderer {
            cacheRenderParams: actor382377.body.bodyType === Body.StaticBody
            id: graphic36
            sizeScale: 2.9280925
            source: Util.getPathToImage("middleground_e1/e1_asteroid_small.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.05327, 0.659896], [0.983077, 0.659896], [0.983077, -5.68871], [-2.05327, -5.68871]]
        id: actor382436
        objectName: "actor382436"
        property alias image: graphic37
        rotation: -6.2671204
        x: -2.1544147
        y: -17.903694
        ImageRenderer {
            cacheRenderParams: actor382436.body.bodyType === Body.StaticBody
            id: graphic37
            sizeScale: 6.1311007
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.528791, -0.748077], [1.04714, -0.748077], [1.04714, -3.32038], [-0.528791, -3.32038]]
        id: actor382489
        objectName: "actor382489"
        property alias image: graphic38
        rotation: -33.930023
        x: -1.0059531
        y: -26.802788
        ImageRenderer {
            cacheRenderParams: actor382489.body.bodyType === Body.StaticBody
            id: graphic38
            sizeScale: 3.578599
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.180632, 0.380182], [0.446662, 0.380182], [0.446662, -0.04087], [-0.180632, -0.04087]]
        id: actor382585
        objectName: "actor382585"
        property alias image: graphic39
        rotation: -58.211838
        x: -0.014587313
        y: -16.3449
        ImageRenderer {
            cacheRenderParams: actor382585.body.bodyType === Body.StaticBody
            id: graphic39
            sizeScale: 1.7189488
            source: Util.getPathToImage("middleground_e1/deco_e1_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.924116, 1.71169], [0.696219, 1.71169], [0.696219, 1.22964], [-0.924116, 1.22964]]
        id: actor382736
        objectName: "actor382736"
        property alias image: graphic40
        rotation: -9.9
        x: 24.995363
        y: -16.577518
        ImageRenderer {
            cacheRenderParams: actor382736.body.bodyType === Body.StaticBody
            id: graphic40
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.924116, 1.71169], [0.696219, 1.71169], [0.696219, 1.22964], [-0.924116, 1.22964]]
        id: actor388263
        objectName: "actor388263"
        property alias image: graphic41
        rotation: -40.5
        x: 22.193811
        y: -15.146293
        ImageRenderer {
            cacheRenderParams: actor388263.body.bodyType === Body.StaticBody
            id: graphic41
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.924116, 1.71169], [0.696219, 1.71169], [0.696219, 1.22964], [-0.924116, 1.22964]]
        id: actor388264
        objectName: "actor388264"
        property alias image: graphic42
        rotation: 17.999891
        x: 28.360268
        y: -16.212101
        ImageRenderer {
            cacheRenderParams: actor388264.body.bodyType === Body.StaticBody
            id: graphic42
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.924116, 1.71169], [0.696219, 1.71169], [0.696219, 1.22964], [-0.924116, 1.22964]]
        id: actor388265
        objectName: "actor388265"
        property alias image: graphic43
        rotation: -71.10011
        x: 20.748817
        y: -12.719081
        ImageRenderer {
            cacheRenderParams: actor388265.body.bodyType === Body.StaticBody
            id: graphic43
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.924116, 1.71169], [0.696219, 1.71169], [0.696219, 1.22964], [-0.924116, 1.22964]]
        id: actor388266
        objectName: "actor388266"
        property alias image: graphic44
        rotation: -9.9
        x: 6.273611
        y: -14.776024
        ImageRenderer {
            cacheRenderParams: actor388266.body.bodyType === Body.StaticBody
            id: graphic44
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.740503, 1.3716], [0.557887, 1.3716], [0.557887, 0.985324], [-0.740503, 0.985324]]
        id: actor388267
        objectName: "actor388267"
        property alias image: graphic45
        rotation: -24.3
        x: 3.7687607
        y: -13.847931
        ImageRenderer {
            cacheRenderParams: actor388267.body.bodyType === Body.StaticBody
            id: graphic45
            sizeScale: 3.0129235
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671712, 1.24418], [0.506061, 1.24418], [0.506061, 0.89379], [-0.671712, 0.89379]]
        id: actor388268
        objectName: "actor388268"
        property alias image: graphic46
        rotation: -24.3
        x: 7.9445314
        y: -14.736575
        ImageRenderer {
            cacheRenderParams: actor388268.body.bodyType === Body.StaticBody
            id: graphic46
            sizeScale: 2.7330306
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671712, 1.24418], [0.506061, 1.24418], [0.506061, 0.89379], [-0.671712, 0.89379]]
        id: actor388269
        objectName: "actor388269"
        property alias image: graphic47
        rotation: 52.07616
        x: 16.518534
        y: -14.23116
        ImageRenderer {
            cacheRenderParams: actor388269.body.bodyType === Body.StaticBody
            id: graphic47
            sizeScale: 2.7330306
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671712, 1.69199], [0.506061, 1.69199], [0.506061, 1.23185], [-0.671712, 1.23185]]
        id: actor388270
        objectName: "actor388270"
        property alias image: graphic48
        rotation: 71.01793
        x: 18.217955
        y: -11.913764
        ImageRenderer {
            cacheRenderParams: actor388270.body.bodyType === Body.StaticBody
            id: graphic48
            sizeScale: 3.76
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.0997256, 0.0997599], [0.221285, 0.0997599], [0.221285, -0.334412], [-0.0997256, -0.334412]]
        id: actor388914
        objectName: "actor388914"
        property alias image: graphic49
        rotation: -105.87901
        x: 6.5486016
        y: -16.811878
        ImageRenderer {
            cacheRenderParams: actor388914.body.bodyType === Body.StaticBody
            id: graphic49
            sizeScale: 0.54381335
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.127917, 0.127961], [0.283841, 0.127961], [0.283841, -0.428948], [-0.127917, -0.428948]]
        id: actor388915
        objectName: "actor388915"
        property alias image: graphic50
        rotation: -76.85211
        x: 25.761753
        y: -20.272274
        ImageRenderer {
            cacheRenderParams: actor388915.body.bodyType === Body.StaticBody
            id: graphic50
            sizeScale: 0.6975453
            source: Util.getPathToImage("middleground_e1/deco_e1_rock10.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.05327, 5.65171], [0.983077, 5.65171], [0.983077, -0.150915], [-2.05327, -0.150915]]
        id: actor382487
        objectName: "actor382487"
        property alias image: graphic51
        rotation: -162.71136
        x: 32.85877
        y: -21.606451
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor382487.body.bodyType === Body.StaticBody
            id: graphic51
            sizeScale: 6.1311007
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.275449, 4.36621], [1.04714, 4.36621], [1.04714, 0.859715], [-0.275449, 0.859715]]
        id: actor382488
        objectName: "actor382488"
        property alias image: graphic52
        rotation: -124.6811
        x: 33.624928
        y: -30.434479
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor382488.body.bodyType === Body.StaticBody
            id: graphic52
            sizeScale: 3.578599
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.528791, -0.748077], [1.04714, -0.748077], [1.04714, -3.32038], [-0.528791, -3.32038]]
        id: actor413732
        objectName: "actor413732"
        property alias image: graphic53
        rotation: -20.152695
        x: -1.5868499
        y: -30.579046
        ImageRenderer {
            cacheRenderParams: actor413732.body.bodyType === Body.StaticBody
            id: graphic53
            sizeScale: 3.578599
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor430204
        objectName: "actor430204"
        x: 31.194544
        y: -21.771406
    }
    Asteroid {
        body.angularVelocity: 0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.magnetic: true
        body.magneticStrength: 1.8
        body.restitution: 0.1
        body.vertices: [[0.566376, -1.843], [0.888777, -1.68698], [1.09677, -1.49418], [1.35336, -1.3041], [1.56536, -1.11249], [1.79715, -0.758511], [1.86908, -0.573718], [1.91964, -0.351039], [1.93557, -0.0522838], [1.92339, 0.240299], [1.7803, 0.704852], [1.56829, 0.912654], [1.35443, 1.11046], [1.10361, 1.4183], [1.03092, 1.46236], [0.906463, 1.49525], [0.771176, 1.5506], [0.68802, 1.66081], [0.600116, 1.71561], [0.406334, 1.75227], [0.0873355, 1.86805], [-0.247905, 1.88954], [-0.609777, 1.84462], [-0.927565, 1.73945], [-1.28848, 1.5236], [-1.54322, 1.28717], [-1.71898, 1.02135], [-1.8669, 0.714941], [-1.93715, 0.305397], [-1.9495, -0.0423859], [-1.88886, -0.528291], [-1.80851, -0.820379], [-1.74085, -1.03511], [-1.61913, -1.19612], [-1.4043, -1.28345], [-1.22212, -1.40082], [-1.08899, -1.52051], [-0.96021, -1.71241], [-0.851836, -1.78967], [-0.504313, -1.90178], [-0.276098, -1.92543], [-0.00915563, -1.94306], [0.267087, -1.9282]]
        id: actor502252
        objectName: "actor502252"
        property alias image: graphic55
        x: 21.291016
        y: -23.426558
        ImageRenderer {
            cacheRenderParams: actor502252.body.bodyType === Body.StaticBody
            id: graphic55
            sizeScale: 4.4077015
            source: Util.getPathToImage("middleground_e1/e1_asteroid.png")
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
        x: 4.2661176
        y: -14.828179
        z: 1
    }
    Polygon {
        body.active: false
        body.vertices: [[0.207222, 0.312298], [-0.34526, 0.312298], [-0.34526, 0.049705], [0.207222, 0.049705]]
        id: actor389504
        objectName: "actor389504"
        property alias image: graphic57
        rotation: 6.708908
        x: 18.605196
        y: -16.888248
        z: 2
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor389504.body.bodyType === Body.StaticBody
            id: graphic57
            sizeScale: -1
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.526395, 0.774643], [0.967777, 0.774643], [0.967777, -0.42604], [-0.526395, -0.42604]]
        id: actor382634
        objectName: "actor382634"
        property alias image: graphic58
        x: -1.332413
        y: -16.289112
        z: 2
        ImageRenderer {
            cacheRenderParams: actor382634.body.bodyType === Body.StaticBody
            id: graphic58
            sizeScale: 3.5495038
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Portal {
        activationThreshold: 7
        id: actor138974
        objectName: "actor138974"
        x: 30.627106
        y: -23.103687
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.787564], [0.696011, 0.787564], [0.696011, 0.321409], [-0.417739, 0.321409]]
        id: actor140805
        objectName: "actor140805"
        property alias image: graphic60
        x: 1.0639443
        y: -17.15659
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140805.body.bodyType === Body.StaticBody
            id: graphic60
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.579231], [0.696011, 0.579231], [0.696011, -0.378592], [-0.417739, -0.378592]]
        id: actor382490
        objectName: "actor382490"
        property alias image: graphic61
        x: -0.9514084
        y: -17.034122
        z: 2
        ImageRenderer {
            cacheRenderParams: actor382490.body.bodyType === Body.StaticBody
            id: graphic61
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.62808, 0.626759], [0.770824, 0.626759], [0.770824, -0.483898], [-0.62808, -0.483898]]
        id: actor382635
        objectName: "actor382635"
        property alias image: graphic62
        x: -2.8240347
        y: -16.899147
        z: 2
        ImageRenderer {
            cacheRenderParams: actor382635.body.bodyType === Body.StaticBody
            id: graphic62
            sizeScale: 2.8271406
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.312298], [0.34526, 0.312298], [0.34526, 0.049705], [-0.207222, 0.049705]]
        id: actor388330
        objectName: "actor388330"
        property alias image: graphic63
        rotation: 0.21929932
        x: 9.816001
        y: -16.959908
        z: 2
        ImageRenderer {
            cacheRenderParams: actor388330.body.bodyType === Body.StaticBody
            id: graphic63
            sizeScale: 1.13
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.374237], [0.34526, 0.374237], [0.34526, 0.129341], [-0.207222, 0.129341]]
        id: actor388913
        objectName: "actor388913"
        property alias image: graphic64
        rotation: -4.6663513
        x: 24.221102
        y: -16.915667
        z: 2
        ImageRenderer {
            cacheRenderParams: actor388913.body.bodyType === Body.StaticBody
            id: graphic64
            sizeScale: 1.13
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.180675, 0.27229], [0.301029, 0.27229], [0.301029, 0.0433373], [-0.180675, 0.0433373]]
        id: actor388916
        objectName: "actor388916"
        property alias image: graphic65
        x: 16.128292
        y: -17.280685
        z: 2
        ImageRenderer {
            cacheRenderParams: actor388916.body.bodyType === Body.StaticBody
            id: graphic65
            sizeScale: 0.87189037
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.312298], [0.34526, 0.312298], [0.34526, 0.049705], [-0.207222, 0.049705]]
        id: actor389506
        objectName: "actor389506"
        property alias image: graphic66
        rotation: 7.1796412
        x: 25.998207
        y: -20.81018
        z: 2
        ImageRenderer {
            cacheRenderParams: actor389506.body.bodyType === Body.StaticBody
            id: graphic66
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207222, 0.374237], [0.34526, 0.374237], [0.34526, 0.129341], [-0.207222, 0.129341]]
        id: actor389507
        objectName: "actor389507"
        property alias image: graphic67
        rotation: 0.68571424
        x: 6.741
        y: -17.31123
        z: 2
        ImageRenderer {
            cacheRenderParams: actor389507.body.bodyType === Body.StaticBody
            id: graphic67
            sizeScale: 1.13
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.17042, 0.513531], [0.472979, 0.513531], [0.472979, -0.653206], [-1.17042, -0.653206]]
        id: actor391868
        objectName: "actor391868"
        property alias image: graphic68
        x: -2.3375187
        y: -13.405781
        z: 2
        ImageRenderer {
            cacheRenderParams: actor391868.body.bodyType === Body.StaticBody
            id: graphic68
            sizeScale: 4.254821
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.576023, 1.15548], [1.01983, 1.15548], [1.01983, 0.202729], [-0.576023, 0.202729]]
        id: actor391946
        objectName: "actor391946"
        property alias image: graphic69
        x: 29.558298
        y: -18.827837
        z: 2
        ImageRenderer {
            cacheRenderParams: actor391946.body.bodyType === Body.StaticBody
            id: graphic69
            sizeScale: 4.72568
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.180675, 0.210627], [0.184555, 0.210627], [0.184555, -0.10926], [-0.180675, -0.10926]]
        id: actor392025
        objectName: "actor392025"
        property alias image: graphic70
        x: 30.562304
        y: -20.764362
        z: 2
        ImageRenderer {
            cacheRenderParams: actor392025.body.bodyType === Body.StaticBody
            id: graphic70
            sizeScale: 0.87189037
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.180675, 0.210627], [0.184555, 0.210627], [0.184555, -0.10926], [-0.180675, -0.10926]]
        id: actor392026
        objectName: "actor392026"
        property alias image: graphic71
        x: 22.631683
        y: -16.650028
        z: 2
        ImageRenderer {
            cacheRenderParams: actor392026.body.bodyType === Body.StaticBody
            id: graphic71
            sizeScale: 0.87189037
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.671399, 0.669986], [0.823987, 0.669986], [0.823987, -0.517273], [-0.671399, -0.517273]]
        id: actor392027
        objectName: "actor392027"
        property alias image: graphic72
        x: 31.186289
        y: -20.25881
        z: 2
        ImageRenderer {
            cacheRenderParams: actor392027.body.bodyType === Body.StaticBody
            id: graphic72
            sizeScale: 3.0221272
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.576023, 1.15548], [1.01983, 1.15548], [1.01983, 0.202729], [-0.576023, 0.202729]]
        id: actor413577
        objectName: "actor413577"
        property alias image: graphic73
        rotation: 16.550323
        x: 9.251094
        y: -16.319387
        z: 2
        ImageRenderer {
            cacheRenderParams: actor413577.body.bodyType === Body.StaticBody
            id: graphic73
            sizeScale: 4.72568
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor165113
        objectName: "actor165113"
        property alias image: graphic75
        property alias parallaxTransform: parallaxTransform74
        x: -10.285189
        y: -11.596597
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform74
            zDepth: 0.7
            ImageRenderer {
                id: graphic75
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor186014
        objectName: "actor186014"
        property alias image: graphic77
        property alias parallaxTransform: parallaxTransform76
        x: -7.2909675
        y: -9.732241
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform76
            zDepth: 0.7
            ImageRenderer {
                id: graphic77
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor389910
        objectName: "actor389910"
        property alias image: graphic79
        property alias parallaxTransform: parallaxTransform78
        x: 6.032727
        y: -10.399191
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform78
            zDepth: 0.7
            ImageRenderer {
                id: graphic79
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor390750
        objectName: "actor390750"
        property alias image: graphic81
        property alias parallaxTransform: parallaxTransform80
        rotation: 32.934845
        x: 13.122901
        y: -10.129935
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform80
            zDepth: 0.7
            ImageRenderer {
                id: graphic81
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor390822
        objectName: "actor390822"
        property alias image: graphic83
        property alias parallaxTransform: parallaxTransform82
        rotation: -28.229282
        x: 41.99802
        y: -16.92896
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform82
            zDepth: 0.7
            ImageRenderer {
                id: graphic83
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor390967
        objectName: "actor390967"
        property alias image: graphic85
        property alias parallaxTransform: parallaxTransform84
        x: 31.20993
        y: -8.919221
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform84
            zDepth: 0.7
            ImageRenderer {
                id: graphic85
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor391041
        objectName: "actor391041"
        property alias image: graphic87
        property alias parallaxTransform: parallaxTransform86
        rotation: -20.542269
        x: 36.760513
        y: -11.008475
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform86
            zDepth: 0.7
            ImageRenderer {
                id: graphic87
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor391042
        objectName: "actor391042"
        property alias image: graphic89
        property alias parallaxTransform: parallaxTransform88
        x: 25.05875
        y: -10.350578
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform88
            zDepth: 0.7
            ImageRenderer {
                id: graphic89
                sizeScale: 5.5509486
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    ThoughtBubble {
        id: thoughtBubble90
        objectName: "thoughtBubble90"
        playerActor: actor0
        portal: actor138974
        x: 4.26612
        y: -14.8282
        z: 10
    }
    ParticleLayer {
        density: 20
        gravityScale: 0.65
        id: particleLayer0
        radius: 0.075
    }
    ParticleLayer {
        density: 0.2
        gravityScale: 1.5
        id: particleLayer1
    }
    ParticleLayer {
        id: particleLayer2
    }
    ParticleLayer {
        id: particleLayer3
    }
}
