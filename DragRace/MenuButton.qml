import QtQuick 2.7

Rectangle
{
    id: button_rect
    height: width * 0.33
    width : parent.width
    radius: 5
    smooth: true
    border.color: "gray"
    border.width: 2 // TODO : skalierbarkeit

    property alias mouse: mouse_area
    property alias text : buttontext.text
    property alias imagesource: buttonimage.source

    gradient: Gradient
    {
        GradientStop
        {
            position: 0.0; color: mouse_area.containsMouse ? "red" : "gray"
        }
        GradientStop
        {
            position: 0.9; color:  "black"
        }
    }

    Row
    {
        padding: button_rect.width / 25 // TODO : skalierbarkeit
        anchors.fill: parent
        spacing: button_rect.width / 25 // TODO : skalierbarkeit

        Image
        {
            id: buttonimage
            mipmap: true
            smooth: true
            antialiasing: true
            height: button_rect.height * 0.7 // TODO : skalierbarkeit
            width: height
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
        }

        Text
        {
            id: buttontext
            leftPadding: button_rect.width / 25 // TODO : skalierbarkeit
            font.bold: true
            font.pointSize:button_rect.height * 0.15 <= 0 ? 1 : button_rect.height * 0.15
            color: mouse_area.containsMouse ? "white" : "white"
            anchors.verticalCenter: parent.verticalCenter
        }

    }

    MouseArea
    {
        anchors.fill:  parent
        hoverEnabled: true
        id: mouse_area

    }
}
