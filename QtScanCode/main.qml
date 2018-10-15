import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 480
    height: 640
    title: qsTr("ScanCode")

    StackView{
        id:stackview
        anchors.fill: parent
        initialItem: Page{
            anchors.fill: parent
            Button{
                anchors.centerIn: parent
                text: "ScanCode"
                onClicked: {
                    stackview.push("qrc:/ScanPage.qml")
                }
            }
        }
    }

}
