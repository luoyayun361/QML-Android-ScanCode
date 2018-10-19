#include "mainconsole.h"
#include <QtAndroid>
#include "QZXing.h"

MainConsole::MainConsole(QObject *parent) : QObject(parent)
{
    //摄像头权限
    checkPermission("android.permission.CAMERA");
}

bool MainConsole::checkPermission(QString permission) {
    QtAndroid::PermissionResult r = QtAndroid::checkPermission(permission);
    if(r == QtAndroid::PermissionResult::Denied) {
        QtAndroid::requestPermissionsSync( QStringList() << permission );
        r = QtAndroid::checkPermission(permission);
        if(r == QtAndroid::PermissionResult::Denied) {
             return false;
        }
   }
    return true;
}

void MainConsole::initPage()
{
    QZXing::registerQMLTypes();
    QQuickStyle::setStyle("Material");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
}
