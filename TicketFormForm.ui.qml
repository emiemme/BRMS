import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Item {
    id: ticketForm
    width: 400
    height: 450
    property alias dateDepartureMouseArea: dateDepartureMouseArea
    property alias datePickerDeparture: datePickerDeparture
    property alias dateArriveMouseArea: dateArriveMouseArea
    property alias textFieldAcconto: textFieldAcconto
    property var ticketNumber: -1
    property alias datePickerArrive: datePickerArrive
    property alias bookingTicketButton: bookingTicketButton
    property alias checkBoxDaily: checkBoxDaily
    property alias textDateDepartPlaceholderText: textDateDepart.placeholderText
    property alias textDateArrivePlaceholderText: textDateArrive.placeholderText
    property alias textFieldSurnamePlaceholderText: textFieldSurname.placeholderText
    property alias textFieldSurname: textFieldSurname
    property alias textDateDepart: textDateDepart
    property alias textDateArrive: textDateArrive
    property alias tableModelTicket: tableModelTicket
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

            TableView {
                id: tableItems
                x: 14
                y: 90
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: checkBoxDaily.bottom
                anchors.bottom: rectDivider.top
                anchors.bottomMargin: 70
                anchors.leftMargin: 15
                anchors.rightMargin: 20
                anchors.topMargin: -5
                columnSpacing: 1
                rowSpacing: 1
                boundsBehavior: Flickable.StopAtBounds

                model: TableModel {
                    id: tableModelTicket
                    TableModelColumn { display: "checked" }
                    TableModelColumn { display: "currentText" }
                    TableModelColumn { display: "amount" }


                    // Each row is one type of fruit that can be ordered
                    rows: [
                        {
                            checked: true,
                            currentText: "Ombrellone",
                            amount: 1
                        },
                        {
                            checked: true,
                            currentText: "Lettini",
                            amount: 2
                        },
                        {
                            checked: false,
                            currentText: "Sdraio",
                            amount: 0
                        },
                        {
                            checked: false,
                            currentText: "Cabina",
                            amount: 0
                        }
                    ]
                }
                delegate: DelegateChooser {
                    DelegateChoice {
                        column: 0
                        delegate: CheckBox {
                            checked: model.display
                            onToggled: model.display = checked
                        }
                    }
                    DelegateChoice {
                        column: 1
                        delegate: Label {
                            text: model.display
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    DelegateChoice {
                        column: 2
                        delegate: SpinBox {
                            value: model.display
                            onValueModified: model.display = value
                        }
                    }
                }
            }

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
                x: 272
                y: 30
                width: 115
                height: 43
                visible: false
                anchors.right: parent.right
                anchors.rightMargin: 20
                hoverEnabled: false
            }

            TextField {
                id: textFieldSurname
                x: 135
                y: 30
                width: 115
                height: 43
                visible: true
                text: ""
                anchors.right: textFieldName.left
                anchors.rightMargin: 20
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
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.leftMargin: 21
                anchors.rightMargin: 5
                anchors.topMargin: 5
            }

            Label {
                id: labelClientName
                x: 14
                y: 37
                height: 30
                text: qsTr("Nome Cliente:")
                anchors.left: parent.left
                anchors.right: textFieldSurname.left
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 20
                anchors.leftMargin: 20
            }

            Label {
                id: arriveLabel
                x: 20
                y: 245
                width: 116
                height: 19
                text: qsTr("Data Arrivo")
                anchors.left: parent.left
                anchors.top: tableItems.bottom
                anchors.topMargin: 5
                anchors.leftMargin: 20

            }

            Label {
                id: departLabel
                x: 260
                y: 245
                width: 120
                height: 19
                text: qsTr("Data Partenza")
                anchors.right: parent.right
                anchors.top: tableItems.bottom
                anchors.topMargin: 5
                anchors.rightMargin: 20
            }

            TextField {
                id: textDateArrive
                x: 10
                y: 269
                height: 50
                text: ""
                anchors.left: parent.left
                anchors.right: textDateDepart.left
                anchors.top: arriveLabel.bottom
                anchors.bottom: rectDivider.top
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 80
                property string property0: "none.none"
                font.hintingPreference: Font.PreferFullHinting
                anchors.bottomMargin: 6
                anchors.topMargin: 0
                anchors.leftMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
                MouseArea {
                    id:dateArriveMouseArea
                    anchors.fill: parent
                }

            }

            TextField {
                id: textDateDepart
                x: 240
                y: 269
                width: 140
                text: ""
                anchors.right: parent.right
                anchors.top: departLabel.bottom
                anchors.bottom: rectDivider.top
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 0
                anchors.bottomMargin: 6
                anchors.rightMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
                MouseArea {
                    id:dateDepartureMouseArea
                    anchors.fill: parent
                }
            }


            Label {
                id: labelOmb
                width: 225
                height: 35
                text: qsTr("Ombrellone Numero:")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 5
                anchors.leftMargin: 5
            }

            CheckBox {
                id: checkBoxDaily
                height: 36
                text: qsTr("Abbonamento")
                anchors.left: parent.left
                anchors.right: textFieldAcconto.left
                anchors.top: textFieldName.bottom
                anchors.topMargin: 6
                anchors.rightMargin: 90
                anchors.leftMargin: 20
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
                x: 251
                y: 76
                width: 115
                visible: false
                anchors.right: parent.right
                anchors.rightMargin: 20
                placeholderText: qsTr("Acconto")
            }
        }
    }

    DatePicker {
        id: datePickerArrive
        x: -61
        y: 330
        width: 221
        height: 295
        visible: false
        mm: 9
        fontSizePx: 12
        cellSize: 27
    }

    DatePicker {
        id: datePickerDeparture
        x: 239
        y: 330
        width: 221
        height: 295
        visible: false
        cellSize: 27
        fontSizePx: 12
        mm: 9
    }
}


