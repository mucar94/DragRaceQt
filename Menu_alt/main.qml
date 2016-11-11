import QtQuick 2.7
import QtQuick.Window 2.2

Window
{
    visible: true

    height: 450
    width: 720

    Image
    {
        source : "qrc:/picture/background_car.png"
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




    Grid
    {

        height: parent.height
        width: parent.width/2
        leftPadding : 50
        anchors.verticalCenter: parent.verticalCenter
        columns : 1

        MenuButton
        {
            anchors.left: parent.left
            width: parent.width
            height: parent.height / 5

        }






    }



}
