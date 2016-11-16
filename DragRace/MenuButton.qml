import QtQuick 2.7

Rectangle
{
    id: button_rect
    height: width * 0.33 // TODO : skalierbarkeit
    width : parent.width // TODO : skalierbarkeit
    radius: 5
    smooth: true

    function checkwidthsize(width)
    {
        if (width >= 25)
        {
            return 1;
        }

        return 0;
    }

    gradient: Gradient {
        GradientStop { position: 0.0; color: mouse_area.containsMouse ? "red" : "gray" }
        GradientStop { position: 0.9; color:  "black" }
    }

    border.color: mouse_area.containsMouse ? "gray" : "gray"
    border.width: 2 // TODO : skalierbarkeit

    property alias mouse: mouse_area
    property alias text : buttontext.text
    property alias imagesource: buttonimage.source

    Row
    {
        padding: button_rect.width / 25 // TODO : skalierbarkeit
        anchors.fill: parent
        spacing: button_rect.width / 25 // TODO : skalierbarkeit

        Image
        {
            mipmap: true
            smooth: true
            antialiasing: true
            height: button_rect.height - button_rect.width / 12.5 // TODO : skalierbarkeit
            width: height
            id: buttonimage
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit

        }

        Text
        {
            leftPadding: button_rect.width / 25 // TODO : skalierbarkeit
            font.bold: true
            font.pointSize: checkwidthsize(button_rect.width) ? (button_rect.width / 20) : 1// TODO : skalierbarkeit
            color: mouse_area.containsMouse ? "white" : "white"
            id: buttontext
            anchors.verticalCenter: parent.verticalCenter
        }

    }

    MouseArea{
        anchors.fill:  parent
        hoverEnabled: true
        id: mouse_area

    }
}
