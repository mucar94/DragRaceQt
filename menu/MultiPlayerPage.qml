import QtQuick 2.7



Item
{
    height: 480
    width: 720

Image
{
    source : "qrc:/picture/background_car.jpg"
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.top: parent.top
}

Text
{
    text: "DRAGRACE QT"
    color: "black"
    font.bold: true
    font.pointSize: 30
    font.letterSpacing: 7
    font.wordSpacing: 15
    anchors.right: parent.right
    rightPadding: 60
    topPadding: 30
}




Column
{

    leftPadding : 50
    anchors.verticalCenter: parent.verticalCenter

    spacing: 10


    MyButton
    {
        Text
        {
            font.bold: true
            text: "1 V 1"
            color: mouse_area1.containsMouse ? "blue" : "white"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            id: mouse_area1
            onClicked: layout.currentIndex = 4

        }

    }

    MyButton
    {

        Text
        {
            font.bold: true
            text: "BACK"
            color: mouse_area2.containsMouse ? "blue" : "white"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            id: mouse_area2
            onClicked: layout.currentIndex = 0

        }
    }





}
}
