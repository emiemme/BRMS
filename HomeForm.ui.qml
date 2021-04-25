import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Page {
    id: item1
    width: 1200
    height: 1080
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
    property alias cellButtonListRight10: cellButtonListRight10
    property alias cellButtonListLeft1: cellButtonListLeft1
    property alias cellButtonListLeft2: cellButtonListLeft2
    property alias cellButtonListLeft3: cellButtonListLeft3
    property alias cellButtonListLeft4: cellButtonListLeft4
    property alias cellButtonListLeft5: cellButtonListLeft5
    property alias cellButtonListLeft6: cellButtonListLeft6
    property alias cellButtonListLeft7: cellButtonListLeft7
    property alias cellButtonListLeft8: cellButtonListLeft8
    property alias cellButtonListLeft9: cellButtonListLeft9
    property alias cellButtonListLeft10: cellButtonListLeft10
    property alias stackView: stackView
    property alias backgroundRect: backgroundRect

    Rectangle {
        id: backgroundRect
        color: "#ffffff"
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
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                spacing: 0
                interactive: false
                model: ListModel {
                    id: cellButtonListRight1
                }
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }

            }

            ListView {
                id: rowRight2
                width: 120
                anchors.left: rowRight1.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight2
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight3
                width: 120
                anchors.left: rowRight2.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight3
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight4
                width: 120
                anchors.left: rowRight3.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight4
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight5
                width: 120
                anchors.left: rowRight4.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight5
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight6
                width: 120
                anchors.left: rowRight5.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 6
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight6
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight7
                width: 120
                anchors.left: rowRight6.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 5
                model: ListModel {
                    id: cellButtonListRight7
                }
                spacing: 0
                interactive: false
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }


            ListView {
                id: rowRight8
                width: 120
                anchors.left: rowRight7.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListRight8
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight9
                width: 120
                anchors.left: rowRight8.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListRight9
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowRight10
                width: 120
                anchors.left: rowRight9.right
                anchors.top: parent.top
                anchors.bottom: passerellaRect.top
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListRight10
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft1
                x: 90
                width: 120
                anchors.left: seaRect.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft1
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft2
                width: 120
                anchors.left: rowLeft1.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft2
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft3
                width: 120
                anchors.left: rowLeft2.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft3
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft4
                width: 120
                anchors.left: rowLeft3.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft4
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft5
                width: 120
                anchors.left: rowLeft4.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft5
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft6
                width: 120
                anchors.left: rowLeft5.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft6
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft7
                width: 120
                anchors.left: rowLeft6.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft7
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft8
                width: 120
                anchors.left: rowLeft7.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft8
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft9
                width: 120
                anchors.left: rowLeft8.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft9
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }

            ListView {
                id: rowLeft10
                width: 120
                anchors.left: rowLeft9.right
                anchors.top: passerellaRect.bottom
                anchors.bottom: parent.bottom
                interactive: false
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
                spacing: 0
                model: ListModel {
                    id: cellButtonListLeft10
                }
                anchors.topMargin: 5
                delegate: CellButton {
                    labelNumber.text: cellNumber
                    labelClientName.text: clientName
                    cellStatusRectColor: statusColor
                    cellStatus: statusCell
                }
            }
            Rectangle {
                id: passerellaRect
                y: 337
                width: 1122
                height: 30
                color: "#ffd819"
                anchors.left: seaRect.right
                anchors.leftMargin: 6
            }
            Rectangle {
                id: seaRect
                width: 30
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
                anchors.verticalCenterOffset: -280
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            InfoCell {
                id: infoCell
                x: 286
                y: 8
                visible: false
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
