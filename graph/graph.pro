QT       += core gui quick

TARGET = graph

TEMPLATE = app

SOURCES += main.cpp \
    graph.cpp \
    noisynode.cpp \
    gridnode.cpp \
    linenode.cpp \
    carphysics.cpp

HEADERS += \
    graph.h \
    noisynode.h \
    gridnode.h \
    linenode.h \
    carphysics.h

RESOURCES += \
    graph.qrc

OTHER_FILES += \
    main.qml \
    shaders/noisy.vsh \
    shaders/noisy.fsh \
    shaders/line.fsh \
    shaders/line.vsh

target.path = $$[QT_INSTALL_EXAMPLES]/quick/scenegraph/graph
INSTALLS += target
