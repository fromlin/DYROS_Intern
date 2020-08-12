#ifndef ROS_CONNECT_H
#define ROS_CONNECT_H

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "JointState.h"
#include "SensorState.h"
#include "Joy.h"
#include "TaskCommand.h"
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
#include <geometry_msgs/PolygonStamped.h>

#define min(x, y) (((x) < (y)) ? (x) : (y))
#define max(x, y) (((x) > (y)) ? (x) : (y))

class ros_connect : public QObject
{
    Q_OBJECT
public:
    explicit ros_connect(QObject *parent, ros::NodeHandle &nh)
    {
        button_pub = nh.advertise<std_msgs::String>("/dyros_red/command", 100);
        joint_sub = nh.subscribe("/tocabi/jointstates", 1, &ros_connect::joint_cb, this);
        sensor_sub = nh.subscribe("/mujoco_ros_interface/sensor_states", 1, &ros_connect::sensor_cb, this);
        time_sub = nh.subscribe("/tocabi/time", 1, &ros_connect::time_cb, this);
        m_Q = parent;

        pos_sub = nh.subscribe("/tocabi/point", 1, &ros_connect::pos_cb, this);
        tt = 0;

        com_pub = nh.advertise<std_msgs::String>("/tocabi/command", 100);
        velcommand_pub = nh.advertise<tocabi_controller::VelocityCommand>("/tocabi/velcommand", 100);
        task_pub = nh.advertise<tocabi_controller::TaskCommand>("/tocabi/taskcommand", 100);


        joystick_sub = nh.subscribe("/controller/gui_command",1,&ros_connect::joystick_cb, this);

        char buf[128];
        char buf2[128];
        std::sprintf(buf, "%6.2f", 15.48721241);
        std::sprintf(buf2, "t%d", 1);
        m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);
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

    void joystick_cb(const sensor_msgs::Joy::ConstPtr &msg)
    {
        char buf[128];
        char buf2[128];

        // axes
        for (int i = 0; i < 4; i++)
        {
            float dot = (msg->axes[i]) * 100.0;
            std::sprintf(buf, "%8.3f", dot);
            std::sprintf(buf2, "t%d", i + 46);
            m_Q->findChild<QObject *>(buf2)->setProperty("text", buf);

            std::sprintf(buf, "#%02X0000", (int)(pp(dot) * 256.0));
            m_Q->findChild<QObject *>(buf2)->setProperty("color", buf);

            std::sprintf(buf2, "p%d", i + 44);
            m_Q->findChild<QObject *>(buf2)->setProperty("value", dot / 200.0 + 0.5);
        }
        for (int i = 4; i < 6; i++)
        {
            std::sprintf(buf2, "b%d", i + 2);
            if (msg->axes[i] < 0.0)
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", true);
            else
                m_Q->findChild<QObject *>(buf2)->setProperty("checked", false);
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

        if(msg->buttons[6])
            StateInitHandle();
        if(msg->buttons[7])
            TaskHandle();

        VelocityHandle(msg);
    };



//////////////////////////////////////////////////////////////////////


    void StateInitHandle()
    {
        com_msg.data = std::string("stateestimation");
        com_pub.publish(com_msg);
    }
    void VelocityHandle(const sensor_msgs::Joy::ConstPtr& msg)
    {
        velcmd_msg.des_vel.resize(6);
        velcmd_msg.des_vel[0] = (double)msg->axes[0] / 4.;
        velcmd_msg.des_vel[1] = (double)msg->axes[1] / 4.;

        velcommand_pub.publish(velcmd_msg);
    }
    void TaskHandle()
    {
        // task_msg.ratio = 0.5;
        // task_msg.height = 0.85;
        // task_msg.time = 1.;
        task_msg.mode = 5;                       // ??????????
        
        task_pub.publish(task_msg);
    }

//////////////////////////////////////////////////////////////////////



    int cnt_pub = 0;
    sensor_msgs::JointState state;

    ros::Subscriber joint_sub;
    ros::Subscriber time_sub;
    ros::Subscriber sensor_sub;
    ros::Subscriber pos_sub;
    ros::Publisher command_pub;

    ros::Publisher com_pub;
    ros::Publisher velcommand_pub;
    ros::Publisher task_pub;
    ros::Publisher button_pub;
    ros::Publisher switch_pub;

    float pp(float val){
        if (val < 0){
            return (val * -1.0) / 150.0;
        }
        else{
            return val / 150.0;
        }
    };

    ros::Subscriber joystick_sub;
    tocabi_controller::TaskCommand task_msg;
    tocabi_controller::VelocityCommand velcmd_msg;
    std_msgs::String com_msg;

protected:
    QObject *m_Q;

signals:

public slots:
};

#endif // ROS_CONNECT_H