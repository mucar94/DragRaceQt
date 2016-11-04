/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

import Graph 1.0

Item {
    id: item1
    width: 800
    height: 1000
    property alias graph_1: graph_1


    Graph {
        id: graph_1
        x: 8
        y: 8
        width: 784
        height: 200

        Component.onCompleted: {
            for (var i=0; i<100; ++i)
                appendSample(1);
        }
    }
    Graph {
        id: graph_2
        x: 8
        y: 216
        width: 784
        height: 200

        Component.onCompleted: {
            for (var i=0; i<100; ++i)
                appendSample(1);
        }
    }
    Graph {
        id: graph_3
        x: 8
        y: 424
        width: 784
        height: 200

        Component.onCompleted: {
            for (var i=0; i<100; ++i)
                appendSample(1);
        }
    }
    Graph {
        id: graph_4
        x: 8
        y: 632
        width: 784
        height: 200

        Component.onCompleted: {
            for (var i=0; i<100; ++i)
                appendSample(1);
        }
    }

    Rectangle {
        id: button

        property bool checked: false
        property alias text : buttonText.text
        Accessible.name: text
        Accessible.description: "This button does " + text
        Accessible.role: Accessible.Button
        Accessible.onPressAction: {
            button.clicked()
        }

        signal clicked

        width: buttonText.width + 20
        height: 30
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0;
                color: button.focus ? "red" : "blue" }
        }

        radius: 5
        antialiasing: true

        Text {
            id: buttonText
            text: "shift up"
            anchors.centerIn: parent
            font.pixelSize: parent.height * .5
            style: Text.Sunken
            color: "white"
            styleColor: "black"
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        Keys.onSpacePressed: clicked()
    }

}
