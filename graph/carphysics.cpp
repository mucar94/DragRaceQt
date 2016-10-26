#include "carphysics.h"
#include <list>
#include <QDebug>

CarPhysics::CarPhysics(QObject *parent) : QObject(parent)
{
    gear = 1;
    a = 0;
    v = 0;
    s = 0;
    rpm = 0;
}

CarPhysics::step(){

    float passed_time = 0.15;

    float v_for_a_max_of_gear_1=0;

    float a_max_of_gear_1=8;

    a = a_max_of_gear_1;
    v = v + a * passed_time;
    s = s + v * passed_time;

    float gui_max_a = 10;
    float gui_max_v = 83;
    float gui_max_s = 402;
    float gui_max_rpm = 80000;

    qInfo() << "a: " << a << "   v: "<< v << "   s: "<< s << "   rpm: "<< rpm ;

    emit rpm_update(1-rpm/gui_max_rpm);
    emit a_update(1-a/gui_max_a);
    emit v_update(1-v/gui_max_v);
    emit s_update(1-s/gui_max_s);
}
