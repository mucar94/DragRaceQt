import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

import CarPhysics 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("DragRaceQt")

    CarPhysics
    {
        Component.onCompleted: start()
    }


StackLayout {
    id: layout
    anchors.fill: parent
    currentIndex: 0
    MainMenuPage{
        //0
        id: mainmenu_p
    }

    SinglePlayerPage{
        //1
        id:singleplayer_p
    }

    MultiPlayerPage{
        //2
        id: multiplayer_p
    }

    HighscorePage{
        //3
        id: highscore_p
    }

    SelectCarPage{
        //4
        id: selectcar_p
    }

}


}
