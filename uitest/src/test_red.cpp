#include <ros/ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Joy.h>
#include <TaskCommand.h>


void callback(const sensor_msgs::Joy::ConstPtr& msg){
    // printf("x:%.f   y:%.f\n   \
    //         butA:%d   butB:%d   butX:%d   butY:%d   L1:%d   R1:%d\n",
    //         msg->axes[0]*100.0, msg->axes[1]*100.0,
    //         msg->buttons[0], msg->buttons[1], msg->buttons[2],
    //         msg->buttons[3], msg->buttons[4], msg->buttons[5]);
}
void call_back(const std_msgs::String::ConstPtr& msg){
    // printf("%s\n", msg->data.c_str());
}
void com_callback(const tocabi_controller::TaskCommand& msg){
    printf(" %lf  \t%lf\n", msg.roll, msg.pitch);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "test_red_node");
    ros::NodeHandle nh;

    ros::Subscriber subbb = nh.subscribe("/tocabi/taskcommand", 1, &com_callback);
    ros::Subscriber subb = nh.subscribe("/controller/red_command", 1, &callback);
    ros::Subscriber sub = nh. subscribe("/dyros_red/command", 1, &call_back);
    ros::spin();

    return 0;
}