#ifndef CARPHYSICS_H
#define CARPHYSICS_H

#include <QObject>

class CarPhysics : public QObject
{
    Q_OBJECT
public:
    explicit CarPhysics(QObject *parent = 0);
    int gear;
    float a;
    float v;
    float s;
    float rpm;
signals:
    rpm_update(qreal);
    v_update(qreal);
    a_update(qreal);
    s_update(qreal);
public slots:
    step();
};

#endif // CARPHYSICS_H
