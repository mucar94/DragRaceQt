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
        property double position;
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

        SelectCarPageMultiplayer{
            //3
        }

        GameSingleplayer{
            id: game
            //4
        }

        GameMultiplayer{
            id: game_multiplayer
            //5
        }
    }

    //Component.onCompleted: physics.start()
}
