#include "carphysics.h"
#include <list>
#include <QDebug>

CarPhysics::CarPhysics(QObject *parent) : QObject(parent)
{
    running=false;
    QObject::connect(&timer, SIGNAL(timeout()), this, SLOT(step()));
    timer.start(timer_value);
}

void CarPhysics::start(){
    gear = 1;
    a = 0;
    v = 0;
    s = 0;
    rpm = 0;
    t_millisecondes=0;
    running=true;

}

void CarPhysics::stop(){
    running=false;
}

void CarPhysics::shift_up(){

    if(gear<5 && running){
        //verlangsamen bei zu frühem schalten
        float speed_punishment=0.0f;
        if( rpm<7000.0f && rpm>6000.0f){
            speed_punishment=0.003f*rpm-21.0f;
        }
        if(rpm < 6000.0f){
            speed_punishment=-3.0f;
        }

        v += speed_punishment;

        if(v<0){
            v=0;
        }

        //schalten
        gear++;
    }
}

void CarPhysics::step(){
    if(running){
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
        rpm_per_m_per_s[4]=110;
        rpm_per_m_per_s[5]=80;

        float delta_t = timer_value / 1000.0f;

        t_millisecondes += timer_value;

        //beschleunigung konstant für jeden gang
        a = a_max[gear];

        //geschwindigkeit erhöhen (ausser drehzahlbegrenzer ist aktiv)
        if (rpm<7000){
            v = v + a * delta_t;
        }
        else{
            v = v - ( ( rand() % 100 ) / 200 + 0.7 );
        }

        //vorwärtsbewegen mit berechneter geschwindigkeit
        s = s + v * delta_t;

        //zeit anhalten nach viertel meile
        if(s>402){
            running=false;
            emit end_of_race(t_millisecondes/1000.0f);
        }

        //drehzahl bestimmen abhängig von gang und geschwindigkeit
        rpm= v * rpm_per_m_per_s[gear];


        //tiefpass für rpm
        rpm_list.push_front(rpm);
        if (rpm_list.size()>rpm_lowpass){
            rpm_list.pop_back();
        }
        rpm_list_average=0;
        for (std::list<float>::iterator it=rpm_list.begin(); it != rpm_list.end(); ++it){
            rpm_list_average = rpm_list_average+*it;
        }
        rpm_list_average = rpm_list_average/rpm_list.size();

        //tiefpass für v
        v_list.push_front(v);
        if (v_list.size()>v_lowpass){
            v_list.pop_back();
        }
        v_list_average=0;
        for (std::list<float>::iterator it=v_list.begin(); it != v_list.end(); ++it){
            v_list_average = v_list_average+*it;
        }
        v_list_average = v_list_average/v_list.size();


        if(signalupdate_prescaler==0){
            emit rpm_update(rpm_list_average);
            emit a_update(a);
            emit v_update(v_list_average);
            emit s_update(s);
            emit t_update(t_millisecondes/1000.0f);
            //qInfo() << "a: " << a << "   v: "<< v << "   s: "<< s << "   rpm: "<< rpm << "   t: "<< t_millisecondes/1000.0f ;
            signalupdate_prescaler = signalupdate_prescaler_maxvalue;
        }
        signalupdate_prescaler-=1;
    }
}
