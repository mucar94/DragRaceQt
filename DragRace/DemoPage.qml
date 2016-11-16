import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import CarPhysics 1.0
Item{

    id: demogame


    property real speed_g;
    property real position_g;
    property real rpm_g;

    anchors.fill: parent
    CarPhysics
    {
        onV_update: speed_g = v*3
        onS_update: position_g = s
        onRpm_update: rpm_g = (rpm/1000)
        id: physics
    }

    Text{
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.pointSize: 50
        font.bold: true
        font.letterSpacing: 5
        text: "DEMO"
    }

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 20

        anchors.top: title.bottom
        text: "position: " + position_g
    }

    Row{

        id: controls
        anchors.top : gaugerow.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Rectangle{
            id: startrect
            width: 50
            height: width
            radius: 100
            color: "green"

            Text{
                anchors.centerIn: parent
                text: "START"
                font.bold: true
            }

            MouseArea{
                anchors.fill: parent
                onClicked: physics.start()
            }


        }

        Rectangle{
            id: shiftrect
            width: 50
            height: width
            radius: 100
            color: "black"
            Text{
                anchors.centerIn: parent
                text: "SHIFT"
                color: "white"
                font.bold: true
            }

            MouseArea{
                anchors.fill: parent
                onClicked: physics.shift_up();
            }

        }

        Rectangle{
            width: 50
            height: width
            radius: 100
            color: "grey"
            Text{
                anchors.centerIn: parent
                text: "BACK"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {page.currentIndex = 0;
                           physics.stop();}
            }

        }

    }


    Row{

        id: gaugerow
        anchors.centerIn: parent
        spacing: 20

        CircularGauge {

            maximumValue: 280
            value: speed_g
            width: 200
            height: width
            id: speed_tacho
            style: CircularGaugeStyle {


                tickmarkStepSize : 20

                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: "blue"

                }

            }
        }


        CircularGauge {


            maximumValue: 9
            value: rpm_g
            width: 200
            height: width
            id: rpm_tacho
            style: CircularGaugeStyle {
                tickmarkStepSize : 1

                needle: Rectangle {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: "blue"

                }



            }
        }



    }

}
