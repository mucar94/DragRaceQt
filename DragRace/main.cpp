#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "carphysics.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    CarPhysics car;

    return app.exec();
}
