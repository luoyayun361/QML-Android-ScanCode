#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "QZXing.h"
#include "mainconsole.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    MainConsole mainConsole;
    mainConsole.initPage();

    return app.exec();
}
