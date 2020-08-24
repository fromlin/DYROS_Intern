#ifndef ROS_CONNECT_H
#define ROS_CONNECT_H

#include <QObject>
#include <QDebug>
#include <QPoint>
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Float32.h>
#include <sensor_msgs/JointState.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point32.h>
#include <geometry_msgs/PointStamped.h>
#include <geometry_msgs/PolygonStamped.h>
#include "JointState.h"
#include "SensorState.h"
#include "Joy.h"

#include "TaskCommand.h"

class ros_connect : public QObject
{
    Q_OBJECT
public:
    explicit ros_connect(QObject *parent, ros::NodeHandle &nh);

    Q_INVOKABLE void TaskHandle_gui();
    Q_INVOKABLE void button_ros(int id, QString msg);
    Q_INVOKABLE void switch_ros(int id, char* msg);
    Q_INVOKABLE void update();
    Q_INVOKABLE double t_x();
    Q_INVOKABLE int tt;
    Q_INVOKABLE QString a;


    void TaskHandle(const sensor_msgs::Joy::ConstPtr& msg);
    void joint_cb(sensor_msgs::JointStateConstPtr msg);
    void sensor_cb(mujoco_ros_msgs::SensorStateConstPtr msg);
    void time_cb(std_msgs::Float32ConstPtr msg);
    void pos_cb(geometry_msgs::PolygonStampedConstPtr msg);
    void joystick_cb(const sensor_msgs::Joy::ConstPtr& msg);
    sensor_msgs::JointState state;

    ros::Subscriber joint_sub;
    ros::Subscriber time_sub;
    ros::Subscriber sensor_sub;
    ros::Subscriber pos_sub;
    ros::Publisher command_pub;
    ros::Publisher task_pub;

    ros::Publisher button_pub;
    ros::Publisher switch_pub;
    float pp(float val);

    ros::Subscriber joystick_sub;
protected:
    QObject *m_Q;

signals:

public slots:
};

#endif // ROS_CONNECT_H
