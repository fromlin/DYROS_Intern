import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1024
    height: 600

    Frame {
        id: frame13
        x: 330
        y: 411
        width: 235
        height: 94
        Text {
            id: text15
            x: -12
            y: -32
            text: qsTr("Center")
            font.pixelSize: 16
        }

        Button {
            id: b15
            x: 13
            y: 26
            width: 30
            height: 30
            text: qsTr("B")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1
            objectName: "b12"
        }

        Button {
            id: b16
            x: 173
            y: 26
            width: 30
            height: 30
            text: qsTr("S")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 1
            objectName: "b13"
        }

        RoundButton {
            id: b17
            x: 28
            y: 23
            width: 40
            height: 40
            text: "X"
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            checkable: false
            objectName: "b14"
            checked: false
        }
    }

    Frame {
        id: frame12
        x: 88
        y: 368
        width: 180
        height: 180
        Text {
            id: text14
            x: -12
            y: -34
            text: qsTr("JoysKey")
            font.pixelSize: 16
        }

        Button {
            id: b11
            x: 12
            y: 26
            width: 35
            height: 35
            text: qsTr("L")
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            objectName: "b8"
        }

        Button {
            id: b12
            x: 117
            y: 12
            width: 35
            height: 35
            text: qsTr("U")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            objectName: "b9"
        }

        Button {
            id: b13
            x: 108
            y: 26
            width: 35
            height: 35
            text: qsTr("R")
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            objectName: "b10"
        }

        Button {
            id: b14
            x: 117
            y: 110
            width: 35
            height: 35
            text: qsTr("D")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            objectName: "b11"
        }
    }

    Frame {
        id: frame11
        x: 629
        y: 375
        width: 341
        height: 167
        ProgressBar {
            id: p46
            x: 14
            y: 33
            width: 199
            height: 6
            to: 1
            from: -1
            objectName: "p46"
            value: 0
        }

        ProgressBar {
            id: p47
            x: 13
            y: 107
            height: 7
            to: 1
            from: -1
            objectName: "p47"
            value: 0
        }

        Text {
            id: t48
            x: 109
            y: 12
            width: 6.575
            height: 15
            text: qsTr("X")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignTop
        }

        Text {
            id: t49
            x: 108
            y: 86
            text: qsTr("Y")
            font.pixelSize: 12
        }

        Text {
            id: t50
            x: 256
            y: 28
            height: 15
            text: qsTr("000.000")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            objectName: "t48"
        }

        Text {
            id: t51
            x: 256
            y: 103
            height: 15
            text: qsTr("000.000")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            objectName: "t49"
        }

        Button {
            id: b19
            x: 251
            y: 53
            width: 54
            height: 37
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

        Text {
            id: t52
            x: -55
            y: -247
            height: 15
            text: qsTr("000.000")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            objectName: "t50"
        }

        Text {
            id: t53
            x: 185
            y: -247
            height: 15
            text: qsTr("000.000")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
            objectName: "t51"
        }
    }

    Frame {
        id: frame9
        x: 489
        y: 97
        width: 475
        height: 207

        Text {
            id: text12
            x: -12
            y: -32
            text: qsTr("JoysButtons")
            font.pixelSize: 16
        }

        RoundButton {
            id: b4
            x: 208
            y: 85
            width: 25
            height: 25
            text: "Y"
            checked: false
            checkable: false
            objectName: "b3"
        }

        RoundButton {
            id: b3
            x: 166
            y: 31
            width: 25
            height: 25
            text: "X"
            anchors.verticalCenterOffset: 40
            anchors.verticalCenter: parent.verticalCenter
            objectName: "b2"
        }

        RoundButton {
            id: b1
            x: 208
            y: 158
            width: 25
            height: 25
            text: "A"
            checked: false
            objectName: "b0"
        }

        RoundButton {
            id: b2
            x: 250
            y: 117
            width: 25
            height: 25
            text: "B"
            anchors.verticalCenterOffset: 39
            anchors.verticalCenter: parent.verticalCenter
            objectName: "b1"
        }

        Button {
            id: b5
            x: 73
            y: 65
            width: 55
            height: 25
            text: qsTr("L1")
            objectName: "b4"
        }

        Button {
            id: b6
            x: 313
            y: 65
            width: 55
            height: 25
            text: qsTr("R1")
            objectName: "b5"
        }

        ProgressBar {
            id: p48
            x: 7
            y: 18
            height: 7
            from: -1
            objectName: "p48"
            value: 0
        }

        ProgressBar {
            id: p49
            x: 240
            y: 6
            width: 200
            height: 19
            to: 1
            from: -1
            objectName: "p49"
            value: 0
        }
    }

    Frame {
        id: frame8
        x: 29
        y: 68
        width: 324
        height: 161

        ProgressBar {
            id: p44
            x: 1
            y: 41
            height: 23
            font.pointSize: 11
            font.bold: false
            to: 1
            from: -1
            indeterminate: false
            objectName: "p44"
            value: 0
        }

        ProgressBar {
            id: p45
            x: 1
            y: 111
            height: 13
            to: 1
            from: -1
            objectName: "p45"
            value: 0
        }

        Text {
            id: t44
            x: 97
            y: 20
            width: 8
            height: 15
            text: qsTr("X")
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 12
        }

        Text {
            id: t45
            x: 97
            y: 90
            text: qsTr("Y")
            font.pixelSize: 12
        }

        Text {
            id: t46
            x: 228
            y: 37
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t46"
            font.pixelSize: 12
        }

        Text {
            id: t47
            x: 228
            y: 113
            height: 15
            text: qsTr("000.000")
            horizontalAlignment: Text.AlignRight
            objectName: "t47"
            font.pixelSize: 12
        }

        Button {
            id: b18
            x: 225
            y: 64
            width: 51
            height: 35
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
}
