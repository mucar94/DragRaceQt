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
    bool running;
    QTimer timer;
signals:
    void rpm_update(qreal rpm);
    void v_update(qreal v);
    void a_update(qreal a);
    void s_update(qreal s);
public slots:
    void start();
    void stop();
    void step();
    void shift_up();
};

#endif // CARPHYSICS_H
