import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1024
    height: 600

    Button {
        id: button
        x: 231
        y: 80
        width: 219
        height: 87
        text: qsTr("Initialize All")
        highlighted: false
        checked: false
        font.pointSize: 20

        onClicked: {
            ros.button_ros(0, "Initialize All")
        }
    }

    Button {
        id: button1
        x: 231
        y: 216
        width: 219
        height: 87
        text: qsTr("Initialize Lower")
        font.pointSize: 20
        highlighted: false
        checked: false
        onClicked: {
            ros.button_ros(0, "Initialize Lower")
        }
    }

    Button {
        id: button2
        x: 231
        y: 348
        width: 219
        height: 87
        text: qsTr("Safety Reset")
        font.pointSize: 20
        highlighted: false
        checked: false
        onClicked: {
            ros.button_ros(0, "Safety Reset")
        }
    }

    Button {
        id: button3
        x: 563
        y: 80
        width: 219
        height: 87
        text: qsTr("Disable Safety")
        font.pointSize: 20
        highlighted: false
        checked: false
        onClicked: {
            ros.button_ros(0, "Disable Safety")
        }
    }

    Button {
        id: button4
        x: 563
        y: 216
        width: 219
        height: 87
        text: qsTr("FT Calibration")
        font.pointSize: 20
        highlighted: false
        checked: false
        onClicked: {
            ros.button_ros(0, "FT Calibration")
        }
    }

    Button {
        id: button5
        x: 563
        y: 348
        width: 219
        height: 87
        text: qsTr("IMU EF Reset")
        font.pointSize: 20
        highlighted: false
        checked: false
        onClicked: {
            ros.button_ros(0, "IMU EF Reset")
        }
    }
}
