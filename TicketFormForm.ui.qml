import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0
import Qt.labs.calendar 1.0

Item {
    id: ticketForm
    width: 400
    height: 400
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
                anchors.top: textFieldName.bottom
                anchors.bottom: rectDivider.top
                anchors.bottomMargin: 91
                anchors.leftMargin: 14
                anchors.rightMargin: 6
                anchors.topMargin: 5
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
                x: 8
                y: 336
                width: 100
                height: 50
            }

            GeneralButton {
                id: confirmTicketButton
                x: 292
                y: 336
            }

            Rectangle {
                id: rectDivider
                x: 10
                y: 321
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: closeTicketButton.top
                anchors.bottomMargin: 5
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            TextField {
                id: textFieldName
                x: 116
                y: 42
                width: 113
                height: 43
                anchors.right: textFieldSurname.left
                anchors.rightMargin: 30
                hoverEnabled: false
                placeholderText: qsTr("Daily")
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
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
            }

            Label {
                id: labelClientName
                x: 14
                y: 49
                height: 30
                text: qsTr("Nome Cliente:")
                anchors.left: parent.left
                anchors.right: textFieldName.left
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 22
                anchors.leftMargin: 14
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
                anchors.left: parent.left
                anchors.right: textDateDepart.left
                anchors.top: arriveLabel.bottom
                anchors.bottom: rectDivider.top
                anchors.rightMargin: 80
                property string property0: "none.none"
                font.hintingPreference: Font.PreferFullHinting
                anchors.bottomMargin: 20
                anchors.topMargin: 5
                anchors.leftMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-ddThh:mm").toString()
                inputMethodHints: inputMethodHints
            }

            TextField {
                id: textDateDepart
                x: 241
                y: 269
                width: 140
                anchors.right: parent.right
                anchors.top: departLabel.bottom
                anchors.bottom: rectDivider.top
                anchors.topMargin: 5
                anchors.bottomMargin: 20
                anchors.rightMargin: 20
                placeholderText: Qt.formatDateTime(new Date(),"yyyy-MM-ddT").toString() + "23:59"
                inputMethodHints: inputMethodHints
            }

            TextField {
                id: textFieldSurname
                x: 260
                y: 42
                width: 115
                height: 43
                text: ""
                anchors.right: parent.right
                anchors.rightMargin: 25
                placeholderText: qsTr("Daily")
                hoverEnabled: false
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
        }
    }
}
