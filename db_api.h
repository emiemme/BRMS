#ifndef DB_API_H
#define DB_API_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDateTime>

struct booking
{
    Q_GADGET
public:
        Q_PROPERTY(int b_ticketNumber MEMBER ticketNumber)
        Q_PROPERTY(QDateTime b_timeStamp MEMBER timeStamp)
        Q_PROPERTY(int b_omb_num MEMBER omb_num)
        Q_PROPERTY(QString b_client_name MEMBER client_name)
        Q_PROPERTY(QString b_client_surname MEMBER client_surname)
        Q_PROPERTY(int b_lettini MEMBER lettini)
        Q_PROPERTY(int b_sdraio MEMBER sdraio)
        Q_PROPERTY(int b_cabina MEMBER cabina)
        Q_PROPERTY(QDateTime b_arriveDate MEMBER arriveDate)
        Q_PROPERTY(QDateTime b_departureDate MEMBER departureDate)
        Q_PROPERTY(QString b_status MEMBER status)
        Q_PROPERTY(QString b_operatore MEMBER operatore)

        int         ticketNumber;
        QDateTime   timeStamp;
        int         omb_num;
        QString     client_name;
        QString     client_surname;
        int         lettini;
        int         sdraio;
        int         cabina;
        QDateTime   arriveDate;
        QDateTime   departureDate;
        QString     status;
        QString     operatore;
};
Q_DECLARE_METATYPE(booking)

struct ombStatus
{
    int         omb_num;
    QString     status;
};

class DB_api : public QObject
{
    Q_OBJECT

public:
    explicit DB_api(QObject *parent = nullptr);


public slots:
    bool openDB();
    void closeDB();
    bool createDB(int total_omb);
    bool insertBooking(struct booking newBooking);
    bool replaceBooking(struct booking replaceBooking);
    bool deleteBooking(struct booking deleteBooking);
    bool setTicketCount(int ticket_number);


    QList <booking> selectOmbBooking(int omb_num);
    QList <ombStatus> selectAllOmbStatus (int total_omb,QDateTime currentDate);
    int getTicketCount();



private slots:
    bool _queryTheDB(const QString text, QString msg);



signals:

private:
    QSqlDatabase sqlDB;


};

#endif // DB_API_H
