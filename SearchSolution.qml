import QtQuick 2.0
import QtQuick.Controls 2.12

SearchSolutionForm {
    id: searchSolution
    signal closeSolutionForm()
    property var dateTimeForm
    property var dateTimeSprite

    property var arriveDate
    property var departureDate
    signal addBooking(var name, var dateArrive, var dateDeparture)

    closeSolutionButton.mouseAreaButton.onClicked: {
        searchSolution.destroy();
        if(dateTimeSprite != null) {
            dateTimeSprite.destroy()
        }
    }

    Component.onCompleted: {
    }

    dateArriveMouseArea.onClicked: {
//        dateTimeForm = Qt.createComponent("DatePicker.qml");
//        dateTimeSprite = dateTimeForm.createObject(searchSolution, {x: 150, y: 150});
//        if (dateTimeSprite == null) {
//            // Error Handling
//            console.log("Error creating datePicker object");
//        }
        datePickerSearch.visible = true
    }

    dateDepartureMouseArea.onClicked: {
//        dateTimeForm = Qt.createComponent("DatePicker.qml");
//        dateTimeSprite = dateTimeForm.createObject(searchSolution, {x: 150, y: 150});
//        if (dateTimeSprite == null) {
//            // Error Handling
//            console.log("Error creating datePicker object");
//        }
        datePickerSearch.visible = true
    }

    datePickerSearch.onCancel: {
        datePickerSearch.visible = false
    }

    datePickerSearch.onOk: {
            datePickerSearch.visible = false
            textDateArrive.text = startDate
            textDateDepart.text = stopDate
        }

    searchSolutionButton.mouseAreaButton.onClicked: {
        searchList.clear()
        arriveDate = textDateArrive.text
        if (arriveDate === "" || arriveDate  === null || arriveDate === undefined) {
           arriveDate  =   textDateArrive.placeholderText
        }

        departureDate =  textDateDepart.text
        if (departureDate === "" || departureDate  === null || departureDate === undefined ) {
           departureDate  =   textDateDepart.placeholderText
        }

        var startValue = comboBoxRowData.get(comboBoxRow.currentIndex).startValue
        var endValue = comboBoxRowData.get(comboBoxRow.currentIndex).endValue

        var freeOmbList = Backend.getfreeOmbInInterval(startValue,endValue+1,arriveDate,departureDate)
        if(freeOmbList.lenght == 0) {
            searchList.append({check:false,name:"Nessun Risultato"})
        } else {
            for(var i=0;i<freeOmbList.length;i++) {
                searchList.append({check:false,name:freeOmbList[i]})
            }
        }

        //console.log(freeOmbList)
    }

    addBookingButton.mouseAreaButton.onClicked: {
        for(var i=0;i<checkBoxGroup.buttons.length;i++) {
            if(checkBoxGroup.buttons[i].checked) {
                //console.log(searchList.get(i).name)
                searchSolution.addBooking(searchList.get(i).name,arriveDate,departureDate)
                searchSolution.destroy();
                if(dateTimeSprite != null) {
                    dateTimeSprite.destroy()
                }
            }
        }
    }
}
