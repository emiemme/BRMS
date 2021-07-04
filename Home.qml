import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Controls 1.4 as Old



HomeForm {

    property var rightList : [12, 20, 32, 40, 52, 60, 72, 80, 92, 99, 111, 118, 130, 137, 146, 149, 158, 161, 170, 173]
    property var leftList :  [1,  11, 21, 31, 41, 51, 61, 71, 81, 91, 100, 110, 119, 129, 138, 145, 150, 157, 162, 169]
    property int totalOmb : 173

    signal updateMapCompleted()

    buttonUpdateGrid.onClicked: {
        updateGrid(155,"2021-06-10")
}




    Component.onCompleted: {
        addRows()
        homeTicketForm.closeTicketButton.labelButton.text = "Annulla"
        homeTicketForm.confirmTicketButton.labelButton.text = "Conferma"
        homeTicketForm.bookingTicketButton.labelButton.text = "Prenotazioni"
        var currentDate = Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
        Backend.updateStatusGrid(totalOmb, currentDate)
        updateGrid(totalOmb, currentDate)
    }

    homeTicketForm.dateArriveMouseArea.onClicked: {
        homeTicketForm.datePickerArrive.visible = true
    }
    homeTicketForm.datePickerArrive.onOk: {
        homeTicketForm.datePickerArrive.visible = false
        homeTicketForm.textDateArrive.text = selectDate
    }
    homeTicketForm.datePickerArrive.onCancel: {
        homeTicketForm.datePickerArrive.visible = false
    }


    homeTicketForm.dateDepartureMouseArea.onClicked: {
        homeTicketForm.datePickerDeparture.visible = true
    }
    homeTicketForm.datePickerDeparture.onOk: {
        homeTicketForm.datePickerDeparture.visible = false
        homeTicketForm.textDateDepart.text = selectDate
    }
    homeTicketForm.datePickerDeparture.onCancel: {
        homeTicketForm.datePickerDeparture.visible = false
    }

    homeTicketForm.closeTicketButton.mouseAreaButton.onClicked: {
        //console.log("Clicked")
        homeTicketForm.visible = false
    }

    homeTicketForm.checkBoxDaily.onCheckedChanged: {
        console.log (homeTicketForm.checkBoxDaily.checked)
        if(homeTicketForm.checkBoxDaily.checked) {
            homeTicketForm.textFieldName.visible = true
            homeTicketForm.textFieldAcconto.visible = true
            homeTicketForm.textFieldCellNum.visible = true
            homeTicketForm.textFieldSurname.placeholderText = "Cognome"
            homeTicketForm.textFieldName.placeholderText = "Nome"
        } else {
            homeTicketForm.textFieldName.visible = false
            homeTicketForm.textFieldAcconto.visible = false
            homeTicketForm.textFieldCellNum.visible = false
            homeTicketForm.textFieldSurname.placeholderText = "Giornaliero"
            homeTicketForm.textDateArrive.placeholderText =  Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
            homeTicketForm.textDateDepart.placeholderText =  Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
        }

    }

    homeTicketForm.bookingTicketButton.mouseAreaButton.onClicked: {
        console.log("Prenotazioni")
        homeTicketForm.visible = false
        infoCell.visible = true
        infoCell.displayInfo(homeTicketForm.labelUmbrella.text)
        //infoCell.la
    }


    homeTicketForm.confirmTicketButton.mouseAreaButton.onClicked: {
        console.log("Confirmed")
        var ticketNumber
        if(homeTicketForm.ticketNumber != -1) {
            ticketNumber = homeTicketForm.ticketNumber
            homeTicketForm.ticketNumber = -1
        } else {
            ticketNumber = Backend.getTicketCount() + 1
        }

        var omb_number = homeTicketForm.labelUmbrella.text
        var client_name  =   homeTicketForm.textFieldName.text
        if (client_name === "" || client_name  === null || client_name === undefined ) {
           client_name  =    "-"
        }

        var client_surname = homeTicketForm.textFieldSurname.text
        if (client_surname === "" || client_surname  === null || client_surname === undefined ) {
           client_surname  =  homeTicketForm.textFieldSurname.placeholderText
        }

        var lettini
        if(homeTicketForm.tableModelTicket.rows[1].checked) {
           lettini = homeTicketForm.tableModelTicket.rows[1].amount
        } else {
           lettini = 0
        }
        var sdraio
        if(homeTicketForm.tableModelTicket.rows[2].checked) {
            sdraio = homeTicketForm.tableModelTicket.rows[2].amount
        } else {
            sdraio = 0
        }

        var cabina = 0
        if(homeTicketForm.tableModelTicket.rows[3].checked) {
            cabina = homeTicketForm.tableModelTicket.rows[3].amount
        } else {
            cabina = 0
        }

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
        if(!homeTicketForm.checkBoxDaily.checked) {
           console.log("giornaliero")
            status =    "Daily"
            cellColor = "#ff0000"
        } else {
            if( currentDate.getTime() >= arriveDateCmp.getTime() && currentDate.getTime() <= departureDateCmp ) {
                    status =    "Arrived"
                    cellColor = "#ff0000"
            } else {
                    status =    "Not Arrived"
                    cellColor = "#00ff00"
            }
        }
        var acconto = "0.0"
        var cell_number = homeTicketForm.textFieldCellNum.text
        if(cell_number === "" || cell_number  === null || cell_number === undefined) {
            cell_number = "000 0000000"
        }

        var operatore =      "Maria"
        if ( Backend.insertNewBooking(ticketNumber, omb_number, client_name, client_surname,
                                 lettini, sdraio, cabina, arriveDate, departureDate, status, acconto, cell_number, operatore) ) {
            console.log("New Ticket inserted")
            // Aggiorno contatore ticket interno
            if (Backend.setTicketCount() ) {
                console.log("Update ticket count")
            }
            //updateCell(omb_number, client_name, cellColor)
            Backend.updateStatusGrid(totalOmb, Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString())
            updateGrid(totalOmb, Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString())
        }
        homeTicketForm.visible = false
    }


    infoCell.closeinfoButton.mouseAreaButton.onClicked: {
        console.log("Clicked")

        infoCell.visible = false
    }

    infoCell.addInfoButton.mouseAreaButton.onClicked: {
        infoCell.visible = false
        homeTicketForm.visible = true

        homeTicketForm.labelUmbrella.text = infoCell.labelUmbrella.text
        homeTicketForm.textFieldName.text = ""
        homeTicketForm.textFieldSurname.text = ""
        homeTicketForm.textDateArrive.text = ""
        homeTicketForm.textDateDepart.text = ""
    }

    infoCell.removeInfoButton.mouseAreaButton.onClicked: {
        for(var i = 0; i< infoCell.checkBoxGroup.buttons.length; i++) {

            if (infoCell.checkBoxGroup.buttons[i].checked) {
                Backend.deleteBooking(infoCell.tableModelInfo.rows[i].numeroT, infoCell.labelUmbrella.text)
                infoCell.displayInfo( infoCell.labelUmbrella.text)
                updateGrid(totalOmb, Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString())
            }
        }
    }

    infoCell.modifyInfoButton.mouseAreaButton.onClicked: {
        infoCell.visible = false
        homeTicketForm.visible = true


        homeTicketForm.labelUmbrella.text = infoCell.labelUmbrella.text
        for(var i = 0; i< infoCell.checkBoxGroup.buttons.length; i++) {

            if (infoCell.checkBoxGroup.buttons[i].checked) {
                homeTicketForm.checkBoxDaily.checked = true
                homeTicketForm.textFieldName.text =      infoCell.tableModelInfo.rows[i].name
                homeTicketForm.textFieldSurname.text =   infoCell.tableModelInfo.rows[i].surname
                homeTicketForm.textDateArrive.text =     infoCell.tableModelInfo.rows[i].arrive_date
                homeTicketForm.textDateDepart.text =     infoCell.tableModelInfo.rows[i].departure_date
                homeTicketForm.ticketNumber         =    infoCell.tableModelInfo.rows[i].numeroT
                var row
                if(infoCell.tableModelInfo.rows[i].lettini > 0) {
                    row = {checked: true, currentText: "Lettini", amount: infoCell.tableModelInfo.rows[i].lettini}
                    homeTicketForm.tableModelTicket.setRow(1,row)
                } else {
                    row = {checked: false, currentText: "Lettini", amount: 0}
                    homeTicketForm.tableModelTicket.setRow(1,row)
                }
                if(infoCell.tableModelInfo.rows[i].sdraio > 0) {
                    row = {checked: true, currentText: "Sdraio", amount: infoCell.tableModelInfo.rows[i].sdraio}
                    homeTicketForm.tableModelTicket.setRow(2,row)
                } else {
                    row = {checked: false, currentText: "Sdraio", amount: 0}
                    homeTicketForm.tableModelTicket.setRow(2,row)
                }
                break
            }
        }


    }



    function updateGrid(total_omb, currentDate) {
        if (Backend.selectAllStatus(total_omb, currentDate) ) {
            var rightListIndex = 0
            var indexListModel = 0

            for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
                indexListModel = 0
                for(var colRIndex = rightList[rightRow+1]; colRIndex > rightList[rightRow]-1; colRIndex--){
                    if(stackView.children[rightListIndex].model.get(indexListModel).cellNumber == Backend.m_ombStatus_list[colRIndex-1].b_omb_num) {
                        //console.log(Backend.m_ombStatus_list[colRIndex-1].b_omb_num +" == "+ Backend.m_ombStatus_list[colRIndex].b_client_surname)
                        if( Backend.m_ombStatus_list[colRIndex-1].b_status != "Not Arrived") {
                            stackView.children[rightListIndex].model.get(indexListModel).clientSurname = Backend.m_ombStatus_list[colRIndex-1].b_client_surname
                            stackView.children[rightListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colRIndex-1].b_color
                        } else {
                            stackView.children[rightListIndex].model.get(indexListModel).clientSurname = ""
                            stackView.children[rightListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colRIndex-1].b_color
                        }
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
                       if( Backend.m_ombStatus_list[colLIndex-1].b_status != "Not Arrived") {
                            stackView.children[leftListIndex].model.get(indexListModel).clientSurname = Backend.m_ombStatus_list[colLIndex-1].b_client_surname
                            stackView.children[leftListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colLIndex-1].b_color
                       } else {
                           stackView.children[leftListIndex].model.get(indexListModel).clientSurname = ""
                           stackView.children[leftListIndex].model.get(indexListModel).statusColor = Backend.m_ombStatus_list[colLIndex-1].b_color
                       }
                    }
                    indexListModel++
                }
                leftListIndex++
            }
        }



    }


    function updateCell(currentCell, clientSurname, statusColor) {
        var rightListIndex = 0
        var indexListModel = 0

        for(var rightRow = 0; rightRow < rightList.length; rightRow+=2) {
            indexListModel = 0
            for(var colRIndex = rightList[rightRow+1]; colRIndex > rightList[rightRow]-1; colRIndex--){
                if(stackView.children[rightListIndex].model.get(indexListModel).cellNumber == currentCell) {
                    stackView.children[rightListIndex].model.get(indexListModel).clientSurname = clientSurname
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
                    stackView.children[leftListIndex].model.get(indexListModel).clientSurname = clientSurname
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
                stackView.children[rightListIndex].model.append({cellNumber: colRIndex, clientSurname: "Nomelungo", statusColor: "#d85409"} )
                //console.log(stackView.children[rightListIndex].model.get(indexListModel).cellNumber)
                indexListModel++
            }
            rightListIndex++
        }

        var leftListIndex = rightListIndex;
        for(var leftRow = 0; leftRow < leftList.length; leftRow+=2) {
            for(var colLIndex = leftList[leftRow+1]; colLIndex > leftList[leftRow]-1; colLIndex--){
                stackView.children[leftListIndex].model.append({cellNumber: colLIndex, clientSurname: "Nomelungo", statusColor: "#d85409"} )
                //stackView.children[leftListIndex].model.labelClientName.text = "ciao"
            }
            leftListIndex++
        }
    }
}
