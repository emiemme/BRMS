import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0
import Qt.labs.calendar 1.0

Item {
    id: ticketForm
    width: 400
    height: 450
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
                anchors.bottomMargin: 91
                anchors.leftMargin: 14
                anchors.rightMargin: 6
                anchors.topMargin: 10
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
                x: 116
                y: 30
                width: 113
                height: 43
                anchors.right: textFieldSurname.left
                anchors.rightMargin: 31
                hoverEnabled: false
                placeholderText: qsTr("Giornaliero")
            }

            TextField {
                id: textFieldSurname
                x: 260
                y: 30
                width: 115
                height: 43
                visible: false
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 25
                placeholderText: qsTr("Cognome")
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
                anchors.right: textFieldName.left
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 16
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
                anchors.topMargin: 15
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
                anchors.topMargin: 15
                anchors.rightMargin: 20
            }

            TextField {
                id: textDateArrive
                x: 20
                y: 269
                height: 50
                anchors.left: parent.left
                anchors.right: textDateDepart.left
                anchors.top: arriveLabel.bottom
                anchors.bottom: rectDivider.top
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 80
                property string property0: "none.none"
                font.hintingPreference: Font.PreferFullHinting
                anchors.bottomMargin: 6
                anchors.topMargin: 5
                anchors.leftMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
            }

            TextField {
                id: textDateDepart
                x: 240
                y: 269
                width: 140
                anchors.right: parent.right
                anchors.top: departLabel.bottom
                anchors.bottom: rectDivider.top
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 5
                anchors.bottomMargin: 6
                anchors.rightMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
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
                height: 48
                text: qsTr("Abbonamento")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: textFieldName.bottom
                anchors.topMargin: 10
                anchors.rightMargin: 240
                anchors.leftMargin: 14
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.659999966621399}D{i:18}D{i:19}D{i:30}
}
##^##*/
