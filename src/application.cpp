#include "application.h"
#include <QDateTime>

Application::Application(QObject *parent) : QObject(parent)
{
    db = new DB_api();
    int totalOmb = 173 + 4;
    db->openDB(totalOmb);
    ticketCount = db->getTicketCount();
    if(ticketCount == 0) {
        db->setTicketCount(0);
    }
}


bool Application::selectAllStatus(int total_omb, QString currentDate)
{
     bool fRes = false;
     qml_ombStatus_list = db->selectAllOmbStatus(total_omb,QDateTime::fromString(currentDate, "yyyy-MM-dd"));
//     qDebug()<<qml_ombStatus_list.count();
//     for(int i=0;i < qml_ombStatus_list.count(); i++) {
//        qDebug()<<qml_ombStatus_list.at(i).omb_num<<"-->"<<qml_ombStatus_list.at(i).status<<"-->"<<qml_ombStatus_list.at(i).color;
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
    qDebug()<<fRes;
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


bool Application::insertNewBooking(int ticketNumber, QString omb_num, QString clientName, QString clientSurname,
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

bool Application::deleteBooking(int ticketNumber, QString omb_num)
{
    booking deleteBooking;
    deleteBooking.ticketNumber = ticketNumber;
    deleteBooking.omb_num = omb_num;

    return db->deleteBooking(deleteBooking);
}

bool Application::selectOmbBookings(QString ombNumb)
{
    bool fRes = false;
    qml_booking_list =  db->selectOmbBooking(ombNumb);
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

void Application::setNewPrices()
{
    db->setPrices(tempPrices);
}

bool Application::getNewPrices()
{
   bool fRes = false;
   currentPrices = db->getPrices();

   if(!currentPrices.junePricesMap.isEmpty() && !currentPrices.julyPricesMap.isEmpty() &&
      !currentPrices.augustPricesMap.isEmpty() && !currentPrices.septemberPricesMap.isEmpty()) {
       fRes =  true;
   }

   return fRes;
}

QList<int> Application::getJunePrice(int rowIndex)
{
    return currentPrices.junePricesMap.value(rowIndex);
}

QList<int> Application::getJulyPrice(int rowIndex)
{
    return currentPrices.julyPricesMap.value(rowIndex);
}

QList<int> Application::getAugustPrice(int rowIndex)
{
    return currentPrices.augustPricesMap.value(rowIndex);
}

QList<int> Application::getSeptemberPrice(int rowIndex)
{
    return currentPrices.septemberPricesMap.value(rowIndex);
}

void Application::setJunePrice(QList<int> price, int rowIndex)
{
    qDebug()<<price;

    tempPrices.junePricesMap.insert(rowIndex,price);
}

void Application::setJulyPrice(QList<int> price, int rowIndex)
{
    tempPrices.julyPricesMap.insert(rowIndex,price);
}

void Application::setAugustPrice(QList<int> price, int rowIndex)
{
    tempPrices.augustPricesMap.insert(rowIndex,price);
}

void Application::setSeptemberPrice(QList<int> price, int rowIndex)
{
    tempPrices.septemberPricesMap.insert(rowIndex,price);
}

float Application::calculatePrice(QString omb_num, QString arriveDate_s, QString departureDate_s, int days)
{
    float fRes = -1;
    if(getNewPrices()) {
        QDate arriveDate = QDateTime::fromString(arriveDate_s,Qt::ISODate).date();
        QDate departureDate = QDateTime::fromString(departureDate_s,Qt::ISODate).date();

        int row = rowFinder(omb_num);
        float startPrice;
        float departurePrice;

        if(days > 0 && days < 6) {

            switch (arriveDate.month()) {
            case 6:   //"June"
                startPrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Daily);
                break;
            case 7:   //"July"
                startPrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Daily);
                break;
            case 8:   //"August"
                startPrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Daily);
                break;
            case 9:   //"September"
                startPrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Daily);
                break;
            default:
                startPrice = -1;
            }

            switch (departureDate.month()) {
            case 6:   //"June"
                departurePrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Daily);
                break;
            case 7:   //"July"
                departurePrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Daily);
                break;
            case 8:   //"August"
                departurePrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Daily);
                break;
            case 9:   //"September"
                departurePrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Daily);
                break;
            default:
                departurePrice = -1;
            }

        } else if (days >= 6 && days < 15) {
            switch (arriveDate.month()) {
            case 6:   //"June"
                startPrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Week)/7;
                break;
            case 7:   //"July"
                startPrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Week)/7;
                break;
            case 8:   //"August"
                startPrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Week)/7;
                break;
            case 9:   //"September"
                startPrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Week)/7;
                break;
            default:
                startPrice = -1;
            }

            switch (departureDate.month()) {
            case 6:   //"June"
                departurePrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Week)/7;
                break;
            case 7:   //"July"
                departurePrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Week)/7;
                break;
            case 8:   //"August"
                departurePrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Week)/7;
                break;
            case 9:   //"September"
                departurePrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Week)/7;
                break;
            default:
                departurePrice = -1;
            }
        } else if (days >= 15 && days < 27) {
            switch (arriveDate.month()) {
            case 6:   //"June"
                startPrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 7:   //"July"
                startPrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 8:   //"August"
                startPrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 9:   //"September"
                startPrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            default:
                startPrice = -1;
            }

            switch (departureDate.month()) {
            case 6:   //"June"
                departurePrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 7:   //"July"
                departurePrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 8:   //"August"
                departurePrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            case 9:   //"September"
                departurePrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Fifteen)/15;
                break;
            default:
                departurePrice = -1;
            }
        } else if (days >= 27) {
            switch (arriveDate.month()) {
            case 6:   //"June"
                startPrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Month)/30;
                break;
            case 7:   //"July"
                startPrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Month)/30;
                break;
            case 8:   //"August"
                startPrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Month)/30;
                break;
            case 9:   //"September"
                startPrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Month)/30;
                break;
            default:
                startPrice = -1;
            }

            switch (departureDate.month()) {
            case 6:   //"June"
                departurePrice = (float)currentPrices.junePricesMap.value(row).at(priceT::Month)/30;
                break;
            case 7:   //"July"
                departurePrice = (float)currentPrices.julyPricesMap.value(row).at(priceT::Month)/30;
                break;
            case 8:   //"August"
                departurePrice = (float)currentPrices.augustPricesMap.value(row).at(priceT::Month)/30;
                break;
            case 9:   //"September"
                departurePrice = (float)currentPrices.septemberPricesMap.value(row).at(priceT::Month)/30;
                break;
            default:
                departurePrice = -1;
            }
        }


        //qDebug()<<"Row finder:"<<row<< " startPrice:"<<startPrice<< " departurePrice:"<<departurePrice<< " days:"<<days;
        if(departureDate.month() - arriveDate.month() == 0) {
            if(days == 6 || days == 7) {
                fRes =  startPrice * 7;
            } else if (days == 29 || days == 30 || days == 31) {
                fRes =  startPrice * 30;
            }else {
                fRes = startPrice * days;
            }
        } else if (departureDate.month() - arriveDate.month() == 1)  {
            int startDays = arriveDate.daysInMonth() - arriveDate.day() + 1;
            //qDebug()<<"arriveDate.daysInMonth():"<<arriveDate.daysInMonth()<< "  arriveDate.day():"<< arriveDate.day();

            int endDays = departureDate.day();
            //qDebug()<<"  departureDate.day():"<< departureDate.day();
            //qDebug()<<"startDays:"<<startDays<< " endDays:"<<endDays<< " days:"<<days;

            fRes = (startPrice*startDays) + (departurePrice*endDays);
        }
    } else {
        qDebug()<<"Cannot get Prices";
    }

    return fRes;
}

int Application::rowFinder(QString omb_numb)
{
    int fRes = 0;

    if(omb_numb == "A" || (omb_numb.toInt() > 0 && omb_numb.toInt() < 21)) {
        fRes = 1;
    } else if(omb_numb == "B" || (omb_numb.toInt() > 20 && omb_numb.toInt() < 41)) {
        fRes = 2;
    } else if(omb_numb == "C" || omb_numb == "D" || omb_numb.toInt() > 40 ) {
        fRes = 3;
    }
    return fRes;

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
