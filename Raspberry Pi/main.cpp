// библиотеки чтобы на пк работал график
#include <QtPrintSupport/QPrinter>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// обязательные библиотеки
#include <QApplication>
#include <QQmlApplicationEngine>
#include "appengine.h"

int main(int argc, char *argv[])
{
    //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    qmlRegisterType<appengine>("MyCppObject",1,0,"CppObject");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

