import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page
    width: 1024
    height: 600

    Frame {
        id: leftjoy
        y: 323
        width: 230
        height: 220
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 30

        Item {
            id: leftjoyStick
            property int offset: 30
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 20
            anchors.leftMargin: 30
            width: 150
            height: 150

            signal dirChanged(string direction)
            signal pressed
            signal released

            Rectangle {
                id: totalArea1
                color: "gray"
                radius: parent.width / 2
                opacity: 0.5
                width: parent.width
                height: parent.height
            }

            Rectangle {
                id: stick1
                width: totalArea1.width / 2
                height: width
                radius: width / 2
                x: totalArea1.width / 2 - radius
                y: totalArea1.height / 2 - radius
                color: "black"
            }

            MouseArea {
                id: mouseArea1
                anchors.fill: parent

                //                onPressed: {
                //                    leftjoyStick.pressed()
                //                }

                //                onPositionChanged: {
                //                    //(x-center_x)^2 + (y - center_y)^2 < radius^2
                //                    //if stick need to remain inside larger circle
                //                    //var rad = (totalArea.radius - stick.radius);
                //                    //if stick can go outside larger circle
                //                    var rad = totalArea1.radius
                //                    rad = rad * rad

                //                    // calculate distance in x direction
                //                    var xDist = mouseX - (totalArea1.x + totalArea1.radius)
                //                    xDist = xDist * xDist

                //                    // calculate distance in y direction
                //                    var yDist = mouseY - (totalArea1.y + totalArea1.radius)
                //                    yDist = yDist * yDist

                //                    //total distance for inner circle
                //                    var dist = xDist + yDist

                //                    //if distance if less then radius then inner circle is inside larger circle
                //                    if (rad < dist) {
                //                        return
                //                    }

                //                    //center of larger circle
                //                    var oldX = stick1.x
                //                    var oldY = stick1.y
                //                    stick1.x = mouseX - stick1.radius
                //                    stick1.y = mouseY - stick1.radius
                //                }

                //                onReleased: {
                //                    //snap to center
                //                    stick1.x = totalArea1.width / 2 - stick1.radius
                //                    stick1.y = totalArea1.height / 2 - stick1.radius

                //                    leftjoyStick.released()
                //                }
            }

            //            onDirChanged: {
            //                changeDirection(direction)
            //            }
        }
    }

    Frame {
        id: rightjoy
        x: 764
        y: 361
        width: 230
        height: 220
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 30

        Item {
            id: rightjoyStick
            property int offset: 30
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 20
            anchors.leftMargin: 30
            width: 150
            height: 150

            signal dirChanged(string direction)
            signal pressed
            signal released

            Rectangle {
                id: totalArea2
                color: "gray"
                radius: parent.width / 2
                opacity: 0.5
                width: parent.width
                height: parent.height
            }

            Rectangle {
                id: stick2
                width: totalArea2.width / 2
                height: width
                radius: width / 2
                x: totalArea2.width / 2 - radius
                y: totalArea2.height / 2 - radius
                color: "black"
            }

            MouseArea {
                id: mouseArea2
                anchors.fill: parent

                //                onPressed: {
                //                    leftjoyStick.pressed()
                //                }

                //                onPositionChanged: {
                //                    //(x-center_x)^2 + (y - center_y)^2 < radius^2
                //                    //if stick need to remain inside larger circle
                //                    //var rad = (totalArea.radius - stick.radius);
                //                    //if stick can go outside larger circle
                //                    var rad = totalArea2.radius
                //                    rad = rad * rad

                //                    // calculate distance in x direction
                //                    var xDist = mouseX - (totalArea2.x + totalArea2.radius)
                //                    xDist = xDist * xDist

                //                    // calculate distance in y direction
                //                    var yDist = mouseY - (totalArea2.y + totalArea2.radius)
                //                    yDist = yDist * yDist

                //                    //total distance for inner circle
                //                    var dist = xDist + yDist

                //                    //if distance if less then radius then inner circle is inside larger circle
                //                    if (rad < dist) {
                //                        return
                //                    }

                //                    //center of larger circle
                //                    var oldX = stick2.x
                //                    var oldY = stick2.y
                //                    stick2.x = mouseX - stick2.radius
                //                    stick2.y = mouseY - stick2.radius
                //                }

                //                onReleased: {
                //                    //snap to center
                //                    stick2.x = totalArea2.width / 2 - stick2.radius
                //                    stick2.y = totalArea2.height / 2 - stick2.radius

                //                    leftjoyStick.released()
                //                }
            }

            //            onDirChanged: {
            //                changeDirection(direction)
            //            }
        }
    }

    Frame {
        id: frame
        x: 45
        y: 107
        width: 200
        height: 200
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: frame1.verticalCenter

        Button {
            id: button
            y: 58
            width: 40
            height: 40
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 8
            background: Rectangle {
                radius: button.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }

        Button {
            id: button1
            x: 110
            y: 58
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 8
            background: Rectangle {
                radius: button1.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }

        Button {
            id: button2
            x: 58
            width: 40
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 8
            background: Rectangle {
                radius: button2.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }

        Button {
            id: button3
            x: 58
            y: 116
            width: 40
            height: 40
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                radius: button3.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }
    }

    Frame {
        id: frame1
        x: 357
        y: 136
        width: 310
        height: 151
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        RoundButton {
            id: roundButton
            x: 144
            y: 29
            width: 90
            height: 90
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: false
            checkable: false
            checked: false
            font.pointSize: 60
            background: Rectangle {
                radius: roundButton.radius
                border.width: 3
                border.color: "#30f13e"
                color: "#dcded8"
            }

            Text {
                id: element
                x: 27
                y: 38
                color: "#30f13e"
                text: qsTr("X")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 70
            }
        }

        RoundButton {
            id: roundButton1
            y: 47
            width: 50
            height: 50
            font.bold: false
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: roundButton.verticalCenter
            background: Rectangle {
                radius: roundButton1.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }

        RoundButton {
            id: roundButton2
            x: 309
            y: 47
            width: 50
            height: 50
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: roundButton.verticalCenter
            background: Rectangle {
                radius: roundButton2.radius
                border.color: "#000000"
                border.width: 3
                opacity: 0.5
                color: "gray"
            }
        }
    }

    Frame {
        id: frame2
        x: 779
        y: 125
        width: 200
        height: 200
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: frame1.verticalCenter
        font.pointSize: 11

        RoundButton {
            id: roundButton3
            x: 72
            y: 123
            width: 50
            height: 50
            checkable: false
            font.bold: true
            font.pointSize: 13
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            background: Rectangle {
                radius: roundButton3.radius
                color: "#13aa04"
            }
        }

        RoundButton {
            id: roundButton4
            x: 63
            y: 58
            width: 50
            height: 50
            checkable: false
            font.bold: true
            font.pointSize: 13
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 8
            background: Rectangle {
                radius: roundButton4.radius
                color: "#e22503"
            }
        }

        RoundButton {
            id: roundButton5
            y: 58
            width: 50
            height: 50
            checkable: false
            font.bold: true
            font.pointSize: 13
            anchors.verticalCenterOffset: 0
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
            background: Rectangle {
                radius: roundButton5.radius
                color: "#025aeb"
            }
        }

        RoundButton {
            id: roundButton6
            x: 73
            width: 50
            height: 50
            checkable: false
            font.bold: true
            font.pointSize: 13
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            background: Rectangle {
                radius: roundButton6.radius
                color: "#e2bc03"
            }
        }
    }

    Frame {
        id: frame3
        y: 19
        height: 74
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30

        Slider {
            id: slider
            y: 13
            width: 230
            height: 40
            from: -1
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            value: 0
        }

        Slider {
            id: slider1
            x: 732
            y: 11
            width: 230
            height: 40
            orientation: Qt.Horizontal
            stepSize: 0
            from: -1
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            value: 0
        }
    }

    Frame {
        id: frame4
        x: 319
        y: 320
        width: 387
        height: 220
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }
}

/*##^##
Designer {
    D{i:3;anchors_height:150;anchors_width:150}D{i:1;anchors_x:25}D{i:12;anchors_x:8}
D{i:16;anchors_y:0}D{i:24;anchors_x:5}D{i:33;anchors_x:73}D{i:35;anchors_y:0}D{i:38;anchors_x:9}
D{i:37;anchors_width:974;anchors_x:25}
}
##^##*/

