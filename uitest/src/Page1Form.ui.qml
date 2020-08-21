import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtQml 2.2

Page {
    width: 1024
    height: 600

    Frame {
        id: frame5
        x: 613
        y: 360
        width: 384
        height: 226
        padding: 0

        Canvas {
            id: leftfoot
            objectName: "can1"
            x: -17
            y: 0
            width: 445
            height: 287
            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = Qt.rgba(1, 0, 0, 1)
                ctx.fillRect(ros.tt, 0, 50, 50)
            }

            Image {
                id: image
                x: 8
                y: 118
                width: 100
                height: 100
                //                source: "qrc:/qtquickplugin/images/template_image.png"
            }
        }

        Rectangle {
            id: rectangle
            objectName: "rec1"
            x: 207
            y: 52
            width: 28
            height: 26
            color: "#dcac9e"
            radius: 8
            z: 3
        }

        Rectangle {
            id: rectangle1
            objectName: "rec2"
            x: 207
            y: 156
            width: 28
            height: 26
            color: "#dcac9e"
            radius: 8
            z: 1
        }

        Rectangle {
            id: rectangle2
            objectName: "rec3"
            x: 200
            y: 144
            width: 130
            height: 50
            color: "#cbcbcb"
        }

        Rectangle {
            id: rectangle3
            objectName: "rec4"
            x: 200
            y: 40
            width: 130
            height: 50
            color: "#cbcbcb"
        }

        Rectangle {
            id: com1
            objectName: "com1"
            x: 104
            y: 29
            width: 16
            height: 16
            color: "#fd2121"
            radius: 8
            rotation: 0
            z: 4
        }
    }

    Timer {
        id: timer1
        interval: 16
        repeat: true
        running: true
        triggeredOnStart: true

        onTriggered: {
            ros.update()
        }
    }

    Frame {
        id: frame
        x: 314
        y: 331
        width: 281
        height: 130

        ProgressBar {
            id: p1
            objectName: "p1"
            x: 0
            y: 0
            value: 0.5
        }

        ProgressBar {
            id: p2
            objectName: "p2"
            x: 0
            y: 20
            value: 0.5
        }

        ProgressBar {
            id: p3
            objectName: "p3"
            x: 0
            y: 40
            value: 0.5
        }

        ProgressBar {
            id: p4
            objectName: "p4"
            x: 0
            y: 60
            value: 0.5
        }

        ProgressBar {
            id: p5
            objectName: "p5"
            x: 0
            y: 80
            value: 0.5
        }

        ProgressBar {
            id: p6
            objectName: "p6"
            x: 0
            y: 100
            value: 0.5
        }

        Text {
            id: t1
            objectName: "t1"
            x: 213
            y: -4
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t2
            objectName: "t2"
            x: 214
            y: 16
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t3
            objectName: "t3"
            x: 214
            y: 36
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t4
            objectName: "t4"
            x: 214
            y: 56
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t5
            objectName: "t5"
            x: 214
            y: 76
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t6
            objectName: "t6"
            x: 214
            y: 96
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: text1
            x: -12
            y: -32
            text: qsTr("RightLeg")
            font.pixelSize: 16
        }
    }

    Frame {
        id: frame1
        x: 12
        y: 331
        width: 281
        height: 130
        ProgressBar {
            id: p7
            x: 0
            y: 0
            objectName: "p7"
            value: 0.5
        }

        ProgressBar {
            id: p8
            x: 0
            y: 20
            objectName: "p8"
            value: 0.5
        }

        ProgressBar {
            id: p9
            x: 0
            y: 40
            objectName: "p9"
            value: 0.5
        }

        ProgressBar {
            id: p10
            x: 0
            y: 60
            objectName: "p10"
            value: 0.5
        }

        ProgressBar {
            id: p11
            x: 0
            y: 80
            objectName: "p11"
            value: 0.5
        }

        ProgressBar {
            id: p12
            x: 0
            y: 100
            objectName: "p12"
            value: 0.5
        }

        Text {
            id: t7
            x: 213
            y: -4
            color: "#000000"
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t7"
            font.pixelSize: 12
        }

        Text {
            id: t8
            x: 214
            y: 16
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t8"
            font.pixelSize: 12
        }

        Text {
            id: t9
            x: 214
            y: 36
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t9"
            font.pixelSize: 12
        }

        Text {
            id: t10
            x: 214
            y: 56
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t10"
            font.pixelSize: 12
        }

        Text {
            id: t11
            x: 214
            y: 76
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t11"
            font.pixelSize: 12
        }

        Text {
            id: t12
            x: 214
            y: 96
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t12"
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: -12
            y: -32
            text: qsTr("LeftLeg")

            font.pixelSize: 16
        }
    }

    Frame {
        id: frame2
        x: 12
        y: 25
        width: 281
        height: 169
        ProgressBar {
            id: p13
            x: 0
            y: 0
            objectName: "p24"
            value: 0.5
        }

        ProgressBar {
            id: p14
            x: 0
            y: 20
            objectName: "p25"
            value: 0.5
        }

        ProgressBar {
            id: p15
            x: 0
            y: 40
            objectName: "p26"
            value: 0.5
        }

        ProgressBar {
            id: p16
            x: 0
            y: 60
            objectName: "p27"
            value: 0.5
        }

        ProgressBar {
            id: p17
            x: 0
            y: 80
            objectName: "p28"
            value: 0.5
        }

        ProgressBar {
            id: p18
            x: 0
            y: 100
            objectName: "p29"
            value: 0.5
        }

        ProgressBar {
            id: p27
            x: 0
            y: 120
            objectName: "p30"
            value: 0.5
        }

        ProgressBar {
            id: p28
            x: 0
            y: 140
            objectName: "p31"
            value: 0.5
        }

        Text {
            id: t13
            x: 213
            y: -4
            color: "#000000"
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t24"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t14
            x: 214
            y: 16
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t25"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t15
            x: 214
            y: 36
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t26"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t16
            x: 214
            y: 56
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t27"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t17
            x: 214
            y: 76
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t28"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t18
            x: 214
            y: 96
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t29"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t27
            x: 214
            y: 116
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t30"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t28
            x: 214
            y: 136
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t31"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: text3
            x: -12
            y: -32
            text: qsTr("LeftArm")
            font.pixelSize: 16
        }
    }

    Frame {
        id: frame3
        x: 314
        y: 25
        width: 281
        height: 169
        ProgressBar {
            id: p19
            x: 0
            y: 0
            objectName: "p16"
            value: 0.5
        }

        ProgressBar {
            id: p20
            x: 0
            y: 20
            objectName: "p17"
            value: 0.5
        }

        ProgressBar {
            id: p21
            x: 0
            y: 40
            objectName: "p18"
            value: 0.5
        }

        ProgressBar {
            id: p22
            x: 0
            y: 60
            objectName: "p19"
            value: 0.5
        }

        ProgressBar {
            id: p23
            x: 0
            y: 80
            objectName: "p20"
            value: 0.5
        }

        ProgressBar {
            id: p24
            x: 0
            y: 100
            objectName: "p21"
            value: 0.5
        }

        ProgressBar {
            id: p25
            x: 0
            y: 120
            objectName: "p22"
            value: 0.5
        }

        ProgressBar {
            id: p26
            x: 0
            y: 140
            objectName: "p23"
            value: 0.5
        }

        Text {
            id: t19
            x: 213
            y: -4
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t16"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t20
            x: 214
            y: 16
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t17"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t21
            x: 214
            y: 36
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t18"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t22
            x: 214
            y: 56
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t19"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t23
            x: 214
            y: 76
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t20"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t24
            x: 214
            y: 96
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t21"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t25
            x: 214
            y: 116
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t22"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t26
            x: 214
            y: 136
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t23"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: text4
            x: -12
            y: -32
            text: qsTr("RightArm")
            font.pixelSize: 16
        }
    }

    Frame {
        id: frame4
        x: 101
        y: 228
        width: 281
        height: 72
        ProgressBar {
            id: p29
            x: 0
            y: 0
            objectName: "p13"
            value: 0.5
        }

        ProgressBar {
            id: p30
            x: 0
            y: 20
            objectName: "p14"
            value: 0.5
        }

        ProgressBar {
            id: p31
            x: 0
            y: 40
            objectName: "p15"
            value: 0.5
        }

        Text {
            id: t29
            x: 213
            y: -4
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t13"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t30
            x: 214
            y: 16
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t14"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: t31
            x: 214
            y: 36
            text: qsTr("000.000")
            font.pixelSize: 12
            objectName: "t15"
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: text5
            x: 93
            y: -37
            text: qsTr("Torso")
            font.pixelSize: 16
        }
    }

    Text {
        id: text6
        x: 33
        y: 228
        width: 41
        height: 31
        text: qsTr("TIME")
        font.pixelSize: 18
    }

    Text {
        id: text7
        objectName: "time_text"
        x: 19
        y: 254
        text: qsTr("00:00:00")
        font.pixelSize: 18
    }

    Frame {
        id: frame6
        x: 12
        y: 469
        width: 281
        height: 130
        ProgressBar {
            id: p32
            x: 0
            y: 0
            objectName: "p32"
            value: 0.5
        }

        ProgressBar {
            id: p33
            x: 0
            y: 20
            objectName: "p33"
            value: 0.5
        }

        ProgressBar {
            id: p34
            x: 0
            y: 40
            objectName: "p34"
            value: 0.5
        }

        ProgressBar {
            id: p35
            x: 0
            y: 60
            objectName: "p35"
            value: 0.5
        }

        ProgressBar {
            id: p36
            x: 0
            y: 80
            objectName: "p36"
            value: 0.5
        }

        ProgressBar {
            id: p37
            x: 0
            y: 100
            objectName: "p37"
            value: 0.5
        }

        Text {
            id: t32
            x: 213
            y: -4
            color: "#000000"
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t32"
            font.pixelSize: 12
        }

        Text {
            id: t33
            x: 214
            y: 16
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t33"
            font.pixelSize: 12
        }

        Text {
            id: t34
            x: 214
            y: 36
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t34"
            font.pixelSize: 12
        }

        Text {
            id: t35
            x: 214
            y: 56
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t35"
            font.pixelSize: 12
        }

        Text {
            id: t36
            x: 214
            y: 76
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t36"
            font.pixelSize: 12
        }

        Text {
            id: t37
            x: 214
            y: 96
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t37"
            font.pixelSize: 12
        }

        Text {
            id: text8
            x: -12
            y: -32
            text: qsTr("Left FT")
            font.pixelSize: 16
        }
    }

    Frame {
        id: frame7
        x: 314
        y: 469
        width: 281
        height: 130
        ProgressBar {
            id: p38
            x: 0
            y: 0
            objectName: "p38"
            value: 0.5
        }

        ProgressBar {
            id: p39
            x: 0
            y: 20
            objectName: "p39"
            value: 0.5
        }

        ProgressBar {
            id: p40
            x: 0
            y: 40
            objectName: "p40"
            value: 0.5
        }

        ProgressBar {
            id: p41
            x: 0
            y: 60
            objectName: "p41"
            value: 0.5
        }

        ProgressBar {
            id: p42
            x: 0
            y: 80
            objectName: "p42"
            value: 0.5
        }

        ProgressBar {
            id: p43
            x: 0
            y: 100
            objectName: "p43"
            value: 0.5
        }

        Text {
            id: t38
            x: 213
            y: -4
            color: "#000000"
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t38"
            font.pixelSize: 12
        }

        Text {
            id: t39
            x: 214
            y: 16
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t39"
            font.pixelSize: 12
        }

        Text {
            id: t40
            x: 214
            y: 36
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t40"
            font.pixelSize: 12
        }

        Text {
            id: t41
            x: 214
            y: 56
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t41"
            font.pixelSize: 12
        }

        Text {
            id: t42
            x: 214
            y: 76
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t42"
            font.pixelSize: 12
        }

        Text {
            id: t43
            x: 214
            y: 96
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t43"
            font.pixelSize: 12
        }

        Text {
            id: text9
            x: -12
            y: -32
            text: qsTr("Right FT")
            font.pixelSize: 16
        }
    }

    Button {
        id: button
        x: 613
        y: 25
        text: qsTr("Gravity")
        onClicked: {
            ros.button_ros(0, "gravity")
        }
    }

    Button {
        id: button1
        x: 731
        y: 25
        text: qsTr("Task")
        onClicked: {

            ros.button_ros(1, "task")
        }
    }

    Text {
        id: text10
        x: 613
        y: 374
        text: qsTr("floor status")
        font.pixelSize: 12
    }

    TabBar {
        id: tabBar1
        x: 850
        y: 25
        width: 162
        height: 40
        currentIndex: swipeView.currentIndex

        TabButton {
            text: 'test 1 '
        }

        TabButton {
            text: 'test 2 '
        }
    }

    Frame {
        id: frame10
        x: 612
        y: 87
        width: 405
        height: 267

        Frame {
            id: frame8
            x: -5
            y: 15
            width: 280
            height: 100

            ProgressBar {
                id: p44
                x: 1
                y: 18
                objectName: "p44"
                value: 0.5
            }

            ProgressBar {
                id: p45
                x: 1
                y: 63
                height: 7
                objectName: "p45"
                value: 0.5
            }

            Text {
                id: t44
                x: 97
                y: -4
                text: qsTr("X")
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 12
            }

            Text {
                id: t45
                x: 97
                y: 41
                text: qsTr("Y")
                font.pixelSize: 12
            }

            Text {
                id: t46
                x: 211
                y: 13
                text: qsTr("000.000")
                horizontalAlignment: Text.AlignRight
                objectName: "t46"
                font.pixelSize: 12
            }

            Text {
                id: t47
                x: 212
                y: 58
                height: 15
                text: qsTr("000.000")
                horizontalAlignment: Text.AlignRight
                objectName: "t47"
                font.pixelSize: 12
            }

            Button {
                id: b18
                x: 211
                y: 36
                width: 44
                height: 15
                text: qsTr("push")
                font.pointSize: 8
                objectName: "b15"
            }

            Text {
                id: text11
                x: -12
                y: -33
                text: qsTr("JoysLeft")
                font.pixelSize: 16
            }
        }

        Frame {
            id: frame9
            x: -111
            y: 129
            width: 236
            height: 93

            Text {
                id: text12
                x: -12
                y: -32
                text: qsTr("JoysButtons")
                font.pixelSize: 16
            }

            RoundButton {
                id: b4
                x: 163
                y: 0
                width: 25
                height: 25
                text: "Y"
                checked: false
                checkable: false
                objectName: "b3"
            }

            RoundButton {
                id: b3
                x: 138
                y: 31
                width: 25
                height: 25
                text: "X"
                anchors.verticalCenterOffset: 4
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b2"
            }

            RoundButton {
                id: b1
                x: 164
                y: 50
                width: 25
                height: 25
                text: "A"
                checked: false
                objectName: "b0"
            }

            RoundButton {
                id: b2
                x: 188
                y: 0
                width: 25
                height: 25
                text: "B"
                anchors.verticalCenterOffset: 4
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b1"
            }

            Button {
                id: b5
                x: 2
                y: 41
                width: 55
                height: 25
                text: qsTr("L1")
                objectName: "b4"
            }

            Button {
                id: b6
                x: 70
                y: 39
                width: 55
                height: 25
                text: qsTr("R1")
                objectName: "b5"
            }

            Button {
                id: b7
                x: -1
                y: 4
                width: 55
                height: 25
                text: qsTr("L2")
                objectName: "b6"
            }
            Button {
                id: b8
                x: 70
                y: 4
                width: 55
                height: 25
                text: qsTr("R2")
                objectName: "b7"
            }
        }

        Frame {
            id: frame11
            x: 131
            y: 143
            width: 256
            height: 100
            ProgressBar {
                id: p46
                x: -8
                y: 22
                width: 199
                height: 6
                objectName: "p46"
                value: 0.5
            }

            ProgressBar {
                id: p47
                x: -7
                y: 66
                height: 7
                objectName: "p47"
                value: 0.5
            }

            Text {
                id: t48
                x: 89
                y: -4
                width: 6.575
                height: 15
                text: qsTr("X")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignTop
            }

            Text {
                id: t49
                x: 88
                y: 41
                text: qsTr("Y")
                font.pixelSize: 12
            }

            Text {
                id: t50
                x: 195
                y: 13
                height: 15
                text: qsTr("000.000")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                objectName: "t48"
            }

            Text {
                id: t51
                x: 196
                y: 58
                height: 15
                text: qsTr("000.000")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                objectName: "t49"
            }

            Button {
                id: b19
                x: 197
                y: 36
                width: 44
                height: 15
                text: qsTr("push")
                font.pointSize: 8
                objectName: "b16"
            }

            Text {
                id: text13
                x: -12
                y: -33
                text: qsTr("JoysRight")
                font.pixelSize: 16
            }
        }

        Frame {
            id: frame12
            x: -228
            y: 129
            width: 110
            height: 100
            Text {
                id: text14
                x: -12
                y: -34
                text: qsTr("JoysKey")
                font.pixelSize: 16
            }

            Button {
                id: b11
                x: 0
                y: 26
                width: 25
                height: 25
                text: qsTr("L")
                anchors.verticalCenterOffset: 1
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b8"
            }

            Button {
                id: b12
                x: 117
                y: 23
                width: 25
                height: 25
                text: qsTr("U")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: -31
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b9"
            }

            Button {
                id: b13
                x: 61
                y: 26
                width: 25
                height: 25
                text: qsTr("R")
                anchors.verticalCenterOffset: 1
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b10"
            }

            Button {
                id: b14
                x: 117
                y: 30
                width: 25
                height: 25
                text: qsTr("D")
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 32
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b11"
            }
        }

        Frame {
            id: frame13
            x: 279
            y: 15
            width: 110
            height: 76
            Text {
                id: text15
                x: -12
                y: -32
                text: qsTr("Center")
                font.pixelSize: 16
            }

            Button {
                id: b15
                x: -6
                y: 26
                width: 25
                height: 25
                text: qsTr("B")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 1
                objectName: "b12"
            }

            Button {
                id: b16
                x: 67
                y: 26
                width: 25
                height: 25
                text: qsTr("S")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: 1
                objectName: "b13"
            }

            RoundButton {
                id: b17
                x: 28
                y: 23
                width: 35
                height: 35
                text: "X"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                checkable: false
                objectName: "b14"
                checked: false
            }
        }
    }
}
