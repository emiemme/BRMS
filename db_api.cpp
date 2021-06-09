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
    QList <booking> _selectList;
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

                  _selectList.append(_booking);
                }
        } else {
            qDebug("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
        }
    } else {
        qDebug()<<"Wrong Omb Number";
    }
 return _selectList ;
}

QList <ombStatus>  DB_api::selectAllOmbStatus (int total_omb, QDateTime currentDate)
{
    QList <ombStatus> _selectList;
    QSqlQuery _query(sqlDB);
    if( total_omb != 0 && currentDate.isValid() ) {

        for (int _omb_num = 0; _omb_num < total_omb; _omb_num++ ) {
            QString _currentQuery = "SELECT Status, Client_Name FROM Omb_" + QString::number(_omb_num+1) + "  WHERE Data_Partenza >= '" + currentDate.toString("yyyy-MM-dd") + "' ORDER BY Data_Arrivo" ;
            //qDebug()<<currentQuery;
            if (_query.exec(_currentQuery) && _query.lastError().type() == QSqlError::NoError) {
                struct ombStatus _ombStatus;
                _ombStatus.omb_num =_omb_num + 1;
                _ombStatus.color = "#00FF00";
                while (_query.next()) {
                    _ombStatus.status      =    _query.value(0).toString();
                    _ombStatus.client_name =    _query.value(1).toString();
                    qDebug()<<"_omb_num= "<<_omb_num + 1;
                    qDebug()<<"client_name= "<< _ombStatus.client_name;
                    qDebug()<<"status= "<< _ombStatus.status;

                    if(_ombStatus.status == "Arrived" || _ombStatus.status == "Daily") {
                        _ombStatus.color = "#FF0000";
                    } else if (_ombStatus.status == "Not Arrived" || _ombStatus.status == "Incoming") {
                        _ombStatus.color = "#FFFF00";
                    } else if (_ombStatus.status == "Leaving") {
                        _ombStatus.color = "#FF6700";
                    }

                    if(_ombStatus.color != "#00FF00") {
                        break;
                    }
                }
                _selectList.append(_ombStatus);
            }else {
                qDebug("query='%s'\n[%s] ... ERROR %s", _currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                       _query.lastError().text().toLatin1().data());
            }
        }
    } else {
        qDebug()<<"Wrong total_omb Number or datetime";
    }
 return _selectList ;
}

bool DB_api::updateAllStatusBooking(int total_omb,QDateTime currentDate)
{
    bool fRes = false;
    QSqlQuery query(sqlDB);
    QString _currentQuery;
    QStringList _update_query_list;
    for (int _omb_num = 1; _omb_num < total_omb; _omb_num++ ) {
        _currentQuery =  "SELECT Data_Arrivo, Data_Partenza, Ticket_Number  FROM Omb_" + QString::number(_omb_num+1) +" ORDER BY Data_Arrivo" ;

        if (query.exec(_currentQuery) && query.lastError().type() == QSqlError::NoError) {
            //qDebug()<<currentQuery;
            QDateTime _data_arrivo;
            QDateTime _data_partenza;
            QString _ticket_number;
            while (query.next()) {
                _data_arrivo      =    QDateTime::fromString( query.value(0).toString(),"yyyy-MM-dd");
                _data_partenza    =    QDateTime::fromString(query.value(1).toString(),"yyyy-MM-dd");
                _ticket_number    = query.value(2).toString();

                if(currentDate > _data_arrivo && currentDate < _data_partenza) {
                    _update_query_list.append("UPDATE Omb_"+ QString::number(_omb_num+1)+" SET Status = \"Arrived\" WHERE Ticket_Number = "+_ticket_number);
                }
                else if (currentDate == _data_arrivo) {
                    _update_query_list.append("UPDATE Omb_"+ QString::number(_omb_num+1)+" SET Status = \"Incoming\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if (currentDate < _data_arrivo) {
                    _update_query_list.append("UPDATE Omb_"+ QString::number(_omb_num+1)+" SET Status = \"Not Arrived\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if ( currentDate == _data_partenza) {
                    _update_query_list.append("UPDATE Omb_"+ QString::number(_omb_num+1)+" SET Status = \"Leaving\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if (currentDate > _data_partenza){
                    _update_query_list.append("UPDATE Omb_"+ QString::number(_omb_num+1)+" SET Status = \"Out\" WHERE Ticket_Number = "+_ticket_number);
                }
            }
            if (_update_query_list.count() != 0) {
                foreach(QString _listQuery,_update_query_list) {
                    if (query.exec(_listQuery) && query.lastError().type() == QSqlError::NoError) {
                        qDebug()<<"query executed:"<<_listQuery;
                    } else {
                        qDebug("query='%s'\n[%s] ... ERROR %s", _listQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                }
                _update_query_list.clear();
            }
        }else {
            qDebug("query='%s'\n[%s] ... ERROR %s", _currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
            break;
        }
    }
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

