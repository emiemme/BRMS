import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Controls 1.4 as Old



HomeForm {

    property var rightList : [12, 20, 32, 40, 52, 60, 72, 80, 92, 99, 111, 118, 130, 137, 146, 149, 158, 161, 170, 173]
    property var leftList :  [1,  11, 21, 31, 41, 51, 61, 71, 81, 91, 100, 110, 119, 129, 138, 145, 150, 157, 162, 169]
    property var litteralList : ['A','B','C','D']
    property int totalOmb : 173 + 4

    property var dateTimeForm
    property var dateTimeSprite

    signal updateMapCompleted()

//    buttonUpdateGrid.onClicked: {
//        updateGrid(155,"2021-06-10")
//    }


//    Timer {
//        interval: 5000; running: true; repeat: true
//        onTriggered: {
//            var currentDate = Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
//            Backend.updateStatusGrid(totalOmb, currentDate)
//            updateGrid(totalOmb, currentDate)
//        }
//    }

    Component.onCompleted: {
        addRows()
        homeTicketForm.closeTicketButton.labelButton.text = "Annulla"
        homeTicketForm.confirmTicketButton.labelButton.text = "Conferma"
        homeTicketForm.bookingTicketButton.labelButton.text = "Lista <br> Prenotazioni"
        var currentDate = Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
        Backend.updateStatusGrid(totalOmb, currentDate)
        updateGrid(totalOmb, currentDate)
    }

    homeTicketForm.dateArriveMouseArea.onClicked: {
        homeTicketForm.datePickerArrive.visible = true
    }
    homeTicketForm.datePickerArrive.onOk: {
        homeTicketForm.datePickerArrive.visible = false
        homeTicketForm.textDateArrive.text = startDate
        homeTicketForm.textDateDepart.text = stopDate
        var counterDays =  (Math.abs(new Date(stopDate) - new Date(startDate))/(1000*60*60*24)) +1
        homeTicketForm.labelDaysCounter.text = "Durata soggiorno: "+ counterDays +" Giorno"
        var price = Backend.calculatePrice(homeTicketForm.labelUmbrella.text,homeTicketForm.textDateArrive.text,homeTicketForm.textDateDepart.text,counterDays)
        homeTicketForm.labelPrice.text = "Prezzo stimato: " + Math.round(price) + " Euro"
    }
    homeTicketForm.datePickerArrive.onCancel: {
        homeTicketForm.datePickerArrive.visible = false
    }

    homeTicketForm.dateDepartureMouseArea.onClicked: {
        homeTicketForm.datePickerArrive.visible = true
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
        if(homeTicketForm.checkBoxLettini.checked) {
           lettini = homeTicketForm.spinBoxLettini.value
        } else {
           lettini = 0
        }
        var sdraio
        if(homeTicketForm.checkBoxSdraio.checked) {
            sdraio = homeTicketForm.spinBoxSdraio.value
        } else {
            sdraio = 0
        }

        var cabina = 0
        if(homeTicketForm.checkBoxCabina.checked) {
            cabina = homeTicketForm.spinBoxCabina.value
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
        var acconto = homeTicketForm.textFieldAcconto.text
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
        homeTicketForm.textFieldCellNum.text = ""
        homeTicketForm.textFieldAcconto.text = ""
        homeTicketForm.checkBoxDaily.checked = false
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
        for(var i = 0; i<infoCell.rowCount; i++) {
            if(infoCell.tableModelInfo.rows[i].checked === true) {
                homeTicketForm.checkBoxDaily.checked = true
                homeTicketForm.textFieldName.text =      infoCell.tableModelInfo.rows[i].name
                homeTicketForm.textFieldSurname.text =   infoCell.tableModelInfo.rows[i].surname
                homeTicketForm.textDateArrive.text =     infoCell.tableModelInfo.rows[i].arrive_date
                homeTicketForm.textDateDepart.text =     infoCell.tableModelInfo.rows[i].departure_date
                homeTicketForm.textFieldAcconto.text =   infoCell.tableModelInfo.rows[i].acconto
                homeTicketForm.ticketNumber         =    infoCell.tableModelInfo.rows[i].numeroT

                if(infoCell.tableModelInfo.rows[i].lettini > 0) {
                    homeTicketForm.checkBoxLettini.checked = true
                    homeTicketForm.spinBoxLettini.value =  infoCell.tableModelInfo.rows[i].lettini
                } else {
                    homeTicketForm.checkBoxLettini.checked = false
                    homeTicketForm.spinBoxLettini.value =  0
                }
                if(infoCell.tableModelInfo.rows[i].sdraio > 0) {
                    homeTicketForm.checkBoxSdraio.checked = false
                    homeTicketForm.spinBoxSdraio.value = infoCell.tableModelInfo.rows[i].sdraio
                } else {
                    homeTicketForm.checkBoxSdraio.checked = false
                    homeTicketForm.spinBoxSdraio.value = 0
                }

                var counterDays =  (Math.abs(new Date(homeTicketForm.textDateDepart.text) - new Date(homeTicketForm.textDateArrive.text))/(1000*60*60*24)) +1
                homeTicketForm.labelDaysCounter.text = "Durata soggiorno: "+ counterDays +" Giorno"
                var price = Backend.calculatePrice(homeTicketForm.labelUmbrella.text,homeTicketForm.textDateArrive.text,homeTicketForm.textDateDepart.text,counterDays)
                homeTicketForm.labelPrice.text = "Prezzo stimato: " + Math.round(price) + " Euro"
                break
            }
        }

//        homeTicketForm.checkBoxCabina.checked = false
//        homeTicketForm.spinBoxCabina.value = 0


    }

    function addSearchSolutionBooking(name,dateArrive,dateDeparture) {

        homeTicketForm.visible = true
        homeTicketForm.labelUmbrella.text = name
        homeTicketForm.textFieldName.text = ""
        homeTicketForm.textFieldSurname.text = ""
        homeTicketForm.textDateArrive.text = dateArrive
        homeTicketForm.textDateDepart.text = dateDeparture
        homeTicketForm.checkBoxDaily.checked = false
        homeTicketForm.textFieldAcconto.text = ""
        homeTicketForm.textFieldCellNum.text = ""

        homeTicketForm.checkBoxLettini.checked = true
        homeTicketForm.checkBoxSdraio.checked = false
        homeTicketForm.checkBoxCabina.checked = false

        homeTicketForm.spinBoxLettini.value = 2
        homeTicketForm.spinBoxSdraio.value = 0
        homeTicketForm.spinBoxCabina.value = 0


        homeTicketForm.datePickerArrive.calendar.startDate = new Date(dateArrive)
        homeTicketForm.datePickerArrive.calendar.stopDate = new Date(dateDeparture)


        var counterDays =  (Math.abs(new Date(homeTicketForm.datePickerArrive.calendar.stopDate)
                                     - new Date(homeTicketForm.datePickerArrive.calendar.startDate))/(1000*60*60*24)) +1
        if(Number.isNaN(counterDays)) {
            counterDays = 0
        }
        homeTicketForm.labelDaysCounter.text = "Durata soggiorno: "+ counterDays +" Giorno"
        var price = Backend.calculatePrice(homeTicketForm.labelUmbrella.text,homeTicketForm.textDateArrive.text,homeTicketForm.textDateDepart.text,counterDays)
        homeTicketForm.labelPrice.text = "Prezzo stimato: " + Math.round(price) + " Euro"
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
//                        console.log("updateGrid : " + stackView.children[leftListIndex].model.get(indexListModel).cellNumber)
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
                if(leftListIndex == 10 || leftListIndex == 11 || leftListIndex == 12 || leftListIndex == 13) {
                    var _ombNum
                    if(stackView.children[leftListIndex].model.get(11).cellNumber == "174") {
                        _ombNum = "A"
                    } else if(stackView.children[leftListIndex].model.get(11).cellNumber == "175") {
                        _ombNum = "B"
                    } else if(stackView.children[leftListIndex].model.get(11).cellNumber == "176") {
                        _ombNum = "C"
                    } else if(stackView.children[leftListIndex].model.get(11).cellNumber == "177") {
                        _ombNum = "D"
                    }
                    var _colLIndex = stackView.children[leftListIndex].model.get(11).cellNumber -1

                    if( _ombNum == Backend.m_ombStatus_list[_colLIndex].b_omb_num) {
                       if( Backend.m_ombStatus_list[_colLIndex].b_status != "Not Arrived") {
                            stackView.children[leftListIndex].model.get(11).clientSurname = Backend.m_ombStatus_list[_colLIndex].b_client_surname
                            stackView.children[leftListIndex].model.get(11).statusColor = Backend.m_ombStatus_list[_colLIndex].b_color
                       } else {
                           stackView.children[leftListIndex].model.get(11).clientSurname = ""
                           stackView.children[leftListIndex].model.get(11).statusColor = Backend.m_ombStatus_list[_colLIndex].b_color
                       }
                    }

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

            if(leftListIndex == 10 || leftListIndex == 11 || leftListIndex == 12 || leftListIndex == 13) {
               colLIndex++
               if( stackView.children[leftListIndex].model.get(11).cellNumber == currentCell) {
                    stackView.children[leftListIndex].model.get(11).clientSurname = clientSurname
                    stackView.children[leftListIndex].model.get(11).statusColor = statusColor
                   console.log("----------------- updateCell : " + stackView.children[leftListIndex].model.get(11).cellNumber)

               }
            }
            leftListIndex++
        }
    }


    function addRows() {
        var rightListIndex = 0;
        var indexListModel = 0
        var litteralIndex = 0;
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
            if(litteralIndex < 4) {
                stackView.children[leftListIndex].model.append({cellNumber: 173+litteralIndex+1 , clientSurname: "Nomelungo", statusColor: "#d85409"} )
                //console.log("---------- "+stackView.children[leftListIndex].model.get(11).cellNumber +" indexListModel:"+ indexListModel)

                litteralIndex++;
            }
            leftListIndex++
        }

    }
}
