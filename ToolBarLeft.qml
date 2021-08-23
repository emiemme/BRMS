import QtQuick 2.12
import QtQuick.Controls 2.12

ToolBarLeftForm {
    id: toolBarLeft
    property int totalOmb : 173

    Component.onCompleted: {
        infoAreaFreeOmb.labelInfo.text = "Liberi:"
        infoAreaArrive.labelInfo.text = "Arrivi:"
        infoAreaDepart.labelInfo.text = "Partenze:"
        infoAreaBooked.labelInfo.text = "Abbonati:"
        infoAreaDaily.labelInfo.text = "Giornalieri:"
        infoAreaFreeOmb.labelValue.text = Backend.getFreeOmbCount()
        infoAreaArrive.labelValue.text = Backend.getIncomingOmbCount()
        infoAreaDepart.labelValue.text = Backend.getLeavingOmbCount()
        infoAreaBooked.labelValue.text = Backend.getBookingOmbCount()
        infoAreaDaily.labelValue.text = Backend.getDailyOmbCount()

    }



    toolButtonMenu.text: stackView.depth > 1 ? "\u25C0" : "\u2630"
    toolButtonMenu.onClicked: {
        if (stackView.depth > 1) {
            stackView.pop()
        } else {
            drawer.open()
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Database Settings")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("GUI Settings")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Exit")
                width: parent.width
                onClicked: {
                    Qt.quit()
                }
            }
       }
    }

    buttonUpdateDB.onClicked: {
        console.log("Updating DB with a custom date: " + textAreaDate.text)
        Backend.updateStatusGrid(totalOmb, textAreaDate.text)
    }

    checkBoxViewName.onCheckStateChanged: {
            Backend.emitViewName(checkBoxViewName.checkState)
    }


    //SearchBar:
    ListModel {
      id: resultSearchList
    }

    QtObject {
        id: internal
        property bool finished: false
        property bool busy: false
    }
    searchField.onTextEdited: {
        internal.finished = false
        internal.busy = true
        if(searchField.text.length > 2) {
            searchElement(searchField.text)
            console.log("text changed:" + searchField.text)

        }
    }

        function searchElement(searchText) {
            resultSearchList.clear()

            var arraySearchElementsStruct =  Backend.getSearchValues(totalOmb,searchField.text) //["ciao", "saluti", "salati", "cipresso","cia"]
            //console.log(arraySearchElementsStruct)
            for(var i =0; i< arraySearchElementsStruct.length; i++) {
                if(arraySearchElementsStruct[i].b_searchName.search(searchText) > -1 ) {
                    resultSearchList.append({name:arraySearchElementsStruct[i].b_searchName,number:arraySearchElementsStruct[i].b_omb_num})
                }
            }
            if(resultSearchList.count > 0 )
                internal.busy = false
        }
            Component{
                id: busy_component
                BusyIndicator {
                    running: true
                }
            }

            Component{
                id: lv_component
                ListView {
                    implicitWidth: contentItem.childrenRect.width
                    implicitHeight: contentHeight
                    model: resultSearchList
                    delegate: Text {
                        id:searchText
                        font.bold: true
                        text: model.number +" "+ model.name
                        MouseArea{
                            id: mousearea
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                searchField.text = model.name
                                internal.finished = true
                            }
                        }
                    }
                }
            }

//    Search Bar code snippet

//    TextField {
//        anchors.centerIn: parent
//        id: textfield
//        onTextChanged: {
//            internal.finished = false
//            internal.busy = true
//            if(text.length > 2) {
//                searchElement(text)
//                console.log("text changed:" + text)
//            }
//        }
//        Popup {
//            id: popup
//            y: parent.height
//            visible: !internal.finished && textfield.length > 0
//            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
//            contentItem: Loader{
//                    sourceComponent: internal.busy ? busy_component: lv_component
//                }
//        }
//    }
//    function searchElement(searchText) {
//        resultSearchList.clear()
//        var arraySearchElements = ["ciao", "saluti", "salati", "cipresso","cia"]
//        for(var i =0; i< arraySearchElements.length; i++) {
//            if(arraySearchElements[i].search(searchText) > -1 ) {
//                resultSearchList.append({name:arraySearchElements[i]})
//            }
//        }
//        if(resultSearchList.count > 0 )
//            internal.busy = false
//    }

//    Component{
//        id: busy_component
//        BusyIndicator {
//            running: true
//        }
//    }

//    Component{
//        id: lv_component
//        ListView {
//            implicitWidth: contentItem.childrenRect.width
//            implicitHeight: contentHeight
//            model: resultSearchList
//            delegate: Text {
//                text: model.name
//                MouseArea{
//                    id: mousearea
//                    anchors.fill: parent
//                    hoverEnabled: true
//                    onClicked: {
//                        textfield.text = model.name
//                        internal.finished = true
//                    }
//                }
//            }
//        }
//    }


    Connections {
        target: Backend

        function onGridUpdateCompleted() {
            infoAreaFreeOmb.labelValue.text = Backend.getFreeOmbCount()
            infoAreaArrive.labelValue.text = Backend.getIncomingOmbCount()
            infoAreaDepart.labelValue.text = Backend.getLeavingOmbCount()
            infoAreaBooked.labelValue.text = Backend.getBookingOmbCount()
            infoAreaDaily.labelValue.text = Backend.getDailyOmbCount()

        }
    }


    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: { dateTimeLabel.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd \n hh:mm:ss").toString()
        }

    }

}
