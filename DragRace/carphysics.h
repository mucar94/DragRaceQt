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
    std::list<float> v_list;
    float v_list_average;
    float v;
    float s;
    float rpm;
    std::list<float> rpm_list;
    float rpm_list_average;
    float t;
    bool running;
    int timer_value = 33;
    QTimer timer;
signals:
    void end_of_race(qreal t);
    void rpm_update(qreal rpm);
    void v_update(qreal v);
    void a_update(qreal a);
    void s_update(qreal s);
    void t_update(qreal t);
public slots:
    void start();
    void stop();
    void step();
    void shift_up();
};

#endif // CARPHYSICS_H
