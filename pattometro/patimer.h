#ifndef PATIMER_H
#define PATIMER_H

#include <QObject>
#include <QTimer>
#include <QString>
#include <QStringList>
#include <QDateTime>
//#include <

#include <QDebug>

class Patimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString timeTo READ timeTo NOTIFY timeToChanged)

public:
    explicit Patimer(QObject *parent = 0);

    QString timeTo() { return m_timeTo; }

signals:
    void timeToChanged();

public slots:
    void goTimer(QString oraPatta);
    void timerFinished();

private:
    int m_hours;
    int m_minutes;
    QTimer* m_timer;

    QString m_timeTo;
};

#endif // PATIMER_H
