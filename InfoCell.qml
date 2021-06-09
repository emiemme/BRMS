import QtQuick 2.12
import QtQuick.Controls 2.12
//import Booking 1.0

InfoCellForm {




function displayInfo(omb_num) {
        Backend.selectOmbBookings(omb_num)
        labelUmbrella.text = omb_num
        tableModelInfo.clear()
        if( Backend.m_booking_list_length > 0) {
            for(var i=0; i< Backend.m_booking_list_length; i++ ) {
                var arriveDate =  new Date(Backend.m_booking_list[i].b_arriveDate).toISOString().split('T')[0]
                var departureDate = new Date(Backend.m_booking_list[i].b_departureDate).toISOString().split('T')[0]
                var check =  false
                if ( Backend.m_booking_list[i].b_status === "Arrived" || Backend.m_booking_list[i].b_status === "Daily"){
                    labelNameSurname.text = Backend.m_booking_list[i].b_client_name +" "+ Backend.m_booking_list[i].b_client_surname
                    labelNLettini.text = Backend.m_booking_list[i].b_lettini
                    labelNSdraio.text = Backend.m_booking_list[i].b_sdraio
                    labelNCabina.text = Backend.m_booking_list[i].b_cabina
                    labelTicketNumber.text = Backend.m_booking_list[i].b_ticketNumber
                    labelArriveDate.text = arriveDate
                    labelDepartureDate.text = departureDate
                    check = true
                }
                var row = { checked: check ,
                            name: Backend.m_booking_list[i].b_client_name,
                            surname: Backend.m_booking_list[i].b_client_surname,
                            arrive_date:  arriveDate ,
                            departure_date:  departureDate ,
                            lettini: Backend.m_booking_list[i].b_lettini ,
                            sdraio:  Backend.m_booking_list[i].b_sdraio,
                            cabina: 0,
                            numeroT: Backend.m_booking_list[i].b_ticketNumber}
                tableModelInfo.appendRow(row)
            }
        } else {
            labelNameSurname.text = " "
            labelNLettini.text = " "
            labelNSdraio.text = ""
            labelNCabina.text = ""
            labelArriveDate.text = ""
            labelDepartureDate.text = ""

        }
}


}
