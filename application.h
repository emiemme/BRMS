#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <QQuickItem>
#include "db_api.h"


class Application: public QObject
{
    Q_OBJECT
    Q_PROPERTY(booking m_booking READ getBooking WRITE setBooking NOTIFY bookingChanged)
    Q_PROPERTY(QList<booking> m_booking_list READ getBookingList)
    Q_PROPERTY(int m_booking_list_length READ getBookingListLength)

    Q_PROPERTY(QList<ombStatus> m_ombStatus READ getOmbStatusList)
    Q_PROPERTY(QList<ombStatus> m_ombStatus_list READ getOmbStatusList)
    Q_PROPERTY(int m_ombStatus_list_length READ getOmbStatusLength)



public:
    explicit Application(QObject *parent = nullptr);
    Q_INVOKABLE bool selectAllStatus(int total_omb, QString currentDate);
    Q_INVOKABLE bool insertNewBooking(int ticketNumber, int omb_num, QString clientName, QString clientSurname, int lettini, int sdraio, int cabina, QString arriveDate, QString departureDate, QString status, QString acconto, QString cell_number, QString operatore);
    Q_INVOKABLE bool deleteBooking(int ticketNumber, int omb_num);

    Q_INVOKABLE void    setTicketCount();
    Q_INVOKABLE int     getTicketCount();
    Q_INVOKABLE bool    selectOmbBookings(QString ombNumb);
    Q_INVOKABLE bool    updateStatusGrid(int total_omb, QDateTime dateTime);


    // Expose booking to qml
    booking qml_booking;
    booking getBooking() const { return qml_booking; }
    void setBooking(booking val){ qml_booking = val; emit bookingChanged();}

    // Expose QList<booking> to qml
    QList<booking> qml_booking_list;
    QList<booking> getBookingList() const { return qml_booking_list; }
    int getBookingListLength() const {return qml_booking_list.count();}

    // Expose QList<ombStatus> to qml
    QList<ombStatus> qml_ombStatus_list;
    QList<ombStatus> getOmbStatusList() const { return qml_ombStatus_list; }
    int getOmbStatusLength() const {return qml_ombStatus_list.count();}


    //Expose freeOmb,bookingOmb & leavingOmb to qml
    Q_INVOKABLE int     getFreeOmbCount();
    Q_INVOKABLE int     getIncomingOmbCount();
    Q_INVOKABLE int     getBookingOmbCount();
    Q_INVOKABLE int     getLeavingOmbCount();
    Q_INVOKABLE int     getDailyOmbCount();


private slots:
    void debugStruct(booking newBooking);

private:
    DB_api  *db;
    int     ticketCount;
    int     freeOmb;
    int     bookingOmb;
    int     leavingOmb;
    int     incomingOmb;

signals:
    void bookingChanged();
    void gridUpdateCompleted();


};

#endif // APPLICATION_H
