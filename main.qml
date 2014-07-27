import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: root
    visible: true
    minimumWidth: 800
    minimumHeight: 600
    color: "white"



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
        property real scaleFactor: 1.0

        MouseArea {
            anchors.fill:parent
            onWheel: {
                if (wheel.angleDelta.y > 0)
                    parent.scaleFactor +=0.1
                else
                    parent.scaleFactor -=0.1
                canvas1.requestPaint()
            }
        }
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
                ctx.clearRect(0, 0, canvas1.width, canvas1.height)
                drawAxis(ctx, canvas1.width, canvas1.height, av_axisX.scaleFactor, v_axisY.scaleFactor)
                drawLines(ctx, av_axisX.scaleFactor, v_axisY.scaleFactor)
            }

            function drawAxis(ctx, width, height, xf, yf) {
                ctx.clearRect(0, 0, canvas1.width, canvas1.height)
                ctx.strokeStyle = "white"
                ctx.lineWidth = 1
                for(var i=0;;i++) {
                    if((xf*40.5+xf*i*40) > width) break;
                    ctx.beginPath()
                    ctx.moveTo(xf*40.5+xf*i*40, 0)
                    ctx.lineTo(xf*40.5+xf*i*40, height)
                    ctx.stroke()
                }
                for(var i=0;;i++) {
                    if((height - (yf*40.5+yf*i*40)) < 0) break;
                    ctx.beginPath()
                    ctx.moveTo(0, height - (yf*40.5+yf*i*40))
                    ctx.lineTo(width, height - (yf*40.5+yf*i*40))
                    ctx.stroke()
                }
            }

            function drawLines(ctx, xf, yf) {
                ctx.strokeStyle="blue"
                ctx.lineWidth=2
                ctx.beginPath()
                ctx.moveTo(10*xf, 10*yf)
                ctx.lineTo(100*xf, 150*yf)
                ctx.lineTo(500*xf, 150*yf)
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
            property real scaleFactor: 1.0

            MouseArea {
                anchors.fill:parent
                onWheel: {
                    if (wheel.angleDelta.y > 0)
                        parent.scaleFactor +=0.1
                    else
                        parent.scaleFactor -=0.1
                    canvas2.requestPaint()
                }
            }
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
                        ctx.clearRect(0, 0, canvas2.width, canvas2.height)
                        drawAxis(ctx, canvas2.width, canvas2.height, av_axisX.scaleFactor, a_axisY.scaleFactor)
                        drawLines(ctx, av_axisX.scaleFactor, v_axisY.scaleFactor)
                    }

                    function drawAxis(ctx, width, height, xf, yf) {
                        ctx.strokeStyle = "white"
                        ctx.lineWidth = 1
                        for(var i=0;;i++) {
                            if((xf*40.5+xf*i*40) > width) break;
                            ctx.beginPath()
                            ctx.moveTo(xf*40.5+xf*i*40, 0)
                            ctx.lineTo(xf*40.5+xf*i*40, height)
                            ctx.stroke()
                        }
                        for(var i=0;;i++) {
                            if((height - (yf*40.5+yf*i*40)) < 0) break;
                            ctx.beginPath()
                            ctx.moveTo(0, height - (yf*40.5+yf*i*40))
                            ctx.lineTo(width, height - (yf*40.5+yf*i*40))
                            ctx.stroke()
                        }
                    }

                    function drawLines(ctx, xf, yf) {
                        ctx.strokeStyle="blue"
                        ctx.lineWidth=2
                        ctx.beginPath()
                        ctx.moveTo(10*xf, 10*yf)
                        ctx.lineTo(100*xf, 150*yf)
                        ctx.lineTo(500*xf, 150*yf)
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
            property real scaleFactor: 1.0

            MouseArea {
                anchors.fill:parent
                onWheel: {
                    if (wheel.angleDelta.y > 0)
                        parent.scaleFactor +=0.1
                    else
                        parent.scaleFactor -=0.1
                    canvas1.requestPaint()
                    canvas2.requestPaint()
                }
            }

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
