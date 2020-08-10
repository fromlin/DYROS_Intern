#include "ros_connect.h"
#include <sstream>


#define min(x,y) (((x) < (y)) ? (x) : (y))
#define max(x,y) (((x) > (y)) ? (x) : (y))


ros_connect::ros_connect(QObject *parent, ros::NodeHandle &nh) : QObject(parent)
{
    button_pub = nh.advertise<std_msgs::String>("/dyros_red/command",100);
    switch_pub = nh.advertise<std_msgs::String>("/mode/command", 100);
    joint_sub = nh.subscribe("/tocabi/jointstates",1,&ros_connect::joint_cb,this);
    sensor_sub = nh.subscribe("/mujoco_ros_interface/sensor_states",1,&ros_connect::sensor_cb,this);
    time_sub = nh.subscribe("/tocabi/time",1,&ros_connect::time_cb,this);
    m_Q=parent;

    pos_sub = nh.subscribe("/tocabi/point",1,&ros_connect::pos_cb,this);
    tt=0;

    task_pub = nh.advertise<tocabi_controller::TaskCommand>("/tocabi/taskcommand", 100);

    joystick_sub = nh.subscribe("/controller/joystick_states",1,&ros_connect::joystick_cb, this);

    char buf[128];
    char buf2[128];
        std::sprintf(buf, "%6.2f", 15.48721241);
        std::sprintf(buf2,"t%d", 1);
        m_Q->findChild<QObject*>(buf2)->setProperty("text",buf);
}

void ros_connect::TaskHandle_gui(){

}

void ros_connect::TaskHandle(const sensor_msgs::Joy::ConstPtr& msg){
    tocabi_controller::TaskCommand task_msg;

    task_msg.roll = msg->axes[0];
    task_msg.pitch = msg->axes[1];

    task_pub.publish(task_msg);
}


void ros_connect::button_ros(int id, QString msg){
    id+=1;
    std_msgs::String msg_;
    msg_.data = msg.toUtf8().constData();

    button_pub.publish(msg_);
}



void ros_connect::switch_ros(int id, char* msg){
    id+=1;
    std_msgs::String msg_;
    msg_.data = msg;
}



double ros_connect::t_x(){

    return tt;
}



void ros_connect::pos_cb(geometry_msgs::PolygonStampedConstPtr msg){
    int scale = 500;

    double foot_x = 0.28;
    double foot_h = 0.1;
    double com_l = 0.05;

    foot_x = com_l;
    foot_h = com_l;

    int foot_dis_x_max = 600 - foot_x*scale;
    int foot_dis_y_max = 300 - foot_h*scale;
    int com_dis_x_max = 600 - com_l*scale;
    int com_dis_y_max = 300 - com_l*scale;



    m_Q->findChild<QObject*>("rec1")->setProperty("width",foot_x*scale);
    m_Q->findChild<QObject*>("rec1")->setProperty("height",foot_h*scale);
    m_Q->findChild<QObject*>("rec2")->setProperty("width",foot_x*scale);
    m_Q->findChild<QObject*>("rec2")->setProperty("height",foot_h*scale);
    m_Q->findChild<QObject*>("com1")->setProperty("width",com_l*scale);
    m_Q->findChild<QObject*>("com1")->setProperty("height",com_l*scale);


    //point 1 -> right foot
    int x = min(msg->polygon.points[1].x*scale+foot_dis_x_max*0.5 - foot_x*scale*0.5, foot_dis_x_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec1")->setProperty("x",x);

    x = min(msg->polygon.points[1].y*scale+foot_dis_y_max*0.5 - foot_h*scale*0.5,foot_dis_y_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec1")->setProperty("y",x);




    // point 2 -> left foot
    x = min(msg->polygon.points[2].x*scale+foot_dis_x_max*0.5 - foot_x*scale*0.5,foot_dis_x_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec2")->setProperty("x",x);

    x = min(msg->polygon.points[2].y*scale+foot_dis_y_max*0.5 - foot_h*scale*0.5,foot_dis_y_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec2")->setProperty("y",x);




    foot_x = 0.26;
    foot_h = 0.1;
    double dis_x=0.0317;



    m_Q->findChild<QObject*>("rec3")->setProperty("width",foot_x*scale);
    m_Q->findChild<QObject*>("rec3")->setProperty("height",foot_h*scale);

    x = min(msg->polygon.points[1].x*scale+foot_dis_x_max*0.5 - foot_x*scale*0.5 - dis_x*scale, foot_dis_x_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec3")->setProperty("x",x);

    x = min(msg->polygon.points[1].y*scale+foot_dis_y_max*0.5 - foot_h*scale*0.5,foot_dis_y_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec3")->setProperty("y",x);




    m_Q->findChild<QObject*>("rec4")->setProperty("width",foot_x*scale);
    m_Q->findChild<QObject*>("rec4")->setProperty("height",foot_h*scale);

    x = min(msg->polygon.points[2].x*scale+foot_dis_x_max*0.5 - foot_x*scale*0.5- dis_x*scale, foot_dis_x_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec4")->setProperty("x",x);

    x = min(msg->polygon.points[2].y*scale+foot_dis_y_max*0.5 - foot_h*scale*0.5,foot_dis_y_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("rec4")->setProperty("y",x);






    //point 0 com position

    x = min(msg->polygon.points[0].x*scale+com_dis_x_max*0.5 - com_l*scale*0.5,com_dis_x_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("com1")->setProperty("x",x);

    x = min(msg->polygon.points[0].y*scale+com_dis_y_max*0.5 - com_l*scale*0.5,com_dis_y_max);
    x = max(x,0.0);
    m_Q->findChild<QObject*>("com1")->setProperty("y",x);
}



void ros_connect::update(){
    ros::spinOnce();
}



void ros_connect::time_cb(std_msgs::Float32ConstPtr msg){
    char buf[128];
    std::sprintf(buf, "%8.4f",msg->data);
    m_Q->findChild<QObject*>("time_text")->setProperty("text",buf);
}



float ros_connect::pp(float val){
    if(val < 0 ){
        return (val*-1.0)/150.0;
    }
    else{
        return val/150.0;
    }

}



void ros_connect::sensor_cb(mujoco_ros_msgs::SensorStateConstPtr msg){
    char buf[128];
    char buf2[128];

    for(int i=0;i<4;i++){
        for(int j=0;j<3;j++)
        {
            std::sprintf(buf, "%8.3f", msg->sensor[i+4].data[j]);
            std::sprintf(buf2,"t%d", 32+3*i+j);
            m_Q->findChild<QObject*>(buf2)->setProperty("text",buf);

            std::sprintf(buf,"#%02X0000", (int)(pp(msg->sensor[i+4].data[j])*256.0));
            m_Q->findChild<QObject*>(buf2)->setProperty("color",buf);

            std::sprintf(buf2,"p%d", 32+3*i+j);
            float ratio = 1.0;
            if((i==0)||(i==2))
            {
                if(j==2){
                    ratio = 0.3;
                }
            }
            m_Q->findChild<QObject*>(buf2)->setProperty("value",ratio*pp(msg->sensor[i+4].data[j]));
        }
    }
}



void ros_connect::joint_cb(sensor_msgs::JointStateConstPtr msg){
    char buf[128];
    char buf2[128];

    for(int i=0;i<31;i++){
        std::sprintf(buf, "%8.3f", msg->effort[i]);
        std::sprintf(buf2,"t%d", i+1);
        m_Q->findChild<QObject*>(buf2)->setProperty("text",buf);


        std::sprintf(buf,"#%02X0000", (int)(pp(msg->effort[i])*256.0));
        m_Q->findChild<QObject*>(buf2)->setProperty("color",buf);

        std::sprintf(buf2,"p%d", i+1);
        m_Q->findChild<QObject*>(buf2)->setProperty("value",pp(msg->effort[i]));
    }

    for(int i=0;i<31;i++){

    }
}



void ros_connect::joystick_cb(const sensor_msgs::Joy::ConstPtr& msg){
    char buf[128];
    char buf2[128];

    // axes
    for(int i=0;i<4;i++){
        float dot=(msg->axes[i])*100.0;
        std::sprintf(buf, "%8.3f", dot);
        std::sprintf(buf2,"t%d", i+46);
        m_Q->findChild<QObject*>(buf2)->setProperty("text",buf);

        std::sprintf(buf,"#%02X0000", (int)(pp(dot)*256.0));
        m_Q->findChild<QObject*>(buf2)->setProperty("color",buf);

        std::sprintf(buf2,"p%d", i+44);
        m_Q->findChild<QObject*>(buf2)->setProperty("value",dot/200.0 + 0.5);
    }
    for (int i=4; i<6; i++){
        std::sprintf(buf2,"b%d", i+2);
        if(msg->axes[i] < 0.0)      m_Q->findChild<QObject*>(buf2)->setProperty("checked", true);
        else                        m_Q->findChild<QObject*>(buf2)->setProperty("checked", false);
    }

    for (int i=8; i<10; i++){
        std::sprintf(buf2,"b%d", i);
        if(msg->axes[i-2] > 0.5)    m_Q->findChild<QObject*>(buf2)->setProperty("checked", true);
        else                        m_Q->findChild<QObject*>(buf2)->setProperty("checked", false);
        std::sprintf(buf2,"b%d", i+2);
        if(msg->axes[i-2] < -0.5)   m_Q->findChild<QObject*>(buf2)->setProperty("checked", true);
        else    m_Q->findChild<QObject*>(buf2)->setProperty("checked", false);
    }


    // buttons
    for(int j=0; j<6; j++){
        std::sprintf(buf,"b%d", j);
        if(msg->buttons[j])         m_Q->findChild<QObject*>(buf)->setProperty("checked", true);
        else                        m_Q->findChild<QObject*>(buf)->setProperty("checked", false);
    }

    for(int j=12; j<17; j++){
        std::sprintf(buf,"b%d", j);
        if(msg->buttons[j-6])         m_Q->findChild<QObject*>(buf)->setProperty("checked", true);
        else                        m_Q->findChild<QObject*>(buf)->setProperty("checked", false);
    }
    TaskHandle(msg);
}











