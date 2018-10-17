import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Canvas {
    id:mask
    property int scanWidth: width*0.6
    property int temp: 18

    onPaint: {
        var ctx = getContext("2d")
        ctx.fillStyle = Qt.rgba(0,0,0,0.4)
        //画一个框
        ctx.fillRect(0,0,width,height)
        ctx.clearRect(width/2.-scanWidth/2.,height/2.-scanWidth/2.,scanWidth,scanWidth)
        //画左上的边角
        ctx.lineWidth = 3
        ctx.strokeStyle = "lightgreen"
        ctx.beginPath()
        ctx.moveTo(width/2.-scanWidth/2.+temp,height/2.-scanWidth/2.)
        ctx.lineTo(width/2.-scanWidth/2.,height/2.-scanWidth/2.)
        ctx.lineTo(width/2.-scanWidth/2.,height/2.-scanWidth/2.+temp)
        //画右上的边角
        ctx.moveTo(width/2.+scanWidth/2.-temp,height/2.-scanWidth/2.)
        ctx.lineTo(width/2.+scanWidth/2.,height/2.-scanWidth/2.)
        ctx.lineTo(width/2.+scanWidth/2.,height/2.-scanWidth/2.+temp)

        //画左下的边角
        ctx.moveTo(width/2.-scanWidth/2.,height/2.+scanWidth/2.-temp)
        ctx.lineTo(width/2.-scanWidth/2.,height/2.+scanWidth/2.)
        ctx.lineTo(width/2.-scanWidth/2.+temp,height/2.+scanWidth/2.)

        //画右下的边角
        ctx.moveTo(width/2.+scanWidth/2.-temp,height/2.+scanWidth/2.)
        ctx.lineTo(width/2.+scanWidth/2.,height/2.+scanWidth/2.)
        ctx.lineTo(width/2.+scanWidth/2.,height/2.+scanWidth/2.-temp)
        ctx.stroke()
    }

    Label{
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        horizontalAlignment: Qt.AlignHCenter
        font.pixelSize: 25
        color: "white"
        anchors.top: parent.top
        anchors.topMargin: mask.height/2. + scanWidth/2. + 15
        text: qsTr("Please put the QR code in the box")
    }

    Image {
        id: line
        source: "qrc:/skin/bg_scan_line.png"
        width: scanWidth
        height: 4
        anchors.horizontalCenter: parent.horizontalCenter

        PropertyAnimation{
            id:ani
            target:line
            properties: "y"
            duration: 1500
            from:mask.height/2. - scanWidth/2.
            running: true
            to:mask.height/2. + scanWidth/2.
            onStopped: {
                y=mask.height/2. - scanWidth/2.
                ani.start()
            }
        }
    }
}
