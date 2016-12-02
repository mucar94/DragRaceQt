import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import CarPhysics 1.0
Item
{

    id: demogame


    property real speed_g;
    property real position_g;
    property real rpm_g;
    property real time_g;

    anchors.fill: parent
    CarPhysics
    {
        onV_update: speed_g = v*3
        onS_update: position_g = s
        onRpm_update: rpm_g = (rpm/1000)
        id: physics
    }



    Text
    {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        anchors.top: parent.top
        font.pointSize: 50
        font.bold: true
        font.letterSpacing: 5
        text: "DEMO"
    }




    Text
    {
        id: position
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20

        anchors.top: title.bottom
        text: "position: " + position_g
    }

    Row
    {

        id: controls
        anchors.top : gaugerow.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Rectangle
        {
            id: startrect
            width: 50
            height: width
            radius: 100
            color: start_area.containsMouse ? "greenyellow": "green"


            Text
            {
                anchors.centerIn: parent
                text: "START"
                font.bold: true
            }

            MouseArea
            {
                id: start_area
                hoverEnabled: true

                anchors.fill: parent
                onClicked: physics.start()
            }


        }

        Rectangle
        {
            id: shiftrect
            width: 50
            height: width
            radius: 100
            color: shift_area.containsMouse ? "red" : "black"
            Text{
                anchors.centerIn: parent
                text: "SHIFT"
                color: "white"
                font.bold: true
            }

            MouseArea
            {
                id: shift_area
                hoverEnabled: true

                anchors.fill: parent
                onClicked: physics.shift_up();
            }

        }

        Rectangle
        {
            width: 50
            height: width
            radius: 100
            color: stop_area.containsMouse?"lightgrey" :"grey"
            Text{
                anchors.centerIn: parent
                text: "STOP"
            }

            MouseArea
            {
                hoverEnabled: true
                id: stop_area
                anchors.fill: parent
                onClicked: {physics.stop();}
            }

        }

        Rectangle
        {
            width: 50
            height: width
            radius: 100
            color: back_area.containsMouse?"lightgrey" :"grey"
            Text{
                anchors.centerIn: parent
                text: "BACK"
            }

            MouseArea
            {
                id: back_area
                hoverEnabled: true

                anchors.fill: parent
                onClicked: {page.currentIndex = 0;
                    physics.stop();}
            }

        }



    }


    Row
    {

        id: gaugerow
        anchors.top:position.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        spacing: 20

        CircularGauge
        {

            maximumValue: 240
            value: speed_g
            width: 200
            height: width
            id: speed_tacho
            style: DashboardGaugeStyle{}
        }


        CircularGauge
        {


            maximumValue: 9
            value: rpm_g
            width: 200
            height: width
            id: rpm_tacho
            style: TachometerStyle{}


        }

    }

}
