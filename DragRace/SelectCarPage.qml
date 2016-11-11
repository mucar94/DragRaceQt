import QtQuick 2.7
Rectangle
{
    height: 480
    width: 720
    color: "#fafcef"

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
            text: "TODO"
            color: mouse_area.containsMouse ? "blue" : "white"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            id: mouse_area
            onClicked: layout.currentIndex = 0

        }

    }
}

}
