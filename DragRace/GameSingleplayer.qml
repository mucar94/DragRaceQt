import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import CarPhysics 1.0
Item
{

    anchors.fill: parent
    property alias physics: physics
    property alias finishtimelable: finishtimelable

    property real speed_g;
    property real position_g;
    property real rpm_g;
    property real time_g;

    Timer {
        id: timer
        interval: 1
        repeat: true
        running: true
        onTriggered: {
            physics.step();
        }

    }

    CarPhysics{
        id: physics
        onV_update: speed_g = v*3.6
        onS_update:{ position_g = s;
                     car.position = s;
                     //racecar.childAt(racecar.currentIndex).fontwheel.rotation.angle=s*100
                    }
        onRpm_update: rpm_g = rpm
        onT_update: time_g = t
        onEnd_of_race:  finishtimelable.text=t.toFixed(3)
    }

    Image {
        width: 3240*15; height: 1080
        x: racecar.x - 2000 - position_g*100
//        y: redracecar.y
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10

        source : "qrc:/picture/racetrack.jpg"
        fillMode: Image.TileHorizontally

//        Behavior on x { SmoothedAnimation { velocity: 20000 } }
//        Behavior on y { SmoothedAnimation { velocity: 200 } }
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



    Row
    {

        id: gaugerow
        anchors.top:timelable.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        spacing: 20

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


    Keys.onUpPressed: physics.shift_up();

}
