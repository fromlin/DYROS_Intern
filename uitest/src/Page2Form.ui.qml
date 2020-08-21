import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 1024
    height: 600

    Frame {
        id: frame10
        x: 182
        y: 167
        width: 613
        height: 267

        Frame {
            id: frame8
            x: 0
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
            x: 306
            y: 15
            width: 283
            height: 100

            Text {
                id: text12
                x: -12
                y: -32
                text: qsTr("JoysButtons")
                font.pixelSize: 16
            }

            RoundButton {
                id: b4
                x: 198
                y: -6
                width: 30
                height: 30
                text: "Y"
                checked: false
                checkable: false
                objectName: "b3"
            }

            RoundButton {
                id: b3
                x: 166
                y: 31
                width: 30
                height: 30
                text: "X"
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b2"
            }

            RoundButton {
                id: b1
                x: 198
                y: 53
                width: 30
                height: 30
                text: "A"
                checked: false
                objectName: "b0"
            }

            RoundButton {
                id: b2
                x: 229
                y: 0
                width: 30
                height: 30
                text: "B"
                anchors.verticalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                objectName: "b1"
            }

            Button {
                id: b5
                x: 6
                y: 50
                width: 55
                height: 25
                text: qsTr("L1")
                objectName: "b4"
            }

            Button {
                id: b6
                x: 82
                y: 50
                width: 55
                height: 25
                text: qsTr("R1")
                objectName: "b5"
            }

            Button {
                id: b7
                x: 6
                y: 6
                width: 55
                height: 25
                text: qsTr("L2")
                objectName: "b6"
            }
            Button {
                id: b8
                x: 82
                y: 6
                width: 55
                height: 25
                text: qsTr("R2")
                objectName: "b7"
            }

        }

        Frame {
            id: frame11
            x: 309
            y: 143
            width: 280
            height: 100
            ProgressBar {
                id: p46
                x: 1
                y: 18
                objectName: "p46"
                value: 0.5
            }

            ProgressBar {
                id: p47
                x: 1
                y: 63
                height: 7
                objectName: "p47"
                value: 0.5
            }

            Text {
                id: t48
                x: 97
                y: -4
                text: qsTr("X")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignTop
            }

            Text {
                id: t49
                x: 97
                y: 41
                text: qsTr("Y")
                font.pixelSize: 12
            }

            Text {
                id: t50
                x: 211
                y: 13
                text: qsTr("000.000")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                objectName: "t48"
            }

            Text {
                id: t51
                x: 212
                y: 58
                height: 15
                text: qsTr("000.000")
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                objectName: "t49"
            }

            Button {
                id: b19
                x: 211
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
            x: 0
            y: 143
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
                onClicked: {
                    ros.click_ros("left")
                 }
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
                onClicked: {
                    ros.click_ros("right")
                 }
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
            x: 156
            y: 155
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

    Item {
        id:joyStick;
        property int offset:30;
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        width:150;height:150

        signal dirChanged(string direction);
        signal pressed();
        signal released();

        Rectangle {
            id:totalArea
            color:"gray"
            radius: parent.width/2
            opacity: 0.5
            width:parent.width;height:parent.height
        }

        Rectangle{
            id:stick
            width:totalArea.width/2; height: width
            radius: width/2
            x: totalArea.width/2 - radius;
            y: totalArea.height/2 - radius;
            color:"black"
        }

        MouseArea{
            id:mouseArea
            anchors.fill: parent

            onPressed: {
                joyStick.pressed();
            }

            onPositionChanged: {
             //(x-center_x)^2 + (y - center_y)^2 < radius^2
             //if stick need to remain inside larger circle
             //var rad = (totalArea.radius - stick.radius);
             //if stick can go outside larger circle
             var rad = totalArea.radius;
             rad =  rad * rad;

             // calculate distance in x direction
             var xDist = mouseX - (totalArea.x + totalArea.radius);
             xDist = xDist * xDist;

             // calculate distance in y direction
             var yDist = mouseY - (totalArea.y + totalArea.radius);
             yDist = yDist * yDist;

             //total distance for inner circle
             var dist = xDist + yDist;

             //if distance if less then radius then inner circle is inside larger circle
             if( rad < dist) {
                 return;
             }

             //center of larger circle
             var oldX = stick.x; var oldY = stick.y;
             stick.x = mouseX - stick.radius;
             stick.y = mouseY - stick.radius;

             //using L R U D LU RU LD RD for describe direction
             var dir="";

             //check if Right or left direction,
             //by checking if inner circle's y is near center of larger circle
             if( stick.y >= totalArea.radius - stick.radius - joyStick.offset
     && stick.y+stick.height <= totalArea.radius + stick.radius + joyStick.offset) {
                 if( stick.x + stick.radius > totalArea.x + totalArea.radius) {
                     dir = "R";
                 } else if( stick.x < totalArea.x + totalArea.radius) {
                     dir = "L";
                 }
             }
             //check if Up or Down direction,
             //by checking if inner circle's x is near center of larger circle
             else if( stick.x >= totalArea.radius - stick.radius - joyStick.offset
     && stick.x + stick.width <= totalArea.radius + stick.radius + joyStick.offset) {
                if( stick.y + stick.radius > totalArea.y + totalArea.radius) {
                     dir = "D";
                } else if( stick.y < totalArea.y + totalArea.radius) {
                     dir = "U";
                }
             }
             //check if Up Left or Up Right direction,
             //by checking if inner circle is near one of top corner of larger circle
             else if( stick.y < totalArea.radius - stick.radius ) {
                if( stick.x + stick.radius > totalArea.x + totalArea.radius) {
                    dir = "R";
                } else if( stick.x < totalArea.x + totalArea.radius) {
                    dir = "L";
                }
                dir = dir +"U";
             }
             //check if Down Left or Down Right direction,
             //by checking if inner circle is near one of bottom corner of larger circle
             else if ( stick.y + stick.radius >= totalArea.radius + stick.radius ) {
                if( stick.x + stick.radius > totalArea.x + totalArea.radius) {
                   dir = "R";
                } else if( stick.x < totalArea.x + totalArea.radius) {
                   dir = "L";
                }
                dir = dir +"D";
             }

             joyStick.dirChanged(dir);
            }

            onReleased: {
                //snap to center
                stick.x = totalArea.width /2 - stick.radius;
                stick.y = totalArea.height/2 - stick.radius;

                joyStick.released();
            }
        }
        function changeDirection(direction) {
        if( direction === "L") {
          // velcmd_msg.des_vel[0] = -0.25;
          ros.move_ros("L");
        } else if( direction === "R") {
            ros.move_ros("R");
        } else if( direction === "U") {
            ros.move_ros("U");
        } else if( direction === "D") {
            ros.move_ros("D");
        } else if( direction === "RU") {
            ros.move_ros("RU");
        } else if( direction === "LU") {
            ros.move_ros("LU");
        } else if( direction === "RD") {
            ros.move_ros("RD");
        } else if( direction === "LD") {
            ros.move_ros("LD");
        }
    }
      onDirChanged:{
         changeDirection(direction)
         }
  
//        onPressed:{
//            //man.running=true;
//        }

//        onReleased:{
//            //man.running=false;
//        }
    }


}
