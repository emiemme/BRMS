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
        Q_PROPERTY(QString b_omb_num MEMBER omb_num)
        Q_PROPERTY(QString b_client_name MEMBER client_name)
        Q_PROPERTY(QString b_client_surname MEMBER client_surname)
        Q_PROPERTY(int b_lettini MEMBER lettini)
        Q_PROPERTY(int b_sdraio MEMBER sdraio)
        Q_PROPERTY(int b_cabina MEMBER cabina)
        Q_PROPERTY(QDate b_arriveDate MEMBER arriveDate)
        Q_PROPERTY(QDate b_departureDate MEMBER departureDate)
        Q_PROPERTY(QString b_status MEMBER status)
        Q_PROPERTY(QString b_acconto MEMBER acconto)
        Q_PROPERTY(QString b_cell_number MEMBER cell_number)
        Q_PROPERTY(QString b_operatore MEMBER operatore)

        int         ticketNumber;
        QDateTime   timeStamp;
        QString     omb_num;
        QString     client_name;
        QString     client_surname;
        int         lettini;
        int         sdraio;
        int         cabina;
        QDate       arriveDate;
        QDate       departureDate;
        QString     status;
        QString     acconto;
        QString     cell_number;
        QString     operatore;
};
Q_DECLARE_METATYPE(booking)

struct ombStatus
{
    Q_GADGET
public:
        Q_PROPERTY(QString b_omb_num MEMBER omb_num)
        Q_PROPERTY(QString b_client_surname MEMBER client_surname)
        Q_PROPERTY(QString b_status MEMBER status)
        Q_PROPERTY(QString b_color MEMBER color)

        QString     omb_num;
        QString     client_surname;
        QString     status;
        QString     color;
};
Q_DECLARE_METATYPE(ombStatus)

struct searchStruct
{
    Q_GADGET
public:
        Q_PROPERTY(QString b_omb_num MEMBER omb_num)
        Q_PROPERTY(QString b_searchName MEMBER searchName)

        QString     omb_num;
        QString     searchName;
};
Q_DECLARE_METATYPE(searchStruct)

class DB_api : public QObject
{
    Q_OBJECT

public:
    explicit DB_api(QObject *parent = nullptr);
    int     freeOmb;
    int     bookingOmb;
    int     leavingOmb;
    int     incomingOmb;
    int     dailyOmb;


public slots:
    bool openDB(int totalOmb);
    void closeDB();
    bool createDB(int total_omb);
    bool createLettersTables();

    bool insertBooking(struct booking newBooking);
    bool replaceBooking(struct booking replaceBooking);
    bool deleteBooking(struct booking deleteBooking);
    bool setTicketCount(int ticket_number);
    bool updateAllStatusBooking(int total_omb, QDateTime currentDate);



    QList <booking> selectOmbBooking(QString omb_num);
    QList <ombStatus> selectAllOmbStatus (int total_omb,QDateTime currentDate);
    QList <searchStruct> selectSearchValues(int total_omb, QString searchVal);
    QList<int> selectFreeOmbInInterval(int startOmb, int endOmb, QDateTime inDate, QDateTime outDate);


    int getTicketCount();



private slots:
    bool _queryTheDB(const QString text, QString msg);
    QString getLitteralOmbNumber(int omb_numb);



signals:

private:
    QSqlDatabase sqlDB;
};

#endif // DB_API_H
