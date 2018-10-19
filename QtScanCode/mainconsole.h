#ifndef MAINCONSOLE_H
#define MAINCONSOLE_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickStyle>


class MainConsole : public QObject
{
    Q_OBJECT
public:
    explicit MainConsole(QObject *parent = nullptr);
    void initPage();

private:
    bool checkPermission(QString permission);//申请android权限

private:
    QQmlApplicationEngine engine;
};

#endif // MAINCONSOLE_H
