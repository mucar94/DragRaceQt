import QtQuick 2.7
Rectangle
{
    width:
    Row{

        Rectangle{
            id: textrect
            width: parent.width * 0.8
            color: "blue"
            height: width *0.2

        }

        Rectangle{
            color: "black"
            width: parent.width * 0.2
            height: parent.height
        }
    }

}
