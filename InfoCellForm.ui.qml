import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Item {
    width: 600
    height: 600
    property alias tableModelInfo: tableModelInfo
    property alias tableItems: tableItems
    property alias labelUmbrella: labelUmbrella
    property alias labelDepartureDate: labelDepartureDate
    property alias labelArriveDate: labelArriveDate
    property alias labelNCabina: labelNCabina
    property alias labelNSdraio: labelNSdraio
    property alias labelNLettini: labelNLettini
    property alias labelNameSurname: labelNameSurname
    property alias addInfoButton: addInfoButton
    property alias closeinfoButton: closeinfoButton
    property alias removeInfoButton: removeInfoButton
    property alias modifyInfoButton: modifyInfoButton

    Rectangle {
        id: backgroundRect
        color: "#f6d365"
        border.width: 5
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        MouseArea {
            id: mouseArea
            anchors.fill: parent

            TableView {
                id: tableItems
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelBookingList.bottom
                anchors.bottom: rectDivider1.top
                delegate:
                    DelegateChooser {
                    DelegateChoice {
                        CheckBox {
                            onToggled: model.display = checked
                        }
                        column: 0
                    }

                    DelegateChoice {
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        column: 1
                    }

                    DelegateChoice {
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        column: 2
                    }
                    DelegateChoice {
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        column: 3
                    }
                    DelegateChoice {
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        column: 4
                    }
                    DelegateChoice {
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        column: 5
                    }
                }
                anchors.leftMargin: 15

                model: TableModel {
                    id: tableModelInfo
                    TableModelColumn {
                        display: "checked"
                    }

                    TableModelColumn {
                        display: "name_surname"
                    }

                    TableModelColumn {
                        display: "arrive_date"
                    }
                    TableModelColumn {
                        display: "departure_date"
                    }
                    TableModelColumn {
                        display: "lettini"
                    }
                    TableModelColumn {
                        display: "sdraio"
                    }
                }
                anchors.rightMargin: 15
                anchors.topMargin: 5
                anchors.bottomMargin: 15
                implicitWidth: 30
                rowSpacing: 1
                columnSpacing: 1
            }


            Rectangle {
                id: rectDivider
                x: 10
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelCabina.bottom
                anchors.topMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }


            Rectangle {
                id: rectDivider1
                x: 8
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 509
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            GeneralButton {
                id: modifyInfoButton
                width: 100
                height: 60
                anchors.right: removeInfoButton.left
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 15
                anchors.bottomMargin: 15
                anchors.topMargin: 6
                labelButton.text: "Modifica"
            }

            GeneralButton {
                id: removeInfoButton
                width: 100
                height: 60
                anchors.right: parent.right
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 15
                anchors.bottomMargin: 15
                anchors.topMargin: 5
                labelButton.text: "Rimuovi"
            }

            GeneralButton {
                id: closeinfoButton
                width: 100
                anchors.left: parent.left
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.leftMargin: 15
                anchors.topMargin: 11
                labelButton.text: "Annulla"
            }

            GeneralButton {
                id: addInfoButton
                height: 60
                anchors.left: closeinfoButton.right
                anchors.right: modifyInfoButton.left
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 15
                anchors.bottomMargin: 15
                anchors.topMargin: 6
                anchors.leftMargin: 140
                labelButton.text: "Aggiungi"
            }

            Label {
                id: labelUmbrella
                x: 340
                y: 9
                width: 255
                height: 35
                text: qsTr("Label")
                anchors.left: labelOmb.right
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 6
                anchors.rightMargin: 205
                anchors.topMargin: 10
            }

            Label {
                id: labelOmb
                width: 130
                height: 35
                text: qsTr("Ombrellone Numero:")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 205
                anchors.topMargin: 10
            }

            Label {
                id: labelClientName
                x: 14
                width: 85
                height: 30
                text: qsTr("Nome Cliente:")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 50
                anchors.leftMargin: 15
            }

            Label {
                id: labelLettini
                width: 85
                height: 30
                text: qsTr("Lettini")
                anchors.left: parent.left
                anchors.top: labelClientName.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 15
                anchors.topMargin: 5
            }

            Label {
                id: labelNameSurname
                width: 85
                height: 30
                text: qsTr("Label")
                anchors.left: labelClientName.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 50
                anchors.leftMargin: 30
            }

            Label {
                id: labelSdraio
                width: 85
                height: 30
                text: qsTr("Sdraio")
                anchors.left: parent.left
                anchors.top: labelLettini.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 15
                anchors.topMargin: 5
            }

            Label {
                id: labelCabina
                width: 85
                height: 30
                text: qsTr("Cabina")
                anchors.left: parent.left
                anchors.top: labelSdraio.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 15
                anchors.topMargin: 5
            }

            Label {
                id: labelArrive
                width: 85
                height: 30
                text: qsTr("Data Arrivo:")
                anchors.left: labelNameSurname.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 130
                anchors.topMargin: 50
            }

            Label {
                id: labelDeparture
                width: 85
                height: 30
                text: qsTr("Data Partenza")
                anchors.left: labelNLettini.right
                anchors.top: labelArrive.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 130
                anchors.topMargin: 20
            }

            Label {
                id: labelNLettini
                width: 85
                height: 30
                text: qsTr("Label")
                anchors.left: labelLettini.right
                anchors.top: labelNameSurname.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 30
                anchors.topMargin: 5
            }

            Label {
                id: labelNSdraio
                width: 85
                height: 30
                text: qsTr("Label")
                anchors.left: labelSdraio.right
                anchors.top: labelNLettini.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 30
                anchors.topMargin: 5
            }

            Label {
                id: labelNCabina
                width: 85
                height: 30
                text: qsTr("Label")
                anchors.left: labelCabina.right
                anchors.top: labelNSdraio.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 30
                anchors.topMargin: 5
            }

            Label {
                id: labelArriveDate
                height: 30
                text: qsTr("Label")
                anchors.left: labelArrive.right
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 56
                anchors.topMargin: 50
                anchors.leftMargin: 30
            }

            Label {
                id: labelDepartureDate
                height: 30
                text: qsTr("Label")
                anchors.left: labelDeparture.right
                anchors.right: parent.right
                anchors.top: labelArriveDate.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 56
                anchors.leftMargin: 30
                anchors.topMargin: 20
            }

            Label {
                id: labelBookingList
                height: 22
                text: qsTr("Lista Prenotazioni")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectDivider.bottom
                anchors.topMargin: 5
                anchors.rightMargin: 449
                anchors.leftMargin: 15
            }



        }
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
    }
}
