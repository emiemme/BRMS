#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtDebug>
#include <QFile>
#include <QTextStream>
#include "application.h"

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    QString txt;
    switch (type) {
    case QtDebugMsg:
        txt = QString("[%1] Debug: %2").arg(QDateTime::currentDateTime().toString("yyyy-MM-ddThh:mm:ss")).arg(msg);
        fprintf(stderr, "Debug: %s \n", msg.toLatin1().data());
        break;
    case QtWarningMsg:
        txt = QString("[%1] Warning: %2").arg(QDateTime::currentDateTime().toString("yyyy-MM-ddThh:mm:ss")).arg(msg);
        fprintf(stderr, "Warning: %s \n", msg.toLatin1().data());
    break;
    case QtCriticalMsg:
        txt = QString("[%1] Critical: %2").arg(QDateTime::currentDateTime().toString("yyyy-MM-ddThh:mm:ss")).arg(msg);
        fprintf(stderr, "Critical: %s \n", msg.toLatin1().data());
    break;
    case QtFatalMsg:
        txt = QString("[%1] Fatal: %2").arg(QDateTime::currentDateTime().toString("yyyy-MM-ddThh:mm:ss")).arg(msg);
        fprintf(stderr, "Fatal: %s \n", msg.toLatin1().data());
    break;
    }
    QFile outFile("Gestionale_Lido.log");
    outFile.open(QIODevice::WriteOnly | QIODevice::Append);
    QTextStream ts(&outFile);
    ts << txt << Qt::endl;
}

int main(int argc, char *argv[])
{
    //qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

     qInstallMessageHandler(myMessageOutput);
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






