import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: ticketForm
    width: 400
    height: 450
    property alias labelPrice: labelPrice
    property alias labelDaysCounter: labelDaysCounter
    property alias spinBoxCabina: spinBoxCabina
    property alias spinBoxSdraio: spinBoxSdraio
    property alias spinBoxLettini: spinBoxLettini
    property alias checkBoxCabina: checkBoxCabina
    property alias checkBoxSdraio: checkBoxSdraio
    property alias checkBoxLettini: checkBoxLettini
//    property alias tableItems: tableItems
    property alias textFieldCellNum: textFieldCellNum
    property alias dateDepartureMouseArea: dateDepartureMouseArea
    property alias dateArriveMouseArea: dateArriveMouseArea
    property alias textFieldAcconto: textFieldAcconto
    property int ticketNumber: -1
    property alias datePickerArrive: datePickerArrive
    property alias bookingTicketButton: bookingTicketButton
    property alias checkBoxDaily: checkBoxDaily
    property alias textDateDepartPlaceholderText: textDateDepart.placeholderText
    property alias textDateArrivePlaceholderText: textDateArrive.placeholderText
    property alias textFieldSurnamePlaceholderText: textFieldSurname.placeholderText
    property alias textFieldSurname: textFieldSurname
    property alias textDateDepart: textDateDepart
    property alias textDateArrive: textDateArrive
//    property alias tableModelTicket: tableModelTicket
    property alias labelUmbrella: labelUmbrella
    property alias confirmTicketButton: confirmTicketButton
    property alias arriveLabel: arriveLabel
    property alias departLabel: departLabel
    property alias textFieldName: textFieldName
    property alias closeTicketButton: closeTicketButton
    property alias ticketForm: ticketForm

    Rectangle {
        id: backgroundRect
        color: "#f6d365"
        border.width: 5
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#e6b980"
            }

            GradientStop {
                position: 1
                color: "#eacda3"
            }
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent

//            TableView {
//                id: tableItems
//                x: 14
//                y: 90
//                anchors.left: parent.left
//                anchors.right: parent.right
//                anchors.top: checkBoxDaily.bottom
//                anchors.bottom: rectDivider.top
//                anchors.bottomMargin: 70
//                anchors.leftMargin: 15
//                anchors.rightMargin: 20
//                anchors.topMargin: -5
//                columnSpacing: 1
//                rowSpacing: 1
//                boundsBehavior: Flickable.StopAtBounds

                //                model: TableModel {
                //                    id: tableModelTicket
                //                    TableModelColumn { display: "checked" }
                //                    TableModelColumn { display: "currentText" }
                //                    TableModelColumn { display: "amount" }

                //                    // Each row is one type of fruit that can be ordered
                //                    rows: [
                //                        {
                //                            checked: true,
                //                            currentText: "Ombrellone",
                //                            amount: 1
                //                        },
                //                        {
                //                            checked: true,
                //                            currentText: "Lettini",
                //                            amount: 2
                //                        },
                //                        {
                //                            checked: false,
                //                            currentText: "Sdraio",
                //                            amount: 0
                //                        },
                //                        {
                //                            checked: false,
                //                            currentText: "Cabina",
                //                            amount: 0
                //                        }
                //                    ]
                //                }
//                delegate: DelegateChooser {
//                    DelegateChoice {
//                        column: 0
//                        delegate: CheckBox {
//                            checked: model.display
//                            onToggled: model.display = checked
//                        }
//                    }
//                    DelegateChoice {
//                        column: 1
//                        delegate: Label {
//                            text: model.display
//                            horizontalAlignment: Text.AlignHCenter
//                            verticalAlignment: Text.AlignVCenter
//                        }
//                    }
//                    DelegateChoice {
//                        column: 2
//                        delegate: SpinBox {
//                            value: model.display
//                            onValueModified: model.display = value
//                        }
//                    }
//                }
//            }

            GeneralButton {
                id: closeTicketButton
                y: 336
                width: 100
                height: 50
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 15
                anchors.bottomMargin: 15
            }

            GeneralButton {
                id: confirmTicketButton
                x: 292
                anchors.right: parent.right
                anchors.top: rectDivider.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 15
                anchors.rightMargin: 15
            }

            Rectangle {
                id: rectDivider
                x: 10
                y: 320
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: closeTicketButton.top
                anchors.bottomMargin: 6
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            TextField {
                id: textFieldName
                x: 147
                y: 72
                width: 115
                height: 43
                visible: false
                text: ""
                anchors.right: textFieldCellNum.left
                anchors.rightMargin: 16
                hoverEnabled: false
                placeholderText: qsTr("Cognome")
            }

            TextField {
                id: textFieldSurname
                y: 72
                height: 43
                visible: true
                text: ""
                anchors.left: parent.left
                anchors.right: textFieldName.left
                anchors.rightMargin: 16
                anchors.leftMargin: 16
                placeholderText: qsTr("Giornaliero")
                hoverEnabled: false
            }

            Label {
                id: labelUmbrella
                x: 5
                y: 5
                height: 37
                text: qsTr("Label")
                anchors.left: labelOmb.right
                anchors.right: checkBoxDaily.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.leftMargin: 16
                anchors.rightMargin: 16
                anchors.topMargin: 5
            }

            Label {
                id: arriveLabel
                x: 20
                width: 120
                height: 30
                text: qsTr("Data Arrivo")
                anchors.left: parent.left
                anchors.top: checkBoxCabina.bottom
                verticalAlignment: Text.AlignVCenter
                //anchors.top: tableItems.bottom
                anchors.topMargin: 8
                anchors.leftMargin: 16
            }

            Label {
                id: departLabel
                height: 30
                text: qsTr("Data Partenza")
                anchors.left: parent.left
                anchors.right: textDateDepart.left
                anchors.top: arriveLabel.bottom
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 8
                anchors.leftMargin: 16
                //anchors.top: tableItems.bottom
                anchors.rightMargin: 16
            }

            TextField {
                id: textDateArrive
                x: 10
                height: 48
                text: ""
                anchors.left: arriveLabel.right
                anchors.right: parent.right
                anchors.top: checkBoxCabina.bottom
                horizontalAlignment: Text.AlignHCenter
                bottomPadding: 24
                anchors.rightMargin: 128
                anchors.topMargin: -1
                property string property0: "none.none"
                font.hintingPreference: Font.PreferFullHinting
                anchors.leftMargin: 16
                placeholderText: Qt.formatDateTime(new Date(),
                                                   "yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
                MouseArea {
                    id: dateArriveMouseArea
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }
            }

            TextField {
                id: textDateDepart
                x: 152
                width: 120
                height: 49
                text: ""
                anchors.right: parent.right
                anchors.top: arriveLabel.bottom
                horizontalAlignment: Text.AlignHCenter
                bottomPadding: 24
                z: 1
                anchors.topMargin: -2
                anchors.rightMargin: 128
                placeholderText: Qt.formatDateTime(new Date(),
                                                   "yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
                MouseArea {
                    id: dateDepartureMouseArea
                    anchors.fill: parent
                }
            }

            Label {
                id: labelOmb
                width: 136
                height: 35
                text: qsTr("Ombrellone Numero:")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 5
                anchors.leftMargin: 8
            }

            CheckBox {
                id: checkBoxDaily
                x: 268
                height: 36
                text: qsTr("Abbonamento")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.rightMargin: 8
            }

            GeneralButton {
                id: bookingTicketButton
                x: 179
                y: 385
                anchors.right: confirmTicketButton.left
                anchors.top: rectDivider.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.rightMargin: 5
                anchors.topMargin: 5
            }

            TextField {
                id: textFieldAcconto
                x: 180
                y: 121
                width: 82
                height: 30
                visible: true
                anchors.right: parent.right
                anchors.rightMargin: 138
                placeholderText: qsTr("Acconto")
            }

            TextField {
                id: textFieldCellNum
                x: 278
                y: 72
                width: 102
                height: 43
                visible: false
                anchors.right: parent.right
                anchors.rightMargin: 20
                placeholderText: qsTr("Numero Cell.")
            }

            Label {
                id: labelTextDati
                x: 13
                y: 46
                height: 30
                text: qsTr("Dati Cliente:")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.rightMargin: 299
                anchors.leftMargin: 15
            }

            CheckBox {
                id: checkBoxLettini
                height: 32
                text: qsTr("Lettini")
                anchors.left: parent.left
                anchors.right: spinBoxLettini.left
                anchors.top: labelTextBooking.bottom
                checkState: Qt.Checked
                anchors.topMargin: 8
                anchors.rightMargin: 12
                anchors.leftMargin: 16
            }

            CheckBox {
                id: checkBoxSdraio
                height: 32
                text: qsTr("Sdraio")
                anchors.left: parent.left
                anchors.right: spinBoxSdraio.left
                anchors.top: checkBoxLettini.bottom
                anchors.topMargin: 4
                anchors.rightMargin: 12
                anchors.leftMargin: 16
            }

            CheckBox {
                id: checkBoxCabina
                height: 32
                text: qsTr("Cabina")
                anchors.left: parent.left
                anchors.right: spinBoxCabina.left
                anchors.top: checkBoxSdraio.bottom
                anchors.topMargin: 6
                anchors.rightMargin: 12
                anchors.leftMargin: 16
            }

            Label {
                id: labelTextBooking
                x: 15
                height: 30
                text: qsTr("Dati Prenotazione:")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 121
                anchors.rightMargin: 256
                font.bold: true
                anchors.leftMargin: 15
            }

            SpinBox {
                id: spinBoxLettini
                x: 147
                width: 100
                height: 32
                anchors.right: parent.right
                anchors.top: labelTextBooking.bottom
                value: 2
                anchors.rightMargin: 153
                anchors.topMargin: 8
            }

            SpinBox {
                id: spinBoxSdraio
                x: 133
                width: 100
                height: 32
                anchors.right: parent.right
                anchors.top: spinBoxLettini.bottom
                anchors.rightMargin: 153
                anchors.topMargin: 4
            }

            SpinBox {
                id: spinBoxCabina
                x: 133
                width: 100
                height: 32
                anchors.right: parent.right
                anchors.top: spinBoxSdraio.bottom
                anchors.topMargin: 4
                anchors.rightMargin: 153
            }

            Label {
                id: labelDaysCounter
                y: 345
                width: 86
                height: 18
                text: qsTr("Durata soggiorno: 1 Giorno")
                anchors.left: parent.left
                anchors.right: labelPrice.left
                anchors.top: departLabel.bottom
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 19
                anchors.leftMargin: 15
                anchors.topMargin: 6
            }

            Label {
                id: labelPrice
                x: 214
                y: 347
                width: 171
                height: 18
                text: qsTr("Prezzo Stimato: 999 Euro")
                anchors.right: parent.right
                anchors.top: departLabel.bottom
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 6
                anchors.rightMargin: 15
            }
        }
    }

    DatePicker {
        id: datePickerArrive
        x: 99
        y: 38
        width: 221
        height: 295
        visible: false
        //        mm: 9
        //        fontSizePx: 12
        //        cellSize: 27
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}D{i:15;invisible:true}
D{i:14}D{i:17;invisible:true}D{i:16}D{i:18}D{i:19}D{i:20}D{i:21}D{i:22}D{i:23}D{i:24}
D{i:25}D{i:26}D{i:27}D{i:28}D{i:29}D{i:30}D{i:31}D{i:32}D{i:5}D{i:1}D{i:33}
}
##^##*/
