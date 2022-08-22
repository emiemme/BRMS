import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Item {
    width: 400
    height: 600
    property alias addBookingButton: addBookingButton
    property alias datePickerSearch: datePickerSearch
    property alias comboBoxRow: comboBoxRow
    property alias searchListView: searchListView
    property alias textDateDepart: textDateDepart
    property alias textDateArrive: textDateArrive
    property alias searchSolutionButton: searchSolutionButton
    property alias dateDepartureMouseArea: dateDepartureMouseArea
    property alias dateArriveMouseArea: dateArriveMouseArea
    property alias closeSolutionButton: closeSolutionButton
    property var tvRectColor: "#FF0000"
    property alias checkBoxGroup: checkBoxGroup
    property alias searchList: searchList
    property alias comboBoxRowData: comboBoxRowData
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


            Label {
                id: arriveLabel
                x: 20
                width: 120
                height: 30
                text: qsTr("Data Arrivo")
                anchors.left: parent.left
                anchors.top: labelOmb.bottom
                verticalAlignment: Text.AlignVCenter
                //anchors.top: tableItems.bottom
                anchors.topMargin: 27
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
                anchors.topMargin: 27
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
                anchors.top: labelOmb.bottom
                horizontalAlignment: Text.AlignHCenter
                bottomPadding: 24
                anchors.rightMargin: 128
                anchors.topMargin: 18
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
                anchors.topMargin: 17
                anchors.rightMargin: 128
                placeholderText: Qt.formatDateTime(new Date(),
                                                   "yyyy-MM-dd").toString()
                inputMethodHints: inputMethodHints
                MouseArea {
                    id: dateDepartureMouseArea
                    anchors.fill: parent
                }
            }

            Rectangle {
                id: rectDivider
                x: 10
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: searchSolutionButton.bottom
                anchors.topMargin: 17
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
                id: closeSolutionButton
                width: 100
                anchors.left: parent.left
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.leftMargin: 15
                anchors.topMargin: 11
                labelButton.text: "Esci"
            }

            GeneralButton {
                id: addBookingButton
                width: 100
                height: 60
                anchors.right: parent.right
                anchors.top: rectDivider1.bottom
                anchors.bottom: parent.bottom
                anchors.rightMargin: 15
                anchors.bottomMargin: 15
                anchors.topMargin: 6
                labelButton.text: "Aggiungi"
            }

            Label {
                id: labelOmb
                width: 130
                height: 35
                text: qsTr("Ricerca Soluzioni")
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true
                anchors.topMargin: 10
            }

            Label {
                id: labelBookingList
                y: 211
                height: 22
                text: qsTr("Lista Soluzioni")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectDivider.bottom
                anchors.rightMargin: 283
                font.bold: true
                anchors.topMargin: 5
                anchors.leftMargin: 16
            }

            ListView {
                id: searchListView
                height: 155
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelBookingList.bottom
                anchors.topMargin: 23
                anchors.leftMargin: 107
                anchors.rightMargin: 121
                ScrollIndicator.vertical: ScrollIndicator { }
                model: ListModel {
                    id: searchList
                }
                delegate: Row {
                        x: 5
                        width: 80
                        height: 40
                        id: row1
                        CheckBox {
                           checked: check
                           ButtonGroup.group: checkBoxGroup
                        }

                        Text {
                            text: name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                        spacing: 10
                    }
                }

            GeneralButton {
                id: searchSolutionButton
                height: 60
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: textDateDepart.bottom
                anchors.topMargin: 1
                anchors.rightMargin: 15
                labelButton.text: "Cerca"
                anchors.leftMargin: 285
            }

            ComboBox {
                id: comboBoxRow
                x: 10
                y: 181
                currentIndex: 0
                textRole: "text"
                model: ListModel {
                    id: comboBoxRowData
                    ListElement {
                        text: "Tutte"
                        startValue: 1
                        endValue: 173
                    }

                    ListElement {
                        text: "1° Fila"
                        startValue: 1
                        endValue: 20
                    }

                    ListElement {
                        text: "2° Fila"
                        startValue: 21
                        endValue: 40
                    }

                    ListElement {
                        text: "3° Fila"
                        startValue: 41
                        endValue: 60
                    }
                    ListElement {
                        text: "4° Fila"
                        startValue: 61
                        endValue: 80
                    }
                    ListElement {
                        text: "5° Fila"
                        startValue: 81
                        endValue: 99
                    }
                    ListElement {
                        text: "6° Fila"
                        startValue: 100
                        endValue: 118
                    }
                    ListElement {
                        text: "7° 8° 9° Fila"
                        startValue: 119
                        endValue: 173
                    }
                }
            }

            DatePicker {
                id: datePickerSearch
                x: 100
                y: 63
                width: 221
                height: 295
                visible: false
                z: 1
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
