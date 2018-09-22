#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <patimer.h>
#include "notificationclient.h"

#include <QList>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    Patimer pat;
    NotificationClient *notificationClient = new NotificationClient();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QLatin1String("patimer"), &pat);
    engine.rootContext()->setContextProperty(QLatin1String("notificationClient"), notificationClient);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

//    QList<QObject*> objects = engine.rootObjects();
//    for (int i=0; i<objects.size(); i++) {
//        QObject* theButton = objects.at(i)->findChild<QObject*>("theButton");
//        if (theButton) {
//            qDebug() << "object connected";
//            QObject::connect(theButton, SIGNAL(buttonClicked()), &pat, SLOT(goTimer()));
//        } else {
//            qDebug() << "Serious problem, no button !";
//        }
//    }

    return app.exec();
}
