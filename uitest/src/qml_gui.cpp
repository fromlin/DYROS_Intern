#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>

#include "ros/ros.h"
// #include "std_msgs/String.h"
// #include "std_msgs/Float32.h"
#include "ros_connect.h"

using namespace std;


int main(int argc, char** argv)
{
    //Init ros stuff
    ros::init(argc, argv, "qml_gui");
    ros::NodeHandle nh;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //Init Qt
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:///qml/gui.qml"));       

    QObject* root = engine.rootObjects()[0];
    ros_connect ros(root, nh);
    engine.rootContext()->setContextProperty("ros", &ros);
 
    //Start main app
    return app.exec();
}
