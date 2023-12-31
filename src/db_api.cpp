#include "db_api.h"
#include <QVariant>
#include <QDebug>


#define BASE_PATH "./"

DB_api::DB_api(QObject *parent) : QObject(parent)
{
    freeOmb    = 0;
    bookingOmb = 0;
    leavingOmb = 0;
    incomingOmb = 0;
    dailyOmb = 0;
}

bool DB_api::openDB(int totalOmb)
{
    bool fRes = false;
    sqlDB = QSqlDatabase::addDatabase("QSQLITE");
    sqlDB.setDatabaseName(BASE_PATH "Gestionale_Lido.sqlite");

    if(!sqlDB.open()) {
        qCritical("[%s] open (%s) ERROR '%s'", __PRETTY_FUNCTION__, sqlDB.databaseName().toLatin1().data(),
               sqlDB.lastError().text().toLatin1().data());
        fRes = false;
    } else {
            createDB(totalOmb);
            createLettersTables();
            createPriceTables();
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
         //qDebug("query='%s'\n%s ... OK", text.toLatin1().data(), msg.toLatin1().data());
        return true;
    } else {
        qWarning("query='%s'\n%s ... ERROR %s", text.toLatin1().data(), msg.toLatin1().data(), query.lastError().text().toLatin1().data());
        return false;
    }
}

bool DB_api::createDB(int total_omb)
{
    bool fRes = false;
    qWarning("[%s] empty database file ...", __PRETTY_FUNCTION__);

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
                            "Acconto varchar(10),"
                            "Cell_number varchar(10),"
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

bool DB_api::createLettersTables()
{
    bool fRes = false;
    qWarning("[%s] empty database file ...", __PRETTY_FUNCTION__);

    bool ok;
    ok = _queryTheDB("BEGIN TRANSACTION;",QString("[%1] begin").arg(__PRETTY_FUNCTION__));

    ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Omb_A ( "
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
                    "Acconto varchar(10),"
                    "Cell_number varchar(10),"
                    "Operatore varchar(10)"
                    ")",
                    QString("[%1] create A").arg(__PRETTY_FUNCTION__));
    if (!ok) {
        _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = false;
        goto exit_function;
    }

    ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Omb_B ( "
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
                    "Acconto varchar(10),"
                    "Cell_number varchar(10),"
                    "Operatore varchar(10)"
                    ")",
                    QString("[%1] create B").arg(__PRETTY_FUNCTION__));
    if (!ok) {
        _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = false;
        goto exit_function;
    }

    ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Omb_C ( "
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
                    "Acconto varchar(10),"
                    "Cell_number varchar(10),"
                    "Operatore varchar(10)"
                    ")",
                    QString("[%1] create C").arg(__PRETTY_FUNCTION__));
    if (!ok) {
        _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = false;
        goto exit_function;
    }

    ok = _queryTheDB("CREATE TABLE IF NOT EXISTS Omb_D ( "
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
                    "Acconto varchar(10),"
                    "Cell_number varchar(10),"
                    "Operatore varchar(10)"
                    ")",
                    QString("[%1] create D").arg(__PRETTY_FUNCTION__));
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

exit_function:
    return fRes;
}

bool DB_api::createPriceTables()
{
    bool fRes = false;
    qWarning("[%s] empty database file ...", __PRETTY_FUNCTION__);

    bool ok;
    ok = _queryTheDB("BEGIN TRANSACTION;",QString("[%1] begin").arg(__PRETTY_FUNCTION__));
    if (!ok) {

        _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = false;

    } else {

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS June_Prices ( "
                        "Rows       integer(11) PRIMARY KEY,"
                         "Daily     integer(11),"
                         "Week      integer(11),"
                         "Fifteen   integer(11),"
                         "Month     integer(11)"
                        ")",
                        QString("[%1] create table Statistic").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
            fRes = false;
            goto exit_function;
        }

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS July_Prices ( "
                        "Rows       integer(11) PRIMARY KEY,"
                         "Daily     integer(11),"
                         "Week      integer(11),"
                         "Fifteen   integer(11),"
                         "Month     integer(11)"
                        ")",
                        QString("[%1] create table Statistic").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
            fRes = false;
            goto exit_function;
        }

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS August_Prices ( "
                        "Rows       integer(11) PRIMARY KEY,"
                         "Daily     integer(11),"
                         "Week      integer(11),"
                         "Fifteen   integer(11),"
                         "Month     integer(11)"
                        ")",
                        QString("[%1] create table Statistic").arg(__PRETTY_FUNCTION__));
        if (!ok) {
            _queryTheDB("ROLLBACK;",QString("[%1] end").arg(__PRETTY_FUNCTION__));
            fRes = false;
            goto exit_function;
        }

        ok = _queryTheDB("CREATE TABLE IF NOT EXISTS September_Prices ( "
                        "Rows       integer(11) PRIMARY KEY,"
                         "Daily     integer(11),"
                         "Week      integer(11),"
                         "Fifteen   integer(11),"
                         "Month     integer(11)"
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
    if( !newBooking.omb_num.isEmpty() ) {

        QString currentQuery = "INSERT OR REPLACE INTO Omb_"+newBooking.omb_num+" (Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Acconto, Cell_number, Operatore) "
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
                "', '" + newBooking.acconto +
                "', '" + newBooking.cell_number +
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
    if( !replaceBooking.omb_num.isEmpty()) {

        QString currentQuery = "REPLACE INTO Omb_"+replaceBooking.omb_num+" (Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Acconto, Cell_number, Operatore) "
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
                "', '" + replaceBooking.acconto +
                "', '" + replaceBooking.cell_number +
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
    if( !deleteBooking.omb_num.isEmpty()) {

        QString currentQuery = "DELETE FROM Omb_"+deleteBooking.omb_num+" WHERE Ticket_Number = " + QString::number(deleteBooking.ticketNumber);
        qDebug()<<currentQuery;
        _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));
        fRes = true;
    }
    else {
        fRes = false;
    }
 return fRes;

}

QList <booking> DB_api::selectOmbBooking(QString omb_num)
{
    QList <booking> _selectList;
    struct booking _booking;
    QSqlQuery query(sqlDB);
    if( !omb_num.isEmpty() ) {

        QString currentQuery = "SELECT Ticket_Number, DateTime, Client_Name, Client_Surname, Lettini, Sdraio, Cabina ,Data_Arrivo, Data_Partenza, Status, Acconto, Cell_number, Operatore FROM Omb_"+omb_num;
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
                  _booking.acconto = query.value(10).toString();
                  _booking.cell_number = query.value(11).toString();
                  _booking.operatore = query.value(12).toString();

                  _selectList.append(_booking);
                }
        } else {
            qWarning("query='%s'\n[%s] ... ERROR %s", currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
        }
    } else {
        qCritical()<<"Wrong Omb Number";
    }
 return _selectList ;
}

QList <ombStatus>  DB_api::selectAllOmbStatus (int total_omb, QDateTime currentDate)
{
    QList <ombStatus> _selectList;
    QSqlQuery _query(sqlDB);
    freeOmb    = total_omb;
    bookingOmb = 0;
    leavingOmb = 0;
    incomingOmb = 0;
    dailyOmb = 0;
    if( total_omb != 0 && currentDate.isValid() ) {

        for (int _omb_num = 1; _omb_num < total_omb +1; _omb_num++ ) {
            QString _currentOmbNumber = getLitteralOmbNumber(_omb_num);
            QString _currentQuery = "SELECT Status, Client_Surname FROM Omb_" + _currentOmbNumber + "  WHERE Data_Partenza >= '" + currentDate.toString("yyyy-MM-dd") + "' ORDER BY Data_Arrivo" ;
            //qDebug()<<currentQuery;
            if (_query.exec(_currentQuery) && _query.lastError().type() == QSqlError::NoError) {
                struct ombStatus _ombStatus;
                _ombStatus.omb_num = _currentOmbNumber;
                _ombStatus.color = "#00FF00";
                while (_query.next()) {
                    _ombStatus.status      =    _query.value(0).toString();
                    _ombStatus.client_surname =    _query.value(1).toString();
                    qDebug()<<"Omb_num = "<< _currentOmbNumber;
                    qDebug()<<"Client_Surname = "<< _ombStatus.client_surname;
                    qDebug()<<"Status = "<< _ombStatus.status;

                    if(_ombStatus.status == "Arrived") {
                        _ombStatus.color = "#FF0000";
                        bookingOmb++;
                        freeOmb--;
                    } else if (_ombStatus.status == "Daily") {
                        _ombStatus.color = "#FF0000";
                        dailyOmb++;
                        freeOmb--;
                    }else if (_ombStatus.status == "Incoming") {
                        _ombStatus.color = "#FFFF00";
                        incomingOmb++;
                        freeOmb--;
                    } else if (_ombStatus.status == "Not Arrived") {
                        _ombStatus.color = "#00FF00";
//                        incomingOmb++;
//                        freeOmb--;
                    }
                    else if (_ombStatus.status == "Leaving") {
                        //_ombStatus.color = "#FF6700";
                        _ombStatus.color = "#0c3483";
                        leavingOmb++;
                        freeOmb--;
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
        qCritical()<<"Wrong total_omb Number or datetime";
    }
 return _selectList ;
}

QList<searchStruct> DB_api::selectSearchValues (int total_omb,QString searchVal)
{
    QList<searchStruct> _searchList;
    searchStruct _tmpSearchStruct;
    QString _tmpName;
    QSqlQuery _query(sqlDB);
    if( total_omb != 0 ) {

        for (int _omb_num = 1; _omb_num < total_omb+1; _omb_num++ ) {
            QString _currentOmbNumber = getLitteralOmbNumber(_omb_num);

            QString _currentQuery = "SELECT Client_Name, Client_Surname FROM Omb_" + _currentOmbNumber + " WHERE Client_Name LIKE (\"%"+searchVal+"%\") OR Client_Surname LIKE (\"%"+searchVal+"%\")";
            //qDebug()<<currentQuery;
            if (_query.exec(_currentQuery) && _query.lastError().type() == QSqlError::NoError) {
                _tmpSearchStruct.omb_num = _currentOmbNumber;
                while (_query.next()) {
                    _tmpName = _query.value(0).toString();
                    if(_tmpName != "-") {
                        _tmpSearchStruct.searchName = _query.value(0).toString();

                    } else {
                         _tmpSearchStruct.searchName = _query.value(1).toString();
                    }
                    _searchList.append(_tmpSearchStruct);
                }
            }else {
                qDebug("query='%s'\n[%s] ... ERROR %s", _currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                       _query.lastError().text().toLatin1().data());
            }
        }
    } else {
        qCritical()<<"Wrong total_omb Number or datetime";
    }
 return _searchList ;
}

QList<int> DB_api::selectFreeOmbInInterval(int startOmb,int endOmb, QDateTime inDate, QDateTime outDate)
{
    QList <int> results;
    QSqlQuery _query(sqlDB);
    QString _currentQuery;
    if( startOmb != 0 && endOmb != 0 && inDate.isValid() && outDate.isValid()) {
        for (int _omb_num = startOmb; _omb_num < endOmb; _omb_num++ ) {
            QString _currentOmbNumber = getLitteralOmbNumber(_omb_num);
            _currentQuery =  "SELECT Data_Arrivo, Data_Partenza  FROM Omb_" + _currentOmbNumber +" ORDER BY Data_Arrivo" ;
            //qDebug()<<_currentQuery;
            if (_query.exec(_currentQuery) && _query.lastError().type() == QSqlError::NoError) {
                QDateTime _data_arrivo;
                QDateTime _data_partenza;
                QString _ticket_number;
                QList<bool> ombValidityList;
                while (_query.next()) {
                    _data_arrivo      =    QDateTime::fromString( _query.value(0).toString(),"yyyy-MM-dd");
                    _data_partenza    =    QDateTime::fromString(_query.value(1).toString(),"yyyy-MM-dd");


                    if( inDate > _data_arrivo && inDate > _data_partenza) {
                        ombValidityList.append(true);
                    } else if (inDate < _data_arrivo && outDate <  _data_arrivo) {
                        ombValidityList.append(true);
                    } else {
                        ombValidityList.append(false);
                    }
                }
                //qDebug()<<"_omb_num:"<<_omb_num<<"-->"<<ombValidityList;
                if(!ombValidityList.contains(false)) {
                    results.append(_omb_num);
                }
            } else {
                qDebug("query='%s'\n[%s] ... ERROR %s", _currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                       _query.lastError().text().toLatin1().data());
            }
        }
    } else {
        qCritical()<<"Wrong total_omb Number or datetime";
    }
    return results ;
}

bool DB_api::updateAllStatusBooking(int total_omb,QDateTime currentDate)
{
    bool fRes = false;
    QSqlQuery query(sqlDB);
    QString _currentQuery;
    QStringList _update_query_list;
    for (int _omb_num = 1; _omb_num < total_omb+1; _omb_num++ ) {
        QString _currentOmbNumber = getLitteralOmbNumber(_omb_num);
        //qDebug()<<"------updateAllStatusBooking omb number:"<<_currentOmbNumber;
        _currentQuery =  "SELECT Data_Arrivo, Data_Partenza, Ticket_Number, Status  FROM Omb_" + _currentOmbNumber +" ORDER BY Data_Arrivo" ;

        if (query.exec(_currentQuery) && query.lastError().type() == QSqlError::NoError) {

            QDateTime _data_arrivo;
            QDateTime _data_partenza;
            QString _ticket_number;
            QString _status;
            while (query.next()) {
                _data_arrivo      =    QDateTime::fromString( query.value(0).toString(),"yyyy-MM-dd");
                _data_partenza    =    QDateTime::fromString(query.value(1).toString(),"yyyy-MM-dd");
                _ticket_number    =    query.value(2).toString();
                _status           =    query.value(3).toString();
                if(currentDate > _data_arrivo && currentDate < _data_partenza) {
                    _update_query_list.append("UPDATE Omb_"+ _currentOmbNumber +" SET Status = \"Arrived\" WHERE Ticket_Number = "+_ticket_number);
                }
                else if (currentDate == _data_arrivo) {
                    if(_status != "Daily")
                    _update_query_list.append("UPDATE Omb_"+ _currentOmbNumber +" SET Status = \"Incoming\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if (currentDate < _data_arrivo) {
                    _update_query_list.append("UPDATE Omb_"+ _currentOmbNumber +" SET Status = \"Not Arrived\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if ( currentDate == _data_partenza) {
                    if(_status != "Daily")
                    _update_query_list.append("UPDATE Omb_"+ _currentOmbNumber +" SET Status = \"Leaving\" WHERE Ticket_Number = "+_ticket_number);

                }
                else if (currentDate > _data_partenza){
                    _update_query_list.append("UPDATE Omb_"+ _currentOmbNumber +" SET Status = \"Out\" WHERE Ticket_Number = "+_ticket_number);
                }
            }
            if (_update_query_list.count() != 0) {
                foreach(QString _listQuery,_update_query_list) {
                    if (query.exec(_listQuery) && query.lastError().type() == QSqlError::NoError) {
                        //qDebug()<<"query executed:"<<_listQuery;
                    } else {
                        qWarning("query='%s'\n[%s] ... ERROR %s", _listQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                               query.lastError().text().toLatin1().data());
                    }
                }
                _update_query_list.clear();
            }
        }else {
            qWarning("query='%s'\n[%s] ... ERROR %s", _currentQuery.toLatin1().data(), __PRETTY_FUNCTION__,
                   query.lastError().text().toLatin1().data());
            break;
        }
    }
    return fRes;
}

QString DB_api::getLitteralOmbNumber(int omb_numb)
{
    QString _currentOmbNumber = QString::number(omb_numb+1);
    if(omb_numb == 174 ) {
        _currentOmbNumber = "A";
    } else if (omb_numb == 175) {
        _currentOmbNumber = "B";
    } else if (omb_numb == 176) {
        _currentOmbNumber = "C";
    } else if(omb_numb == 177){
        _currentOmbNumber = "D";
    } else {
        _currentOmbNumber = QString::number(omb_numb);
    }

    return _currentOmbNumber;
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

bool DB_api::setPrices(pricesStruct newPrices)
{
    bool fRes = false;

    foreach(int row,newPrices.junePricesMap.keys()) {
        QList<int> prices = newPrices.junePricesMap.value(row);
            if(!prices.isEmpty() && prices.count() == 4) {
                QString currentQuery = "INSERT OR REPLACE INTO June_Prices (Rows,Daily,Week,Fifteen,Month) "
                                       "VALUES ('" +
                                       QString::number(row) +
                                       "', '" + QString::number(prices.at(0)) +
                                       "', '" + QString::number(prices.at(1)) +
                                       "', '" + QString::number(prices.at(2)) +
                                       "', '" + QString::number(prices.at(3)) +
                                       + "')";
                fRes = _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));

            }

    }

    foreach(int row,newPrices.julyPricesMap.keys()){
        QList<int> prices = newPrices.julyPricesMap.value(row);
        if(!prices.isEmpty() && prices.count() == 4) {
            QString currentQuery = "INSERT OR REPLACE INTO July_Prices (Rows,Daily,Week,Fifteen,Month) "
                                  "VALUES ('" +
                                   QString::number(row) +
                                   "', '" +QString::number(prices.at(0)) +
                                   "', '" +QString::number(prices.at(1)) +
                                   "', '" +QString::number(prices.at(2)) +
                                   "', '" +QString::number(prices.at(3)) +
                                  + "')";
            fRes = _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));

        }
    }

    foreach(int row,newPrices.augustPricesMap.keys()){
        QList<int> prices = newPrices.augustPricesMap.value(row);
        if(!prices.isEmpty() && prices.count() == 4) {
            QString currentQuery = "INSERT OR REPLACE INTO August_Prices (Rows,Daily,Week,Fifteen,Month) "
                                  "VALUES ('" +
                                   QString::number(row) +
                                   "', '" +QString::number(prices.at(0)) +
                                   "', '" +QString::number(prices.at(1)) +
                                   "', '" +QString::number(prices.at(2)) +
                                   "', '" +QString::number(prices.at(3)) +
                                  + "')";
            fRes = _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));

        }
    }

    foreach(int row,newPrices.septemberPricesMap.keys()){
        QList<int> prices = newPrices.septemberPricesMap.value(row);
        if(!prices.isEmpty() && prices.count() == 4) {
            QString currentQuery = "INSERT OR REPLACE INTO September_Prices (Rows,Daily,Week,Fifteen,Month) "
                                  "VALUES ('" +
                                   QString::number(row) +
                                   "', '" +QString::number(prices.at(0)) +
                                   "', '" +QString::number(prices.at(1)) +
                                   "', '" +QString::number(prices.at(2)) +
                                   "', '" +QString::number(prices.at(3)) +
                                  + "')";
            fRes = _queryTheDB(currentQuery,QString("[%1] end").arg(__PRETTY_FUNCTION__));

        }
    }
    return fRes;
}

pricesStruct DB_api::getPrices()
{
    QSqlQuery query(sqlDB);
    pricesStruct currentPrices;
    QMap<int,QList<int>> junePricesMap;        //row --> Daily,Week,Fifteen,Month
    QMap<int,QList<int>> julyPricesMap;        //row --> Daily,Week,Fifteen,Month
    QMap<int,QList<int>> augustPricesMap;      //row --> Daily,Week,Fifteen,Month
    QMap<int,QList<int>> septemberPricesMap;   //row --> Daily,Week,Fifteen,Month
    QString currentQuery = "SELECT Rows,Daily,Week,Fifteen,Month FROM June_Prices";
    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
        while (query.next()) {
            int row = query.value(0).toInt();
            QList<int> prices;
            prices.append(query.value(1).toInt());
            prices.append(query.value(2).toInt());
            prices.append(query.value(3).toInt());
            prices.append(query.value(4).toInt());
            junePricesMap.insert(row,prices);

        }
    }

    currentQuery = "SELECT Rows,Daily,Week,Fifteen,Month FROM July_Prices";
    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
        while (query.next()) {
            int row = query.value(0).toInt();
            QList<int> prices;
            prices.append(query.value(1).toInt());
            prices.append(query.value(2).toInt());
            prices.append(query.value(3).toInt());
            prices.append(query.value(4).toInt());
            julyPricesMap.insert(row,prices);
        }
    }

    currentQuery = "SELECT Rows,Daily,Week,Fifteen,Month FROM August_Prices";
    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
        while (query.next()) {
            int row = query.value(0).toInt();
            QList<int> prices;
            prices.append(query.value(1).toInt());
            prices.append(query.value(2).toInt());
            prices.append(query.value(3).toInt());
            prices.append(query.value(4).toInt());
            augustPricesMap.insert(row,prices);
        }
    }

    currentQuery = "SELECT Rows,Daily,Week,Fifteen,Month FROM September_Prices";
    if (query.exec(currentQuery) && query.lastError().type() == QSqlError::NoError) {
        while (query.next()) {
            int row = query.value(0).toInt();
            QList<int> prices;
            prices.append(query.value(1).toInt());
            prices.append(query.value(2).toInt());
            prices.append(query.value(3).toInt());
            prices.append(query.value(4).toInt());
            septemberPricesMap.insert(row,prices);
        }
    }

    currentPrices.junePricesMap = junePricesMap;
    currentPrices.julyPricesMap = julyPricesMap;
    currentPrices.augustPricesMap = augustPricesMap;
    currentPrices.septemberPricesMap = septemberPricesMap;

    return currentPrices;
}

