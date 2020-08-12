#include "ros/ros.h"
#include "std_msgs/Float32.h"
#include "std_msgs/String.h"
#include "sensor_msgs/Joy.h"
#include "TaskCommand.h"


// void callback(const sensor_msgs::Joy::ConstPtr& msg){
//     // printf("x:%.f   y:%.f\n   \
//     //         butA:%d   butB:%d   butX:%d   butY:%d   L1:%d   R1:%d\n",
//     //         msg->axes[0]*100.0, msg->axes[1]*100.0,
//     //         msg->buttons[0], msg->buttons[1], msg->buttons[2],
//     //         msg->buttons[3], msg->buttons[4], msg->buttons[5]);
// }
void callback(const std_msgs::String::ConstPtr& msg){
    printf("%s\n", msg->data.c_str());
}
void com_callback(const std_msgs::String::ConstPtr& msg){
    printf("%s\n", msg->data.c_str());
}
void task_callback(const tocabi_controller::TaskCommand& msg){
    printf(" ratio:%.1lf\theight:%.2lf\t  \
    time:%.lf\tmode:%d\n pitch:%.3lf\tyaw:%.3lf\n",
    msg.ratio, msg.height, msg.time, msg.mode, msg.pitch, msg.yaw);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "test_red_node");
    ros::NodeHandle nh;                                                                                                                                                                                                                                                                                                                            

    ros::Subscriber sub_com = nh.subscribe("/tocabi/command", 100, &com_callback);
    ros::Subscriber sub_task = nh.subscribe("/tocabi/taskcommand", 100, &task_callback);
    // ros::Subscriber subb = nh.subscribe("/controller/red_command", 1, &callback);
    ros::Subscriber sub = nh.subscribe("/dyros_red/command", 100, &callback);

    ros::spin();

    return 0;
}