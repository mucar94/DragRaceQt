
import QtQuick 2.7
import QtQuick.Controls 1.4


Rectangle
{

    Text{
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        text: "in Bearbeitung"
    }

    MenuButton
    {
        anchors.top: text.bottom
        text: "ZURÜCK"
        mouse.onClicked: page.currentIndex = 0
        imagesource: "qrc:/picture/back.png"
    }

}
