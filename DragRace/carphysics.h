#ifndef CARPHYSICS_H
#define CARPHYSICS_H

#include <QObject>
#include <QTimer>

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
    QTimer timer;
signals:
    void rpm_update(qreal);
    void v_update(qreal);
    void a_update(qreal);
    void s_update(qreal);
public slots:
    void start();
    void step();
    void shift_up();
};

#endif // CARPHYSICS_H
