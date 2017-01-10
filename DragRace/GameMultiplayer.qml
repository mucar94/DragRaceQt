import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import CarPhysics 1.0
Item
{

    anchors.fill: parent
    property alias physics: physics
    property alias physics2: physics2
    property alias finishtimelable: finishtimelable

    property real speed_g;
    property real position_g;
    property real rpm_g;
    property real time_g;

    property real speed_g2;
    property real position_g2;
    property real rpm_g2;
    property real time_g2;


    Keys.onUpPressed: physics.shift_up();
    Keys.onSpacePressed: physics2.shift_up();

    Timer {
        id: timer
        interval: 1
        repeat: true
        running: true
        onTriggered: {
            physics.step();
            physics2.step();
        }

    }

    CarPhysics{
        id: physics
        onV_update: speed_g = v*3.6
        onS_update: {position_g = s
                     car.position = s;
                    }
        onRpm_update: rpm_g = rpm
        onT_update: time_g = t
        onEnd_of_race: { finishtimelable.text= "player 1 wins " + t.toFixed(3)
                         physics2.stop()
                       }
    }
    CarPhysics{
        id: physics2
        onV_update: speed_g2 = v*3.6
        onS_update: position_g2 = s
        onRpm_update: rpm_g2 = rpm
        onT_update: time_g2 = t
        onEnd_of_race: { finishtimelable.text= "player 2 wins " + t.toFixed(3)
                         physics.stop()
                       }
    }

    Image {
        width: 3240*15; height: 1080
        x: - 2000 - position_g*100
//        y: redracecar.y
        anchors.bottom: parent.bottom
//        anchors.bottomMargin: -10

        source : "qrc:/picture/racetrack.jpg"
        fillMode: Image.TileHorizontally

//        Behavior on x { SmoothedAnimation { velocity: 20000 } }
//        Behavior on y { SmoothedAnimation { velocity: 200 } }
    }


    StackLayout {
        id: racecar2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -200 + (position_g2 - position_g)*100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 110
        currentIndex: car.actcar
        height: 400
        Car_lancer_evo{
            //0
        }
        Car_r8{
            //1
        }
        Car_mx5{
            //2
        }
    }


    Image {
        width: 3240*15; height: 1080
        x: - 2000 - position_g*100
//        y: redracecar.y
        anchors.bottom: parent.bottom
//        anchors.bottomMargin: -10

        source : "qrc:/picture/racetrack_barrier.png"
        fillMode: Image.TileHorizontally

//        Behavior on x { SmoothedAnimation { velocity: 20000 } }
//        Behavior on y { SmoothedAnimation { velocity: 200 } }
    }


    StackLayout {
        id: racecar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -50
        currentIndex: car.actcar
        height: 400
        Car_lancer_evo{
            //0
        }
        Car_r8{
            //1
        }
        Car_mx5{
            //2
        }
    }


    Text
    {
        id: timelable
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20

        anchors.top: title.bottom
        text: "time: " + time_g.toFixed(2)
        color: "white"
    }
    Text
    {
        id: finishtimelable
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20

        anchors.top: gaugerow.bottom
        text: ""
        color: "white"
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


    Row
    {

        id: gaugerow
        anchors.top:timelable.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        spacing: 20


        // Spieler 2

        CircularGauge
        {

            maximumValue: 280
            value: speed_g2
            width: 200
            height: width
            id: speed_tacho2
            style: DashboardGaugeStyle{}
        }


        CircularGauge
        {


            maximumValue: 9
            value: rpm_g2/1000
            width: 200
            height: width
            id: rpm_tacho2
            style: TachometerStyle{}


        }


        // Spieler 1

        CircularGauge
        {

            maximumValue: 280
            value: speed_g
            width: 200
            height: width
            id: speed_tacho
            style: DashboardGaugeStyle{}
        }


        CircularGauge
        {


            maximumValue: 9
            value: rpm_g/1000
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

}
