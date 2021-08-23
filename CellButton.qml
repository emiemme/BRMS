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
                 cellGlow.visible = true
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
                    var row = {checked: true, currentText: "Ombrellone", amount: 1}
                    homeTicketForm.tableModelTicket.setRow(0,row)
                    row = {checked: true, currentText: "Lettini", amount: 2}
                    homeTicketForm.tableModelTicket.setRow(1,row)
                    row = {checked: false, currentText: "Sdraio", amount: 0}
                    homeTicketForm.tableModelTicket.setRow(2,row)
                    row = {checked: false, currentText: "Cabina", amount: 0}
                    homeTicketForm.tableModelTicket.setRow(3,row)
                } else {
                    console.log("cell "+ labelNumber.text  +" Clicked but not Empty")
                    infoCell.visible = true
                    infoCell.displayInfo(labelNumber.text)
                }
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

