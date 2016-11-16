import QtQuick 2.7
import QtQuick.Controls 1.4

Rectangle
{
    id: root
    height: parent.height
    width: parent.width
    color: "#fafcef"


        Image
        {
            mipmap: true
            smooth: true
            antialiasing: true
            source : "qrc:/picture/background_car.jpg"
            anchors.fill: parent
        }


    Item
    {
        id: titel_rect
        width: parent.width * 0.5
        height: width / 4
        anchors.right: parent.right
        anchors.rightMargin: width * 0.05
        anchors.topMargin: height * 0.1
        anchors.top: parent.top

        Image
        {
            fillMode: Image.PreserveAspectFit
            mipmap: true
            smooth: true
            antialiasing: true
            source: "qrc:/picture/Titel.png"
            height: titel_rect.height  // TODO : skalierbarkeit
            width: titel_rect.width
        }
    }

    StackView {
        id: stack
        initialItem: mainselect
        anchors.verticalCenter: parent.verticalCenter

                delegate: StackViewDelegate {
                function transitionFinished(properties)
                {
                    properties.exitItem.opacity = 1
                }

                pushTransition: StackViewTransition {
                    PropertyAnimation {
                        target: enterItem
                        property: "opacity"
                        from: 0
                        to: 1
                    }
                    PropertyAnimation {
                        target: exitItem
                        property: "opacity"
                        from: 1
                        to: 0
                    }
                }
            }
        }

        Component{
            id: mainselect
            Item{
                anchors.verticalCenter: parent.verticalCenter

                Column
                {
                    width: root.width*0.25
                    leftPadding :  root.width/20
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: root.width/128

                    MenuButton
                    {
                        imagesource:  mouse.containsMouse ?"qrc:/picture/Wsingleplyr.png" : "qrc:/picture/singleplyr.png"
                        text: "EINZELSPIELER"
                        mouse.onClicked: stack.replace(gamemodeselect_singleplyr)
                    }

                    MenuButton
                    {
                        text: "MEHRSPIELER"
                        imagesource: mouse.containsMouse ?"qrc:/picture/Wmultiplyr.png" :"qrc:/picture/multiplyr.png"
                        mouse.onClicked: stack.replace(gamemodeselect_multiplyr)
                    }

                    MenuButton
                    {
                        text: "DEMO"
                        imagesource: mouse.containsMouse ? "qrc:/picture/Wdemo.png" : "qrc:/picture/demo.png"
                        mouse.onClicked: page.currentIndex = 3
                    }

                    MenuButton
                    {
                        text: "HIGHSCORE"
                        mouse.onClicked: page.currentIndex = 1
                        imagesource: mouse.containsMouse ? "qrc:/picture/Whighscore.png": "qrc:/picture/highscore.svg"
                    }
                }
            }
        }


        Component{
            id: gamemodeselect_singleplyr
            Item{
                anchors.verticalCenter: parent.verticalCenter
                Column
                {
                    width: root.width*0.25
                    leftPadding : root.width/20
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: root.width/128

                    MenuButton
                    {
                        text: "ZEITRENNEN"
                        mouse.onClicked: page.currentIndex = 2
                        imagesource: mouse.containsMouse ? "qrc:/picture/Wtimerace.png": "qrc:/picture/timerace.png"

                    }

                    MenuButton
                    {
                        text: "1 GEGEN 1"
                        mouse.onClicked: page.currentIndex = 2
                        imagesource: mouse.containsMouse ? "qrc:/picture/W1v1.png":"qrc:/picture/1v1.png"
                    }

                    MenuButton
                    {
                        text: "ZURÜCK"
                        mouse.onClicked: stack.replace(mainselect)
                        imagesource: mouse.containsMouse ?"qrc:/picture/Wback.png": "qrc:/picture/back.png"
                    }
                }
            }
        }
        Component{
            id: gamemodeselect_multiplyr
            Item{
                anchors.verticalCenter: parent.verticalCenter
                Column
                {
                    width: root.width*0.25
                    leftPadding : root.width/20
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: root.width/128

                    MenuButton
                    {
                        text: "ZEITRENNEN"
                        mouse.onClicked: page.currentIndex = 2
                        imagesource: mouse.containsMouse ? "qrc:/picture/Wtimerace.png": "qrc:/picture/timerace.png"
                    }

                    MenuButton
                    {
                        text: "1 GEGEN 1"
                        mouse.onClicked: page.currentIndex = 2
                        imagesource: mouse.containsMouse ? "qrc:/picture/W1v1.png":"qrc:/picture/1v1.png"
                    }

                    MenuButton
                    {
                        text: "ZURÜCK"
                        mouse.onClicked: stack.replace(mainselect)
                        imagesource: mouse.containsMouse ?"qrc:/picture/Wback.png": "qrc:/picture/back.png"
                    }
                }
            }
        }
    }

