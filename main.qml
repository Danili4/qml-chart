import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    id: root
    visible: true
    width: 800
    height: 600
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
        color: "gray"

    Text {
        id: textHello
        text: qsTr("Hello World")
        anchors.centerIn: parent
        transform: Rotation {origin.x: textHello.width/2; origin.y: textHello.height/2; angle: 90;}
    }

    Canvas {
     id: canvas
     anchors.fill: parent
     onPaint: {
         var ctx = getContext("2d")
         ctx.fillStyle = "green"
         ctx.fillRect(0, 0, 200, 300)
     }

    }
    }
}
