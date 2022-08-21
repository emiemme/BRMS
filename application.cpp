#include "application.h"

Application::Application(QObject *parent) : QObject(parent)
{
    db = new DB_api();
    int totalOmb = 173;
    db->openDB(totalOmb);
    ticketCount = db->getTicketCount();
    if(ticketCount == 0) {
        db->setTicketCount(0);
    }

//    qDebug()<<db->selectOmbBooking(1).at(0).ticketNumber;
//    qDebug()<<db->selectOmbBooking(1).at(1).ticketNumber;
}


bool Application::selectAllStatus(int total_omb, QString currentDate)
{
     bool fRes = false;
     qml_ombStatus_list = db->selectAllOmbStatus(total_omb,QDateTime::fromString(currentDate, "yyyy-MM-dd"));
     //qDebug()<<qml_ombStatus_list.count();
//     for(int i=0;i < qml_ombStatus_list.count(); i++) {
//        //qDebug()<<qml_ombStatus_list.at(i).omb_num<<"-->"<<qml_ombStatus_list.at(i).status<<"-->"<<qml_ombStatus_list.at(i).color<<"-->"<<qml_ombStatus_list.at(i).client_name;
//     }
     if (qml_ombStatus_list.first().omb_num < 1 || qml_ombStatus_list.first().omb_num > total_omb) {
         fRes = false;
     } else {
        fRes = true;
        emit gridUpdateCompleted();
     }
     return fRes;
}

bool Application::updateStatusGrid(int total_omb, QDateTime dateTime)
{
    bool fRes = db->updateAllStatusBooking(total_omb,dateTime);
    //qDebug()<<fRes;
    return fRes;
}

QList<searchStruct> Application::getSearchValues(int total_omb, QString searchValue)
{
    QList<searchStruct> _tmpSearchList;
    _tmpSearchList = db->selectSearchValues(total_omb,searchValue);

    emit searchCompleted(_tmpSearchList);

    return _tmpSearchList;
}


QList <int> Application::getfreeOmbInInterval(int startOmb,int endOmb, QDateTime inDate, QDateTime outDate)
{
    QList <int> _tmpFreeOmbInIntervalList;
    _tmpFreeOmbInIntervalList = db->selectFreeOmbInInterval( startOmb, endOmb,inDate,outDate);

    emit searchIntervalCompleted(_tmpFreeOmbInIntervalList);

    return _tmpFreeOmbInIntervalList;
}



bool Application::insertNewBooking(int ticketNumber, int omb_num, QString clientName, QString clientSurname,
                                   int lettini, int sdraio, int cabina, QString arriveDate,
                                   QString departureDate,QString status, QString acconto, QString cell_number, QString operatore)
{
    booking newBooking;
    newBooking.ticketNumber = ticketNumber;
    newBooking.timeStamp = QDateTime::currentDateTime();
    newBooking.omb_num = omb_num;
    newBooking.client_name = clientName;
    newBooking.client_surname = clientSurname;
    newBooking.lettini = lettini;
    newBooking.sdraio = sdraio;
    newBooking.cabina = cabina;
    newBooking.arriveDate = QDate::fromString(arriveDate, "yyyy-MM-dd");
    newBooking.departureDate = QDate::fromString(departureDate, "yyyy-MM-dd");;
    newBooking.status = status;
    newBooking.acconto = acconto;
    newBooking.cell_number = cell_number;
    newBooking.operatore = operatore;

    return db->insertBooking(newBooking);
}

bool Application::deleteBooking(int ticketNumber, int omb_num)
{
    booking deleteBooking;
    deleteBooking.ticketNumber = ticketNumber;
    deleteBooking.omb_num = omb_num;

    return db->deleteBooking(deleteBooking);
}

bool Application::selectOmbBookings(QString ombNumb)
{
    bool fRes = false;
    qml_booking_list =  db->selectOmbBooking(ombNumb.toInt());
    return fRes;
}

int Application::getTicketCount()
{
    return ticketCount;
}

void Application::setTicketCount()
{
    ticketCount =  db->getTicketCount();
}

int Application::getFreeOmbCount()
{
    return db->freeOmb;
}
int Application::getBookingOmbCount()
{
    return db->bookingOmb;
}
int Application::getLeavingOmbCount()
{
    return db->leavingOmb;
}
int Application::getIncomingOmbCount()
{
    return db->incomingOmb;
}

int Application::getDailyOmbCount()
{
    return db->dailyOmb;
}

void Application::emitViewName(bool state)
{
    emit viewName(state);
}


void Application::debugStruct(booking newBooking)
{
    qDebug()<<"ticketNumber:"<<newBooking.ticketNumber;
    qDebug()<<"omb_num:"<<newBooking.omb_num;
    qDebug()<<"client_name:"<<newBooking.client_name;
    qDebug()<<"client_surname:"<<newBooking.client_surname;
    qDebug()<<"lettini:"<<newBooking.lettini;
    qDebug()<<"sdraio:"<<newBooking.sdraio;
    qDebug()<<"cabina:"<<newBooking.cabina;
    qDebug()<<"arriveDate:"<<newBooking.arriveDate;
    qDebug()<<"departureDate:"<<newBooking.departureDate;
    qDebug()<<"status:"<<newBooking.status;
    qDebug()<<"operatore:"<<newBooking.operatore;
}
