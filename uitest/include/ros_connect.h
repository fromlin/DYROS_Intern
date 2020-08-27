#ifndef ROS_CONNECT_H
#define ROS_CONNECT_H

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "JointState.h"
#include "SensorState.h"
#include "Joy.h"
#include "TaskCommand.h"
#include "stdlib.h"
#include "iostream"
#include "geometry_msgs/Twist.h"
#include "VelocityCommand.h"


#include <QObject>
#include <QPoint>
#include <QDebug>
#include <sstream>
#include <std_msgs/Float32.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point32.h>
#include <geometry_msgs/PointStamped.h>
#include <VelocityCommand.h>
#include <geometry_msgs/PolygonStamped.h>
#include <math.h>
#define min(x, y) (((x) < (y)) ? (x) : (y))
#define max(x, y) (((x) > (y)) ? (x) : (y))

class ros_connect : public QObject
{
    Q_OBJECT
public:
    explicit ros_connect(QObject *parent, ros::NodeHandle &nh)
    {
        button_pub = nh.advertise<std_msgs::String>("/tocabi/command", 100);
        joint_sub = nh.subscribe("/tocabi/jointstates", 1, &ros_connect::joint_cb, this);
        sensor_sub = nh.subscribe("/mujoco_ros_interface/sensor_states", 1, &ros_connect::sensor_cb, this);
        time_sub = nh.subscribe("/tocabi/time", 1, &ros_connect::time_cb, this);
        m_Q = parent;

        pos_sub = nh.subscribe("/tocabi/point", 1, &ros_connect::pos_cb, this);
        tt = 0;

        joystick_sub = nh.subscribe("/controller/gui_command",1,&ros_connect::joystick_cb, this);

        com_pub = nh.advertise<std_msgs::String>("/tocabi/command", 100);
        task_pub = nh.advertise<tocabi_controller::TaskCommand>("/tocabi/taskcommand", 100);
        velcommand_pub = nh.advertise<tocabi_controller::VelocityCommand>("/tocabi/velcommand", 100);

        android_pub = nh.advertise<tocabi_controller::TaskCommand>("/tocabi/taskcommand", 100);
        android_sub  =  nh.subscribe("/controller/android_command", 1 , &ros_connect::android_cb,this);

        char buf[128];
        char buf2[128];
        std::sprintf(buf, "%6.2f", 15.48721241);
        std::sprintf(buf2, "t%d", 1);
        m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);
    };

    Q_INVOKABLE void click_ros(QString msg)
    {
        std::string str1 = msg.toStdString();
        const char *p = str1.c_str();

        if (strcmp(p, "left"))
        {
            ChangeConMode(-1);
        }
        if (strcmp(p, "right"))
        {
            ChangeConMode(1);
        }

        velcommand_pub.publish(velcmd_msg);
    };

    Q_INVOKABLE void vir_TaskHandle()
    {
        TaskHandle();
    }
    Q_INVOKABLE void rmmodxpad()
    {   
        std::string str = "rmmod xpad";
        const char *c = str.c_str();
        system(c);
    }
    Q_INVOKABLE void joyconfig()
    {
        std::string str = "xboxdrv --config /usr/share/doc/xboxdrv/examples/default.xboxdrv";
        const char *c1 = str.c_str();
        system(c1);
    }
    
    Q_INVOKABLE void virjoy(float x, float y, int i)
    {
        velcmd_msg.des_vel.resize(6);
        int arrarychange = i; // i = 0(left : pos ) or 2(right : rot) or 4 (optional pos) or 5 (optional rot)
        double axes[6] = {0, 0, 0, 0, 0, 0};

        if (i == 0 || i == 2)
        {
            axes[arrarychange] = (double)(x - 37.5) / 75;
            axes[arrarychange + 1] = (double)(y - 37.5) / 75;
        }
        else if (i == 4 || i == 5)
        {
            axes[arrarychange] = x;
        }

        switch (velcmd_msg.task_link)
        {
        case 0: // pos : COM rot : pelv
            velcmd_msg.des_vel[0] = axes[1] / -40.;
            velcmd_msg.des_vel[1] = axes[0] / -40.;
            velcmd_msg.des_vel[2] = ((axes[4]) / 40.); //com pos

            velcmd_msg.des_vel[3] = axes[2] / 4.;
            velcmd_msg.des_vel[4] = axes[3] / -4.;
            velcmd_msg.des_vel[5] = ((axes[5]) / -4.); //pelv rot
            break;

        case 1: // rot : upperbody
            velcmd_msg.des_vel[0] = 0;
            velcmd_msg.des_vel[1] = 0;
            velcmd_msg.des_vel[2] = 0;
            velcmd_msg.des_vel[3] = axes[2] / 4.;
            velcmd_msg.des_vel[4] = axes[3] / -4.;
            velcmd_msg.des_vel[5] = ((axes[5]) / -4.); //upperbody rot
            break;

        case 2: // righthand
            velcmd_msg.des_vel[0] = axes[1] / -8.;
            velcmd_msg.des_vel[1] = axes[0] / -8.;
            velcmd_msg.des_vel[2] = ((axes[4]) / 20.); //righthand pos

            velcmd_msg.des_vel[3] = axes[2] / 4.;
            velcmd_msg.des_vel[4] = axes[3] / -4.;
            velcmd_msg.des_vel[5] = ((axes[5]) / -4.); //righthand rot
            break;

        case 3: // lefthand
            velcmd_msg.des_vel[0] = axes[1] / -8.;
            velcmd_msg.des_vel[1] = axes[0] / -8.;
            velcmd_msg.des_vel[2] = ((axes[4]) / 20.); //lefthand pos

            velcmd_msg.des_vel[3] = axes[2] / 4.;
            velcmd_msg.des_vel[4] = axes[3] / -4.;
            velcmd_msg.des_vel[5] = ((axes[5]) / -4.); //lefthand rot
            break;

        default:
            break;
        }

        velcommand_pub.publish(velcmd_msg);
    };

    Q_INVOKABLE void button_ros(int id, QString msg)
    {
        std_msgs::String msg_;
        msg_.data = msg.toUtf8().constData();

        button_pub.publish(msg_);
    };
    

    Q_INVOKABLE void switch_ros(int id, char *msg){

    };

    Q_INVOKABLE void update()
    {
        ros::spinOnce();
    };

    Q_INVOKABLE double t_x(){
        return tt;
    };

    Q_INVOKABLE int tt;
    Q_INVOKABLE QString a;

    void joint_cb(sensor_msgs::JointStateConstPtr msg){
        char buf[128];
        char buf2[128];

        for (int i = 0; i < 31; i++){
            std::sprintf(buf, "%8.3f", msg->effort[i]);
            std::sprintf(buf2, "t%d", i + 1);
            m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

            std::sprintf(buf, "#%02X0000", (int)(pp(msg->effort[i]) * 256.0));
            m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

            std::sprintf(buf2, "p%d", i + 1);
            m_Q->findChild<QObject *>(buf2)->setProperty("value", pp(msg->effort[i]));
        }

        for (int i = 0; i < 31; i++){
        }
    };

    void sensor_cb(mujoco_ros_msgs::SensorStateConstPtr msg){
        char buf[128];
        char buf2[128];

        for (int i = 0; i < 4; i++){
            for (int j = 0; j < 3; j++){
                std::sprintf(buf, "%8.3f", msg->sensor[i + 4].data[j]);
                std::sprintf(buf2, "t%d", 32 + 3 * i + j);
                m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

                std::sprintf(buf, "#%02X0000", (int)(pp(msg->sensor[i + 4].data[j]) * 256.0));
                m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

                std::sprintf(buf2, "p%d", 32 + 3 * i + j);
                float ratio = 1.0;
                if ((i == 0) || (i == 2)){
                    if (j == 2){
                        ratio = 0.3;
                    }
                }
                m_Q->findChild<QObject *>(buf2)->setProperty("value", ratio * pp(msg->sensor[i + 4].data[j]));
            }
        }
    };

    void time_cb(std_msgs::Float32ConstPtr msg){
        char buf[128];
        std::sprintf(buf, "%8.4f", msg->data);
        m_Q->findChild<QObject *>("time_text")->setProperty("text", buf);
    };

    void pos_cb(geometry_msgs::PolygonStampedConstPtr msg){
        int scale = 500;

        double foot_x = 0.28;
        double foot_h = 0.1;
        double com_l = 0.05;

        foot_x = com_l;
        foot_h = com_l;

        int foot_dis_x_max = 600 - foot_x * scale;
        int foot_dis_y_max = 300 - foot_h * scale;
        int com_dis_x_max = 600 - com_l * scale;
        int com_dis_y_max = 300 - com_l * scale;

        m_Q->findChild<QObject *>("rec1")->setProperty("width", foot_x * scale);
        m_Q->findChild<QObject *>("rec1")->setProperty("height", foot_h * scale);
        m_Q->findChild<QObject *>("rec2")->setProperty("width", foot_x * scale);
        m_Q->findChild<QObject *>("rec2")->setProperty("height", foot_h * scale);
        m_Q->findChild<QObject *>("com1")->setProperty("width", com_l * scale);
        m_Q->findChild<QObject *>("com1")->setProperty("height", com_l * scale);

        //point 1 -> right foot
        int x = min(msg->polygon.points[1].x * scale + foot_dis_x_max * 0.5 - foot_x * scale * 0.5, foot_dis_x_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec1")->setProperty("x", x);

        x = min(msg->polygon.points[1].y * scale + foot_dis_y_max * 0.5 - foot_h * scale * 0.5, foot_dis_y_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec1")->setProperty("y", x);

        // point 2 -> left foot
        x = min(msg->polygon.points[2].x * scale + foot_dis_x_max * 0.5 - foot_x * scale * 0.5, foot_dis_x_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec2")->setProperty("x", x);

        x = min(msg->polygon.points[2].y * scale + foot_dis_y_max * 0.5 - foot_h * scale * 0.5, foot_dis_y_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec2")->setProperty("y", x);

        foot_x = 0.26;
        foot_h = 0.1;
        double dis_x = 0.0317;

        m_Q->findChild<QObject *>("rec3")->setProperty("width", foot_x * scale);
        m_Q->findChild<QObject *>("rec3")->setProperty("height", foot_h * scale);

        x = min(msg->polygon.points[1].x * scale + foot_dis_x_max * 0.5 - foot_x * scale * 0.5 - dis_x * scale, foot_dis_x_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec3")->setProperty("x", x);

        x = min(msg->polygon.points[1].y * scale + foot_dis_y_max * 0.5 - foot_h * scale * 0.5, foot_dis_y_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec3")->setProperty("y", x);

        m_Q->findChild<QObject *>("rec4")->setProperty("width", foot_x * scale);
        m_Q->findChild<QObject *>("rec4")->setProperty("height", foot_h * scale);

        x = min(msg->polygon.points[2].x * scale + foot_dis_x_max * 0.5 - foot_x * scale * 0.5 - dis_x * scale, foot_dis_x_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec4")->setProperty("x", x);

        x = min(msg->polygon.points[2].y * scale + foot_dis_y_max * 0.5 - foot_h * scale * 0.5, foot_dis_y_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("rec4")->setProperty("y", x);

        //point 0 com position

        x = min(msg->polygon.points[0].x * scale + com_dis_x_max * 0.5 - com_l * scale * 0.5, com_dis_x_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("com1")->setProperty("x", x);

        x = min(msg->polygon.points[0].y * scale + com_dis_y_max * 0.5 - com_l * scale * 0.5, com_dis_y_max);
        x = max(x, 0.0);
        m_Q->findChild<QObject *>("com1")->setProperty("y", x);
    };

 

 

///////////////////////////////////////////////////////////////////////////////////////////////

    void joystick_cb(const sensor_msgs::Joy::Ptr &msg)
    
    {   // default 0 (Not control both LT,RT yet) , 1 (Control LT only not RT), 2 (Control RT only not LT) , 3(Control LT RT Both)
         velcmd_msg.des_vel.resize(6);

         if(JoyFlag ==0){
        if(abs(msg->axes[4]!= 0))
            LTFlag = 1;
        if(abs(msg->axes[5]!= 0))
            RTFlag = 1;
        if(LTFlag == 0) {msg->axes[4] = 1;}
        if(RTFlag == 0) {msg->axes[5] = 1;}
        if(LTFlag == 1 && RTFlag ==0)
        {
            msg->axes[5] = 1;
            JoyFlag = 0; 
        }
        if(LTFlag == 0 && RTFlag == 1)
        {
            msg->axes[4] = 1;
            JoyFlag = 0;
        }
        if(LTFlag == 1 && RTFlag == 1)
        { JoyFlag = 1;}
        if(LTFlag == 0 && RTFlag == 0)
        { JoyFlag = 0;}
         }

         
        for ( int i = 0; i<4 ; i++)
        {
            if(abs(msg->axes[i]) <= 0.1) // value of Threshold
            {
                msg->axes[i] = 0;
            }
        }  //Setting Threshold value 

        char buf[128];
        char buf2[128];
        float dot;

        // axes
        for (int i = 0; i < 4; i++)
        {
            dot = msg->axes[i];
            if((i==1) || (i==3))    std::sprintf(buf, "%8.3f", dot);
            else                    std::sprintf(buf, "%8.3f", -dot);
            std::sprintf(buf2, "t%d", i + 46);
            m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

            std::sprintf(buf, "#%02X0000", (int)(pp(dot * 100.0) * 256.0));
            m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

            std::sprintf(buf2, "p%d", i + 44);
            if((i==1) || (i==3))    m_Q->findChild<QObject *>(buf2)->setProperty("value", dot);
            else                    m_Q->findChild<QObject *>(buf2)->setProperty("value", -dot);
        }

        for (int i = 4; i < 6; i++)     //L2, R2
        {
            if(msg->buttons[i])     dot = (msg->axes[i] / 2.0) - 0.5;
            else                    dot = (msg->axes[i] / -2.0) + 0.5;
            std::sprintf(buf, "%8.3f", dot);
            std::sprintf(buf2, "t%d", i + 46);
            m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

            std::sprintf(buf, "#%02X0000", (int)(pp(dot * 100.0) * 256.0));
            m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

            std::sprintf(buf2, "p%d", i + 44);
            m_Q->findChild<QObject *>(buf2)->setProperty("value", dot);
        }

        for (int i = 8; i < 10; i++)
        {
            std::sprintf(buf2, "b%d", i);
            if (msg->axes[i - 2] > 0.5)
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", true);
            else
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", false);
            std::sprintf(buf2, "b%d", i + 2);
            if (msg->axes[i - 2] < -0.5)
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", true);
            else
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", false);
        }

        // buttons
        for (int j = 0; j < 6; j++)
        {
            std::sprintf(buf, "b%d", j);
            if (msg->buttons[j])
                m_Q->findChild<QObject *>(buf)->setProperty("checked", true);
            else
                m_Q->findChild<QObject *>(buf)->setProperty("checked", false);
        }

        for (int j = 12; j < 17; j++)
        {
            std::sprintf(buf, "b%d", j);
            if (msg->buttons[j - 6])
                m_Q->findChild<QObject *>(buf)->setProperty("checked", true);
            else
                m_Q->findChild<QObject *>(buf)->setProperty("checked", false);
        }

        if (msg->buttons[6])
            Torqueon();
        if (msg->buttons[7])
            Torqueoff();   
        if (msg->buttons[0])
            TaskHandle();
        if (msg->buttons[1])
            VirtualInitHandle();
        if(msg->buttons[8])
            EmergencyOff();
        if (msg->axes[7] != 0) {
            if (msg->axes[7] > 0)       ChangeConMode(-1);
            else if (msg->axes[7] < 0)   ChangeConMode(1);
        }
        VelocityHandle(msg);
    };


    void android_cb(const geometry_msgs::Twist::ConstPtr &msg)
    {
        char buf[128];
        char buf2[128];
        float temp[2];
        temp[0] = -msg->angular.z;
        temp[1] = -msg->linear.x;

        for (int i = 0; i < 2; i++)
        {
            float dot = (temp[i])*pow(-1, i) * 100;

            std::sprintf(buf, "%8.3f", dot);
            std::sprintf(buf2, "t%d", i +46);
            m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

            std::sprintf(buf, "#%02X0000", (int)(pp(dot) * 256.0));
            m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

            std::sprintf(buf2, "p%d", i + 44);
            m_Q->findChild<QObject *>(buf2)->setProperty("value", dot / 200.0 + 0.5);
        }

        VelHandle_android(msg);
    }

///////////////////////////////////////////////////////////////////////////////////////////////
    
    void VirtualInitHandle()
    {
        com_msg.data = std::string("simvirtualjoint");
        com_pub.publish(com_msg);
    }

    void Torqueon()
    {
        com_msg.data = std::string("torqueon");
        com_pub.publish(com_msg);
    }

    void Torqueoff()
    {
        com_msg.data = std::string("torqueoff");
        com_pub.publish(com_msg);
    }

    void EmergencyOff()
    {
        com_msg.data = std::string("emergencyoff");
        com_pub.publish(com_msg);
    }

    void TaskHandle()
    {
        task_msg.ratio = 0.5;
        task_msg.height = 0.85;
        task_msg.time = 1.;
        task_msg.mode = 9;
        
        task_pub.publish(task_msg);
    }

    void VelocityHandle(const sensor_msgs::Joy::ConstPtr& msg)
    {
        velcmd_msg.des_vel.resize(6);
        
        switch (velcmd_msg.task_link) {
        case 0:     // pos : COM rot : pelv 
            velcmd_msg.des_vel[0] = (double)msg->axes[1] / 40.;
            velcmd_msg.des_vel[1] = (double)msg->axes[0] / 40.;
            velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / -80.);  //com pos
            if(msg->buttons[4])
                velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / 80.);

            velcmd_msg.des_vel[3] = (double)msg->axes[2] / -4.;
            velcmd_msg.des_vel[4] = (double)msg->axes[3] / 4.;
            velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / 8.);  //pelv rot
            if(msg->buttons[5])
                velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / -8.);              
            break;


            
        case 1:     // rot : upperbody
            velcmd_msg.des_vel[0] = 0;
            velcmd_msg.des_vel[1] = 0;
            velcmd_msg.des_vel[2] = 0;
            velcmd_msg.des_vel[3] = (double)msg->axes[2] / -4.;
            velcmd_msg.des_vel[4] = (double)msg->axes[3] / 4.;
            velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / 8.);  //upperbody rot
            if(msg->buttons[5])
                velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / -8.);
            break;



        case 2:     // righthand
            velcmd_msg.des_vel[0] = (double)msg->axes[1] / 8.;
            velcmd_msg.des_vel[1] = (double)msg->axes[0] / 8.;
            velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / -40.);  //righthand pos
            if(msg->buttons[4])
                velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / 40.);              


            velcmd_msg.des_vel[3] = (double)msg->axes[2] / -4.;
            velcmd_msg.des_vel[4] = (double)msg->axes[3] / 4.;
            velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / 8.);  //righthand rot
            if(msg->buttons[5])
                velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / -8.);                
            break;



        case 3:     // lefthand
            velcmd_msg.des_vel[0] = (double)msg->axes[1] / 8.;
            velcmd_msg.des_vel[1] = (double)msg->axes[0] / 8.;
            velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / -40.);  //lefthand pos
            if(msg->buttons[4])
                velcmd_msg.des_vel[2] = (((double)msg->axes[4] - 1.) / 40.);


            velcmd_msg.des_vel[3] = (double)msg->axes[2] / -4.;
            velcmd_msg.des_vel[4] = (double)msg->axes[3] / 4.;
            velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / 8.);  //lefthand rot
            if(msg->buttons[5])
                velcmd_msg.des_vel[5] = (((double)msg->axes[5] - 1.) / -8.);
            break;


        default:
            break;

        }
        velcommand_pub.publish(velcmd_msg);
    }

    void VelHandle_android(const geometry_msgs::Twist::ConstPtr &msg)
    {
        velcmd_msg.des_vel.resize(6);
        velcmd_msg.des_vel[0] = -1. * ((double)msg->angular.z / 4.);
        velcmd_msg.des_vel[1] = (double)msg->linear.x / 4.;

        velcommand_pub.publish(velcmd_msg);
    }

    void ChangeConMode(int data)
    {   velcmd_msg.des_vel.resize(6);
        mode_index -= data;
        if(mode_index > 3)      mode_index = 0;
        if(mode_index < 0)      mode_index = 3;
        velcmd_msg.task_link = change_mode[mode_index];
    }

///////////////////////////////////////////////////////////////////////////////////////////////





    sensor_msgs::JointState state;
    ros::Subscriber joint_sub;
    ros::Subscriber time_sub;
    ros::Subscriber sensor_sub;
    ros::Subscriber pos_sub;
    ros::Publisher button_pub;
    ros::Publisher switch_pub;


    ros::Subscriber joystick_sub;
    ros::Publisher com_pub;
    std_msgs::String com_msg;

    ros::Publisher task_pub;
    tocabi_controller::TaskCommand task_msg;

    ros::Publisher velcommand_pub;
    tocabi_controller::VelocityCommand velcmd_msg;

    ros::Publisher android_pub;
    ros::Subscriber android_sub;
    int JoyFlag = 0;
    int LTFlag = 0;
    int RTFlag = 0;



    float pp(float val){
        if (val < 0){
            return (val * -1.0) / 150.0;
        }
        else{
            return val / 150.0;
        }
    };

protected:
    QObject *m_Q;
    int mode_index = 0;
    uint32_t change_mode[4] = {0, 1, 2, 3};

signals:

public slots:
};

#endif // ROS_CONNECT_H
