import QtQuick 2.2
import VoltAir 1.0
Level {
    cameraBoundary: Qt.rect(-0.93268, -28.9984, 101.577, 17.9359)
    fileName: "E1S1"
    parallaxOrigin.x: 49.998302
    parallaxOrigin.y: -21.69758
    parallaxStrength.y: 1
    Polygon {
        body.active: false
        body.vertices: [[-10.0774, 10.219], [10.2866, 10.219], [10.2866, -1.14761], [-10.0774, -1.14761]]
        id: actor36924
        objectName: "actor36924"
        property alias image: graphic1
        property alias parallaxTransform: parallaxTransform0
        x: 50.168816
        y: -26.832365
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
        body.active: false
        body.vertices: [[-0.273135, -0.235305], [0.775189, -0.235305], [0.775189, -4.42401], [-0.273135, -4.42401]]
        id: actor141140
        objectName: "actor141140"
        property alias image: graphic2
        x: 85.86668
        y: -9.588185
        z: -2
        ImageRenderer {
            cacheRenderParams: actor141140.body.bodyType === Body.StaticBody
            id: graphic2
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.348182, -0.299958], [0.988183, -0.299958], [0.988183, -5.63957], [-0.348182, -5.63957]]
        id: actor142256
        objectName: "actor142256"
        property alias image: graphic3
        x: 71.98181
        y: -4.1653857
        z: -2
        ImageRenderer {
            cacheRenderParams: actor142256.body.bodyType === Body.StaticBody
            id: graphic3
            sizeScale: 3.6243458
            source: Util.getPathToImage("middleground_e1/deco_e1_column02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.0851281, 1.84455], [1.79324, 1.84455], [1.79324, -5.03893], [-0.0851281, -5.03893]]
        id: actor142257
        objectName: "actor142257"
        property alias image: graphic4
        x: 53.548992
        y: -6.417487
        z: -2
        ImageRenderer {
            cacheRenderParams: actor142257.body.bodyType === Body.StaticBody
            id: graphic4
            sizeScale: 6
            source: Util.getPathToImage("middleground_e1/deco_e1_column03.png")
        }
    }
    Polygon {
        body.vertices: [[-1, 3.88092], [0.00511932, 3.88092], [0.00511932, -23.3214], [-1, -23.3214]]
        id: actor2
        objectName: "actor2"
        visible: false
        y: -10.638224
        z: -2
    }
    Polygon {
        body.vertices: [[-0.00387573, 3.88092], [1, 3.88092], [1, -23.2424], [-0.00387573, -23.2424]]
        id: actor5
        objectName: "actor5"
        visible: false
        x: 99.90249
        y: -10.737098
        z: -2
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210898, 0.292428], [0.258828, 0.292428], [0.258828, 0.0991096], [-0.210898, 0.0991096]]
        id: actor140335
        objectName: "actor140335"
        property alias image: graphic7
        x: 62.57537
        y: -16.166882
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor140335.body.bodyType === Body.StaticBody
            id: graphic7
            sizeScale: 0.9493009
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.18092, 0.333943], [0.222038, 0.333943], [0.222038, 0.0850219], [-0.18092, 0.0850219]]
        id: actor140512
        objectName: "actor140512"
        property alias image: graphic8
        rotation: -6.3001094
        x: 7.590597
        y: -15.460388
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor140512.body.bodyType === Body.StaticBody
            id: graphic8
            sizeScale: 0.8143646
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor38186
        objectName: "actor38186"
        property alias image: graphic9
        x: 8.095668
        y: -12.902129
        z: -1
        ImageRenderer {
            cacheRenderParams: actor38186.body.bodyType === Body.StaticBody
            id: graphic9
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.38282, 1.29137], [0.561856, 1.29137], [0.561856, -0.166399], [-1.38282, -0.166399]]
        id: actor140611
        objectName: "actor140611"
        property alias image: graphic10
        x: 6.777646
        y: -14.3293705
        z: -1
        ImageRenderer {
            cacheRenderParams: actor140611.body.bodyType === Body.StaticBody
            id: graphic10
            sizeScale: 3.4656453
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210898, 0.292428], [0.258828, 0.292428], [0.258828, 0.0875463], [-0.210898, 0.0875463]]
        id: actor141130
        objectName: "actor141130"
        property alias image: graphic11
        x: 56.425438
        y: -14.632179
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor141130.body.bodyType === Body.StaticBody
            id: graphic11
            sizeScale: 0.9493009
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210898, 0.334153], [0.258828, 0.334153], [0.258828, 0.0991096], [-0.210898, 0.0991096]]
        id: actor141135
        objectName: "actor141135"
        property alias image: graphic12
        x: 93.565605
        y: -17.43591
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor141135.body.bodyType === Body.StaticBody
            id: graphic12
            sizeScale: 0.9493009
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.38282, 1.29137], [0.561856, 1.29137], [0.561856, -0.166399], [-1.38282, -0.166399]]
        id: actor142149
        objectName: "actor142149"
        property alias image: graphic13
        x: 56.698288
        y: -13.120763
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142149.body.bodyType === Body.StaticBody
            id: graphic13
            sizeScale: 3.4656453
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor142150
        objectName: "actor142150"
        property alias image: graphic14
        x: 57.625416
        y: -11.750624
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142150.body.bodyType === Body.StaticBody
            id: graphic14
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor142151
        objectName: "actor142151"
        property alias image: graphic15
        x: 51.723484
        y: -11.825967
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142151.body.bodyType === Body.StaticBody
            id: graphic15
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor142152
        objectName: "actor142152"
        property alias image: graphic16
        x: 96.209854
        y: -13.868673
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142152.body.bodyType === Body.StaticBody
            id: graphic16
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.38282, 1.29137], [0.561856, 1.29137], [0.561856, -0.166399], [-1.38282, -0.166399]]
        id: actor142153
        objectName: "actor142153"
        property alias image: graphic17
        x: 98.682686
        y: -15.012776
        z: -1
        ImageRenderer {
            cacheRenderParams: actor142153.body.bodyType === Body.StaticBody
            id: graphic17
            sizeScale: 3.4656453
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210898, 0.292428], [0.258828, 0.292428], [0.258828, 0.0715522], [-0.210898, 0.0715522]]
        id: actor181396
        objectName: "actor181396"
        property alias image: graphic18
        x: 14.602526
        y: -14.578
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor181396.body.bodyType === Body.StaticBody
            id: graphic18
            sizeScale: 0.9493009
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.631637, -0.235305], [0.775189, -0.235305], [0.775189, -1.60721], [-0.631637, -1.60721]]
        id: actor181399
        objectName: "actor181399"
        property alias image: graphic19
        x: 75.641014
        y: -11.423428
        z: -1
        ImageRenderer {
            cacheRenderParams: actor181399.body.bodyType === Body.StaticBody
            id: graphic19
            sizeScale: 2.843152
            source: Util.getPathToImage("middleground_e1/deco_e1_vines02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.342337, 0.580565], [0.42014, 0.580565], [0.42014, -0.160312], [-0.342337, -0.160312]]
        id: actor307064
        objectName: "actor307064"
        property alias image: graphic20
        x: 64.74609
        y: -15.5478735
        z: -1
        ImageRenderer {
            cacheRenderParams: actor307064.body.bodyType === Body.StaticBody
            id: graphic20
            sizeScale: 1.5409422
            source: Util.getPathToImage("middleground_e1/deco_e1_geyser01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.579231], [0.696011, 0.579231], [0.696011, -0.378592], [-0.417739, -0.378592]]
        id: actor140806
        objectName: "actor140806"
        property alias image: graphic21
        x: 1.9121804
        y: -15.375386
        z: -1
        ImageRenderer {
            cacheRenderParams: actor140806.body.bodyType === Body.StaticBody
            id: graphic21
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.210898, 0.292428], [0.258828, 0.292428], [0.258828, 0.0991096], [-0.210898, 0.0991096]]
        id: actor140511
        objectName: "actor140511"
        property alias image: graphic22
        x: 4.9022717
        y: -15.41523
        z: -1
        ImageRenderer {
            aspectRatio: 1.1875
            cacheRenderParams: actor140511.body.bodyType === Body.StaticBody
            id: graphic22
            sizeScale: 0.9493009
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.friction: 0
        body.vertices: [[-1.64145, 5.71415], [1.65244, 5.73199], [1.34369, 4.96413], [1.1971, 4.17637], [1.17159, 3.10134], [1.07543, 1.6243], [0.345064, -0.160755], [-0.0245776, -1], [-1.61091, -1]]
        id: actor311424
        objectName: "actor311424"
        property alias bodyRenderer: graphic23
        x: -7.4505806e-09
        y: -20.902023
        z: -1
        TerrainMeshRenderer {
            id: graphic23
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic23baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "egLJv/uZtMBmKsW/YNttP2E4or3Wjmo/egLJv/uZtMBhOKK91o5qP/mLgT7xKvk9egLJv/uZtMD5i4E+8Sr5PSZdej96ydK/egLJv/uZtMAmXXo/esnSvwYtiT8OxUbAegLJv/uZtMAGLYk/DsVGwIB/jD/E+YXAegLJv/uZtMCAf4w/xPmFwKCznz8Pv5/AoLOfPw+/n8AR7cg//Z+1wHoCyb/7mbTA"
            }
            PolygonVertexAttributeArray {
                id: graphic23baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "pwGGvqhm+D+acYO+cFtYPyxLWLwy6Fg/pwGGvqhm+D8sS1i8MuhYP6K6LD0bz3o/pwGGvqhm+D+iuiw9G896P8ToJj6UIaM/pwGGvqhm+D/E6CY+lCGjP7PmNj6wQcI/pwGGvqhm+D+z5jY+sEHCP6tUOz4uUdk/pwGGvqhm+D+rVDs+LlHZP4DvVD5gf+o/gO9UPmB/6j9h84U+VBX5P6cBhr6oZvg/"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic23baseMesha_position, graphic23baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic23edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "ZirFv2DbbT/xOde/UBKJP5oz27+4GrnAZirFv2DbbT+aM9u/uBq5wHoCyb/7mbTAegLJv/uZtMCaM9u/uBq5wEAZ3j/4OLnAegLJv/uZtMBAGd4/+Di5wBHtyD/9n7XAEe3IP/2ftcBAGd4/+Di5wEZIuD9V9Z3AEe3IP/2ftcBGSLg/VfWdwKCznz8Pv5/AoLOfPw+/n8BGSLg/VfWdwMr1pT/sT4XAoLOfPw+/n8DK9aU/7E+FwIB/jD/E+YXAgH+MP8T5hcDK9aU/7E+FwC3Aoj+1M0bAgH+MP8T5hcAtwKI/tTNGwAYtiT8OxUbABi2JPw7FRsAtwKI/tTNGwIAglj+DCM2/Bi2JPw7FRsCAIJY/gwjNvyZdej96ydK/Jl16P3rJ0r+AIJY/gwjNv2fM3z60pEw+Jl16P3rJ0r9nzN8+tKRMPvmLgT7xKvk9+YuBPvEq+T1nzN8+tKRMPoQz9jyVuIo/+YuBPvEq+T2EM/Y8lbiKP2E4or3Wjmo/YTiivdaOaj+EM/Y8lbiKP/E5179QEok/YTiivdaOaj/xOde/UBKJP2Yqxb9g220/"
            }
            PolygonVertexAttributeArray {
                id: graphic23edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "mnGDvnBbWD/2e4++Ok9SP2cikr4mZ/s/mnGDvnBbWD9nIpK+Jmf7P6cBhr6oZvg/pwGGvqhm+D9nIpK+Jmf7P9YQlD5Qe/s/pwGGvqhm+D/WEJQ+UHv7P2HzhT5UFfk/YfOFPlQV+T/WEJQ+UHv7P7O1dT45Tuk/YfOFPlQV+T+ztXU+OU7pP4DvVD5gf+o/gO9UPmB/6j+ztXU+OU7pP7hHXT7z39g/gO9UPmB/6j+4R10+89/YP6tUOz4uUdk/q1Q7Pi5R2T+4R10+89/YPzwAWT48EcI/q1Q7Pi5R2T88AFk+PBHCP7PmNj6wQcI/s+Y2PrBBwj88AFk+PBHCP1YrSD4WLKI/s+Y2PrBBwj9WK0g+FiyiP8ToJj6UIaM/xOgmPpQhoz9WK0g+FiyiP/AylT0jeXc/xOgmPpQhoz/wMpU9I3l3P6K6LD0bz3o/orosPRvPej/wMpU9I3l3P1gipDt5wlE/orosPRvPej9YIqQ7ecJRPyxLWLwy6Fg/LEtYvDLoWD9YIqQ7ecJRP/Z7j746T1I/LEtYvDLoWD/2e4++Ok9SP5pxg75wW1g/"
            }
            PolygonVertexAttributeArray {
                id: graphic23edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAAOza1j8AAAAAAAAAAAAAgD/s2tY/AAAAAOza1j8AAIA/7NrWPwAAgD/s2tY/AAAAAG8hIEAAAAAA7NrWPwAAgD9vISBAAAAAAG8hIEAAAIA/byEgQAAAgD9vISBAAAAAAE9fLUAAAAAAbyEgQAAAgD9PXy1AAAAAAE9fLUAAAIA/T18tQAAAgD9PXy1AAAAAAF8xOkAAAAAAT18tQAAAgD9fMTpAAAAAAF8xOkAAAIA/XzE6QAAAgD9fMTpAAAAAAPBlS0AAAAAAXzE6QAAAgD/wZUtAAAAAAPBlS0AAAIA/8GVLQAAAgD/wZUtAAAAAALcUY0AAAAAA8GVLQAAAgD+3FGNAAAAAALcUY0AAAIA/txRjQAAAgD+3FGNAAAAAAFD4gEAAAAAAtxRjQAAAgD9Q+IBAAAAAAFD4gEAAAIA/UPiAQAAAgD9Q+IBAAAAAAGpOiEAAAAAAUPiAQAAAgD9qTohAAAAAAGpOiEAAAIA/ak6IQAAAgD9qTohAAAAAADf/lEAAAAAAak6IQAAAgD83/5RAAAAAADf/lEAAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic23edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAPzEkoUAAAIA/AAAAAAAAgD8xJKFAAACAPzEkoUAAAIA/MSShQAAAgD8xJKFAAACAPycy8EAAAIA/MSShQAAAgD8nMvBAAACAPycy8EAAAIA/JzLwQAAAgD8nMvBAAACAP3wHAkEAAIA/JzLwQAAAgD98BwJBAACAP3wHAkEAAIA/fAcCQQAAgD98BwJBAACAPwilC0EAAIA/fAcCQQAAgD8IpQtBAACAPwilC0EAAIA/CKULQQAAgD8IpQtBAACAP3WMGEEAAIA/CKULQQAAgD91jBhBAACAP3WMGEEAAIA/dYwYQQAAgD91jBhBAACAP4pPKkEAAIA/dYwYQQAAgD+KTypBAACAP4pPKkEAAIA/ik8qQQAAgD+KTypBAACAP3l0QUEAAIA/ik8qQQAAgD95dEFBAACAP3l0QUEAAIA/eXRBQQAAgD95dEFBAACAP6B1TEEAAIA/eXRBQQAAgD+gdUxBAACAP6B1TEEAAIA/oHVMQQAAgD+gdUxBAACAP9R+X0EAAIA/oHVMQQAAgD/Ufl9BAACAP9R+X0EAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic23edgeMesha_position, graphic23edgeMesha_texCoord, graphic23edgeMesha_maskTexCoord, graphic23edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic23bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic23bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic23bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic23bevelMesha_position, graphic23bevelMesha_texCoord, graphic23bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.friction: 0
        body.restitution: 0
        body.vertices: [[-1.40016, 7.35126], [0.942777, 7.34449], [0.925221, -3.15541], [0.326697, -3.15556], [-0.183212, -2.30736], [-0.594519, -1.35538], [-1.03213, 0.587929], [-0.946618, 1.76472], [-0.80615, 3.65465], [-0.874574, 5.11303], [-1.16394, 6.22685], [-1.21604, 6.86651]]
        id: actor311425
        objectName: "actor311425"
        property alias bodyRenderer: graphic24
        x: 100.50079
        y: -24.48876
        z: -1
        TerrainMeshRenderer {
            id: graphic24
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic24baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "4SqPv+Ru3MBGXYi/GcvHwJGURr/JGKTA2MY0v1vPacCTzVi/X/Lgv2Wybr8uahi/2MY0v1vPacBlsm6/LmoYvyC1/77vhqk/2MY0v1vPacAgtf++74apP3wMwb0RvxBAkZRGv8kYpMDYxjS/W89pwHwMwb0RvxBAkZRGv8kYpMB8DMG9Eb8QQHR4wD6QYkRAkZRGv8kYpMB0eMA+kGJEQHjEWj/makVA4SqPv+Ru3MCRlEa/yRikwHjEWj/makVA4SqPv+Ru3MB4xFo/5mpFQCQ1Xz8jxOjA4SqPv+Ru3MAkNV8/I8TowP6xqL9ma+nA"
            }
            PolygonVertexAttributeArray {
                id: graphic24baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "1+M+vkx6CUCz0TW+CJkCQAxjBL7cZe0/IAnxvcnvzT8NiRC+un2lP5khH76Es4w/IAnxvcnvzT+ZIR++hLOMP8B4qr2wfUc/IAnxvcnvzT/AeKq9sH1HP/6ygLyfgB8/DGMEvtxl7T8gCfG9ye/NP/6ygLyfgB8/DGMEvtxl7T/+soC8n4AfP05QgD1AJ/o+DGMEvtxl7T9OUIA9QCf6PlDYET7Mxvg+1+M+vkx6CUAMYwS+3GXtP1DYET7Mxvg+1+M+vkx6CUBQ2BE+zMb4PhjOFD62lg1A1+M+vkx6CUAYzhQ+tpYNQFPtYL54zg1A"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic24baseMesha_position, graphic24baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic24edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "4SqPv+Ru3MB2I6i/8QXbwA2/vb+6D+3A4SqPv+Ru3MANv72/ug/twP6xqL9ma+nA/rGov2Zr6cANv72/ug/twDq/gT8ESO3A/rGov2Zr6cA6v4E/BEjtwCQ1Xz8jxOjAJDVfPyPE6MA6v4E/BEjtwBfyfj+WeU5AJDVfPyPE6MAX8n4/lnlOQHjEWj/makVAeMRaP+ZqRUAX8n4/lnlOQEsRjj7thk9AeMRaP+ZqRUBLEY4+7YZPQHR4wD6QYkRAdHjAPpBiREBLEY4+7YZPQMJYi75fmBZAdHjAPpBiREDCWIu+X5gWQHwMwb0RvxBAfAzBvRG/EEDCWIu+X5gWQDWKML9Ac7E/fAzBvRG/EEA1ijC/QHOxPyC1/77vhqk/ILX/vu+GqT81ijC/QHOxP6HgkL/jmhS/ILX/vu+GqT+h4JC/45oUv2Wybr8uahi/ZbJuvy5qGL+h4JC/45oUv8Xuhb+Z0uK/ZbJuvy5qGL/F7oW/mdLiv5PNWL9f8uC/k81Yv1/y4L/F7oW/mdLiv9P4Z78X/GnAk81Yv1/y4L/T+Ge/F/xpwNjGNL9bz2nA2MY0v1vPacDT+Ge/F/xpwIszeb8WI6PA2MY0v1vPacCLM3m/FiOjwJGURr/JGKTAkZRGv8kYpMCLM3m/FiOjwOmaob+XucbAkZRGv8kYpMDpmqG/l7nGwEZdiL8Zy8fARl2IvxnLx8DpmqG/l7nGwHYjqL/xBdvARl2IvxnLx8B2I6i/8QXbwOEqj7/kbtzA"
            }
            PolygonVertexAttributeArray {
                id: graphic24edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "1+M+vkx6CUBIL2C++wEJQLz+fL4+BQ9A1+M+vkx6CUC8/ny+PgUPQFPtYL54zg1AU+1gvnjODUC8/ny+PgUPQPj+LD4CGA9AU+1gvnjODUD4/iw+AhgPQBjOFD62lg1AGM4UPraWDUD4/iw+AhgPQLr2KT44s+w+GM4UPraWDUC69ik+OLPsPlDYET7Mxvg+UNgRPszG+D669ik+OLPsPmRsPT0YTOs+UNgRPszG+D5kbD09GEzrPk5QgD1AJ/o+TlCAPUAn+j5kbD09GEzrPq7LOb1rmhs/TlCAPUAn+j6uyzm9a5obP/6ygLyfgB8//rKAvJ+AHz+uyzm9a5obP/Ji672V2UQ//rKAvJ+AHz/yYuu9ldlEP8B4qr2wfUc/wHiqvbB9Rz/yYuu9ldlEP4IrQb4+Yow/wHiqvbB9Rz+CK0G+PmKMP5khH76Es4w/mSEfvoSzjD+CK0G+PmKMP7KTMr7EzaU/mSEfvoSzjD+ykzK+xM2lPw2JEL66faU/DYkQvrp9pT+ykzK+xM2lP+KlGr6y/s0/DYkQvrp9pT/ipRq+sv7NPyAJ8b3J780/IAnxvcnvzT/ipRq+sv7NP10iJr4Pwuw/IAnxvcnvzT9dIia+D8LsPwxjBL7cZe0/DGMEvtxl7T9dIia+D8LsPzd5V77dPQJADGMEvtxl7T83eVe+3T0CQLPRNb4ImQJAs9E1vgiZAkA3eVe+3T0CQEgvYL77AQlAs9E1vgiZAkBIL2C++wEJQNfjPr5MeglA"
            }
            PolygonVertexAttributeArray {
                id: graphic24edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAAAAAJm/BD4AAAAAAAAAAAAAgD+ZvwQ+AAAAAJm/BD4AAIA/mb8EPgAAgD+ZvwQ+AAAAAMUiNz8AAAAAmb8EPgAAgD/FIjc/AAAAAMUiNz8AAIA/xSI3PwAAgD/FIjc/AAAAAFrIVUAAAAAAxSI3PwAAgD9ayFVAAAAAAFrIVUAAAIA/WshVQAAAgD9ayFVAAAAAAOhbX0AAAAAAWshVQAAAgD/oW19AAAAAAOhbX0AAAIA/6FtfQAAAgD/oW19AAAAAAKExb0AAAAAA6FtfQAAAgD+hMW9AAAAAAKExb0AAAIA/oTFvQAAAgD+hMW9AAAAAAAAAgEAAAAAAoTFvQAAAgD8AAIBAAAAAAAAAgEAAAIA/AAAAAAAAgD8AAAAAAAAAAPj4/j4AAAAAAAAAAAAAgD/4+P4+AAAAAPj4/j4AAIA/+Pj+PgAAgD/4+P4+AAAAAO//Sj8AAAAA+Pj+PgAAgD/v/0o/AAAAAO//Sj8AAIA/7/9KPwAAgD/v/0o/AAAAAOkkoj8AAAAA7/9KPwAAgD/pJKI/AAAAAOkkoj8AAIA/6SSiPwAAgD/pJKI/AAAAACHd0D8AAAAA6SSiPwAAgD8h3dA/AAAAACHd0D8AAIA/Id3QPwAAgD8h3dA/AAAAAHCw9T8AAAAAId3QPwAAgD9wsPU/AAAAAHCw9T8AAIA/cLD1PwAAgD9wsPU/AAAAAO4cBUAAAAAAcLD1PwAAgD/uHAVAAAAAAO4cBUAAAIA/"
            }
            PolygonVertexAttributeArray {
                id: graphic24edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "AAAAAAAAgD8AAAAAAACAP2Yfxz4AAIA/AAAAAAAAgD9mH8c+AACAP2Yfxz4AAIA/Zh/HPgAAgD9mH8c+AACAPxRaCUAAAIA/Zh/HPgAAgD8UWglAAACAPxRaCUAAAIA/FFoJQAAAgD8UWglAAACAP0RWIEEAAIA/FFoJQAAAgD9EViBBAACAP0RWIEEAAIA/RFYgQQAAgD9EViBBAACAP+6EJ0EAAIA/RFYgQQAAgD/uhCdBAACAP+6EJ0EAAIA/7oQnQQAAgD/uhCdBAACAPzhlM0EAAIA/7oQnQQAAgD84ZTNBAACAPzhlM0EAAIA/OGUzQQAAgD84ZTNBAACAP/rWP0EAAIA/OGUzQQAAgD/61j9BAACAP/rWP0EAAIA/+tY/QQAAgD/61j9BAACAP1G+V0EAAIA/+tY/QQAAgD9RvldBAACAP1G+V0EAAIA/Ub5XQQAAgD9RvldBAACAP/fmZUEAAIA/Ub5XQQAAgD/35mVBAACAP/fmZUEAAIA/9+ZlQQAAgD/35mVBAACAP9KkfEEAAIA/9+ZlQQAAgD/SpHxBAACAP9KkfEEAAIA/0qR8QQAAgD/SpHxBAACAP/MUh0EAAIA/0qR8QQAAgD/zFIdBAACAP/MUh0EAAIA/8xSHQQAAgD/zFIdBAACAP5L8jUEAAIA/8xSHQQAAgD+S/I1BAACAP5L8jUEAAIA/kvyNQQAAgD+S/I1BAACAP1bWkUEAAIA/kvyNQQAAgD9W1pFBAACAP1bWkUEAAIA/"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic24edgeMesha_position, graphic24edgeMesha_texCoord, graphic24edgeMesha_maskTexCoord, graphic24edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic24bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic24bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: ""
            }
            PolygonVertexAttributeArray {
                id: graphic24bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: ""
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic24bevelMesha_position, graphic24bevelMesha_texCoord, graphic24bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.508043], [0.521351, 0.508043], [0.521351, -0.00350833], [-0.424806, -0.00350833]]
        id: actor38406
        objectName: "actor38406"
        property alias image: graphic25
        x: 56.898956
        y: -17.8457
        z: -1
        ImageRenderer {
            cacheRenderParams: actor38406.body.bodyType === Body.StaticBody
            id: graphic25
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock02.png")
        }
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-2.3714, 4.73382], [2.19238, 4.73485], [3.74449, 0.129973], [5.02849, -1.35269], [5.96294, -2.13341], [6.78742, -2.6638], [7.45033, -2.92604], [7.98415, -3.07883], [8.26866, -3.10427], [8.56279, -3.05722], [8.98199, -2.80819], [9.50203, -2.17734], [9.69097, -1.48803], [9.81919, -0.463602], [9.68282, 1.92104], [8.73384, 4.7036], [16.1313, 4.71289], [14.6131, 1.20802], [14.4832, 0.0867949], [14.7106, -0.927742], [15.6199, -1.27515], [16.5621, -1.307], [17.8054, -1.22326], [19.1222, -1.58934], [20.5552, -1.66871], [21.7831, -1.2909], [22.4816, -0.243884], [22.9399, 4.7138], [25.4688, 4.71414], [26.6147, -0.478712], [27.3188, -1.37309], [28.5707, -1.84405], [30.7247, -1.67], [32.258, -0.816707], [32.4475, 0.964826], [30.6563, 4.71483], [36.5837, 4.71562], [38.8135, 2.30297], [39.2428, 0.515747], [39.8533, -0.676638], [40.603, -1.15346], [41.5073, -1.21078], [42.3097, -1.36398], [43.235, -1.82008], [44.0393, -2.00137], [44.5157, -1.82528], [44.7045, -1.46767], [44.6462, -1.04335], [44.2852, -0.25702], [43.3722, 0.702855], [41.9391, 4.71227], [46.5213, 4.71227], [48.011, 1.60562], [50.1831, -0.588308], [51.5522, -1.31416], [53.2399, -1.59719], [55.5541, -1.25886], [57.4218, -1.62538], [58.369, -1.51882], [58.6603, -0.605145], [58.079, 1.547], [58.6237, 4.71811], [66.8786, 4.71637], [67.3436, 3.29889], [65.67, 1.26113], [65.8461, -0.134643], [67.2944, -0.620299], [69.3349, 0.566779], [71.5855, 1.30937], [72.8527, 0.990726], [73.2045, -0.411838], [74.3003, -1.37145], [76.5449, -1.63624], [78.4841, -1.21642], [79.889, 1.1905], [80.2863, 4.71355], [86.2309, 4.71229], [86.3712, 1.54212], [85.7285, 0.144177], [83.892, -0.30253], [82.477, -1.29222], [81.8247, -2.4635], [81.9088, -3.74279], [82.9874, -4.34735], [84.4416, -4.06517], [85.9546, -3.31252], [87.0827, -2.20587], [89.2468, 4.75641], [90.9901, 4.74471], [88.6231, -0.898962], [88.7047, -1.9809], [89.3803, -2.76469], [90.6574, -3.6201], [92.0841, -4.08417], [93.7918, -4.26479], [95.6098, -4.10252], [97.6633, -3.38882], [100.009, -1.85953], [100.009, -5.62243], [98.3473, -5.56785], [93.5863, -5.55563], [92, -5.55857], [91.4767, -5.58716], [90.9176, -5.62346], [90.4299, -5.6499], [90.0725, -5.64527], [89.6015, -5.54458], [89.2908, -5.40559], [88.986, -5.2925], [88.5958, -5.22905], [87.9085, -5.21715], [84.6893, -5.35729], [83.1694, -5.55271], [81.8503, -5.84338], [80.8399, -6.25644], [80.2062, -6.78057], [79.7034, -6.78318], [79.3983, -6.3385], [79.4147, -5.416], [79.3343, -4.70523], [79.0127, -4.01714], [78.5306, -3.54513], [77.7203, -3.16724], [76.9638, -2.99713], [75.9234, -2.87073], [74.84, -2.79066], [73.1373, -2.71876], [71.7412, -2.76542], [70.2371, -2.90596], [68.8571, -3.15563], [68.3419, -3.30086], [67.6064, -3.58515], [66.8994, -3.96596], [66.3149, -4.27908], [65.9934, -4.34395], [65.2201, -4.34498], [64.9097, -4.28096], [64.4312, -4.04792], [64.157, -3.6922], [63.5528, -3.693], [63.2435, -4.0663], [62.749, -4.28383], [62.359, -4.36166], [61.6631, -4.36259], [61.2849, -4.28578], [60.4452, -3.92322], [59.5018, -3.59427], [58.5789, -3.27168], [57.2818, -2.98659], [55.5078, -2.80361], [54.1251, -2.75325], [51.991, -2.75359], [49.9257, -2.87578], [48.6026, -3.02177], [47.8413, -3.19404], [47.149, -3.57383], [46.5955, -4.2373], [46.3312, -4.78024], [46.1988, -5.26019], [46.1103, -5.50466], [45.9995, -5.67604], [45.6857, -5.76454], [45.0615, -4.80344], [43.7402, -3.82488], [41.9071, -2.98635], [40.0446, -2.42015], [37.6643, -1.98684], [35.2587, -1.72997], [33.0097, -1.81009], [32.5893, -2.01611], [32.3405, -2.42196], [32.2593, -2.82392], [31.7002, -3.0079], [31.0866, -3.09074], [30.5574, -3.10085], [29.7699, -3.03344], [29.0493, -3.00854], [28.4724, -3.183], [28.323, -3.50655], [27.9445, -3.66269], [27.635, -3.65561], [27.4121, -3.38887], [27.0592, -3.16825], [26.5302, -3.06294], [25.9528, -3.00134], [25.3907, -2.97308], [24.7402, -2.96141], [23.8781, -3.09453], [23.394, -3.402], [22.9592, -3.96703], [22.6281, -4.10282], [22.2174, -4.08105], [21.5251, -3.77105], [20.6765, -3.46891], [19.3852, -3.0196], [18.196, -2.69556], [17.0288, -2.49562], [16.0811, -2.45052], [15.29, -2.47514], [14.8392, -2.54327], [14.3103, -2.68412], [13.8589, -2.79215], [13.5387, -2.82277], [13.1525, -2.78037], [12.7054, -2.57374], [12.2215, -2.47277], [11.5657, -2.47786], [10.9484, -2.62164], [9.96421, -3.13895], [9.41703, -3.45328], [9.03769, -3.66831], [8.51616, -3.81413], [8.09013, -3.80707], [7.71959, -3.71029], [7.38606, -3.65712], [7.00243, -3.61084], [6.33062, -3.58987], [0.583614, -3.60392], [-2.36481, -3.60111]]
        id: actor30
        objectName: "actor30"
        property alias bodyRenderer: graphic26
        x: 0.9119129
        y: -11.579806
        TerrainMeshRenderer {
            id: graphic26
            material: "rough_rock"
            visible: true
            PolygonVertexAttributeArray {
                id: graphic26baseMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26baseMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            baseMesh: PolygonMesh {
                attributes: [graphic26baseMesha_position, graphic26baseMesha_texCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic26edgeMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26edgeMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26edgeMesha_maskTexCoord
                name: "a_maskTexCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26edgeMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "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"
            }
            edgeMesh: PolygonMesh {
                attributes: [graphic26edgeMesha_position, graphic26edgeMesha_texCoord, graphic26edgeMesha_maskTexCoord, graphic26edgeMesha_blendTexCoord]
            }
            PolygonVertexAttributeArray {
                id: graphic26bevelMesha_position
                name: "a_position"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26bevelMesha_texCoord
                name: "a_texCoord"
                valuesAsBase64Binary: "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"
            }
            PolygonVertexAttributeArray {
                id: graphic26bevelMesha_blendTexCoord
                name: "a_blendTexCoord"
                valuesAsBase64Binary: "6UjtQQAAgD/jGQJCAACAP+MZAkL3ok0/4xkCQgAAgD/jGQJC96JNP798BUL4os0+4xkCQgAAgD+/fAVC+KLNPtW3BEIAAIA/EOkEQgAAgD+/fAVC+KLNPtW3BEIAAIA/ShoFQgAAgD+/fAVC+KLNPhDpBEIAAIA/hUsFQgAAgD+/fAVC+KLNPkoaBUIAAIA/v3wFQgAAgD+/fAVC+KLNPoVLBUIAAIA/v3wFQgAAgD89mwhCAACAP798BUL4os0+4PM7QAAAgD+8NIZAAACAP3n5iEDw0Nc+6+WGQAAAgD95+YhA8NDXPrw0hkAAAIA/GpeHQAAAgD95+YhA8NDXPuvlhkAAAIA/SkiIQAAAgD95+YhA8NDXPhqXh0AAAIA/efmIQAAAgD95+YhA8NDXPkpIiEAAAIA/efmIQAAAgD8Et+xAAACAP3n5iEDw0Nc+ql6oQQAAgD9QhKxBAACAP6aPrUFU6s0+bd2sQQAAgD+mj61BVOrNPlCErEEAAIA/iTatQQAAgD+mj61BVOrNPm3drEEAAIA/po+tQQAAgD+mj61BVOrNPok2rUEAAIA/po+tQQAAgD+mj61BVOrNPm6CtUG+Mc4+po+tQQAAgD9ugrVBvjHOPm6CtUEAAIA/boK1QQAAgD9/Ds9BAACAP26CtUG+Mc4+Uh4lQgAAgD9izitCAACAP2LOK0LYoc0+Ys4rQgAAgD93dTVCAACAP2LOK0LYoc0+PDlOQgAAgD/zslJCAACAP/OyUkJ4Ps8+87JSQgAAgD/zslJCeD7PPh+cWkLoRg0/87JSQgAAgD8fnFpC6EYNP7s4WUIAAIA/lJFZQgAAgD8fnFpC6EYNP7s4WUIAAIA/bepZQgAAgD8fnFpC6EYNP5SRWUIAAIA/RkNaQgAAgD8fnFpC6EYNP23qWUIAAIA/H5xaQgAAgD8fnFpC6EYNP0ZDWkIAAIA/H5xaQgAAgD+S1F5CAACAPx+cWkLoRg0/5uWXQgAAgD9wqJxCAACAP3ConEIQx+Q+cKicQgAAgD9wqJxCEMfkPkP3nkLshtA+cKicQgAAgD9D955C7IbQPkP3nkIAAIA/Q/eeQgAAgD9D955C7IbQPgvNoUIaa80+Q/eeQgAAgD8LzaFCGmvNPudqoUIAAIA/+ZuhQgAAgD8LzaFCGmvNPudqoUIAAIA/C82hQgAAgD8LzaFCGmvNPvmboUIAAIA/C82hQgAAgD8LzaFCGmvNPiRkpEJAFNM+C82hQgAAgD8kZKRCQBTTPi/zo0IAAIA/1hikQgAAgD8kZKRCQBTTPi/zo0IAAIA/fT6kQgAAgD8kZKRCQBTTPtYYpEIAAIA/JGSkQgAAgD8kZKRCQBTTPn0+pEIAAIA/JGSkQgAAgD8kZKRCQBTTPvRmpkJsmu8+JGSkQgAAgD/0ZqZCbJrvPpwGpkIAAIA/sh6mQgAAgD/0ZqZCbJrvPpwGpkIAAIA/yDamQgAAgD/0ZqZCbJrvPrIepkIAAIA/3k6mQgAAgD/0ZqZCbJrvPsg2pkIAAIA/9GamQgAAgD/0ZqZCbJrvPt5OpkIAAIA/9GamQgAAgD9DU6hCAACAP/RmpkJsmu8+yNu+QgAAgD/ZCMZCAACAP9cJyEJikuE+GInGQgAAgD/XCchCYpLhPtkIxkIAAIA/WAnHQgAAgD/XCchCYpLhPhiJxkIAAIA/l4nHQgAAgD/XCchCYpLhPlgJx0IAAIA/1wnIQgAAgD/XCchCYpLhPpeJx0IAAIA/1wnIQgAAgD97qslCAACAP9cJyEJikuE+ozHiQgAAgD8wsORCAACAPzCw5EJIt78+MLDkQgAAgD8wsORCSLe/PmnU60KkmFQ+MLDkQgAAgD9p1OtCpJhUPmnU60IAAIA/adTrQgAAgD9p1OtCpJhUPo417kJEUlM+adTrQgAAgD+ONe5CRFJTPlox7UIAAIA/dLPtQgAAgD+ONe5CRFJTPlox7UIAAIA/jjXuQgAAgD+ONe5CRFJTPnSz7UIAAIA/jjXuQgAAgD+ONe5CRFJTPs/+7kL8YY0+jjXuQgAAgD/P/u5C/GGNPs/+7kIAAIA/z/7uQgAAgD/P/u5C/GGNPvLV70Ic0M4+z/7uQgAAgD/y1e9CHNDOPvLV70IAAIA/8tXvQgAAgD/y1e9CHNDOPoaR8EKgUc0+8tXvQgAAgD+GkfBCoFHNPoaR8EIAAIA/hpHwQgAAgD+GkfBCoFHNPsEa8UKafs0+hpHwQgAAgD/BGvFCmn7NPsEa8UIAAIA/wRrxQgAAgD/BGvFCmn7NPrbT8UKSIM0+wRrxQgAAgD+20/FCkiDNPrbT8UIAAIA/ttPxQgAAgD+20/FCkiDNPmlW8kJo9Mw+ttPxQgAAgD9pVvJCaPTMPmlW8kIAAIA/aVbyQgAAgD9pVvJCaPTMPj3T8kKQ+cw+aVbyQgAAgD890/JCkPnMPnOP8kIAAIA/PdPyQgAAgD890/JCkPnMPnOP8kIAAIA/PdPyQgAAgD890/JCkPnMPgpr80JcP84+PdPyQgAAgD8Ka/NCXD/OPnc280IAAIA/CmvzQgAAgD8Ka/NCXD/OPnc280IAAIA/CmvzQgAAgD8Ka/NCXD/OPgVz9EIcHN4+CmvzQgAAgD8Fc/RCHBzePgVz9EIAAIA/BXP0QgAAgD8Fc/RCHBzePmJI+UKsoU4+BXP0QgAAgD9iSPlCrKFOPmGH+EIAAIA/tsf4QgAAgD9iSPlCrKFOPmGH+EIAAIA/DAj5QgAAgD9iSPlCrKFOPrbH+EIAAIA/Ykj5QgAAgD9iSPlCrKFOPgwI+UIAAIA/Ykj5QgAAgD9iSPlCrKFOPs2U+0KCp9Q+Ykj5QgAAgD/NlPtCgqfUPs2U+0IAAIA/zZT7QgAAgD/NlPtCgqfUPnub/UIMO1U+zZT7QgAAgD97m/1CDDtVPsgu/UIAAIA/9En9QgAAgD97m/1CDDtVPsgu/UIAAIA/IWX9QgAAgD97m/1CDDtVPvRJ/UIAAIA/ToD9QgAAgD97m/1CDDtVPiFl/UIAAIA/e5v9QgAAgD97m/1CDDtVPk6A/UIAAIA/e5v9QgAAgD97m/1CDDtVPqU+/0IcfM4+e5v9QgAAgD+lPv9CHHzOPqU+/0IAAIA/pT7/QgAAgD+lPv9CHHzOPjg9AEOwyMw+pT7/QgAAgD84PQBDsMjMPjg9AEMAAIA/OD0AQwAAgD84PQBDsMjMPsSdAEPaxcw+OD0AQwAAgD/EnQBD2sXMPsSdAEMAAIA/xJ0AQwAAgD/EnQBD2sXMPk8FAUPMzMw+xJ0AQwAAgD9PBQFDzMzMPk8FAUMAAIA/TwUBQwAAgD9PBQFDzMzMPnW2AUOMYk0+TwUBQwAAgD91tgFDjGJNPl6DAUMAAIA/ZpQBQwAAgD91tgFDjGJNPl6DAUMAAIA/baUBQwAAgD91tgFDjGJNPmaUAUMAAIA/dbYBQwAAgD91tgFDjGJNPm2lAUMAAIA/dbYBQwAAgD91tgFDjGJNPss/AkPI40w+dbYBQwAAgD/LPwJDyONMPqweAkMAAIA/PC8CQwAAgD/LPwJDyONMPqweAkMAAIA/yz8CQwAAgD/LPwJDyONMPjwvAkMAAIA/yz8CQwAAgD/LPwJDyONMPqDRAkOo5Uw+yz8CQwAAgD+g0QJDqOVMPqKrAkMAAIA/ob4CQwAAgD+g0QJDqOVMPqKrAkMAAIA/oNECQwAAgD+g0QJDqOVMPqG+AkMAAIA/oNECQwAAgD+g0QJDqOVMPitTA0PsKE8+oNECQwAAgD8rUwND7ChPPlA1A0MAAIA/xzwDQwAAgD8rUwND7ChPPlA1A0MAAIA/PUQDQwAAgD8rUwND7ChPPsc8A0MAAIA/tEsDQwAAgD8rUwND7ChPPj1EA0MAAIA/K1MDQwAAgD8rUwND7ChPPrRLA0MAAIA/K1MDQwAAgD8rUwND7ChPPgAABEO0YMs+K1MDQwAAgD8AAARDtGDLPgAABEMAAIA/AAAAAAAAgD8AAAAAtGDLPoffFD9I4cs+AAAAAAAAgD+H3xQ/SOHLPoffFD8AAIA/h98UPwAAgD+H3xQ/SOHLPloNrz/k4mc+h98UPwAAgD9aDa8/5OJnPp5QmD8AAIA/Wg2vPwAAgD9aDa8/5OJnPp5QmD8AAIA/Wg2vPwAAgD9aDa8/5OJnPtOqC0A4VlY+Wg2vPwAAgD/TqgtAOFZWPpo7BEAAAIA/NvMHQAAAgD/TqgtAOFZWPpo7BEAAAIA/06oLQAAAgD/TqgtAOFZWPjbzB0AAAIA/06oLQAAAgD/TqgtAOFZWPjl4XUBg3co+06oLQAAAgD85eF1AYN3KPjl4XUAAAIA/OXhdQAAAgD85eF1AYN3KPtdCkEBQDVo+OXhdQAAAgD/XQpBAUA1aPknfikAAAIA/10KQQAAAgD/XQpBAUA1aPknfikAAAIA/10KQQAAAgD/XQpBAUA1aPvyDtECokk0+10KQQAAAgD/8g7RAqJJNPgx0rkAAAIA/BHyxQAAAgD/8g7RAqJJNPgx0rkAAAIA//IO0QAAAgD/8g7RAqJJNPgR8sUAAAIA//IO0QAAAgD/8g7RAqJJNPsAs1kCa28s+/IO0QAAAgD/ALNZAmtvLPsAs1kAAAIA/wCzWQAAAgD/ALNZAmtvLPnIF40BErLk+wCzWQAAAgD9yBeNARKy5Ptws30AAAIA/cgXjQAAAgD9yBeNARKy5Ptws30AAAIA/cgXjQAAAgD9yBeNARKy5Pu7x9UDgQbg+cgXjQAAAgD/u8fVA4EG4Pu7x9UAAAIA/7vH1QAAAgD/u8fVA4EG4PgqcBEGQKk0+7vH1QAAAgD8KnARBkCpNPgqcBEEAAIA/CpwEQQAAgD8KnARBkCpNPgWRDEE8QU0+CpwEQQAAgD8FkQxBPEFNPgWRDEEAAIA/BZEMQQAAgD8FkQxBPEFNPpqAEEGwHE0+BZEMQQAAgD+agBBBsBxNPpqAEEEAAIA/moAQQQAAgD+agBBBsBxNPhHIGUHIrU4+moAQQQAAgD8RyBlByK1OPhHIGUEAAIA/EcgZQQAAgD8RyBlByK1OPs+VHUFIJU4+EcgZQQAAgD/PlR1BSCVOPs+VHUEAAIA/z5UdQQAAgD/PlR1BSCVOPsb4I0EMzkw+z5UdQQAAgD/G+CNBDM5MPsb4I0EAAIA/xvgjQQAAgD/G+CNBDM5MPnZcKUHMjWQ+xvgjQQAAgD92XClBzI1kPmQ2KEEAAIA/6H8oQQAAgD92XClBzI1kPmQ2KEEAAIA/bckoQQAAgD92XClBzI1kPuh/KEEAAIA/8RIpQQAAgD92XClBzI1kPm3JKEEAAIA/dlwpQQAAgD92XClBzI1kPvESKUEAAIA/dlwpQQAAgD92XClBzI1kPrOcMEFARIE+dlwpQQAAgD+znDBBQESBPt5zLUEAAIA/rPotQQAAgD+znDBBQESBPt5zLUEAAIA/eoEuQQAAgD+znDBBQESBPqz6LUEAAIA/SQgvQQAAgD+znDBBQESBPnqBLkEAAIA/F48vQQAAgD+znDBBQESBPkkIL0EAAIA/5RUwQQAAgD+znDBBQESBPhePL0EAAIA/s5wwQQAAgD+znDBBQESBPuUVMEEAAIA/s5wwQQAAgD+znDBBQESBPvFtNkEUPa8+s5wwQQAAgD/xbTZBFD2vPvFtNkEAAIA/8W02QQAAgD/xbTZBFD2vPpDpPEHQzEw+8W02QQAAgD+Q6TxB0MxMPpDpPEEAAIA/kOk8QQAAgD+Q6TxB0MxMPhWvQUEwl00+kOk8QQAAgD8Vr0FBMJdNPhWvQUEAAIA/Fa9BQQAAgD8Vr0FBMJdNPvIISkEYmbk+Fa9BQQAAgD/yCEpBGJm5PvIISkEAAIA/8ghKQQAAgD/yCEpBGJm5PnOqTkGSrbY+8ghKQQAAgD9zqk5Bkq22PnOqTkEAAIA/c6pOQQAAgD9zqk5Bkq22PiykWUFkanE+c6pOQQAAgD8spFlBZGpxPk/oVkEAAIA/PUZYQQAAgD8spFlBZGpxPk/oVkEAAIA/LKRZQQAAgD8spFlBZGpxPj1GWEEAAIA/LKRZQQAAgD8spFlBZGpxPpKhZUGgHX0+LKRZQQAAgD+SoWVBoB19Pv+5YkEAAIA/kqFlQQAAgD+SoWVBoB19Pv+5YkEAAIA/kqFlQQAAgD+SoWVBoB19PsJccUHwFcs+kqFlQQAAgD/CXHFB8BXLPsJccUEAAIA/wlxxQQAAgD/CXHFB8BXLPl6mgEG4ucQ+wlxxQQAAgD9epoBBuLnEPl6mgEEAAIA/XqaAQQAAgD9epoBBuLnEPp9Zi0HMzEw+XqaAQQAAgD+fWYtBzMxMPkh0iUEAAIA/n1mLQQAAgD+fWYtBzMxMPkh0iUEAAIA/n1mLQQAAgD+fWYtBzMxMPuCmk0GQ3k0+n1mLQQAAgD/gppNBkN5NPuCmk0EAAIA/4KaTQQAAgD/gppNBkN5NPvJ0oEE0804+4KaTQQAAgD/ydKBBNPNOPvJ0oEEAAIA/8nSgQQAAgD/ydKBBNPNOPsverEFMJVE+8nSgQQAAgD/L3qxBTCVRPkC0qkEAAIA/hsmrQQAAgD/L3qxBTCVRPkC0qkEAAIA/y96sQQAAgD/L3qxBTCVRPobJq0EAAIA/y96sQQAAgD/L3qxBTCVRPmzbtEG0JNE+y96sQQAAgD9s27RBtCTRPmzbtEEAAIA/bNu0QQAAgD9s27RBtCTRPlWKuUHw5NE+bNu0QQAAgD9VirlB8OTRPlWKuUEAAIA/VYq5QQAAgD9VirlB8OTRPjRHvkF2vog+VYq5QQAAgD80R75Bdr6IPtgNvUEAAIA/L1y9QQAAgD80R75Bdr6IPtgNvUEAAIA/hqq9QQAAgD80R75Bdr6IPi9cvUEAAIA/3fi9QQAAgD80R75Bdr6IPoaqvUEAAIA/NEe+QQAAgD80R75Bdr6IPt34vUEAAIA/NEe+QQAAgD80R75Bdr6IPlZ2w0F8PME+NEe+QQAAgD9WdsNBfDzBPvCWwUEAAIA/vTbCQQAAgD9WdsNBfDzBPvCWwUEAAIA/idbCQQAAgD9WdsNBfDzBPr02wkEAAIA/VnbDQQAAgD9WdsNBfDzBPonWwkEAAIA/VnbDQQAAgD9WdsNBfDzBPtoVx0GfYUg/VnbDQQAAgD/aFcdBn2FIP9oVx0EAAIA/2hXHQQAAgD/aFcdBn2FIP5USykECwc4+2hXHQQAAgD+VEspBAsHOPpUSykEAAIA/lRLKQQAAgD+VEspBAsHOPu2hy0EkZgk/lRLKQQAAgD/toctBJGYJP+2hy0EAAIA/7aHLQQAAgD/toctBJGYJP2bbzEHKzEw/7aHLQQAAgD9m28xBysxMP2bbzEEAAIA/ZtvMQQAAgD9m28xBysxMP0LQzkHKzEw/ZtvMQQAAgD9C0M5BysxMP0LQzkEAAIA/QtDOQQAAgD9C0M5BysxMP4ew1UE4r7M+QtDOQQAAgD+HsNVBOK+zPsO81EEAAIA/pTbVQQAAgD+HsNVBOK+zPsO81EEAAIA/h7DVQQAAgD+HsNVBOK+zPqU21UEAAIA/h7DVQQAAgD+HsNVBOK+zPgWO30H0/Fo+h7DVQQAAgD8Fjt9B9PxaPidh3kEAAIA/lvfeQQAAgD8Fjt9B9PxaPidh3kEAAIA/BY7fQQAAgD8Fjt9B9PxaPpb33kEAAIA/BY7fQQAAgD8Fjt9B9PxaPkqm60EkDl8+BY7fQQAAgD9KputBJA5fPtAo6kEAAIA/jefqQQAAgD9KputBJA5fPtAo6kEAAIA/SqbrQQAAgD9KputBJA5fPo3n6kEAAIA/SqbrQQAAgD9KputBJA5fPklU90GIvsY+SqbrQQAAgD9JVPdBiL7GPklU90EAAIA/SVT3QQAAgD9JVPdBiL7GPkTsAkJQfWg+SVT3QQAAgD9E7AJCUH1oPqQvAkIAAIA/9I0CQgAAgD9E7AJCUH1oPqQvAkIAAIA/ROwCQgAAgD9E7AJCUH1oPvSNAkIAAIA/ROwCQgAAgD9E7AJCUH1oPkQuCkKQib4+ROwCQgAAgD9ELgpCkIm+PkQuCkIAAIA/RC4KQgAAgD9ELgpCkIm+PpnuEEK89lc+RC4KQgAAgD+Z7hBCvPZXPn/dDkIAAIA/3Y0PQgAAgD+Z7hBCvPZXPn/dDkIAAIA/Oz4QQgAAgD+Z7hBCvPZXPt2ND0IAAIA/me4QQgAAgD+Z7hBCvPZXPjs+EEIAAIA/me4QQgAAgD+Z7hBCvPZXPi9WEkKYxWk+me4QQgAAgD8vVhJCmMVpPjraEUIAAIA/4+4RQgAAgD8vVhJCmMVpPjraEUIAAIA/jAMSQgAAgD8vVhJCmMVpPuPuEUIAAIA/NRgSQgAAgD8vVhJCmMVpPowDEkIAAIA/3SwSQgAAgD8vVhJCmMVpPjUYEkIAAIA/hkESQgAAgD8vVhJCmMVpPt0sEkIAAIA/L1YSQgAAgD8vVhJCmMVpPoZBEkIAAIA/L1YSQgAAgD8vVhJCmMVpPsDDE0Ig1eA+L1YSQgAAgD/AwxNCINXgPkKaEkIAAIA/wMMTQgAAgD/AwxNCINXgPkKaEkIAAIA/wMMTQgAAgD/AwxNCINXgPrT+FELM8ew+wMMTQgAAgD+0/hRCzPHsPrT+FEIAAIA/tP4UQgAAgD+0/hRCzPHsPrfCFkI6pNY+tP4UQgAAgD+3whZCOqTWPrfCFkIAAIA/t8IWQgAAgD+3whZCOqTWPjyeGEI4a9I+t8IWQgAAgD88nhhCOGvSPjyeGEIAAIA/PJ4YQgAAgD88nhhCOGvSPrM0GkJI9NQ+PJ4YQgAAgD+zNBpCSPTUPrM0GkIAAIA/szQaQgAAgD+zNBpCSPTUPrmTHEK0lm0+szQaQgAAgD+5kxxCtJZtPhXlG0IAAIA/ZzwcQgAAgD+5kxxCtJZtPhXlG0IAAIA/uZMcQgAAgD+5kxxCtJZtPmc8HEIAAIA/uZMcQgAAgD+5kxxCtJZtPn29HkIQTFQ+uZMcQgAAgD99vR5CEExUPiQjHkIAAIA/A0IeQgAAgD99vR5CEExUPiQjHkIAAIA/4WAeQgAAgD99vR5CEExUPgNCHkIAAIA/wH8eQgAAgD99vR5CEExUPuFgHkIAAIA/np4eQgAAgD99vR5CEExUPsB/HkIAAIA/fb0eQgAAgD99vR5CEExUPp6eHkIAAIA/fb0eQgAAgD99vR5CEExUPlqMIEL8S9g+fb0eQgAAgD9ajCBC/EvYPhtIH0IAAIA/OuofQgAAgD9ajCBC/EvYPhtIH0IAAIA/WowgQgAAgD9ajCBC/EvYPjrqH0IAAIA/WowgQgAAgD9ajCBC/EvYPgyeIUKgSc8+WowgQgAAgD8MniFCoEnPPgyeIUIAAIA/DJ4hQgAAgD8MniFCoEnPPorYIkLEkc4+DJ4hQgAAgD+K2CJCxJHOPorYIkIAAIA/itgiQgAAgD+K2CJCxJHOPkPGI0Is280+itgiQgAAgD9DxiNCLNvNPkPGI0IAAIA/Q8YjQgAAgD9DxiNCLNvNPkHRJEKkP4k+Q8YjQgAAgD9B0SRCpD+JPuBtJEIAAIA/uIYkQgAAgD9B0SRCpD+JPuBtJEIAAIA/kZ8kQgAAgD9B0SRCpD+JPriGJEIAAIA/abgkQgAAgD9B0SRCpD+JPpGfJEIAAIA/QdEkQgAAgD9B0SRCpD+JPmm4JEIAAIA/QdEkQgAAgD9B0SRCpD+JPt8QJkKc4U0+QdEkQgAAgD/fECZCnOFNPvySJUIAAIA/96clQgAAgD/fECZCnOFNPvySJUIAAIA/8rwlQgAAgD/fECZCnOFNPvenJUIAAIA/7dElQgAAgD/fECZCnOFNPvK8JUIAAIA/6eYlQgAAgD/fECZCnOFNPu3RJUIAAIA/5PslQgAAgD/fECZCnOFNPunmJUIAAIA/3xAmQgAAgD/fECZCnOFNPuT7JUIAAIA/3xAmQgAAgD/fECZCnOFNPhWvJ0LEKX8+3xAmQgAAgD8VrydCxCl/Pg4NJ0IAAIA/EV4nQgAAgD8VrydCxCl/Pg4NJ0IAAIA/Fa8nQgAAgD8VrydCxCl/PhFeJ0IAAIA/Fa8nQgAAgD8VrydCxCl/Pg9tKUJCu6c+Fa8nQgAAgD8PbSlCQrunPg9tKUIAAIA/D20pQgAAgD8PbSlCQrunPlQdK0KYn4A+D20pQgAAgD9UHStCmJ+APlQdK0IAAIA/VB0rQgAAgD9UHStCmJ+APvMQLUKsm1A+VB0rQgAAgD/zEC1CrJtQPuWeLEIAAIA/7NcsQgAAgD/zEC1CrJtQPuWeLEIAAIA/8xAtQgAAgD/zEC1CrJtQPuzXLEIAAIA/8xAtQgAAgD/zEC1CrJtQPvSuL0KUj1Y+8xAtQgAAgD/0ri9ClI9WPk7kLkIAAIA/1gwvQgAAgD/0ri9ClI9WPk7kLkIAAIA/XTUvQgAAgD/0ri9ClI9WPtYML0IAAIA/5V0vQgAAgD/0ri9ClI9WPl01L0IAAIA/bIYvQgAAgD/0ri9ClI9WPuVdL0IAAIA/9K4vQgAAgD/0ri9ClI9WPmyGL0IAAIA/9K4vQgAAgD/0ri9ClI9WPlpnMULCq84+9K4vQgAAgD9aZzFCwqvOPlpnMUIAAIA/WmcxQgAAgD9aZzFCwqvOPu2KM0IQhNI+WmcxQgAAgD/tijNCEITSPu2KM0IAAIA/7YozQgAAgD/tijNCEITSPsWdNELYuc0+7YozQgAAgD/FnTRC2LnNPsWdNEIAAIA/xZ00QgAAgD/FnTRC2LnNPpPZNUIqUc0+xZ00QgAAgD+T2TVCKlHNPpPZNUIAAIA/k9k1QgAAgD+T2TVCKlHNPiIgOEKAbFw+k9k1QgAAgD8iIDhCgGxcPg9/N0IAAIA/wLQ3QgAAgD8iIDhCgGxcPg9/N0IAAIA/ceo3QgAAgD8iIDhCgGxcPsC0N0IAAIA/IiA4QgAAgD8iIDhCgGxcPnHqN0IAAIA/IiA4QgAAgD8iIDhCgGxcPu7TOkJo8Uw+IiA4QgAAgD/u0zpCaPFMPuZZOkIAAIA/lII6QgAAgD/u0zpCaPFMPuZZOkIAAIA/Qas6QgAAgD/u0zpCaPFMPpSCOkIAAIA/7tM6QgAAgD/u0zpCaPFMPkGrOkIAAIA/7tM6QgAAgD/u0zpCaPFMPvvtPkLQzMw+7tM6QgAAgD/77T5C0MzMPvvtPkIAAIA/++0+QgAAgD/77T5C0MzMPqOgQkIyFrc+++0+QgAAgD+joEJCMha3PqOgQkIAAIA/o6BCQgAAgD+joEJCMha3PhkuRkKACGA+o6BCQgAAgD8ZLkZCgAhgPgpKRUIAAIA/D5ZFQgAAgD8ZLkZCgAhgPgpKRUIAAIA/FOJFQgAAgD8ZLkZCgAhgPg+WRUIAAIA/GS5GQgAAgD8ZLkZCgAhgPhTiRUIAAIA/GS5GQgAAgD8ZLkZCgAhgPsEGSUJs0pA+GS5GQgAAgD/BBklCbNKQPsEGSUIAAIA/wQZJQgAAgD/BBklCbNKQPo9mS0JIQ5w+wQZJQgAAgD+PZktCSEOcPo9mS0IAAIA/j2ZLQgAAgD+PZktCSEOcPr/ETEKYqqk+j2ZLQgAAgD+/xExCmKqpPugsTEIAAIA/v8RMQgAAgD+/xExCmKqpPugsTEIAAIA/v8RMQgAAgD+/xExCmKqpPhJpTkLQzMw+v8RMQgAAgD8SaU5C0MzMPhJpTkIAAIA/EmlOQgAAgD8SaU5C0MzMPo/NT0LG+sw+EmlOQgAAgD+PzU9CxvrMPo/NT0IAAIA/j81PQgAAgD+PzU9CxvrMPpHEUEI46Mw+j81PQgAAgD+RxFBCOOjMPpHEUEIAAIA/kcRQQgAAgD+RxFBCOOjMPvPuUUKw1cw+kcRQQgAAgD/z7lFCsNXMPvPuUUIAAIA/8+5RQgAAgD/z7lFCsNXMPjppU0Kc/so+8+5RQgAAgD86aVNCnP7KPuvFUkIAAIA/OmlTQgAAgD86aVNCnP7KPuvFUkIAAIA/OmlTQgAAgD86aVNCnP7KPtzkVEJ0yco+OmlTQgAAgD/c5FRCdMnKPtzkVEIAAIA/3ORUQgAAgD/c5FRCdMnKPoHcVkI8pYg+3ORUQgAAgD+B3FZCPKWIPvtHVkIAAIA/gdxWQgAAgD+B3FZCPKWIPvtHVkIAAIA/gdxWQgAAgD+B3FZCPKWIPkjDWEKQE04+gdxWQgAAgD9Iw1hCkBNOPuBbWEIAAIA/WH5YQgAAgD9Iw1hCkBNOPuBbWEIAAIA/0KBYQgAAgD9Iw1hCkBNOPlh+WEIAAIA/SMNYQgAAgD9Iw1hCkBNOPtCgWEIAAIA/SMNYQgAAgD9Iw1hCkBNOPjkZXEIkemA+SMNYQgAAgD85GVxCJHpgPkLvWkIAAIA/lFJbQgAAgD85GVxCJHpgPkLvWkIAAIA/57VbQgAAgD85GVxCJHpgPpRSW0IAAIA/ORlcQgAAgD85GVxCJHpgPue1W0IAAIA/ORlcQgAAgD85GVxCJHpgPt39XUKiEsQ+ORlcQgAAgD/d/V1CohLEPt39XUIAAIA/3f1dQgAAgD/d/V1CohLEPr5MX0Kgosc+3f1dQgAAgD++TF9CoKLHPr5MX0IAAIA/vkxfQgAAgD++TF9CoKLHPqXsYEJeVMs+vkxfQgAAgD+l7GBCXlTLPqXsYEIAAIA/pexgQgAAgD+l7GBCXlTLPuAzYkKsL8Y+pexgQgAAgD/gM2JCrC/GPuAzYkIAAIA/4DNiQgAAgD/gM2JCrC/GPv9ZY0JIyrU+4DNiQgAAgD//WWNCSMq1PraRYkIAAIA/2vViQgAAgD//WWNCSMq1PraRYkIAAIA//1ljQgAAgD//WWNCSMq1Ptr1YkIAAIA//1ljQgAAgD//WWNCSMq1PmJdZEJIDtY+/1ljQgAAgD9iXWRCSA7WPmJdZEIAAIA/Yl1kQgAAgD9iXWRCSA7WPieGZUKq5NI+Yl1kQgAAgD8nhmVCquTSPieGZUIAAIA/J4ZlQgAAgD8nhmVCquTSPlqKZ0LYSdo+J4ZlQgAAgD9aimdC2EnaPlqKZ0IAAIA/WopnQgAAgD9aimdC2EnaPhDIeEIccY8+WopnQgAAgD8QyHhCHHGPPr1Md0IAAIA/EMh4QgAAgD8QyHhCHHGPPr1Md0IAAIA/EMh4QgAAgD860IBCAACAPxDIeEIccY8+"
            }
            bevelMesh: PolygonMesh {
                attributes: [graphic26bevelMesha_position, graphic26bevelMesha_texCoord, graphic26bevelMesha_blendTexCoord]
            }
        }
    }
    Polygon {
        body.vertices: [[-1, 1], [100.897, 1], [100.897, -1], [-1, -1]]
        id: actor14856
        objectName: "actor14856"
        visible: false
        y: -35
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor15418
        objectName: "actor15418"
        x: 9.268388
        y: -15.919867
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.605019, -0.58019], [-0.287791, 0.0475555], [0.872375, 0.480381], [2.33947, 0.38559], [3.76043, 0.6353], [5.14227, 0.531137], [5.7967, 0.638336], [7.01784, -0.777063], [6.99321, -0.981027], [6.78028, -0.984679], [6.46199, -0.820118], [6.15392, -0.631241], [5.77869, -0.488963], [5.45078, -0.428244], [5.06454, -0.418405], [1.3057, -0.874702], [0.5955, -1.00108], [0.0601745, -1.18757], [-0.188937, -1.31018], [-0.76404, -1.14454], [-0.903788, -0.927106], [-0.834365, -0.666658]]
        id: actor36627
        objectName: "actor36627"
        rotation: -11.699999
        visible: false
        x: 36.225975
        y: -15.887516
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[-0.377018, 0.00159645], [-0.0680246, 0.338035], [0.872375, 0.480381], [2.33947, 0.38559], [3.76043, 0.6353], [5.14227, 0.531137], [5.7967, 0.638336], [6.94241, -0.668269], [7.00462, -0.792521], [7.0133, -0.91023], [6.9343, -0.909505], [6.77983, -0.820389], [6.58417, -0.711096], [6.3893, -0.626868], [6.18332, -0.544779], [5.95246, -0.476893], [5.69582, -0.424382], [5.45078, -0.39397], [5.0417, -0.384134], [4.25471, -0.437193], [1.5761, -0.588234], [-0.0897152, -0.870313], [-0.533859, -0.844015], [-0.805981, -0.771084], [-0.900282, -0.601578]]
        id: actor36630
        objectName: "actor36630"
        visible: false
        x: 52.46122
        y: -18.31855
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[0.410355, 0.118265], [0.0680246, 0.338035], [-0.872375, 0.480381], [-2.27044, 0.592717], [-3.76043, 0.6353], [-5.08186, 0.729633], [-5.7967, 0.638336], [-6.59571, 0.287949], [-6.91904, -0.152811], [-6.92654, -0.622693], [-6.68998, -0.828668], [-6.51759, -0.679817], [-6.20815, -0.496956], [-5.77036, -0.422297], [-5.45078, -0.39397], [-5.0417, -0.384134], [-4.25471, -0.437193], [-1.56747, -0.545082], [0.0230496, -0.603645], [0.687992, -0.800652], [0.905983, -0.68775], [1.00028, -0.518244], [0.704584, -0.0570255]]
        id: actor36633
        objectName: "actor36633"
        visible: false
        x: 77.15536
        y: -18.435127
    }
    Polygon {
        body.restitution: 0.1
        body.vertices: [[1.12391, 0.123895], [0.897173, 0.195974], [0.486863, 0.264036], [-0.14099, 0.283288], [-1.64073, 0.27719], [-2.21729, 0.318349], [-2.52918, 0.278515], [-2.8778, 0.125636], [-3.01887, -0.0666736], [-3.02215, -0.27169], [-2.86457, -0.302436], [-2.6804, -0.276047], [-2.50415, -0.203211], [-2.35117, -0.163771], [-2.12935, -0.167603], [-1.85602, -0.142282], [0.175904, -0.17046], [0.446434, -0.208009], [0.674851, -0.260123], [0.871095, -0.310738], [1.05982, -0.387111], [1.22596, -0.386487], [1.31483, -0.277818], [1.26046, -0.0245129]]
        id: actor36675
        objectName: "actor36675"
        visible: false
        x: 72.822296
        y: -24.664753
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.834286, 0.69561], [0.482346, 0.69561], [0.482346, 0.0870421], [-0.834286, 0.0870421]]
        id: actor38174
        objectName: "actor38174"
        property alias image: graphic33
        x: 54.59148
        y: -18.03864
        ImageRenderer {
            cacheRenderParams: actor38174.body.bodyType === Body.StaticBody
            id: graphic33
            sizeScale: 2.9999928
            source: Util.getPathToImage("middleground_e1/deco_e1_vines01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.80171, 3.19134], [2.56794, 3.19134], [2.56794, 2.39327], [-2.80171, 2.39327]]
        id: actor38185
        objectName: "actor38185"
        property alias image: graphic34
        rotation: -0.75
        x: 55.509113
        y: -21.064512
        ImageRenderer {
            cacheRenderParams: actor38185.body.bodyType === Body.StaticBody
            id: graphic34
            sizeScale: 7.9707203
            source: Util.getPathToImage("middleground_e1/deco_e1_platform01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.341066, 0.0862524], [0.41858, 0.0862524], [0.41858, -1.08584], [-0.341066, -1.08584]]
        id: actor38187
        objectName: "actor38187"
        property alias image: graphic35
        x: 74.774666
        y: -17.413181
        ImageRenderer {
            cacheRenderParams: actor38187.body.bodyType === Body.StaticBody
            id: graphic35
            sizeScale: 1.5352212
            source: Util.getPathToImage("middleground_e1/deco_e1_vines03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.295396], [0.521351, 0.295396], [0.521351, -0.528039], [-0.424806, -0.528039]]
        id: actor38405
        objectName: "actor38405"
        property alias image: graphic36
        x: 36.46449
        y: -15.790781
        ImageRenderer {
            cacheRenderParams: actor38405.body.bodyType === Body.StaticBody
            id: graphic36
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_rock01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.84429, 3.20244], [2.60697, 3.20244], [2.60697, 2.40765], [-2.84429, 2.40765]]
        id: actor38100
        objectName: "actor38100"
        property alias image: graphic37
        rotation: -10.049999
        x: 38.67913
        y: -19.384235
        ImageRenderer {
            cacheRenderParams: actor38100.body.bodyType === Body.StaticBody
            id: graphic37
            sizeScale: 8.09185
            source: Util.getPathToImage("middleground_e1/deco_e1_platform03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.58906, 1.91033], [1.45647, 1.91033], [1.45647, 1.45659], [-1.58906, 1.45659]]
        id: actor38105
        objectName: "actor38105"
        property alias image: graphic38
        x: 71.92207
        y: -26.13246
        ImageRenderer {
            cacheRenderParams: actor38105.body.bodyType === Body.StaticBody
            id: graphic38
            sizeScale: 4.520796
            source: Util.getPathToImage("middleground_e1/deco_e1_platform04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-2.80171, 2.27946], [2.56794, 2.27946], [2.56794, 1.23202], [-2.80171, 1.23202]]
        id: actor37993
        objectName: "actor37993"
        property alias image: graphic39
        x: 74.17854
        y: -19.998766
        ImageRenderer {
            cacheRenderParams: actor37993.body.bodyType === Body.StaticBody
            id: graphic39
            sizeScale: 7.9707203
            source: Util.getPathToImage("middleground_e1/deco_e1_platform02.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor60521
        objectName: "actor60521"
        x: 16.832916
        y: -14.434565
    }
    WaterBody {
        body.vertices: [[-1.99112, -0.319867], [-1.51418, -0.0241482], [-0.667751, 0.106298], [0.550188, 0.0520754], [1.64344, -0.0924917], [2.12135, -0.521371], [-2.14001, -0.531754]]
        emitterLogic.layer: particleLayer1
        id: actor60522
        objectName: "actor60522"
        x: 26.314425
        y: -14.663183
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61449
        objectName: "actor61449"
        x: 23.601656
        y: -16.465761
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61450
        objectName: "actor61450"
        x: 26.197157
        y: -17.102936
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61452
        objectName: "actor61452"
        x: 26.181906
        y: -15.0339
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61577
        objectName: "actor61577"
        x: 34.628883
        y: -17.37232
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61578
        objectName: "actor61578"
        x: 33.744026
        y: -13.949621
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61581
        objectName: "actor61581"
        x: 35.16796
        y: -17.702488
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61649
        objectName: "actor61649"
        x: 46.971947
        y: -18.299273
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61650
        objectName: "actor61650"
        x: 47.962933
        y: -19.412287
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61653
        objectName: "actor61653"
        x: 49.78783
        y: -15.144003
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor61656
        objectName: "actor61656"
        x: 71.67604
        y: -25.143145
    }
    ParticleEmitter {
        emitterLogic.decayTime: 1.16666672751307
        emitterLogic.decayTimeRandomLength: 0.166666675359011
        emitterLogic.layer: particleLayer0
        emitterLogic.spawnRate: 4
        emitterLogic.spawnSpread: 0.3125
        emitterLogic.spawnVelocity: 7.5
        emitterLogic.timeOff: 3.5
        emitterLogic.timeOn: 2.5
        id: actor61807
        objectName: "actor61807"
        rotation: -180
        visible: false
        x: 64.76341
        y: -15.369966
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62388
        objectName: "actor62388"
        x: 64.87312
        y: -17.148542
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62389
        objectName: "actor62389"
        x: 64.88855
        y: -18.75796
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62390
        objectName: "actor62390"
        x: 64.903496
        y: -20.266682
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62392
        objectName: "actor62392"
        x: 72.01284
        y: -25.704243
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62393
        objectName: "actor62393"
        x: 79.94173
        y: -18.19392
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62394
        objectName: "actor62394"
        x: 80.00732
        y: -19.809982
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62395
        objectName: "actor62395"
        x: 72.80806
        y: -19.365673
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62396
        objectName: "actor62396"
        x: 75.815994
        y: -19.544277
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62398
        objectName: "actor62398"
        x: 55.891685
        y: -19.314306
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62399
        objectName: "actor62399"
        x: 58.352966
        y: -19.487062
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62400
        objectName: "actor62400"
        x: 39.151142
        y: -14.172694
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62401
        objectName: "actor62401"
        x: 43.644176
        y: -15.399636
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62402
        objectName: "actor62402"
        x: 62.934402
        y: -16.577702
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor62403
        objectName: "actor62403"
        x: 66.918274
        y: -16.577703
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63232
        objectName: "actor63232"
        x: 60.263626
        y: -20.288233
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63233
        objectName: "actor63233"
        x: 62.49789
        y: -20.701563
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63234
        objectName: "actor63234"
        x: 67.312164
        y: -20.707273
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63235
        objectName: "actor63235"
        x: 69.65672
        y: -20.100698
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63236
        objectName: "actor63236"
        x: 55.1485
        y: -14.922089
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63237
        objectName: "actor63237"
        x: 72.521805
        y: -14.839671
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63238
        objectName: "actor63238"
        x: 77.17007
        y: -14.955053
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63338
        objectName: "actor63338"
        x: 47.994614
        y: -16.21412
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor63339
        objectName: "actor63339"
        x: 46.030396
        y: -19.448118
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor65857
        objectName: "actor65857"
        x: 34.57854
        y: -18.003891
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor65858
        objectName: "actor65858"
        x: 65.036705
        y: -27.788855
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713427, 1.53603], [0.875567, 1.53603], [0.875567, 0.96921], [-0.713427, 0.96921]]
        id: actor179378
        objectName: "actor179378"
        property alias image: graphic78
        rotation: -46.799892
        x: 4.4216614
        y: -13.4635105
        ImageRenderer {
            cacheRenderParams: actor179378.body.bodyType === Body.StaticBody
            id: graphic78
            sizeScale: 3.211306
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor179379
        objectName: "actor179379"
        property alias image: graphic79
        x: 20.758455
        y: -14.825304
        ImageRenderer {
            cacheRenderParams: actor179379.body.bodyType === Body.StaticBody
            id: graphic79
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.372002, 0.79898], [0.456547, 0.79898], [0.456547, 0.505376], [-0.372002, 0.505376]]
        id: actor179380
        objectName: "actor179380"
        property alias image: graphic80
        rotation: 47.700005
        x: 10.600107
        y: -14.665019
        ImageRenderer {
            cacheRenderParams: actor179380.body.bodyType === Body.StaticBody
            id: graphic80
            sizeScale: 1.6744726
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.68686], [1.0019, 1.68686], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180426
        objectName: "actor180426"
        property alias image: graphic81
        rotation: -8.100001
        x: 19.015602
        y: -14.628674
        ImageRenderer {
            cacheRenderParams: actor180426.body.bodyType === Body.StaticBody
            id: graphic81
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.622117, 1.28549], [0.763505, 1.28549], [0.763505, 0.845163], [-0.622117, 0.845163]]
        id: actor180427
        objectName: "actor180427"
        property alias image: graphic82
        rotation: -4.499997
        x: 17.00254
        y: -14.203467
        ImageRenderer {
            cacheRenderParams: actor180427.body.bodyType === Body.StaticBody
            id: graphic82
            sizeScale: 2.8002965
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.44753, 1.48632], [0.54924, 1.48632], [0.54924, 0.912911], [-0.44753, 0.912911]]
        id: actor180428
        objectName: "actor180428"
        property alias image: graphic83
        rotation: -25.200108
        x: 15.235535
        y: -13.787196
        ImageRenderer {
            aspectRatio: 1.4624999
            cacheRenderParams: actor180428.body.bodyType === Body.StaticBody
            id: graphic83
            sizeScale: 2.01444
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180429
        objectName: "actor180429"
        property alias image: graphic84
        rotation: 42.299778
        x: 24.158325
        y: -13.40869
        ImageRenderer {
            cacheRenderParams: actor180429.body.bodyType === Body.StaticBody
            id: graphic84
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180558
        objectName: "actor180558"
        property alias image: graphic85
        rotation: 7.1999993
        x: 30.709503
        y: -14.965594
        ImageRenderer {
            cacheRenderParams: actor180558.body.bodyType === Body.StaticBody
            id: graphic85
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.718677, 1.54733], [0.88201, 1.54733], [0.88201, 0.976342], [-0.718677, 0.976342]]
        id: actor180559
        objectName: "actor180559"
        property alias image: graphic86
        rotation: 30.599998
        x: 33.18724
        y: -13.968801
        ImageRenderer {
            cacheRenderParams: actor180559.body.bodyType === Body.StaticBody
            id: graphic86
            sizeScale: 3.2349367
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.718677, 1.54733], [0.88201, 1.54733], [0.88201, 0.976342], [-0.718677, 0.976342]]
        id: actor180560
        objectName: "actor180560"
        property alias image: graphic87
        rotation: -21.59989
        x: 28.269732
        y: -14.339038
        ImageRenderer {
            cacheRenderParams: actor180560.body.bodyType === Body.StaticBody
            id: graphic87
            sizeScale: 3.2349367
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.597356, 1.28612], [0.733117, 1.28612], [0.733117, 0.811525], [-0.597356, 0.811525]]
        id: actor180561
        objectName: "actor180561"
        property alias image: graphic88
        rotation: -61.19989
        x: 26.503984
        y: -12.554305
        ImageRenderer {
            cacheRenderParams: actor180561.body.bodyType === Body.StaticBody
            id: graphic88
            sizeScale: 2.688844
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180696
        objectName: "actor180696"
        property alias image: graphic89
        rotation: -53.99989
        x: 39.133633
        y: -12.730509
        ImageRenderer {
            cacheRenderParams: actor180696.body.bodyType === Body.StaticBody
            id: graphic89
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180697
        objectName: "actor180697"
        property alias image: graphic90
        rotation: -8.100001
        x: 41.822037
        y: -14.378239
        ImageRenderer {
            cacheRenderParams: actor180697.body.bodyType === Body.StaticBody
            id: graphic90
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.635492, 1.36823], [0.77992, 1.36823], [0.77992, 0.863333], [-0.635492, 0.863333]]
        id: actor180698
        objectName: "actor180698"
        property alias image: graphic91
        rotation: -15.300001
        x: 43.79739
        y: -14.638408
        ImageRenderer {
            cacheRenderParams: actor180698.body.bodyType === Body.StaticBody
            id: graphic91
            sizeScale: 2.860501
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.423745, 1.35845], [0.520049, 1.35845], [0.520049, 0.971422], [-0.423745, 0.971422]]
        id: actor180699
        objectName: "actor180699"
        property alias image: graphic92
        rotation: 67.5
        x: 46.63996
        y: -13.809724
        ImageRenderer {
            aspectRatio: 1.6774997
            cacheRenderParams: actor180699.body.bodyType === Body.StaticBody
            id: graphic92
            sizeScale: 1.9073768
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180700
        objectName: "actor180700"
        property alias image: graphic93
        rotation: -75.59989
        x: 38.353127
        y: -10.735889
        ImageRenderer {
            cacheRenderParams: actor180700.body.bodyType === Body.StaticBody
            id: graphic93
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180701
        objectName: "actor180701"
        property alias image: graphic94
        rotation: -8.100001
        x: 57.161106
        y: -14.698872
        ImageRenderer {
            cacheRenderParams: actor180701.body.bodyType === Body.StaticBody
            id: graphic94
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180840
        objectName: "actor180840"
        property alias image: graphic95
        rotation: 6.2999983
        x: 55.564754
        y: -14.664282
        ImageRenderer {
            cacheRenderParams: actor180840.body.bodyType === Body.StaticBody
            id: graphic95
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180841
        objectName: "actor180841"
        property alias image: graphic96
        rotation: -9.9000025
        x: 52.89187
        y: -14.562779
        ImageRenderer {
            cacheRenderParams: actor180841.body.bodyType === Body.StaticBody
            id: graphic96
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180842
        objectName: "actor180842"
        property alias image: graphic97
        rotation: -32.400005
        x: 50.261276
        y: -13.556218
        ImageRenderer {
            cacheRenderParams: actor180842.body.bodyType === Body.StaticBody
            id: graphic97
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180843
        objectName: "actor180843"
        property alias image: graphic98
        rotation: -43.200005
        x: 48.552666
        y: -12.025231
        ImageRenderer {
            cacheRenderParams: actor180843.body.bodyType === Body.StaticBody
            id: graphic98
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.444501, 1.42499], [0.545522, 1.42499], [0.545522, 1.019], [-0.444501, 1.019]]
        id: actor180844
        objectName: "actor180844"
        property alias image: graphic99
        rotation: 45
        x: 59.931976
        y: -13.906851
        ImageRenderer {
            aspectRatio: 1.5799997
            cacheRenderParams: actor180844.body.bodyType === Body.StaticBody
            id: graphic99
            sizeScale: 2.0008051
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180991
        objectName: "actor180991"
        property alias image: graphic100
        rotation: 6.2999983
        x: 78.459465
        y: -14.659075
        ImageRenderer {
            cacheRenderParams: actor180991.body.bodyType === Body.StaticBody
            id: graphic100
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180992
        objectName: "actor180992"
        property alias image: graphic101
        rotation: 14.399999
        x: 85.62976
        y: -16.958122
        ImageRenderer {
            cacheRenderParams: actor180992.body.bodyType === Body.StaticBody
            id: graphic101
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180993
        objectName: "actor180993"
        property alias image: graphic102
        rotation: 16.199999
        x: 71.86166
        y: -12.28576
        ImageRenderer {
            cacheRenderParams: actor180993.body.bodyType === Body.StaticBody
            id: graphic102
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180994
        objectName: "actor180994"
        property alias image: graphic103
        rotation: 22.49989
        x: 69.91554
        y: -13.026235
        ImageRenderer {
            cacheRenderParams: actor180994.body.bodyType === Body.StaticBody
            id: graphic103
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.579648, 1.248], [0.711384, 1.248], [0.711384, 0.787468], [-0.579648, 0.787468]]
        id: actor180995
        objectName: "actor180995"
        property alias image: graphic104
        rotation: -21.600113
        x: 66.80176
        y: -12.950289
        ImageRenderer {
            cacheRenderParams: actor180995.body.bodyType === Body.StaticBody
            id: graphic104
            sizeScale: 2.609134
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor180996
        objectName: "actor180996"
        property alias image: graphic105
        rotation: -6.300002
        x: 75.827934
        y: -14.73597
        ImageRenderer {
            cacheRenderParams: actor180996.body.bodyType === Body.StaticBody
            id: graphic105
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.708969, 1.52643], [0.870096, 1.52643], [0.870096, 0.963155], [-0.708969, 0.963155]]
        id: actor180997
        objectName: "actor180997"
        property alias image: graphic106
        rotation: -38.699894
        x: 73.65777
        y: -13.505645
        ImageRenderer {
            cacheRenderParams: actor180997.body.bodyType === Body.StaticBody
            id: graphic106
            sizeScale: 3.1912413
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.456072, 0.981936], [0.559724, 0.981936], [0.559724, 0.619587], [-0.456072, 0.619587]]
        id: actor180999
        objectName: "actor180999"
        property alias image: graphic107
        rotation: -72.900116
        x: 72.72649
        y: -11.668698
        ImageRenderer {
            aspectRatio: 1.3549999
            cacheRenderParams: actor180999.body.bodyType === Body.StaticBody
            id: graphic107
            sizeScale: 2.0528915
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.682535, 1.46952], [0.837655, 1.46952], [0.837655, 0.927244], [-0.682535, 0.927244]]
        id: actor181000
        objectName: "actor181000"
        property alias image: graphic108
        rotation: 41.399994
        x: 88.01438
        y: -15.595481
        ImageRenderer {
            cacheRenderParams: actor181000.body.bodyType === Body.StaticBody
            id: graphic108
            sizeScale: 3.0722568
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.377557, 1.07556], [0.463364, 1.07556], [0.463364, 0.512922], [-0.377557, 0.512922]]
        id: actor181001
        objectName: "actor181001"
        property alias image: graphic109
        rotation: -28.800001
        x: 82.80714
        y: -16.471466
        ImageRenderer {
            aspectRatio: 1.4799998
            cacheRenderParams: actor181001.body.bodyType === Body.StaticBody
            id: graphic109
            sizeScale: 1.699476
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor181002
        objectName: "actor181002"
        property alias image: graphic110
        rotation: -0.00011062622
        x: 94.555084
        y: -17.279316
        ImageRenderer {
            cacheRenderParams: actor181002.body.bodyType === Body.StaticBody
            id: graphic110
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor181003
        objectName: "actor181003"
        property alias image: graphic111
        rotation: 18.899889
        x: 97.83517
        y: -16.73426
        ImageRenderer {
            cacheRenderParams: actor181003.body.bodyType === Body.StaticBody
            id: graphic111
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor181004
        objectName: "actor181004"
        property alias image: graphic112
        rotation: 35.99989
        x: 100.424194
        y: -15.585746
        ImageRenderer {
            cacheRenderParams: actor181004.body.bodyType === Body.StaticBody
            id: graphic112
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor181005
        objectName: "actor181005"
        property alias image: graphic113
        rotation: -18.000109
        x: 91.48913
        y: -16.948387
        ImageRenderer {
            cacheRenderParams: actor181005.body.bodyType === Body.StaticBody
            id: graphic113
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.639827, 1.37757], [0.785241, 1.37757], [0.785241, 0.869224], [-0.639827, 0.869224]]
        id: actor181006
        objectName: "actor181006"
        property alias image: graphic114
        rotation: -37.80011
        x: 89.80529
        y: -15.537078
        ImageRenderer {
            cacheRenderParams: actor181006.body.bodyType === Body.StaticBody
            id: graphic114
            sizeScale: 2.8800173
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816362, 1.75765], [1.0019, 1.75765], [1.0019, 1.10905], [-0.816362, 1.10905]]
        id: actor181400
        objectName: "actor181400"
        property alias image: graphic115
        rotation: 57.599995
        x: 81.52578
        y: -12.481539
        ImageRenderer {
            cacheRenderParams: actor181400.body.bodyType === Body.StaticBody
            id: graphic115
            sizeScale: 3.6746418
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.68803, 1.86271], [0.769949, 1.86271], [0.769949, 0.404431], [-0.68803, 0.404431]]
        id: actor186017
        objectName: "actor186017"
        property alias image: graphic116
        x: 46.39087
        y: -16.541462
        ImageRenderer {
            cacheRenderParams: actor186017.body.bodyType === Body.StaticBody
            id: graphic116
            sizeScale: 4.723224
            source: Util.getPathToImage("middleground_e1/deco_e1s1_unique01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.976625, 0.851294], [0.877252, 0.851294], [0.877252, -0.489964], [-0.976625, -0.489964]]
        id: actor186350
        objectName: "actor186350"
        property alias image: graphic117
        x: 81.466545
        y: -17.067736
        ImageRenderer {
            cacheRenderParams: actor186350.body.bodyType === Body.StaticBody
            id: graphic117
            sizeScale: 3.7080536
            source: Util.getPathToImage("middleground_e1/deco_e1s1_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.855958, 0.433633], [0.580021, 0.433633], [0.580021, -2.78253], [-0.855958, -2.78253]]
        id: actor307587
        objectName: "actor307587"
        property alias image: graphic118
        rotation: -20.850494
        x: 0.92451894
        y: -15.574129
        ImageRenderer {
            cacheRenderParams: actor307587.body.bodyType === Body.StaticBody
            id: graphic118
            sizeScale: 3.1294348
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.656132, 0.3324], [0.444613, 0.3324], [0.444613, -2.3941], [-0.656132, -2.3941]]
        id: actor307588
        objectName: "actor307588"
        property alias image: graphic119
        rotation: -44.74594
        x: 0.21189785
        y: -20.227463
        ImageRenderer {
            cacheRenderParams: actor307588.body.bodyType === Body.StaticBody
            id: graphic119
            sizeScale: 2.3988564
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.349199, 0.283066], [0.44056, 0.283066], [0.44056, -0.0455954], [-0.349199, -0.0455954]]
        id: actor307760
        objectName: "actor307760"
        property alias image: graphic120
        rotation: -25.202927
        x: 2.256342
        y: -14.9182415
        ImageRenderer {
            cacheRenderParams: actor307760.body.bodyType === Body.StaticBody
            id: graphic120
            sizeScale: 1.1902146
            source: Util.getPathToImage("middleground_e1/deco_e1_rock11.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.642814, 2.21517], [0.435588, 2.21517], [0.435588, -0.0308518], [-0.642814, -0.0308518]]
        id: actor308451
        objectName: "actor308451"
        property alias image: graphic121
        rotation: -158.21149
        x: 99.61296
        y: -17.442654
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor308451.body.bodyType === Body.StaticBody
            id: graphic121
            sizeScale: 2.350166
            source: Util.getPathToImage("middleground_e1/deco_e1_wall02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.393186, 1.15095], [0.266433, 1.15095], [0.266433, -0.0305856], [-0.393186, -0.0305856]]
        id: actor308452
        objectName: "actor308452"
        property alias image: graphic122
        rotation: -165.49806
        x: 99.71738
        y: -20.859642
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor308452.body.bodyType === Body.StaticBody
            id: graphic122
            sizeScale: 1.4375095
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.622378, 1.34], [0.763826, 1.34], [0.763826, 0.845518], [-0.622378, 0.845518]]
        id: actor389856
        objectName: "actor389856"
        property alias image: graphic123
        rotation: -34.226208
        x: 6.1034875
        y: -14.715251
        ImageRenderer {
            cacheRenderParams: actor389856.body.bodyType === Body.StaticBody
            id: graphic123
            sizeScale: 2.8014736
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.372002, 0.79898], [0.456547, 0.79898], [0.456547, 0.505376], [-0.372002, 0.505376]]
        id: actor389857
        objectName: "actor389857"
        property alias image: graphic124
        rotation: 17.648918
        x: 9.566621
        y: -15.300518
        ImageRenderer {
            cacheRenderParams: actor389857.body.bodyType === Body.StaticBody
            id: graphic124
            sizeScale: 1.6744726
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.456949, 0.981427], [0.5608, 0.981427], [0.5608, 0.620778], [-0.456949, 0.620778]]
        id: actor389858
        objectName: "actor389858"
        property alias image: graphic125
        rotation: -17.006935
        x: 8.09021
        y: -15.358291
        ImageRenderer {
            cacheRenderParams: actor389858.body.bodyType === Body.StaticBody
            id: graphic125
            sizeScale: 2.0568373
            source: Util.getPathToImage("middleground_e1/deco_e1_rock05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.393186, 1.15095], [0.266433, 1.15095], [0.266433, -0.0305856], [-0.393186, -0.0305856]]
        id: actor416688
        objectName: "actor416688"
        property alias image: graphic126
        rotation: -165.49806
        x: 99.7216
        y: -23.091997
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor416688.body.bodyType === Body.StaticBody
            id: graphic126
            sizeScale: 1.4375095
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.393186, 1.15095], [0.266433, 1.15095], [0.266433, -0.0305856], [-0.393186, -0.0305856]]
        id: actor416689
        objectName: "actor416689"
        property alias image: graphic127
        rotation: -144.14803
        x: 99.96542
        y: -25.348898
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor416689.body.bodyType === Body.StaticBody
            id: graphic127
            sizeScale: 1.4375095
            source: Util.getPathToImage("middleground_e1/deco_e1_wall01.png")
        }
    }
    Orb {
        body.density: 1
        body.friction: 0.3
        id: actor418778
        objectName: "actor418778"
        x: 72.35022
        y: -25.137672
    }
    Asteroid {
        body.angularVelocity: 0.5
        body.bodyType: Body.KinematicBody
        body.density: 7
        body.magnetic: true
        body.magneticStrength: 1.8
        body.restitution: 0.1
        body.vertices: [[0.566376, -1.843], [0.888777, -1.68698], [1.09677, -1.49418], [1.35336, -1.3041], [1.56536, -1.11249], [1.79715, -0.758511], [1.86908, -0.573718], [1.91964, -0.351039], [1.93557, -0.0522838], [1.92339, 0.240299], [1.7803, 0.704852], [1.56829, 0.912654], [1.35443, 1.11046], [1.10361, 1.4183], [1.03092, 1.46236], [0.906463, 1.49525], [0.771176, 1.5506], [0.68802, 1.66081], [0.600116, 1.71561], [0.406334, 1.75227], [0.0873355, 1.86805], [-0.247905, 1.88954], [-0.609777, 1.84462], [-0.927565, 1.73945], [-1.28848, 1.5236], [-1.54322, 1.28717], [-1.71898, 1.02135], [-1.8669, 0.714941], [-1.93715, 0.305397], [-1.9495, -0.0423859], [-1.88886, -0.528291], [-1.80851, -0.820379], [-1.74085, -1.03511], [-1.61913, -1.19612], [-1.4043, -1.28345], [-1.22212, -1.40082], [-1.08899, -1.52051], [-0.96021, -1.71241], [-0.851836, -1.78967], [-0.504313, -1.90178], [-0.276098, -1.92543], [-0.00915563, -1.94306], [0.267087, -1.9282]]
        id: actor502523
        objectName: "actor502523"
        property alias image: graphic129
        x: 64.937416
        y: -24.199484
        ImageRenderer {
            cacheRenderParams: actor502523.body.bodyType === Body.StaticBody
            id: graphic129
            sizeScale: 4.4042077
            source: Util.getPathToImage("middleground_e1/e1_asteroid.png")
        }
    }
    Accelerator {
        acceleration: 0.5
        body.vertices: [[0.293316, 1.23018], [1.02586, 1.07937], [1.77683, 0.714643], [0.993395, 1.00628]]
        id: actor502718
        objectName: "actor502718"
        x: 57.618687
        y: -19.9427
    }
    Robot {
        body.density: 4
        body.friction: 0.3
        id: actor0
        objectName: "actor0"
        rollingMovementLogic.speed: 45
        rollingMovementLogic.speedFalloffRatio: 0.9
        rollingMovementLogic.torqueForceRatio: 0.9
        x: 3.3666003
        y: -15.502338
        z: 1
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.532932, 0.738957], [0.654051, 0.738957], [0.654051, -0.302259], [-0.532932, -0.302259]]
        id: actor179255
        objectName: "actor179255"
        property alias image: graphic132
        x: -0.43333173
        y: -15.352734
        z: 2
        ImageRenderer {
            cacheRenderParams: actor179255.body.bodyType === Body.StaticBody
            id: graphic132
            sizeScale: 2.3988564
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.470275, 0.719361], [0.577154, 0.719361], [0.577154, 0.262913], [-0.470275, 0.262913]]
        id: actor38407
        objectName: "actor38407"
        property alias image: graphic133
        x: 75.97956
        y: -19.392052
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38407.body.bodyType === Body.StaticBody
            id: graphic133
            sizeScale: 2.1168218
            source: Util.getPathToImage("middleground_e1/deco_e1_rock03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.250191, 0.173975], [0.307052, 0.173975], [0.307052, -0.285943], [-0.250191, -0.285943]]
        id: actor38419
        objectName: "actor38419"
        property alias image: graphic134
        x: 70.870476
        y: -24.431492
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38419.body.bodyType === Body.StaticBody
            id: graphic134
            sizeScale: 1.1261717
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.566309], [0.521351, 0.566309], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor38420
        objectName: "actor38420"
        property alias image: graphic135
        rotation: 10.799999
        x: 32.504112
        y: -14.790264
        z: 2
        ImageRenderer {
            cacheRenderParams: actor38420.body.bodyType === Body.StaticBody
            id: graphic135
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Portal {
        activationThreshold: 18
        id: actor138974
        objectName: "actor138974"
        x: 97.76543
        y: -19.664999
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.648567, 1.0999], [0.795967, 1.0999], [0.795967, 0.594289], [-0.648567, 0.594289]]
        id: actor140331
        objectName: "actor140331"
        property alias image: graphic137
        x: 64.80875
        y: -16.059837
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140331.body.bodyType === Body.StaticBody
            id: graphic137
            sizeScale: 2.9193585
            source: Util.getPathToImage("middleground_e1/deco_e1s4_unique02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.387549, 0.269489], [0.475627, 0.269489], [0.475627, -0.442928], [-0.387549, -0.442928]]
        id: actor140332
        objectName: "actor140332"
        property alias image: graphic138
        rotation: 4.4998913
        x: 63.101665
        y: -15.357184
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140332.body.bodyType === Body.StaticBody
            id: graphic138
            sizeScale: 1.7444513
            source: Util.getPathToImage("middleground_e1/deco_e1_rock04b.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.424806, 0.58903], [0.521351, 0.58903], [0.521351, 0.199634], [-0.424806, 0.199634]]
        id: actor140333
        objectName: "actor140333"
        property alias image: graphic139
        x: 66.452774
        y: -16.123251
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140333.body.bodyType === Body.StaticBody
            id: graphic139
            sizeScale: 1.912152
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.208975, 0.289762], [0.256468, 0.289762], [0.256468, 0.098206], [-0.208975, 0.098206]]
        id: actor140334
        objectName: "actor140334"
        property alias image: graphic140
        rotation: 16.19989
        x: 69.34874
        y: -15.061099
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140334.body.bodyType === Body.StaticBody
            id: graphic140
            sizeScale: 0.9406457
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.162712, 0.225614], [0.199691, 0.225614], [0.199691, 0.076465], [-0.162712, 0.076465]]
        id: actor140513
        objectName: "actor140513"
        property alias image: graphic141
        x: 4.5202394
        y: -15.232351
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140513.body.bodyType === Body.StaticBody
            id: graphic141
            sizeScale: 0.73240453
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207325, 0.329141], [0.254443, 0.329141], [0.254443, 0.0974306], [-0.207325, 0.0974306]]
        id: actor140514
        objectName: "actor140514"
        property alias image: graphic142
        x: 6.297697
        y: -15.285228
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140514.body.bodyType === Body.StaticBody
            id: graphic142
            sizeScale: 0.9332192
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238702, 0.33098], [0.292951, 0.33098], [0.292951, 0.112176], [-0.238702, 0.112176]]
        id: actor140515
        objectName: "actor140515"
        property alias image: graphic143
        x: 5.4657536
        y: -15.400807
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140515.body.bodyType === Body.StaticBody
            id: graphic143
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.579231], [0.696011, 0.579231], [0.696011, -0.378592], [-0.417739, -0.378592]]
        id: actor140707
        objectName: "actor140707"
        property alias image: graphic144
        x: 23.22458
        y: -15.222796
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140707.body.bodyType === Body.StaticBody
            id: graphic144
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.188911, 0.174093], [0.197622, 0.174093], [0.197622, -0.0599341], [-0.188911, -0.0599341]]
        id: actor140924
        objectName: "actor140924"
        property alias image: graphic145
        x: 28.769627
        y: -15.321769
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140924.body.bodyType === Body.StaticBody
            id: graphic145
            sizeScale: 0.85033274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.474107, 0.657391], [0.581857, 0.657391], [0.581857, -0.268895], [-0.474107, -0.268895]]
        id: actor140925
        objectName: "actor140925"
        property alias image: graphic146
        rotation: -9.9
        x: 28.498188
        y: -14.829162
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140925.body.bodyType === Body.StaticBody
            id: graphic146
            sizeScale: 2.1340702
            source: Util.getPathToImage("middleground_e1/deco_e1_rock06.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.188911, 0.174093], [0.197622, 0.174093], [0.197622, -0.0599341], [-0.188911, -0.0599341]]
        id: actor140926
        objectName: "actor140926"
        property alias image: graphic147
        x: 40.82043
        y: -13.940223
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140926.body.bodyType === Body.StaticBody
            id: graphic147
            sizeScale: 0.85033274
            source: Util.getPathToImage("middleground_e1/deco_e1_grass04.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238702, 0.33098], [0.292951, 0.33098], [0.292951, 0.112176], [-0.238702, 0.112176]]
        id: actor141129
        objectName: "actor141129"
        property alias image: graphic148
        rotation: -13.500001
        x: 60.891754
        y: -15.548817
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141129.body.bodyType === Body.StaticBody
            id: graphic148
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.162712, 0.246837], [0.199691, 0.246837], [0.199691, 0.076465], [-0.162712, 0.076465]]
        id: actor141131
        objectName: "actor141131"
        property alias image: graphic149
        rotation: -4.190903
        x: 56.860905
        y: -14.48721
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141131.body.bodyType === Body.StaticBody
            id: graphic149
            sizeScale: 0.73240453
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207325, 0.329141], [0.254443, 0.329141], [0.254443, 0.0974306], [-0.207325, 0.0974306]]
        id: actor141132
        objectName: "actor141132"
        property alias image: graphic150
        rotation: 0.83322144
        x: 51.638218
        y: -14.526878
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141132.body.bodyType === Body.StaticBody
            id: graphic150
            sizeScale: 0.9332192
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.787564], [0.696011, 0.787564], [0.696011, 0.391003], [-0.417739, 0.391003]]
        id: actor141133
        objectName: "actor141133"
        property alias image: graphic151
        x: 62.97389
        y: -16.326216
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141133.body.bodyType === Body.StaticBody
            id: graphic151
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238702, 0.359598], [0.292951, 0.359598], [0.292951, 0.112176], [-0.238702, 0.112176]]
        id: actor141134
        objectName: "actor141134"
        property alias image: graphic152
        x: 87.743225
        y: -17.030571
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141134.body.bodyType === Body.StaticBody
            id: graphic152
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.162712, 0.225614], [0.199691, 0.225614], [0.199691, 0.076465], [-0.162712, 0.076465]]
        id: actor141136
        objectName: "actor141136"
        property alias image: graphic153
        x: 93.38313
        y: -17.195135
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141136.body.bodyType === Body.StaticBody
            id: graphic153
            sizeScale: 0.73240453
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207325, 0.329141], [0.254443, 0.329141], [0.254443, 0.0974306], [-0.207325, 0.0974306]]
        id: actor141137
        objectName: "actor141137"
        property alias image: graphic154
        rotation: 7.3850555
        x: 83.05778
        y: -17.477406
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141137.body.bodyType === Body.StaticBody
            id: graphic154
            sizeScale: 0.9332192
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.787564], [0.696011, 0.787564], [0.696011, 0.321409], [-0.417739, 0.321409]]
        id: actor141138
        objectName: "actor141138"
        property alias image: graphic155
        x: 91.157974
        y: -17.593904
        z: 2
        ImageRenderer {
            cacheRenderParams: actor141138.body.bodyType === Body.StaticBody
            id: graphic155
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238702, 0.33098], [0.292951, 0.33098], [0.292951, 0.112176], [-0.238702, 0.112176]]
        id: actor181395
        objectName: "actor181395"
        property alias image: graphic156
        rotation: -7.121811
        x: 14.1609535
        y: -14.521643
        z: 2
        ImageRenderer {
            cacheRenderParams: actor181395.body.bodyType === Body.StaticBody
            id: graphic156
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.207325, 0.329141], [0.254443, 0.329141], [0.254443, 0.0974306], [-0.207325, 0.0974306]]
        id: actor181397
        objectName: "actor181397"
        property alias image: graphic157
        rotation: -0.3370514
        x: 12.612911
        y: -14.201502
        z: 2
        ImageRenderer {
            cacheRenderParams: actor181397.body.bodyType === Body.StaticBody
            id: graphic157
            sizeScale: 0.9332192
            source: Util.getPathToImage("middleground_e1/deco_e1_rock08.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.162712, 0.225614], [0.199691, 0.225614], [0.199691, 0.076465], [-0.162712, 0.076465]]
        id: actor181398
        objectName: "actor181398"
        property alias image: graphic158
        x: 75.29575
        y: -14.450256
        z: 2
        ImageRenderer {
            cacheRenderParams: actor181398.body.bodyType === Body.StaticBody
            id: graphic158
            sizeScale: 0.73240453
            source: Util.getPathToImage("middleground_e1/deco_e1_rock07.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.417739, 0.787564], [0.696011, 0.787564], [0.696011, 0.321409], [-0.417739, 0.321409]]
        id: actor140805
        objectName: "actor140805"
        property alias image: graphic159
        x: 2.792093
        y: -15.546074
        z: 2
        ImageRenderer {
            cacheRenderParams: actor140805.body.bodyType === Body.StaticBody
            id: graphic159
            sizeScale: 1.8803416
            source: Util.getPathToImage("middleground_e1/deco_e1_grass05.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.238702, 0.359598], [0.292951, 0.359598], [0.292951, 0.112176], [-0.238702, 0.112176]]
        id: actor311404
        objectName: "actor311404"
        property alias image: graphic160
        x: 98.348076
        y: -17.294243
        z: 2
        ImageRenderer {
            cacheRenderParams: actor311404.body.bodyType === Body.StaticBody
            id: graphic160
            sizeScale: 0.9
            source: Util.getPathToImage("middleground_e1/deco_e1_grass03.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.624563, 0.487182], [0.491502, 0.487182], [0.491502, -0.41372], [-0.624563, -0.41372]]
        id: actor394979
        objectName: "actor394979"
        property alias image: graphic161
        x: 1.0166445
        y: -12.819673
        z: 2
        ImageRenderer {
            cacheRenderParams: actor394979.body.bodyType === Body.StaticBody
            id: graphic161
            sizeScale: 2.811306
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.624563, 0.487182], [0.491502, 0.487182], [0.491502, -0.41372], [-0.624563, -0.41372]]
        id: actor395158
        objectName: "actor395158"
        property alias image: graphic162
        x: 61.658955
        y: -13.97811
        z: 2
        ImageRenderer {
            cacheRenderParams: actor395158.body.bodyType === Body.StaticBody
            id: graphic162
            sizeScale: 2.811306
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.624563, 0.487182], [0.491502, 0.487182], [0.491502, -0.41372], [-0.624563, -0.41372]]
        id: actor395159
        objectName: "actor395159"
        property alias image: graphic163
        x: 49.674393
        y: -13.637061
        z: 2
        ImageRenderer {
            cacheRenderParams: actor395159.body.bodyType === Body.StaticBody
            id: graphic163
            sizeScale: 2.811306
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.624563, 0.487182], [0.491502, 0.487182], [0.491502, -0.41372], [-0.624563, -0.41372]]
        id: actor395160
        objectName: "actor395160"
        property alias image: graphic164
        rotation: -28.773026
        x: 89.02974
        y: -15.026434
        z: 2
        ImageRenderer {
            cacheRenderParams: actor395160.body.bodyType === Body.StaticBody
            id: graphic164
            sizeScale: 2.811306
            source: Util.getPathToImage("middleground_e1/deco_e1_fossil02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[0.371258, 0.494926], [-0.455634, 0.494926], [-0.455634, 0.17447], [0.371258, 0.17447]]
        id: actor416692
        objectName: "actor416692"
        property alias image: graphic165
        rotation: -4.770222
        x: 35.847836
        y: -17.251333
        z: 2
        ImageRenderer {
            aspectRatio: -1
            cacheRenderParams: actor416692.body.bodyType === Body.StaticBody
            id: graphic165
            sizeScale: -1.6711236
            source: Util.getPathToImage("middleground_e1/deco_e1_grass01.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.295775, 0.410117], [0.492802, 0.410117], [0.492802, -0.268057], [-0.295775, -0.268057]]
        id: actor416693
        objectName: "actor416693"
        property alias image: graphic166
        x: 98.905266
        y: -16.908592
        z: 2
        ImageRenderer {
            cacheRenderParams: actor416693.body.bodyType === Body.StaticBody
            id: graphic166
            sizeScale: 1.3313522
            source: Util.getPathToImage("middleground_e1/deco_e1_bush02.png")
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor165113
        objectName: "actor165113"
        property alias image: graphic168
        property alias parallaxTransform: parallaxTransform167
        rotation: 17.09989
        x: -20.359617
        y: -9.053847
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform167
            zDepth: 0.7
            ImageRenderer {
                id: graphic168
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.831028, 0.860052], [1.15027, 0.860052], [1.15027, -1.09223], [-0.831028, -1.09223]]
        id: actor186014
        objectName: "actor186014"
        property alias image: graphic170
        property alias parallaxTransform: parallaxTransform169
        x: -7.3482685
        y: -6.9889655
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform169
            zDepth: 0.7
            ImageRenderer {
                id: graphic170
                sizeScale: 6.4268312
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor201998
        objectName: "actor201998"
        property alias image: graphic172
        property alias parallaxTransform: parallaxTransform171
        x: -0.4822464
        y: -6.778848
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform171
            zDepth: 0.7
            ImageRenderer {
                id: graphic172
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.877701, 0.908356], [1.21487, 0.908356], [1.21487, -1.15357], [-0.877701, -1.15357]]
        id: actor201999
        objectName: "actor201999"
        property alias image: graphic174
        property alias parallaxTransform: parallaxTransform173
        x: 10.304104
        y: -6.095985
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform173
            zDepth: 0.7
            ImageRenderer {
                id: graphic174
                sizeScale: 6.7877817
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.911108, 0.94293], [1.26112, 0.94293], [1.26112, -1.19748], [-0.911108, -1.19748]]
        id: actor202507
        objectName: "actor202507"
        property alias image: graphic176
        property alias parallaxTransform: parallaxTransform175
        x: 40.829098
        y: -6.9889655
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform175
            zDepth: 0.7
            ImageRenderer {
                id: graphic176
                sizeScale: 7.0461454
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.18949, 1.23103], [1.64644, 1.23103], [1.64644, -1.56336], [-1.18949, -1.56336]]
        id: actor202508
        objectName: "actor202508"
        property alias image: graphic178
        property alias parallaxTransform: parallaxTransform177
        x: 16.655361
        y: -5.063364
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform177
            zDepth: 0.7
            ImageRenderer {
                id: graphic178
                sizeScale: 9.199013
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor202509
        objectName: "actor202509"
        property alias image: graphic180
        property alias parallaxTransform: parallaxTransform179
        x: 38.93761
        y: -7.0227437
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform179
            zDepth: 0.7
            ImageRenderer {
                id: graphic180
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor203198
        objectName: "actor203198"
        property alias image: graphic182
        property alias parallaxTransform: parallaxTransform181
        x: 60.429096
        y: -6.536431
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform181
            zDepth: 0.7
            ImageRenderer {
                id: graphic182
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.831027, 0.860052], [1.15027, 0.860052], [1.15027, -1.09223], [-0.831027, -1.09223]]
        id: actor203199
        objectName: "actor203199"
        property alias image: graphic184
        property alias parallaxTransform: parallaxTransform183
        x: 58.53761
        y: -6.570209
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform183
            zDepth: 0.7
            ImageRenderer {
                id: graphic184
                sizeScale: 6.426825
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor203374
        objectName: "actor203374"
        property alias image: graphic186
        property alias parallaxTransform: parallaxTransform185
        x: 70.12687
        y: -6.8704944
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform185
            zDepth: 0.7
            ImageRenderer {
                id: graphic186
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.866088, 0.896338], [1.1988, 0.896338], [1.1988, -1.13831], [-0.866088, -1.13831]]
        id: actor203375
        objectName: "actor203375"
        property alias image: graphic188
        property alias parallaxTransform: parallaxTransform187
        x: 67.208626
        y: -7.7138257
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform187
            zDepth: 0.7
            ImageRenderer {
                id: graphic188
                sizeScale: 6.697978
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.850498, 0.880203], [1.17722, 0.880203], [1.17722, -1.11782], [-0.850498, -1.11782]]
        id: actor203552
        objectName: "actor203552"
        property alias image: graphic190
        property alias parallaxTransform: parallaxTransform189
        x: 83.31648
        y: -5.9325066
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform189
            zDepth: 0.7
            ImageRenderer {
                id: graphic190
                sizeScale: 6.577409
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.988138, 1.02265], [1.36774, 1.02265], [1.36774, -1.29872], [-0.988138, -1.29872]]
        id: actor203553
        objectName: "actor203553"
        property alias image: graphic192
        property alias parallaxTransform: parallaxTransform191
        x: 80.30313
        y: -5.587039
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform191
            zDepth: 0.7
            ImageRenderer {
                id: graphic192
                sizeScale: 7.641861
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-1.08, 1.11772], [1.49489, 1.11772], [1.49489, -1.41946], [-1.08, -1.41946]]
        id: actor203554
        objectName: "actor203554"
        property alias image: graphic194
        property alias parallaxTransform: parallaxTransform193
        x: 98.06707
        y: -7.1428113
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform193
            zDepth: 0.7
            ImageRenderer {
                id: graphic194
                sizeScale: 8.352286
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.713485, 0.738405], [0.987575, 0.738405], [0.987575, -0.937742], [-0.713485, -0.937742]]
        id: actor203555
        objectName: "actor203555"
        property alias image: graphic196
        property alias parallaxTransform: parallaxTransform195
        x: 95.07109
        y: -7.4031444
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform195
            zDepth: 0.7
            ImageRenderer {
                id: graphic196
                sizeScale: 5.5178084
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.816301, 0.844811], [1.12989, 0.844811], [1.12989, -1.07287], [-0.816301, -1.07287]]
        id: actor204097
        objectName: "actor204097"
        property alias image: graphic198
        property alias parallaxTransform: parallaxTransform197
        rotation: 39.619003
        x: 105.77619
        y: -9.085483
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform197
            zDepth: 0.7
            ImageRenderer {
                id: graphic198
                sizeScale: 6.3129387
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    Polygon {
        body.active: false
        body.vertices: [[-0.902371, 0.933888], [1.24902, 0.933888], [1.24902, -1.186], [-0.902371, -1.186]]
        id: actor204098
        objectName: "actor204098"
        property alias image: graphic200
        property alias parallaxTransform: parallaxTransform199
        x: 112.957
        y: -8.295105
        z: 5
        ParallaxTransformItem {
            id: parallaxTransform199
            zDepth: 0.7
            ImageRenderer {
                id: graphic200
                sizeScale: 6.978576
                source: Util.getPathToImage("foreground_e1/fg_e1_plant01.png")
            }
        }
    }
    ThoughtBubble {
        id: thoughtBubble201
        objectName: "thoughtBubble201"
        playerActor: actor0
        portal: actor138974
        x: 3.3666
        y: -15.5023
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
