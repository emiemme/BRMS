#include "application.h"

Application::Application(QObject *parent) : QObject(parent)
{
    db = new DB_api();
    db->openDB();
    ticketCount = db->getTicketCount();
    if(ticketCount == 0) {
        db->setTicketCount(0);
    }


//    qDebug()<<db->selectOmbBooking(1).at(0).ticketNumber;
//    qDebug()<<db->selectOmbBooking(1).at(1).ticketNumber;

}


QList <QString> Application::selectAllStatus(int total_omb, QString currentDate)
{
     QList <ombStatus> tmpList;
     tmpList = db->selectAllOmbStatus(total_omb,QDateTime::fromString(currentDate, "yyyy-MM-ddThh:mm"));
     if(!tmpList.isEmpty()){
         qDebug()<<tmpList.at(0).omb_num<<" Status:" << tmpList.at(0).status;
     }
}


bool Application::insertNewBooking(int ticketNumber, int omb_num, QString clientName, QString clientSurname,
                                   int lettini, int sdraio, int cabina, QString arriveDate,
                                   QString departureDate,QString status, QString operatore)
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
    newBooking.arriveDate = QDateTime::fromString(arriveDate, "yyyy-MM-ddThh:mm");
    newBooking.departureDate = QDateTime::fromString(departureDate, "yyyy-MM-ddThh:mm");;
    newBooking.status = status;
    newBooking.operatore = operatore;

    return db->insertBooking(newBooking);
}

int Application::getTicketCount()
{
    return ticketCount;
}

void Application::setTicketCount()
{
    ticketCount =  db->getTicketCount();
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
