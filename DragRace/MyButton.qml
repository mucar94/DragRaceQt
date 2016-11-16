import QtQuick 2.7

Rectangle
{
    height: 70
    width : 250
    radius: 100
    color: "gray"

    property alias mouse: mouse_area
    property alias textsize: buttontext.font.pointSize
    property alias textbold: buttontext.font.bold
    property alias textcolor: buttontext.color
    property alias text : buttontext.text
    property alias imagesource: buttonimage.source

    Row
    {
        padding: 10
        anchors.fill: parent
        spacing: 10

        Image
        {
            mipmap: true
            smooth: true
            antialiasing: true
            height: parent.height -20
            width: height
            id: buttonimage
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit

        }


    Text
    {
        leftPadding: 15
        font.bold: true
        font.pointSize: 15
        color: "white"
        id: buttontext
        anchors.verticalCenter: parent.verticalCenter
    }



    }

    MouseArea{
        anchors.fill:  parent
        hoverEnabled: true
        onEntered: parent.textcolor = "blue"
        onExited: parent.textcolor = "white"

        id: mouse_area

    }




}
