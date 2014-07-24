import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: root
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    color: "white"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle{
        id: chart
        anchors.fill: parent
        anchors.margins: 20
        color: "green"

    Rectangle {
        id: area1
        height:parent.height/2
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: "gray"
    Rectangle {
    id: caption1
    anchors.left:parent.left
    height:parent.height
    width: 20
    anchors.top:parent.top
    color: "gray"

        Text {
        id: text1
        text: qsTr("Voltage (V)")
        anchors.centerIn: parent
        y: caption1.height/2+text1.height/2

        transform: Rotation {origin.x: text1.width/2; origin.y: text1.height/2; angle: 270;}
    }
}
    Rectangle {
        id:v_axisY
        anchors.left: caption1.right
        anchors.top: parent.top
        height:parent.height
        width: 30
        color:"blue"
    }

Rectangle {
    anchors.right:parent.right
    anchors.top:parent.top
    anchors.bottom: parent.bottom
    anchors.left: v_axisY.right
    color:"gray"

        Canvas {
            id: canvas1
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.fillStyle = "green"
                ctx.strokeStyle="blue"
                ctx.lineWidth=2
                ctx.beginPath()
                ctx.moveTo(10,10)
                ctx.lineTo(100,150)
                ctx.lineTo(500, 150)
                ctx.stroke()
            }

        }
}
    }
    Rectangle {
        id: area2       
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        width: parent.width
        height: parent.height/2
        color: "gray"

        Rectangle {
            id:caption2
            anchors.left: parent.left
            anchors.top: parent.top
            height:parent.height
            width:20
            color: "gray"
                Text {
                    id: text2
                    text: qsTr("Current (A)")
                    anchors.centerIn: parent
                    y: parent.height/2-text2.height/2
                    transform: Rotation {origin.x: text2.width/2; origin.y: text2.height/2; angle: 270;}
                }
        }
        Rectangle {
            id:a_axisY
            anchors.left:caption2.right
            anchors.top: parent.top
            height: parent.height
            width: 30
            color: "blue"
        }
        Rectangle {
            anchors.right:parent.right
            anchors.top:parent.top
            anchors.bottom: av_axisX.top
            anchors.left: a_axisY.right
            color:"gray"

                Canvas {
                    id: canvas2
                    anchors.fill: parent

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.fillStyle = "green"
                        ctx.strokeStyle="blue"
                        ctx.lineWidth=2
                        ctx.beginPath()
                        ctx.moveTo(10,10)
                        ctx.lineTo(100,150)
                        ctx.lineTo(500, 150)
                        ctx.stroke()
                    }

                }
        }
        Rectangle {
            id: av_axisX
            anchors.bottom: time_caption.top
            anchors.left: a_axisY.right
            anchors.right: parent.right
            height:30
            color:"green"

        }
        Rectangle {
            id:time_caption
            anchors.bottom: parent.bottom
            anchors.left:a_axisY.right
            anchors.right: parent.right
            height: 20
            color: "red"
                Text {
                    id:time
                    anchors.centerIn: parent
                    text: qsTr("Time (hh:mm:ss)")
                }
        }
    }

    }
}
