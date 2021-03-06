#include <QtPrintSupport/QPrinter>
#include <QtQuick/QQuickView>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "appengine.h"
#include <QGuiApplication>

int main(int argc, char *argv[])
{
   // qputenv("QSG_INFO", "1");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //QSurfaceFormat::setDefaultFormat(Q3DS::surfaceFormat());

    QQmlApplicationEngine engine;

    appEngine appCore;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("app", &appCore);

    engine.load(url);

    return app.exec();
}
