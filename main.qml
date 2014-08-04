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
        anchors.bottom: emptyBlock2.top
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
    anchors.right:parent.right
    anchors.top:parent.top
    anchors.bottom: parent.bottom
    anchors.left: caption1.right
    color:"gray"

        Canvas {
            id: canvas1
            anchors.fill: parent
            property real scaleFactorX: 1.0
            property real scaleFactorY: 1.0
            property real scaleMax: 2.0
            property real scaleMin: 0.5

            MouseArea {
                id: canvas1_a
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.left: parent.left
                width: 30
                onWheel: {
                    if (wheel.angleDelta.y > 0)
                        parent.scaleFactorY +=0.1
                    else
                        parent.scaleFactorY -=0.1
                    if (parent.scaleFactorY > parent.scaleMax)
                        parent.scaleFactorY = parent.scaleMax
                    if (parent.scaleFactorY < parent.scaleMin)
                        parent.scaleFactorY = parent.scaleMin
                    canvas1.requestPaint()
                }
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, canvas1.width, canvas1.height)
                drawAxis(ctx, canvas1.width, canvas1.height, canvas1.scaleFactorX, canvas1.scaleFactorY)
                drawLines(ctx, canvas1.width, canvas1.height,canvas1.scaleFactorX, canvas1.scaleFactorY)
                drawText(ctx, 30, 50, "left")

            }

            function drawAxis(ctx, width, height, xf, yf) {
                ctx.strokeStyle = "white"
                ctx.lineWidth = 1
                for(var i=0;;i++) {
                    if((30.5+xf*i*40) > width) break;
                    ctx.beginPath()
                    ctx.moveTo(30.5+xf*i*40, 0)
                    ctx.lineTo(30.5+xf*i*40, height)
                    ctx.stroke()
                }
                ctx.beginPath()
                ctx.moveTo(width-0.5, 0.5)
                ctx.lineTo(width-0.5, height)
                ctx.stroke()
                for(var i=0;;i++) {
                    if((height - (0.5+yf*i*40)) < 0) break;
                    ctx.beginPath()
                    ctx.moveTo(30.5, height - (0.5+yf*i*40))
                    ctx.lineTo(width, height -(0.5+yf*i*40))
                    ctx.stroke()
                    drawText(ctx, (i*40).toFixed(1).toString(), 29.5, height -(0.5+yf*i*40), "right")
                }
                ctx.beginPath()
                ctx.moveTo(30.5, 0.5)
                ctx.lineTo(width, 0.5)
                ctx.stroke()
            }

            function drawLines(ctx, width, height, xf, yf) {
                var bott = 1.5
                ctx.save()
                ctx.beginPath()
                ctx.rect(30.5, 0.5, width-32.5, height-bott)
                ctx.clip()

                ctx.strokeStyle="blue"
                ctx.lineWidth=2
                ctx.beginPath()
                ctx.moveTo(30.5+10*xf, height- bott - 0*yf)
                ctx.lineTo(30.5+100*xf, height- bott - 150*yf)
                ctx.lineTo(30.5+500*xf, height- bott - 150*yf)
                ctx.stroke()
                ctx.restore()
            }

            function drawText(ctx, text, x, y, align) {
                ctx.fillStyle = "white"
                ctx.textBaseline = "top hanging"
                ctx.textAlign = align
                ctx.font = "italic 10pt Arial"
                ctx.fillText(text, x, y)
            }


        }
}
    }

    Rectangle {
        id:emptyBlock2
        anchors.bottom: area2.top
        anchors.left: parent.left
        anchors.right: parent.right
        height:10
        color: "gray"
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
            id: drawingArea2
            anchors.right:parent.right
            anchors.top:parent.top
            anchors.bottom: time_caption.top
            anchors.left: caption2.right
            color:"gray"

                Canvas {
                    id: canvas2
                    anchors.fill: parent
                    property real scaleFactorY: 1.0
                    property real scaleFactorX: 1.0
                    property real scaleMaxX: 3.0
                    property real scaleMinX: 1.0
                    property real scaleMax: 2.0
                    property real scaleMin: 0.5

                    MouseArea {
                        id: canvas_a
                        anchors.bottom: canvas_av.top
                        anchors.top: parent.top
                        anchors.left: parent.left
                        width: 30
                        onWheel: {
                            if (wheel.angleDelta.y > 0)
                                parent.scaleFactorY +=0.1
                            else
                                parent.scaleFactorY -=0.1
                            if (parent.scaleFactorY > parent.scaleMax)
                                parent.scaleFactorY = parent.scaleMax
                            if (parent.scaleFactorY < parent.scaleMin)
                                parent.scaleFactorY = parent.scaleMin
                            canvas2.requestPaint()
                        }
                    }

                    MouseArea {
                        id: canvas_av
                        anchors.bottom: parent.bottom
                        anchors.left: canvas_a.right
                        anchors.right: parent.right
                        height: 30
                        onWheel: {
                            if (wheel.angleDelta.y > 0)
                                parent.scaleFactorX +=0.1
                            else
                                parent.scaleFactorX -=0.1
                            if (parent.scaleFactorX > parent.scaleMaxX)
                                parent.scaleFactorX = parent.scaleMaxX
                            if (parent.scaleFactorX < parent.scaleMinX)
                                parent.scaleFactorX = parent.scaleMinX
                            canvas1.scaleFactorX = parent.scaleFactorX
                            canvas2.requestPaint()
                            canvas1.requestPaint()
                        }
                    }

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, canvas2.width, canvas2.height)
                        drawAxis(ctx, canvas2.width, canvas2.height, canvas2.scaleFactorX, canvas2.scaleFactorY)
                        drawLines(ctx, canvas2.width, canvas2.height, canvas2.scaleFactorX, canvas2.scaleFactorY)
                    }

                    function drawAxis(ctx, width, height, xf, yf) {
                        ctx.strokeStyle = "white"
                        ctx.lineWidth = 1
                        for(var i=0;;i++) {
                            if((30.5+xf*i*40) > width) break;
                            ctx.beginPath()
                            ctx.moveTo(30.5+xf*i*40, 0)
                            ctx.lineTo(30.5+xf*i*40, height - 30)
                            ctx.stroke()                            
                            drawText(ctx, (i*40).toFixed(1).toString(), 30.5+xf*i*40, height - 19.5, "left")
                        }
                        ctx.beginPath()
                        ctx.moveTo(width-0.5, 0.5)
                        ctx.lineTo(width-0.5, height-30.5)
                        ctx.stroke()
                        for(var i=0;;i++) {
                            if((height - 30 - (0.5+yf*i*40)) < 0) break;
                            ctx.beginPath()
                            ctx.moveTo(30.5, height - 30 - (0.5+yf*i*40))
                            ctx.lineTo(width, height - 30 -(0.5+yf*i*40))
                            ctx.stroke()
                            drawText(ctx, (i*40).toFixed(1).toString(), 29.5, height - 30 -(0.5+yf*i*40), "right")
                        }
                        ctx.beginPath()
                        ctx.moveTo(30.5, 0.5)
                        ctx.lineTo(width, 0.5)
                        ctx.stroke()
                    }

                    function drawLines(ctx, width, height, xf, yf) {
                        var bott = 32.5
                        ctx.save()
                        ctx.beginPath()
                        ctx.rect(30.5, 0.5, width-32.5, height-bott)
                        ctx.clip()

                        ctx.strokeStyle="blue"
                        ctx.lineWidth=2
                        ctx.beginPath()
                        ctx.moveTo(30.5+10*xf, height  - bott - 10*yf)
                        ctx.lineTo(30.5+100*xf, height  - bott - 150*yf)
                        ctx.lineTo(30.5+500*xf, height  - bott - 150*yf)
                        ctx.stroke()
                        ctx.restore()
                    }

                    function drawText(ctx, text, x, y, align) {
                        ctx.fillStyle = "white"
                        ctx.textBaseline = "top hanging"
                        ctx.textAlign = align
                        ctx.font = "italic 10pt Arial"
                        ctx.fillText(text, x, y)
                    }

                }
        }
        Rectangle {
            id: emptyBlock
            anchors.top: drawingArea2.bottom
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 50
            color: "gray"
        }


        Rectangle {
            id:time_caption
            anchors.bottom: parent.bottom
            anchors.left: emptyBlock.right
            anchors.right: parent.right
            height: 20
            color: "gray"
                Text {
                    id:time
                    anchors.centerIn: parent
                    text: qsTr("Time (hh:mm:ss)")
                }
        }
    }

    }
}
