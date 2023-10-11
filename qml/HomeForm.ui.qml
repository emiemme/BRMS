import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Page {
    id: homeform
    width: 1240
    height: 768
    property alias buttonUpdateGrid: buttonUpdateGrid
    property alias homeform: homeform
    property alias infoCell: infoCell
    property alias rowRight1: rowRight1
    property alias homeTicketForm: homeTicketForm
    property alias cellButtonListRight1: cellButtonListRight1
    property alias cellButtonListRight2: cellButtonListRight2
    property alias cellButtonListRight3: cellButtonListRight3
    property alias cellButtonListRight4: cellButtonListRight4
    property alias cellButtonListRight5: cellButtonListRight5
    property alias cellButtonListRight6: cellButtonListRight6
    property alias cellButtonListRight7: cellButtonListRight7
    property alias cellButtonListRight8: cellButtonListRight8
    property alias cellButtonListRight9: cellButtonListRight9
    property alias cellButtonListLeft1: cellButtonListLeft1
    property alias cellButtonListLeft2: cellButtonListLeft2
    property alias cellButtonListLeft3: cellButtonListLeft3
    property alias cellButtonListLeft4: cellButtonListLeft4
    property alias cellButtonListLeft5: cellButtonListLeft5
    property alias cellButtonListLeft6: cellButtonListLeft6
    property alias cellButtonListLeft7: cellButtonListLeft7
    property alias cellButtonListLeft8: cellButtonListLeft8
    property alias cellButtonListLeft9: cellButtonListLeft9
    property alias stackView: stackView
    property alias backgroundRect: backgroundRect

    Rectangle {
        id: backgroundRect
        color: "#efb23f"

        anchors.fill: parent

        StackView {
            id: stackView
            anchors.fill: parent

            ListView {
                id: rowRight1
                width: 120
                anchors.left: seaRect.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: -21
                anchors.topMargin: 5
                spacing: 0
                interactive: false
                model: ListModel {
                    id: cellButtonListRight1
                }
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }

            }

            ListView {
                id: rowRight2
                width: 120
                anchors.left: rowRight1.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight2
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight3
                width: 120
                anchors.left: rowRight2.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight3
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight4
                width: 120
                anchors.left: rowRight3.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight4
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight5
                width: 120
                anchors.left: rowRight4.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight5
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight6
                width: 120
                anchors.left: rowRight5.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight6
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight7
                width: 120
                anchors.left: rowRight6.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 3
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight7
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }


            ListView {
                id: rowRight8
                width: 120
                anchors.left: rowRight7.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                interactive: false
                anchors.bottomMargin: 66
                anchors.leftMargin: 3
                spacing: 5
                model: ListModel {
                    id: cellButtonListRight8
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight9
                width: 120
                anchors.left: rowRight8.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                interactive: false
                anchors.bottomMargin: 66
                anchors.leftMargin: 3
                spacing: 5
                model: ListModel {
                    id: cellButtonListRight9
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowRight10
                width: 125
                anchors.left: rowRight9.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.rightMargin: 0
                model: ListModel {
                    id: cellButtonListRight10
                }
                anchors.leftMargin: 3
                anchors.bottomMargin: 66
                delegate: CellButton {
                    labelClientName.text: clientSurname
                    labelNumber.text: cellNumber
                    cellStatusRectColor: statusColor
                }
                spacing: 5
                interactive: false
                anchors.topMargin: 5
            }

            ListView {
                id: rowLeft1
                x: 90
                width: 120
                anchors.left: seaRect.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft1
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft2
                width: 120
                anchors.left: rowLeft1.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft2
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft3
                width: 120
                anchors.left: rowLeft2.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft3
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft4
                width: 120
                anchors.left: rowLeft3.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft4
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft5
                width: 120
                anchors.left: rowLeft4.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft5
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft6
                width: 120
                anchors.left: rowLeft5.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft6
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft7
                width: 120
                anchors.left: rowLeft6.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft7
                }
                anchors.topMargin: 3
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft8
                width: 120
                anchors.left: rowLeft7.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 5
                model: ListModel {
                    id: cellButtonListLeft8
                }
                anchors.topMargin: 78
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }

            ListView {
                id: rowLeft9
                width: 120
                anchors.left: rowLeft8.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 0
                anchors.leftMargin: 3
                spacing: 5
                model: ListModel {
                    id: cellButtonListLeft9
                }
                anchors.topMargin: 78
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientSurname
                    cellStatusRectColor: statusColor
                }
            }
            ListView {
                id: rowLeft10
                anchors.left: rowLeft9.right
                anchors.right: parent.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                model: ListModel {
                    id: cellButtonListLeft10
                }
                anchors.bottomMargin: 0
                delegate: CellButton {
                    labelClientName.text: clientSurname
                    labelNumber.text: cellNumber
                    cellStatusRectColor: statusColor
                }
                anchors.rightMargin: 0
                spacing: 5
                interactive: false
                anchors.topMargin: 78
            }

            Rectangle {
                id: passerellaRect
                y: 340
                height: 16
                color: "#ffd819"
                anchors.left: seaRect.right
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.leftMargin: 4

                Label {
                    id: labelPrimaFila
                    width: 120
                    text: qsTr("1° Fila")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                    font.bold: true
                }

                Label {
                    id: labelSecondaFila
                    width: 120
                    text: qsTr("2° Fila")
                    anchors.left: labelPrimaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                }

                Label {
                    id: labelTerzaFila
                    width: 120
                    text: qsTr("3° Fila")
                    anchors.left: labelSecondaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.topMargin: 8
                    anchors.bottomMargin: 8
                }

                Label {
                    id: labelQuartaFila
                    width: 120
                    text: qsTr("4° Fila")
                    anchors.left: labelTerzaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.topMargin: 8
                    anchors.bottomMargin: 8
                }

                Label {
                    id: labelQuintaFila
                    width: 120
                    text: qsTr("5° Fila")
                    anchors.left: labelQuartaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.topMargin: 8
                    anchors.bottomMargin: 8
                }

                Label {
                    id: labelSestaFila
                    width: 120
                    text: qsTr("6° Fila")
                    anchors.left: labelQuintaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                }

                Label {
                    id: labelSettimaFila
                    width: 120
                    text: qsTr("7° Fila")
                    anchors.left: labelSestaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.topMargin: 8
                    anchors.bottomMargin: 8
                }

                Label {
                    id: labelOttavaFila
                    width: 120
                    text: qsTr("8° Fila")
                    anchors.left: labelSettimaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                }

                Label {
                    id: labelNonaFila
                    width: 120
                    text: qsTr("9° Fila")
                    anchors.left: labelOttavaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                }

                Label {
                    id: labeldecimaFila
                    width: 120
                    text: qsTr("10° Fila")
                    anchors.left: labelNonaFila.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 8
                    anchors.topMargin: 8
                }
            }
            Rectangle {
                id: seaRect
                width: 5
                color: "#26deff"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }

            TicketFormForm {
                id: homeTicketForm
                x: 397
                y: 290
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                z: 4
                anchors.verticalCenterOffset: -99
                anchors.horizontalCenterOffset: 16
                anchors.horizontalCenter: parent.horizontalCenter
            }

            InfoCell {
                id: infoCell
                x: 286
                y: 8
                visible: false
            }

            Button {
                id: buttonUpdateGrid
                x: 1015
                y: 261
                visible: false
                text: qsTr("UpdateGrid")
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:6}D{i:9}D{i:12}D{i:15}D{i:18}D{i:21}D{i:24}D{i:27}
D{i:30}D{i:33}D{i:36}D{i:39}D{i:42}D{i:45}D{i:48}D{i:51}D{i:54}D{i:57}D{i:60}D{i:64}
D{i:65}D{i:66}D{i:67}D{i:68}D{i:69}D{i:70}D{i:71}D{i:72}D{i:73}D{i:63}D{i:74}D{i:75}
D{i:76}D{i:77}D{i:2}D{i:1}
}
##^##*/
