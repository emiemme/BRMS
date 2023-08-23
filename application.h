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

    Q_PROPERTY(QList<searchStruct> m_searchStruct_list READ getSearchStructList)
    Q_PROPERTY(int m_searchStruct_list_length READ getSearchStructLength)

    Q_PROPERTY(QList<int> m_freeOmbInInterval_list READ getfreeOmbInIntervalList)
    Q_PROPERTY(int m_freeOmbInInterval_list_length READ getfreeOmbInIntervalLength)


public:
    explicit Application(QObject *parent = nullptr);
    Q_INVOKABLE bool selectAllStatus(int total_omb, QString currentDate);
    Q_INVOKABLE bool insertNewBooking(int ticketNumber, QString omb_num, QString clientName, QString clientSurname, int lettini, int sdraio, int cabina, QString arriveDate, QString departureDate, QString status, QString acconto, QString cell_number, QString operatore);
    Q_INVOKABLE bool deleteBooking(int ticketNumber, QString omb_num);

    Q_INVOKABLE void    setTicketCount();
    Q_INVOKABLE int     getTicketCount();
    Q_INVOKABLE bool    selectOmbBookings(QString ombNumb);
    Q_INVOKABLE bool    updateStatusGrid(int total_omb, QDateTime dateTime);
    Q_INVOKABLE void    emitViewName(bool state);



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
    QList<ombStatus> getOmbStatusList() const {return qml_ombStatus_list; }
    int getOmbStatusLength() const {return qml_ombStatus_list.count();}

    // Expose QList<searchStruct> to qml
    QList<searchStruct> qml_searchStruct_list;
    QList<searchStruct> getSearchStructList() const { return qml_searchStruct_list; }
    int getSearchStructLength() const {return qml_searchStruct_list.count();}

    // Expose QList<int> to qml
    QList<int> qml_freeOmbInInterval_list;
    QList<int> getfreeOmbInIntervalList() const { return qml_freeOmbInInterval_list; }
    int getfreeOmbInIntervalLength() const {return qml_freeOmbInInterval_list.count();}

    //Expose freeOmb,bookingOmb & leavingOmb to qml
    Q_INVOKABLE int     getFreeOmbCount();
    Q_INVOKABLE int     getIncomingOmbCount();
    Q_INVOKABLE int     getBookingOmbCount();
    Q_INVOKABLE int     getLeavingOmbCount();
    Q_INVOKABLE int     getDailyOmbCount();

    Q_INVOKABLE QList<searchStruct> getSearchValues(int total_omb,QString searchValue);
    Q_INVOKABLE QList <int> getfreeOmbInInterval(int startOmb, int endOmb, QDateTime inDate, QDateTime outDate);

    Q_INVOKABLE QList<int> getJunePrice(int rowIndex);
    Q_INVOKABLE QList<int> getJulyPrice(int rowIndex);
    Q_INVOKABLE QList<int> getAugustPrice(int rowIndex);
    Q_INVOKABLE QList<int> getSeptemberPrice(int rowIndex);

    Q_INVOKABLE void setJunePrice(QList<int> price,int rowIndex);
    Q_INVOKABLE void setJulyPrice(QList<int> price,int rowIndex);
    Q_INVOKABLE void setAugustPrice(QList<int> price,int rowIndex);
    Q_INVOKABLE void setSeptemberPrice(QList<int> price,int rowIndex);

    Q_INVOKABLE void setNewPrices();
    Q_INVOKABLE bool getNewPrices();

    Q_INVOKABLE float calculatePrice(QString omb_num, QString arriveDate, QString departureDate, int days);


private slots:
    void debugStruct(booking newBooking);

private:
    int rowFinder(QString omb_numb);


private:
    DB_api  *db;
    int     ticketCount;
    int     freeOmb;
    int     bookingOmb;
    int     leavingOmb;
    int     incomingOmb;

    pricesStruct currentPrices;
    pricesStruct tempPrices;

signals:
    void bookingChanged();
    void gridUpdateCompleted();
    void viewName(bool viewState);
    void searchCompleted(QList<searchStruct>);
    void searchIntervalCompleted(QList<int>);
                                               //           0     1    2      3      4
    void setPrice(QList<int> price,int index); //price --> Row, Daily,Week,Fifteen,Month
                                               //           0     1      2        3
                                               //index --> June, July, August, September





};

#endif // APPLICATION_H
