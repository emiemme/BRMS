#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QQuickItem>
#include "db_api.h"


class Application: public QObject
{
    Q_OBJECT
public:
    explicit Application(QObject *parent = nullptr);
    Q_INVOKABLE QList <QString> selectAllStatus(int total_omb, QString currentDate);
    Q_INVOKABLE bool    insertNewBooking(int ticketNumber, int omb_num, QString clientName, QString clientSurname, int lettini, int sdraio, int cabina, QString arriveDate, QString departureDate, QString status, QString operatore);
    Q_INVOKABLE void    setTicketCount();
    Q_INVOKABLE int     getTicketCount();

private slots:
    void debugStruct(booking newBooking);

private:
    DB_api  *db;
    int     ticketCount;

};

#endif // APPLICATION_H
