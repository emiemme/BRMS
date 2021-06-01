import QtQuick 2.12
import QtQuick.Controls 2.12

HomeForm {

    property var rightList : [13, 20, 33, 40, 53, 60, 73, 80, 92, 98, 110, 116, 125, 129, 138, 142, 151, 155]
    property var leftList : [1, 12, 21, 32, 41, 52, 61, 72, 81, 91, 99, 109, 117, 124, 130, 137, 143, 150]
    property int totalOmb : 155


    Component.onCompleted: {
        addRows()
        homeTicketForm.closeTicketButton.labelButton.text = "Annulla"
        homeTicketForm.confirmTicketButton.labelButton.text = "Conferma"
        var currentDate = Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
        updateGrid(totalOmb, currentDate)
        Backend.updateStatusGrid(totalOmb, currentDate)

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
        var status
        var cellColor
        var currentDate = new Date()
        var arriveDateCmp = new Date(arriveDate)
        var departureDateCmp = new Date(departureDate)

        //console.log(arriveDateCmp.getTime()  + " == " + currentDate.getTime() + " == " + departureDateCmp.getTime() )
        if( currentDate.getTime() >= arriveDateCmp.getTime() && currentDate.getTime() <= departureDateCmp ) {
                status =    "Arrived"
                cellColor = "#ff0000"
        } else {
                status =    "Not Arrived"
                cellColor = "#00ff00"
        }

        var operatore =      "Maria"
        if ( Backend.insertNewBooking(ticketNumber, omb_number, client_name, client_surname,
                                 lettini, sdraio, cabina, arriveDate, departureDate, status, operatore) ) {
            console.log("New Ticket inserted")
            // Aggiorno contatore ticket interno
            if (Backend.setTicketCount() ) {
                console.log("Update ticket count")
            }
            updateCell(omb_number, client_name, cellColor)
        }
        homeTicketForm.visible = false
    }


    infoCell.closeinfoButton.mouseAreaButton.onClicked: {
        console.log("Clicked")

        infoCell.visible = false
    }



    function updateGrid(total_omb, currentDate) {
        if (Backend.selectAllStatus(total_omb, currentDate) ) {
            var rightListIndex = 0
            var indexListModel = 0

            for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
                indexListModel = 0
                for(var colRIndex = rightList[rightRow+1]; colRIndex > rightList[rightRow]-1; colRIndex--){
                    if(stackView.children[rightListIndex].model.get(indexListModel).cellNumber == Backend.m_ombStatus_list[colRIndex-1].b_omb_num) {
//                        console.log(Backend.m_ombStatus_list[colRIndex-1].b_omb_num +" == "+ Backend.m_ombStatus_list[colRIndex].b_client_name)
                        stackView.children[rightListIndex].model.get(indexListModel).clientName = Backend.m_ombStatus_list[colRIndex-1].b_client_name
                        stackView.children[rightListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colRIndex-1].b_color
                    }
                    indexListModel++
                }
                rightListIndex++
            }


            var leftListIndex = rightListIndex;
            for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
                indexListModel = 0
                for(var colLIndex = leftList[leftRow+1]; colLIndex > leftList[leftRow]-1; colLIndex--){
                    if(stackView.children[leftListIndex].model.get(indexListModel).cellNumber == Backend.m_ombStatus_list[colLIndex-1].b_omb_num) {
                        stackView.children[leftListIndex].model.get(indexListModel).clientName = Backend.m_ombStatus_list[colLIndex-1].b_client_name
                        stackView.children[leftListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colLIndex-1].b_color
                    }
                    indexListModel++
                }
                leftListIndex++
            }
        }

    }


    function updateCell(currentCell, clientName, statusColor) {
        var rightListIndex = 0
        var indexListModel = 0

        for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
            indexListModel = 0
            for(var colRIndex = rightList[rightRow+1]; colRIndex > rightList[rightRow]-1; colRIndex--){
                if(stackView.children[rightListIndex].model.get(indexListModel).cellNumber == currentCell) {
                    stackView.children[rightListIndex].model.get(indexListModel).clientName = clientName
                    stackView.children[rightListIndex].model.get(indexListModel).statusColor = statusColor
                }
                indexListModel++
            }
            rightListIndex++
        }

        var leftListIndex = rightListIndex;
        for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
            indexListModel = 0
            for(var colLIndex = leftList[leftRow+1]; colLIndex > leftList[leftRow]-1; colLIndex--){
                if(stackView.children[leftListIndex].model.get(indexListModel).cellNumber == currentCell) {
                    stackView.children[leftListIndex].model.get(indexListModel).clientName = clientName
                    stackView.children[leftListIndex].model.get(indexListModel).statusColor = statusColor
                }
                indexListModel++
            }
            leftListIndex++
        }
    }


    function addRows() {
        var rightListIndex = 0;
        var indexListModel = 0
        for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
            indexListModel = 0
            for(var colRIndex = rightList[rightRow+1]; colRIndex > rightList[rightRow]-1; colRIndex--){
                stackView.children[rightListIndex].model.append({cellNumber: colRIndex, clientName: "Nomelungo", statusColor: "#d85409"} )
                //console.log(stackView.children[rightListIndex].model.get(indexListModel).cellNumber)
                indexListModel++
            }
            rightListIndex++
        }

        var leftListIndex = rightListIndex;
        for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
            for(var colLIndex = leftList[leftRow+1]; colLIndex > leftList[leftRow]-1; colLIndex--){
                stackView.children[leftListIndex].model.append({cellNumber: colLIndex, clientName: "Nomelungo", statusColor: "#d85409"} )
                //stackView.children[leftListIndex].model.labelClientName.text = "ciao"
            }
            leftListIndex++
        }
    }
}
