import QtQuick 2.12
import QtQuick.Controls 2.12
//import Booking 1.0

InfoCellForm {




function displayInfo(omb_num) {
        Backend.selectOmbBookings(omb_num)
        labelUmbrella.text = omb_num
        for(var i=0; i< Backend.m_booking_list_length; i++ ) {
            if ( Backend.m_booking_list[i].b_status === "Arrived"){
                labelNameSurname.text = Backend.m_booking_list[i].b_client_name +" "+ Backend.m_booking_list[i].b_client_surname
                labelNLettini.text = Backend.m_booking_list[i].b_lettini
                labelNSdraio.text = Backend.m_booking_list[i].b_sdraio
                labelNCabina.text = Backend.m_booking_list[i].b_cabina
                labelArriveDate.text = Backend.m_booking_list[i].b_arriveDate
                labelDepartureDate.text = Backend.m_booking_list[i].b_departureDate
            }
            var row = { checked: false ,
                        name_surname: Backend.m_booking_list[i].b_client_name +" "+ Backend.m_booking_list[i].b_client_surname ,
                        arrive_date: Backend.m_booking_list[i].b_arriveDate ,
                        departure_date: Backend.m_booking_list[i].b_departureDate ,
                        lettini: Backend.m_booking_list[i].b_lettini ,
                        sdraio:  Backend.m_booking_list[i].b_sdraio  }
            tableModelInfo.appendRow(row)
        }
}


}
