#include "db_api.h"
#include <QVariant>
#include <QDebug>


#define BASE_PATH "./"

DB_api::DB_api(QObject *parent) : QObject(parent)
{

}

bool DB_api::openDB(int totalOmb)
{
    bool fRes = false;
    sqlDB = QSqlDatabase::addDatabase("QSQLITE");
    sqlDB.setDatabaseName(BASE_PATH "Gestionale_Lido.sqlite");

    if(!sqlDB.open()) {
        qDebug("[%s] open (%s) ERROR '%s'", __PRETTY_FUNCTION__, sqlDB.databaseName().toLatin1().data(),
               sqlDB.lastError().text().toLatin1().data());
        fRes = false;
    } else {
            createDB(totalOmb);
            fRes = true;
    }
    return fRes;
}

void DB_api::closeDB()
{
   sqlDB.close();
}

bool DB_api::_queryTheDB(const QString text, QString msg)
{
    QSqlQuery query(sqlDB);

    if (query.exec(text)) {
        // qDebug("query='%s'\n%s ... OK", text.toLatin1().data(), msg.toLatin1().data());
        return true;
    } else {
        qDebug("query='%s'\n%s ... ERROR %s", text.toLatin1().data(), msg.toLatin1().data(), query.lastError().text().toLatin1().data());
        return false;
    }
}


bool DB_api::createDB(int total_omb)
{
    bool fRes = false;
    qDebug("[%s] empty database file ...", __PRETTY_FUNCTION__);

    bool ok;
    ok = _queryTheDB("BEGIN TRANSACTION;",QString("[%1] begin").arg(__PRETTY_FUNCTION__));

    if (!ok) {

        _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = false;

    } else {
        for(int i=0; i<total_omb; i++) {
            ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Omb_" +  QString::number(i+1) +  " ( "
                            "Ticket_Number INTEGER PRIMARY KEY,"
                            "DateTime varchar(20),"
                            "Client_Name varchar(100),"
                            "Client_Surname varchar(100),"
                            "Lettini INTEGER,"
                            "Sdraio INTEGER,"
                            "Cabina INTEGER,"
                            "Data_Arrivo varchar(10),"
                            "Data_Partenza varchar(10),"
                            "Status varchar(10),"
                            "Operatore varchar(10)"
                            ")",
                            QString("[%1] create "+  QString::number(i)).arg(__PRETTY_FUNCTION__));
            if (!ok) {
                _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
                fRes = false;
                goto exit_function;
            }
        }

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Settings ( "
                        "Ticket_Count INTEGER"
                        ")",
                        QString("[%1] create table Settings").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
            fRes = false;
            goto exit_function;
        }

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Statistic ( "
                        "Country varchar(100),"
                        "Attacks integer(11)"
                        ")",
                        QString("[%1] create table Statistic").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
            fRes = false;
            goto exit_function;
        }

        ok = _queryTheDB("END TRANSACTION;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            fRes = false;
            goto exit_function;

        } else {
            fRes = true;
        }
    }
exit_function:
    return fRes;
}

bool DB_api::insertBooking(struct booking newBooking)
{
    bool fRes = false;
    if( newBooking.omb_num != 0 ) {

        QString currentQuery = "INSERT INTO Omb_"+QString::number(newBooking.omb_num)+" (Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Operatore) "
                "VALUES ('" +
                QString::number(newBooking.ticketNumber) +
                "', '" + newBooking.timeStamp.toString("yyyy-MM-dd") +
                "', '" + newBooking.client_name +
                "', '" + newBooking.client_surname +
                "', '" + QString::number(newBooking.lettini) +
                "', '" + QString::number(newBooking.sdraio) +
                "', '" + QString::number(newBooking.cabina) +
                "', '" + newBooking.arriveDate.toString("yyyy-MM-dd") +
                "', '" + newBooking.departureDate.toString("yyyy-MM-dd") +
                "', '" + newBooking.status +
                "', '" + newBooking.operatore +
                "')";

        _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));
        if(setTicketCount(newBooking.ticketNumber)){
            fRes = true;
        } else {
            fRes = false;
        }
    }
    else {
        fRes = false;
    }
 return fRes;
}

bool DB_api::replaceBooking(struct booking replaceBooking)
{
    bool fRes = false;
    if( replaceBooking.omb_num != 0 ) {

        QString currentQuery = "REPLACE INTO Omb_"+QString::number(replaceBooking.omb_num)+" (Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Operatore) "
                "VALUES ('" +
                QString::number(replaceBooking.ticketNumber) +
                "', '" + replaceBooking.timeStamp.toString("yyyy-MM-dd") +
                "', '" + replaceBooking.client_name +
                "', '" + replaceBooking.client_surname +
                "', '" + QString::number(replaceBooking.lettini) +
                "', '" + QString::number(replaceBooking.sdraio) +
                "', '" + QString::number(replaceBooking.cabina) +
                "', '" + replaceBooking.arriveDate.toString("yyyy-MM-dd") +
                "', '" + replaceBooking.departureDate.toString("yyyy-MM-dd") +
                "', '" + replaceBooking.status +
                "', '" + replaceBooking.operatore +
                "')";

        _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = true;
    }
    else {
        fRes = false;
    }
 return fRes;
}

bool DB_api::deleteBooking(struct booking deleteBooking)
{
    bool fRes = false;
    if( deleteBooking.omb_num != 0 ) {

        QString currentQuery = "DELETE FROM Omb_"+QString::number(deleteBooking.omb_num)+" WHERE Ticket_Number = " + QString::number(deleteBooking.ticketNumber);

        _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = true;
    }
    else {
        fRes = false;
    }
 return fRes;

}

QList <booking> DB_api::selectOmbBooking(int omb_num)
{
    QList <booking> selectList;
    struct booking _booking;
    QSqlQuery query(sqlDB);
    if( omb_num != 0 ) {

        QString currentQuery = "SELECT Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Operatore FROM Omb_"+QString::number(omb_num);
        if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
              while (query.next()) {
                  _booking.ticketNumber = query.value(0).toInt();
                  _booking.timeStamp = query.value(1).toDateTime();
                  _booking.omb_num = omb_num;
                  _booking.client_name = query.value(2).toString();
                  _booking.client_surname = query.value(3).toString();
                  _booking.lettini = query.value(4).toInt();
                  _booking.sdraio = query.value(5).toInt();
                  _booking.cabina = query.value(6).toInt();
                  _booking.arriveDate = query.value(7).toDate();
                  _booking.departureDate = query.value(8).toDate();
                  _booking.status = query.value(9).toString();
                  _booking.operatore = query.value(10).toString();

                  selectList.append(_booking);
                }
        } else {
            qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
        }
    } else {
        qDebug()<<"Wrong Omb Number";
    }
 return selectList ;
}

QList <ombStatus>  DB_api::selectAllOmbStatus (int total_omb, QDateTime currentDate)
{
    QList <ombStatus> selectList;
    QString color;
    QSqlQuery query(sqlDB);
    QString _currentDateString = currentDate.toString("yyyy-MM-dd");
    if( total_omb != 0 && currentDate.isValid() ) {

        for (int _omb_num = 0; _omb_num < total_omb; _omb_num++ ) {
            QString currentQuery = "SELECT Status, Client_Name FROM Omb_" + QString::number(_omb_num+1) + "  WHERE Data_Partenza >= '" + _currentDateString + "' ORDER BY Data_Arrivo" ;
            //qDebug()<<currentQuery;
            if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                struct ombStatus _ombStatus;
                _ombStatus.omb_num =_omb_num + 1;
                while (query.next()) {
                    _ombStatus.status      =    query.value(0).toString();
                    _ombStatus.client_name =    query.value(1).toString();
                    //qDebug()<<"status= "<< _ombStatus.status;
                    //qDebug()<<"client_name= "<< _ombStatus.client_name;
                }
                if(_ombStatus.status == "Arrived" || _ombStatus.status == "Daily") {
                    color = "#FF0000";
                } else if (_ombStatus.status == "Not Arrived" || _ombStatus.status == "Incoming") {
                    color = "#FFFF00";
                } else {
                    color = "#00FF00";
                }
                _ombStatus.color = color;

                if(!_ombStatus.color.isEmpty()) {
                    selectList.append(_ombStatus);
                }
            }else {
                qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                       query.lastError().text().toLatin1().data());
            }
        }
    } else {
        qDebug()<<"Wrong total_omb Number or datetime";
    }
 return selectList ;
}

bool DB_api::updateAllStatusBooking(int total_omb,QDateTime currentDate)
{
    bool fRes = false;
    QSqlQuery query(sqlDB);
    QString _currentDateString = currentDate.toString("yyyy-MM-dd");
    QString currentQuery;
    for (int _omb_num = 1; _omb_num < total_omb; _omb_num++ ) {


        currentQuery = "SELECT Status FROM Omb_" + QString::number(_omb_num+1) + " ORDER BY Data_Arrivo" ;
        //qDebug()<<currentQuery;
        if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
            QString currentStatus;
            while (query.next()) {
                currentStatus      =    query.value(0).toString();
                if(currentStatus == "Not Arrived") {
                    currentQuery = "UPDATE Omb_"+ QString::number(_omb_num)+" SET Status = REPLACE(Status, \"Not Arrived\", \"Arrived\") WHERE Data_Arrivo < '"+_currentDateString+"' AND Data_Partenza > '"+_currentDateString + "'" ;
                    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed";
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                    currentQuery = "UPDATE Omb_"+ QString::number(_omb_num)+" SET Status = REPLACE(Status, \"Not Arrived\", \"Incoming\") WHERE Data_Arrivo = '"+_currentDateString+"' AND Data_Partenza > '"+_currentDateString + "'" ;
                    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed";
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                } else if(currentStatus == "Arrived") {

                    currentQuery = "UPDATE Omb_"+ QString::number(_omb_num)+" SET Status = REPLACE(Status, \"Arrived\", \"Leaving\") WHERE Data_Arrivo <= '"+_currentDateString+"' AND Data_Partenza = '"+_currentDateString + "'";
                    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed";
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                } else if(currentStatus == "Leaving") {

                    currentQuery = "UPDATE Omb_"+ QString::number(_omb_num)+" SET Status = REPLACE(Status, \"Leaving\", \"Out\") WHERE Data_Partenza < '"+_currentDateString+ "'" ;
                    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed";
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                } else if(currentStatus == "Daily") {

                    currentQuery = "UPDATE Omb_"+ QString::number(_omb_num)+" SET Status = REPLACE(Status, \"Daily\", \"Out\") WHERE Data_Partenza < '"+_currentDateString+ "'" ;
                    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed";
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                }
            }

        }else {
            qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
            break;
        }
    }
    qDebug()<<"FINITO!!!";
    //2021-05-27T10:15
    return fRes;
}

bool DB_api::setTicketCount(int ticket_number)
{
    bool fRes = false;
    QString currentQuery;
    if( ticket_number == 0 ) {
        currentQuery = "INSERT INTO Settings (Ticket_Count) ""VALUES ('" +QString::number(ticket_number) +"')";
    } else {
        currentQuery = "UPDATE Settings SET Ticket_Count = replace(Ticket_Count, "+QString::number(ticket_number-1) +", " +QString::number(ticket_number) + " )";
    }
    if (_queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__))) {
        fRes = true;
    }
    else {
        fRes = false ;
    }
    return fRes;
}

int DB_api::getTicketCount()
{
    QSqlQuery query(sqlDB);
    int ticket_number = 0;
    QString currentQuery = "SELECT Ticket_Count FROM Settings";
    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
        while (query.next()) {
            ticket_number = query.value(0).toInt();
        }
    }
    return ticket_number;
}

