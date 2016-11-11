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

    qInfo() << "a: " << a << "   v: "<< v << "   s: "<< s << "   rpm: "<< rpm ;

    QObject::connect(&timer, SIGNAL(timeout()), this, SLOT(step()));
    timer.start(150);

}

void CarPhysics::shift_up(){

    //schalten
    if(gear<5)gear++;
}

void CarPhysics::step(){

//    float v_for_a_max[6];
    float a_max[6];
    float rpm_per_m_per_s[6];

//    v_for_a_max[1]=0;
//    v_for_a_max[2]=18.3;
//    v_for_a_max[3]=29.5;
//    v_for_a_max[4]=42.0;
//    v_for_a_max[5]=56.3;

    a_max[1]=9;
    a_max[2]=8.5;
    a_max[3]=8;
    a_max[4]=7.5;
    a_max[5]=7;

    rpm_per_m_per_s[1]=380;
    rpm_per_m_per_s[2]=230;
    rpm_per_m_per_s[3]=166;
    rpm_per_m_per_s[4]=125;
    rpm_per_m_per_s[5]=100;

    float passed_time = 0.15;


    //beschleunigung konstant für jeden gang
    a = a_max[gear];

    //geschwindigkeit erhöhen (ausser drehzahlbegrenzer ist aktiv)
    if (rpm<7000){
        v = v + a * passed_time;
    }

    //wand nach viertel meile
    if(s>402) v=0;

    //vorwärtsbewegen mit berechneter geschwindigkeit
    s = s + v * passed_time;

    //drehzahl bestimmen abhängig von gang und geschwindigkeit
    rpm= v * rpm_per_m_per_s[gear];


    qInfo() << "a: " << a << "   v: "<< v << "   s: "<< s << "   rpm: "<< rpm ;

    float gui_max_a = 10;
    float gui_max_v = 83;
    float gui_max_s = 402;
    float gui_max_rpm = 8000;

    emit rpm_update(1-rpm/gui_max_rpm);
    emit a_update(1-a/gui_max_a);
    emit v_update(1-v/gui_max_v);
    emit s_update(1-s/gui_max_s);
}
