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

#include <QGuiApplication>
#include <QQuickView>

#include "graph.h"
#include <QtQml/QQmlContext>

#include <QTimer>
#include "carphysics.h"
#include <QShortcut>


int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);

    qmlRegisterType<Graph>("Graph", 1, 0, "Graph");

    QQuickView view;
    view.resize(800, 900);
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:///scenegraph/graph/main.qml"));
    view.show();

    CarPhysics car;
    QTimer timer;
    QObject::connect(&timer, SIGNAL(timeout()), &car, SLOT(step()));
    timer.start(150);


    QList<QQuickItem*> childitems = view.rootObject()->childItems();
    Graph* rpm_graph = (Graph*) childitems[0];
    Graph* a_graph = (Graph*) childitems[1];
    Graph* v_graph = (Graph*) childitems[2];
    Graph* s_graph = (Graph*) childitems[3];

    QWidget* shift_up_button = (QWidget*) childitems[4];

    QObject::connect(shift_up_button, SIGNAL(clicked()), &car, SLOT(shift_up()));

    QShortcut* shortcut = new QShortcut(QKeySequence("A"),shift_up_button);
    //shortcut.setKey("C");

    QObject::connect(shortcut, SIGNAL(activated()), &car, SLOT(shift_up()));

    QObject::connect(&car, SIGNAL(rpm_update(qreal)), rpm_graph, SLOT(appendSampleShifting(qreal)));
    QObject::connect(&car, SIGNAL(a_update(qreal)), a_graph, SLOT(appendSampleShifting(qreal)));
    QObject::connect(&car, SIGNAL(v_update(qreal)), v_graph, SLOT(appendSampleShifting(qreal)));
    QObject::connect(&car, SIGNAL(s_update(qreal)), s_graph, SLOT(appendSampleShifting(qreal)));



    return a.exec();
}
