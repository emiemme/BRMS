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
