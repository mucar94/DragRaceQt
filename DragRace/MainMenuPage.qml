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
            height: titel_rect.height
            width: titel_rect.width
        }
    }

    StackView
    {
        id: stack
        width: root.width * 0.25
        height: root.height * 0.9
        anchors.verticalCenter: parent.verticalCenter

        initialItem: mainselect

        delegate: StackViewDelegate
        {
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            replaceTransition: StackViewTransition
            {
                PropertyAnimation
                {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 500
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 100
                }
            }
        }
    }

    Component
{
        id: mainselect
        Item
    {
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
                    mouse.onClicked: page.currentIndex = 2
                }

                MenuButton
                {
                    text: "MEHRSPIELER"
                    imagesource: mouse.containsMouse ?"qrc:/picture/Wmultiplyr.png" :"qrc:/picture/multiplyr.png"
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
}

