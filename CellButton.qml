import QtQuick 2.12
import QtQuick.Controls 2.12

CellButtonForm {
    property alias cellButton: cellButton
    id:cellButton

    Component.onCompleted: {
        //console.log(separatorRect.color)
    }



    MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (separatorRect.color == "#00ff00") {
                    console.log("cell "+ labelNumber.text  +" Clicked but Empty")
                    homeTicketForm.visible = true
                    homeTicketForm.labelUmbrella.text = labelNumber.text
                    homeTicketForm.textFieldName.text = ""
                    homeTicketForm.textFieldSurname.text = ""
                    homeTicketForm.textDateArrive.text = ""
                    homeTicketForm.textDateDepart.text = ""
                    homeTicketForm.checkBoxDaily.checked = false
                    homeTicketForm.textFieldAcconto.text = ""
                    homeTicketForm.textFieldCellNum.text = ""

                    homeTicketForm.checkBoxLettini.checked = true
                    homeTicketForm.checkBoxSdraio.checked = false
                    homeTicketForm.checkBoxCabina.checked = false

                    homeTicketForm.spinBoxLettini.value = 2
                    homeTicketForm.spinBoxSdraio.value = 0
                    homeTicketForm.spinBoxCabina.value = 0

                    homeTicketForm.datePickerArrive.calendar.startDate = new Date(homeTicketForm.textDateArrive)
                    homeTicketForm.datePickerArrive.calendar.stopDate = new Date(homeTicketForm.textDateDepart)

                    var counterDays =  (Math.abs(new Date(homeTicketForm.datePickerArrive.calendar.stopDate)
                                                 - new Date(homeTicketForm.datePickerArrive.calendar.startDate))/(1000*60*60*24)) +1
                    if(Number.isNaN(counterDays)) {
                        counterDays = 0
                    }
                    homeTicketForm.labelDaysCounter.text = "Durata soggiorno: "+ counterDays +" Giorno"


                } else {
                    console.log("cell "+ labelNumber.text  +" Clicked but not Empty")
                    infoCell.visible = true
                    infoCell.displayInfo(labelNumber.text)
                }
                cellGlow.visible =  false
            }
        }

    function setNumber(n) {
        labelNumber.text = n
    }
    Connections {
        target: Backend

        function onViewName(viewState){
            labelClientName.visible = viewState
        }

        function onSearchCompleted(omb_search_vals){

            for(var i=0; i < omb_search_vals.length; i++) {
                var cell_number = omb_search_vals[i].b_omb_num
                if (labelNumber.text == cell_number ) {
                    cellGlow.visible =  true
                    glow_timer.running = true
                    //console.log("---------------------------------")
                } else {
                   cellGlow.visible =  false
                }
            }
        }
     }


    Timer {
        id: glow_timer
        interval: 2000; running: false; repeat: false
        onTriggered: { cellGlow.visible =  false

        }

    }
}

