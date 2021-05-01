#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "application.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;


    //qmlRegisterType<Application>("backend.Gestionale", 1, 0, "Backend");
    //qmlRegisterType<booking>("Booking", 1, 0, "booking");

    Application *appl = new Application();
    engine.rootContext()->setContextProperty("Backend",appl);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}