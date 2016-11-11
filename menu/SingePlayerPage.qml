import QtQuick 2.7



Item
{
    height: parent.height
    width: parent.width

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
            text: "EINZELSPIELER"
            color: "white"
            anchors.centerIn: parent
        }
    }

    MyButton
    {
        Text
        {
            font.bold: true
            text: "Main"
            color: "white"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            onClicked: layout.currentIndex = 0;

        }
    }




}
}
