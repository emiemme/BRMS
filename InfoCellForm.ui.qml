import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Item {
    width: 600
    height: 600
    property alias labelNAcconto: labelNAcconto
    property alias labelAcconto: labelAcconto
    property var tvRectColor: "#FF0000"
    property alias labelTicketNumber: labelTicketNumber
    property alias checkBoxGroup: checkBoxGroup
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
    ButtonGroup { id: checkBoxGroup }
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
                anchors.top: header.bottom
                anchors.bottom: rectDivider1.top
                anchors.topMargin: 1
                delegate:
                    DelegateChooser {
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 58
                            implicitHeight: 20

                            CheckBox {
                                anchors.fill: parent
                                display: AbstractButton.IconOnly
                                checked: model.display
                                text: model.display
                                onToggled: model.display = checked
                                ButtonGroup.group: checkBoxGroup
                            }
                        }
                        column: 0
                    }

                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 75
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                            }
                        }
                        column: 1
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 75
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                            }
                        }
                        column: 2
                    }

                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 100
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 3
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 100
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 4
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 50
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 5
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 50
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 6
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 50
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 7
                    }
                    DelegateChoice {
                        Rectangle {
                            color: tvRectColor
                            implicitWidth: 50
                            implicitHeight: 40
                            Label {
                                text: model.display
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        column: 8
                    }
                }
                anchors.leftMargin: 15

                model: TableModel {
                    id: tableModelInfo
                    TableModelColumn {
                        display: "checked"
                    }
                    TableModelColumn {
                        display: "name"
                    }
                    TableModelColumn {
                        display: "surname"
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
                    TableModelColumn {
                        display: "cabina"
                    }
                    TableModelColumn {
                        display: "numeroT"
                    }
                }
                anchors.rightMargin: 15
                anchors.bottomMargin: 16
                implicitWidth: 30
                rowSpacing: 1
                columnSpacing: 2
            }


            Rectangle {
                id: rectDivider
                x: 10
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelAcconto.bottom
                anchors.topMargin: 2
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
                font.bold: true
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
                font.bold: true
                anchors.leftMargin: 205
                anchors.topMargin: 10
            }

            Label {
                id: labelClientName
                x: 14
                width: 100
                height: 30
                text: qsTr("Nome Cliente:")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.topMargin: 50
                anchors.leftMargin: 15
            }

            Label {
                id: labelLettini
                width: 85
                height: 30
                text: qsTr("Lettini:")
                anchors.left: labelNameSurname.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 141
                anchors.topMargin: 50
            }

            Label {
                id: labelNameSurname
                width: 85
                height: 30
                text: qsTr("")
                anchors.left: labelClientName.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 50
                anchors.leftMargin: 15
            }

            Label {
                id: labelSdraio
                width: 85
                height: 30
                text: qsTr("Sdraio:")
                anchors.left: parent.left
                anchors.top: labelLettini.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 356
                anchors.topMargin: 6
            }

            Label {
                id: labelCabina
                width: 85
                height: 30
                text: qsTr("Cabina:")
                anchors.left: parent.left
                anchors.top: labelSdraio.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 356
                anchors.topMargin: 5
            }

            Label {
                id: labelArrive
                width: 100
                height: 30
                text: qsTr("Data Arrivo:")
                anchors.left: parent.left
                anchors.top: labelClientName.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 15
                anchors.topMargin: 5
            }

            Label {
                id: labelDeparture
                width: 100
                height: 30
                text: qsTr("Data Partenza:")
                anchors.left: parent.left
                anchors.top: labelArrive.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 15
                anchors.topMargin: 3
            }

            Label {
                id: labelNLettini
                height: 30
                text: qsTr("")
                anchors.left: labelLettini.right
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 59
                anchors.topMargin: 50
                anchors.leftMargin: 30
            }

            Label {
                id: labelNSdraio
                height: 30
                text: qsTr("")
                anchors.left: labelSdraio.right
                anchors.right: parent.right
                anchors.top: labelNLettini.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 59
                anchors.leftMargin: 30
                anchors.topMargin: 5
            }

            Label {
                id: labelNCabina
                height: 30
                text: qsTr("")
                anchors.left: labelCabina.right
                anchors.right: parent.right
                anchors.top: labelNSdraio.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 59
                anchors.leftMargin: 30
                anchors.topMargin: 5
            }

            Label {
                id: labelArriveDate
                width: 100
                height: 30
                text: qsTr("")
                anchors.left: labelArrive.right
                anchors.top: labelNameSurname.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 5
                anchors.leftMargin: 15
            }

            Label {
                id: labelDepartureDate
                width: 89
                height: 30
                text: qsTr("")
                anchors.left: labelDeparture.right
                anchors.top: labelArriveDate.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 15
                anchors.topMargin: 3
            }

            Label {
                id: labelBookingList
                height: 22
                text: qsTr("Lista Prenotazioni")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectDivider.bottom
                font.bold: true
                anchors.topMargin: 5
                anchors.rightMargin: 449
                anchors.leftMargin: 15
            }

            Rectangle {
                id: header
                height: 22
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelBookingList.bottom
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.topMargin: 5

                Label {
                    id: labelHeaderSelezione
                    width: 60
                    text: qsTr("Seleziona")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                }

                Label {
                    id: labelHeaderNome
                    width: 150
                    text: qsTr("Nome")
                    anchors.left: labelHeaderSelezione.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                }

                Label {
                    id: labelHeaderArrivo
                    x: 205
                    y: 3
                    width: 100
                    text: qsTr("Arrivo")
                    anchors.left: labelHeaderNome.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                }

                Label {
                    id: labelHeaderDepature
                    width: 100
                    text: qsTr("Partenza")
                    anchors.left: labelHeaderArrivo.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                }

                Label {
                    id: labelHeaderLettini
                    width: 50
                    text: qsTr("Lettini")
                    anchors.left: labelHeaderDepature.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                }

                Label {
                    id: labelHeaderSdraio
                    width: 50
                    text: qsTr("Sdraio")
                    anchors.left: labelHeaderLettini.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                }

                Label {
                    id: labelHeaderCabina
                    text: qsTr("Cabina")
                    anchors.left: labelHeaderSdraio.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 0
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                }

            }

            Label {
                id: labelTicket
                width: 107
                height: 17
                text: qsTr("Numero Ticket:")
                anchors.left: parent.left
                anchors.top: labelDepartureDate.bottom
                font.bold: true
                anchors.topMargin: 5
                anchors.leftMargin: 8
            }

            Label {
                id: labelTicketNumber
                width: 85
                height: 17
                text: qsTr("-1")
                anchors.left: labelTicket.right
                anchors.top: labelDepartureDate.bottom
                anchors.topMargin: 5
                anchors.leftMargin: 15
            }

            Label {
                id: labelAcconto
                y: 147
                width: 85
                height: 14
                text: qsTr("Acconto:")
                anchors.left: parent.left
                anchors.top: labelCabina.bottom
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                anchors.leftMargin: 356
                anchors.topMargin: 5
            }

            Label {
                id: labelNAcconto
                x: 456
                y: 147
                width: 59
                height: 18
                text: qsTr("")
                anchors.left: labelAcconto.right
                anchors.right: parent.right
                anchors.top: labelNCabina.bottom
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 30
                anchors.topMargin: 2
                anchors.rightMargin: 59
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
