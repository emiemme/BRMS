import QtQuick 2.12
import QtQuick.Controls 2.12

HomeForm {


    Component.onCompleted: {
        addRows()
        homeTicketForm.closeTicketButton.labelButton.text = "Annulla"
        homeTicketForm.confirmTicketButton.labelButton.text = "Conferma"
    }

    homeTicketForm.closeTicketButton.mouseAreaButton.onClicked: {
        console.log("Clicked")

         homeTicketForm.visible = false
    }

    homeTicketForm.confirmTicketButton.mouseAreaButton.onClicked: {
        console.log("Confirmed")

        var ticketNumber = Backend.getTicketCount() + 1;
        var omb_number = homeTicketForm.labelUmbrella.text
        var client_name  =   homeTicketForm.textFieldName.text
        if (client_name === "" || client_name  === null || client_name === undefined ) {
           client_name  =   homeTicketForm.textFieldName.placeholderText
        }

        var client_surname = homeTicketForm.textFieldSurname.text
        if (client_surname === "" || client_surname  === null || client_surname === undefined ) {
           client_surname  =  "None"
        }

        var lettini =        homeTicketForm.tableModelTicket.rows[1].amount
        var sdraio =         homeTicketForm.tableModelTicket.rows[2].amount
        var cabina =         0

        var arriveDate = homeTicketForm.textDateArrive.text
        if (arriveDate === "" || arriveDate  === null || arriveDate === undefined) {
           arriveDate  =   homeTicketForm.textDateArrive.placeholderText
        }

        var departureDate =  homeTicketForm.textDateDepart.text
        if (departureDate === "" || departureDate  === null || departureDate === undefined ) {
           departureDate  =   homeTicketForm.textDateDepart.placeholderText
        }
        var status =         "Arrived"
        var operatore =      "Maria"
        if ( Backend.insertNewBooking(ticketNumber, omb_number, client_name, client_surname,
                                 lettini, sdraio, cabina, arriveDate, departureDate, status, operatore) ) {
            console.log("New Ticket inserted")
            // Aggiorno contatore ticket interno
            if (Backend.setTicketCount() ) {
                console.log("Update ticket count")

            }
            updateCell(omb_number, client_name, "000000")
        }

        homeTicketForm.visible = false
    }

    function updateCell(currentCell, clientName, status) {
        var rightList = [1, 11, 27, 37, 53, 63, 79, 89, 105, 115, 131, 135, 145, 149, 159, 163]
        var leftList = [12, 26, 38, 52, 64, 78, 90, 104, 116, 130, 136, 144, 150, 158, 164, 172, 173, 183]
        var rightListIndex = 0
        var indexListModel = 0

        for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
            indexListModel = 0

            for(var colRIndex = rightList[rightRow]; colRIndex< rightList[rightRow+1]+1; colRIndex++){
                if(stackView.children[rightListIndex].model.get(indexListModel).cellNumber == currentCell) {
                    stackView.children[rightListIndex].model.get(indexListModel).clientName = clientName
                    stackView.children[rightListIndex].model.get(indexListModel).statusColor = status
                    stackView.children[rightListIndex].model.get(indexListModel).statusCell = false

                    break
                }
                indexListModel++
            }
            rightListIndex++
        }

        var leftListIndex = rightListIndex+2;
        for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
            indexListModel = 0
            for(var colLIndex = leftList[leftRow]; colLIndex< leftList[leftRow+1]+1; colLIndex++){
                if(stackView.children[leftListIndex].model.get(indexListModel).cellNumber == currentCell) {
                    stackView.children[leftListIndex].model.get(indexListModel).clientName = clientName
                    stackView.children[leftListIndex].model.get(indexListModel).statusColor = status
                    stackView.children[leftListIndex].model.get(indexListModel).statusCell = false
                    break
                }
                indexListModel++
            }
            leftListIndex++
        }

    }





    function addRows() {
        var rightList = [1, 11, 27, 37, 53, 63, 79, 89, 105, 115, 131, 135, 145, 149, 159, 163]
        var leftList = [12, 26, 38, 52, 64, 78, 90, 104, 116, 130, 136, 144, 150, 158, 164, 172, 173, 183]
        var rightListIndex = 0;
        var indexListModel = 0
        for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
            indexListModel = 0
            for(var colRIndex = rightList[rightRow]; colRIndex< rightList[rightRow+1]+1; colRIndex++){
                stackView.children[rightListIndex].model.append({cellNumber: colRIndex, clientName: "Nomelungo", statusColor: "#d85409",newCellStatus: true} )
                //console.log(stackView.children[rightListIndex].model.get(indexListModel).cellNumber)
                indexListModel ++
            }
            rightListIndex++
        }

        var leftListIndex = rightListIndex+2;
        for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
            for(var colLIndex = leftList[leftRow]; colLIndex< leftList[leftRow+1]+1; colLIndex++){
                stackView.children[leftListIndex].model.append({cellNumber: colLIndex, clientName: "Nomelungo", statusColor: "#d85409",newCellStatus: true} )
                //stackView.children[leftListIndex].model.labelClientName.text = "ciao"
            }
            leftListIndex++
        }
    }
}
