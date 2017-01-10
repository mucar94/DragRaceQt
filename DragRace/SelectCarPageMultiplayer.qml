
import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle
{


    Text{
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        text: "<"
        font.pointSize: 40
        color: mouse2.containsMouse ? "black" : "red"

        MouseArea
        {
            id: mouse2
            anchors.fill: parent
            onClicked: {redracecar.currentIndex = (redracecar.currentIndex + 1 ) %3;
                       car.actcar = redracecar.currentIndex;}
        }

    }

    Text{
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right


        text: ">"
        font.pointSize: 40
        color: mouse1.containsMouse ? "black" : "red"

        MouseArea
        {
            id: mouse1
            anchors.fill: parent
            onClicked: {redracecar.currentIndex = (redracecar.currentIndex + 1 ) %3;
                       car.actcar = redracecar.currentIndex ;}

        }
    }

    StackLayout {
        id: redracecar
        anchors.centerIn: parent
        height: 400
        currentIndex: 0
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




    Rectangle
    {

       id: back
       height: parent.height/5
       width: parent.width/5
       anchors.top: redracecar.bottom
       anchors.left: parent.left


        MenuButton
        {

            text: "ZURÜCK"
            mouse.onClicked: page.currentIndex = 0
            imagesource: "qrc:/picture/back.png"
        }


    }

    Rectangle
    {

       height: parent.height/5
       width: parent.width/5
       anchors.top: redracecar.bottom
       anchors.left: back.right


        MenuButton
        {

            text: "START"
            mouse.onClicked: {
                page.currentIndex = 5;

                console.log("reset_physics");
                game_multiplayer.physics.start();
                game_multiplayer.physics2.start();

                game_multiplayer.focus = true;
            }
            imagesource: "qrc:/picture/start.png"
        }
    }






}
