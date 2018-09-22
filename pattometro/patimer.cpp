#include "patimer.h"

#include <QTextToSpeech>

Patimer::Patimer(QObject *parent) : QObject(parent)
{
    m_timer = new QTimer();
    m_timer->setInterval(1000);
    QObject::connect(m_timer, SIGNAL(timeout()), this, SLOT(timerFinished()));
}

void Patimer::goTimer(QString oraPatta) {
    QStringList vals = oraPatta.split((":"));

    if (vals[2] == "1") {
        m_hours = vals[0].toInt() + 12;
    } else {
        m_hours = vals[0].toInt();
    }

    m_minutes = vals[1].toInt();
    //vals[0] = QString("%1").arg(vals[0].toInt(), 2, 10, QChar('0'));

    m_timer->start();
}

void Patimer::timerFinished() {
    QDateTime patta(QDate::currentDate(), QTime(m_hours, m_minutes, 0, 0));
    QDateTime now = QDateTime::currentDateTime();
    qDebug() << patta << now;
    int difference = now.secsTo(patta);
    if (difference < 0) {
        patta = patta.addDays(1);
        difference = now.secsTo(patta);
    }

    QString msg = "";
    if (difference < 600 and difference > 540)
        msg = "dieci minuti all'ora patta";
    else if (difference < 300 and difference > 240)
        msg = "cinque minuti all'ora patta";
    else if (difference < 60)
        msg = "un minuto all'ora patta";
    else if (difference < 86400 and difference > 86340)
        msg = "ORA PATTA";

    if (msg != "") {
        QTextToSpeech speech(this);
        speech.say(msg);
    }

    int hours = int(difference/3600);
    int minutes = (difference%3600)/60;
    QTime timeToPatta(hours, minutes, 0, 0);
    m_timeTo = timeToPatta.toString();//QString::number(difference);
    emit timeToChanged();
}
