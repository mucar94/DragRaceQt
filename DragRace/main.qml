import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1280
    height: 720


    title: qsTr("DragRaceQt")


    StackLayout {
        width: parent.width
        height: parent.height
        id: page
        anchors.fill: parent
        currentIndex: 0
        MainMenuPage{
            //0
            id: mainmenu_p
        }

        HighscorePage{
            //1
        }

        SelectCarPage{
            //2
        }

        DemoPage{
            //3
        }
    }
}
