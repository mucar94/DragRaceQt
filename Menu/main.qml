import QtQuick 2.7
import QtQuick.Window 2.2

Window
{
    visible: true

    height: 450
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




    Grid
    {

        leftPadding : 50
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10
        columns : 1

        MenuButton
        {
            Text
            {
                font.bold: true
                text: "EINZELSPIELER"
                color: "white"
                anchors.centerIn: parent
            }
        }

        MenuButton
        {
            Text
            {
                font.bold: true
                text: "MEHRSPIELER"
                color: "white"
                anchors.centerIn: parent
            }
        }

        MenuButton
        {
            Text
            {
                font.bold: true
                text: "HIGHSCORE"
                color: "white"
                anchors.centerIn: parent
            }
        }

        MenuButton
        {
            Text
            {
                font.bold: true
                text: "EINSTELLUNGEN"
                color: "white"
                anchors.centerIn: parent
            }
        }




    }



}
