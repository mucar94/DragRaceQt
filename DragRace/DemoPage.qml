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

    Image {
        width: 3240*15; height: 1080
        x: redracecar.x - 2000 - position_g*100
//        y: redracecar.y
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10

        source : "qrc:/picture/racetrack.jpg"
        fillMode: Image.TileHorizontally

//        Behavior on x { SmoothedAnimation { velocity: 20000 } }
//        Behavior on y { SmoothedAnimation { velocity: 200 } }
    }

    Image{
        id: redracecar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -50
        height: 400
        source : "qrc:/picture/vehicles/lancer_evo.png"
        fillMode: Image.PreserveAspectFit

        Image{
            id: backwheel
            x:148
            y:228
            height: 85
            width: 85
            source : "qrc:/picture/vehicles/lancer_evo_wheel.png"
            transform: Rotation { origin.x: 42.5; origin.y: 42.5; angle: position_g*100}

        }
        Image{
            id: frontwheel
            x:584
            y:230
            height: 85
            width: 85
            source : "qrc:/picture/vehicles/lancer_evo_wheel.png"
            transform: Rotation { origin.x: 42.5; origin.y: 42.5; angle: position_g*100}

        }

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

    Rectangle
    {
        id: shiftrect
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30
        width: 125
        height: width
        radius: 250
        color: shift_area.containsMouse ? "red" : "black"
        Text{
            anchors.centerIn: parent
            text: "SHIFT"
            color: "white"
            font.bold: true
            font.pointSize:shiftrect.width * 0.15 <= 0 ? 1 : shiftrect.width * 0.15

        }

        MouseArea
        {
            id: shift_area
            hoverEnabled: true

            anchors.fill: parent
            onClicked: physics.shift_up();
        }

    }

    focus: true
    Keys.onRightPressed: redracecar.anchors.horizontalCenterOffset = redracecar.anchors.horizontalCenterOffset + 10
    Keys.onLeftPressed: redracecar.anchors.horizontalCenterOffset = redracecar.anchors.horizontalCenterOffset - 10
    Keys.onUpPressed: physics.shift_up();
    Keys.onDownPressed: physics.shift_down();
}
