import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1280
    height: 720

    Item{
        id:car
         property int actcar;

    }


    Item{
        id:gamecontroller
        function reset_physics() {
            console.log("reset_physics");
            demopage.physics.start();
            demopage.timelable.color = "white";
           // demopage.timelable.text = "time: " + demopage.time_g.toFixed(2);
        }
    }

    title: qsTr("DragRaceQt")


    StackLayout {
        width: parent.width
        height: parent.height
        id: page
        anchors.fill: parent
        currentIndex: 0
        MainMenuPage{
            //0
        }

        HighscorePage{
            //1
        }

        SelectCarPage{
            //2
        }

        DemoPage{
            id: demopage
            //3
        }
    }

    //Component.onCompleted: physics.start()
}
