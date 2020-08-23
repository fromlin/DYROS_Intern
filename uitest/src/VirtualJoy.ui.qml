import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1024
    height: 600

    Frame {
        id: joy
        width: 1024
        height: 580

        Item {
            id: joyStick
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
                id: totalArea
                color: "gray"
                radius: parent.width / 2
                opacity: 0.5
                width: parent.width
                height: parent.height
            }

            Rectangle {
                id: stick
                width: totalArea.width / 2
                height: width
                radius: width / 2
                x: totalArea.width / 2 - radius
                y: totalArea.height / 2 - radius
                color: "black"
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent

                onPressed: {
                    joyStick.pressed()
                }

                onPositionChanged: {
                    //(x-center_x)^2 + (y - center_y)^2 < radius^2
                    //if stick need to remain inside larger circle
                    //var rad = (totalArea.radius - stick.radius);
                    //if stick can go outside larger circle
                    var rad = totalArea.radius
                    rad = rad * rad

                    // calculate distance in x direction
                    var xDist = mouseX - (totalArea.x + totalArea.radius)
                    xDist = xDist * xDist

                    // calculate distance in y direction
                    var yDist = mouseY - (totalArea.y + totalArea.radius)
                    yDist = yDist * yDist

                    //total distance for inner circle
                    var dist = xDist + yDist

                    //if distance if less then radius then inner circle is inside larger circle
                    if (rad < dist) {
                        return
                    }

                    //center of larger circle
                    var oldX = stick.x
                    var oldY = stick.y
                    stick.x = mouseX - stick.radius
                    stick.y = mouseY - stick.radius

                    //using L R U D LU RU LD RD for describe direction
                    var dir = ""

                    //check if Right or left direction,
                    //by checking if inner circle's y is near center of larger circle
                    if (stick.y >= totalArea.radius - stick.radius - joyStick.offset
                            && stick.y + stick.height <= totalArea.radius
                            + stick.radius + joyStick.offset) {
                        if (stick.x + stick.radius > totalArea.x + totalArea.radius) {
                            dir = "R"
                        } else if (stick.x < totalArea.x + totalArea.radius) {
                            dir = "L"
                        }
                    } //check if Up or Down direction,
                    //by checking if inner circle's x is near center of larger circle
                    else if (stick.x >= totalArea.radius - stick.radius - joyStick.offset
                             && stick.x + stick.width <= totalArea.radius
                             + stick.radius + joyStick.offset) {
                        if (stick.y + stick.radius > totalArea.y + totalArea.radius) {
                            dir = "D"
                        } else if (stick.y < totalArea.y + totalArea.radius) {
                            dir = "U"
                        }
                    } //check if Up Left or Up Right direction,
                    //by checking if inner circle is near one of top corner of larger circle
                    else if (stick.y < totalArea.radius - stick.radius) {
                        if (stick.x + stick.radius > totalArea.x + totalArea.radius) {
                            dir = "R"
                        } else if (stick.x < totalArea.x + totalArea.radius) {
                            dir = "L"
                        }
                        dir = dir + "U"
                    } //check if Down Left or Down Right direction,
                    //by checking if inner circle is near one of bottom corner of larger circle
                    else if (stick.y + stick.radius >= totalArea.radius + stick.radius) {
                        if (stick.x + stick.radius > totalArea.x + totalArea.radius) {
                            dir = "R"
                        } else if (stick.x < totalArea.x + totalArea.radius) {
                            dir = "L"
                        }
                        dir = dir + "D"
                    }

                    joyStick.dirChanged(dir)
                }

                onReleased: {
                    //snap to center
                    stick.x = totalArea.width / 2 - stick.radius
                    stick.y = totalArea.height / 2 - stick.radius

                    joyStick.released()
                }
            }
            function changeDirection(direction) {
                if (direction === "L") {
                    // velcmd_msg.des_vel[0] = -0.25;
                    ros.move_ros("L")
                } else if (direction === "R") {
                    ros.move_ros("R")
                } else if (direction === "U") {
                    ros.move_ros("U")
                } else if (direction === "D") {
                    ros.move_ros("D")
                } else if (direction === "RU") {
                    ros.move_ros("RU")
                } else if (direction === "LU") {
                    ros.move_ros("LU")
                } else if (direction === "RD") {
                    ros.move_ros("RD")
                } else if (direction === "LD") {
                    ros.move_ros("LD")
                }
            }
            onDirChanged: {
                changeDirection(direction)
            }
        }
    }
}
