import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 1240
    height: 768
    property alias textField_Giugno_Seconda_Giorn: textField_Giugno_Seconda_Giorn
    property alias textField_Giugno_Altre_Giorn: textField_Giugno_Altre_Giorn
    property alias textField_Giugno_Seconda_Sett: textField_Giugno_Seconda_Sett
    property alias textField_Giugno_Altre_Sett: textField_Giugno_Altre_Sett
    property alias textField_Giugno_Prima_Quind: textField_Giugno_Prima_Quind
    property alias textField_Giugno_Seconda_Quind: textField_Giugno_Seconda_Quind
    property alias textField_Giugno_Altre_Quind: textField_Giugno_Altre_Quind
    property alias textField_Giugno_Prima_Mens: textField_Giugno_Prima_Mens
    property alias textField_Giugno_Seconda_Mens: textField_Giugno_Seconda_Mens
    property alias textField_Giugno_Altre_Mens: textField_Giugno_Altre_Mens
    property alias textField_Settembre_Prima_Giorn: textField_Settembre_Prima_Giorn
    property alias textField_Settembre_Seconda_Giorn: textField_Settembre_Seconda_Giorn
    property alias textField_Settembre_Altre_Giorn: textField_Settembre_Altre_Giorn
    property alias textField_Settembre_Prima_Sett: textField_Settembre_Prima_Sett
    property alias textField_Settembre_Seconda_Sett: textField_Settembre_Seconda_Sett
    property alias textField_Settembre_Altre_Sett: textField_Settembre_Altre_Sett
    property alias textField_Settembre_Prima_Quind: textField_Settembre_Prima_Quind
    property alias textField_Settembre_Seconda_Quind: textField_Settembre_Seconda_Quind
    property alias textField_Settembre_Altre_Quind: textField_Settembre_Altre_Quind
    property alias textField_Settembre_Prima_Mens: textField_Settembre_Prima_Mens
    property alias textField_Settembre_Seconda_Mens: textField_Settembre_Seconda_Mens
    property alias textField_Settembre_Altre_Mens: textField_Settembre_Altre_Mens
    property alias textField_Luglio_Prima_Giorn: textField_Luglio_Prima_Giorn
    property alias textField_Luglio_Seconda_Giorn: textField_Luglio_Seconda_Giorn
    property alias textField_Luglio_Altre_Giorn: textField_Luglio_Altre_Giorn
    property alias textField_Luglio_Prima_Sett: textField_Luglio_Prima_Sett
    property alias textField_Luglio_Seconda_Sett: textField_Luglio_Seconda_Sett
    property alias textField_Luglio_Altre_Sett: textField_Luglio_Altre_Sett
    property alias textField_Luglio_Prima_Quind: textField_Luglio_Prima_Quind
    property alias textField_Luglio_Seconda_Quind: textField_Luglio_Seconda_Quind
    property alias textField_Luglio_Altre_Quind: textField_Luglio_Altre_Quind
    property alias textField_Luglio_Prima_Mens: textField_Luglio_Prima_Mens
    property alias textField_Luglio_Seconda_Mens: textField_Luglio_Seconda_Mens
    property alias textField_Luglio_Altre_Mens: textField_Luglio_Altre_Mens
    property alias textField_Agosto_Altre_Mens: textField_Agosto_Altre_Mens
    property alias textField_Agosto_Seconda_Mens: textField_Agosto_Seconda_Mens
    property alias textField_Agosto_Prima_Mens: textField_Agosto_Prima_Mens
    property alias textField_Agosto_Altre_Quind: textField_Agosto_Altre_Quind
    property alias textField_Agosto_Seconda_Quind: textField_Agosto_Seconda_Quind
    property alias textField_Agosto_Prima_Quind: textField_Agosto_Prima_Quind
    property alias textField_Agosto_Altre_Sett: textField_Agosto_Altre_Sett
    property alias textField_Agosto_Seconda_Sett: textField_Agosto_Seconda_Sett
    property alias textField_Agosto_Prima_Sett: textField_Agosto_Prima_Sett
    property alias textField_Agosto_Altre_Giorn: textField_Agosto_Altre_Giorn
    property alias textField_Agosto_Seconda_Giorn: textField_Agosto_Seconda_Giorn
    property alias textField_Agosto_Prima_Giorn: textField_Agosto_Prima_Giorn
    property alias textField_Giugno_Prima_Sett: textField_Giugno_Prima_Sett
    property alias textField_Giugno_Prima_Giorn: textField_Giugno_Prima_Giorn
    property alias confirmButton: confirmButton
    property alias closeButton: closeButton

    Rectangle {
        id: backgroundRect
        color: "#f6d365"
        border.width: 5
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
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

            GeneralButton {
                id: closeButton
                y: 336
                width: 100
                height: 50
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                labelButton.text: "Esci"
                anchors.leftMargin: 15
                anchors.bottomMargin: 15
            }

            GeneralButton {
                id: confirmButton
                x: 292
                anchors.right: parent.right
                anchors.top: rectDivider.bottom
                anchors.bottom: parent.bottom
                labelButton.text: "Conferma"
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
                anchors.bottom: closeButton.top
                anchors.bottomMargin: 6
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            Rectangle {
                id: rectDivider1
                width: 10
                color: "#0c3483"
                radius: 2.5
                anchors.top: parent.top
                anchors.bottom: rectDividerMiddle.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                anchors.bottomMargin: 10
            }

            Rectangle {
                id: rectDividerMiddle
                x: 14
                height: 10
                color: "#0c3483"
                radius: 2.5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenterOffset: -25
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }

            Rectangle {
                id: rectDividerMiddleBottom
                width: 10
                color: "#0c3483"
                radius: 2.5
                anchors.top: rectDividerMiddle.bottom
                anchors.bottom: rectDivider.top
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: labelUmbrella
                x: 5
                y: 5
                height: 37
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.leftMargin: 16
                anchors.topMargin: 5
                anchors.rightMargin: 16
            }

            Label {
                id: labelUmbrella1
                x: 1
                y: 12
                height: 37
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: 14
                anchors.leftMargin: 16
                anchors.topMargin: 5
                anchors.rightMargin: 16
            }

            Rectangle {
                id: rectangleGiugno
                x: 15
                y: 12
                width: 594
                height: 332
                color: "#00ffffff"

                Label {
                    id: label
                    x: 281
                    y: 8
                    text: qsTr("Giugno")
                    font.pointSize: 12
                    font.bold: true
                }

                Label {
                    id: label1
                    x: 14
                    y: 105
                    width: 65
                    height: 50
                    text: qsTr("Prima")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                Label {
                    id: label2
                    x: 14
                    y: 162
                    width: 65
                    height: 50
                    text: qsTr("Seconda")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                Label {
                    id: label3
                    x: 14
                    y: 224
                    width: 65
                    height: 50
                    text: qsTr("Altre")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                    rotation: 0
                }

                Label {
                    id: label4
                    x: 85
                    y: 74
                    text: qsTr("Giornaliero")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                Label {
                    id: label5
                    x: 218
                    y: 74
                    text: qsTr("Settimanale")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                Label {
                    id: label6
                    x: 357
                    y: 74
                    text: qsTr("Quindicina")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                Label {
                    id: label7
                    x: 496
                    y: 74
                    text: qsTr("Mensile")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                TextField {
                    id: textField_Giugno_Prima_Giorn
                    x: 92
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                Label {
                    id: label8
                    x: 39
                    y: 74
                    text: qsTr("FILA")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    font.bold: true
                }

                TextField {
                    id: textField_Giugno_Seconda_Giorn
                    x: 92
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Altre_Giorn
                    x: 92
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Prima_Sett
                    x: 229
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Seconda_Sett
                    x: 229
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Altre_Sett
                    x: 229
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Prima_Quind
                    x: 362
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Seconda_Quind
                    x: 362
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Altre_Quind
                    x: 362
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Prima_Mens
                    x: 488
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Seconda_Mens
                    x: 488
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Giugno_Altre_Mens
                    x: 488
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }
            }

            Rectangle {
                id: rectangleSettembre
                x: 636
                y: 12
                width: 594
                height: 332
                color: "#00ffffff"
                Label {
                    id: label9
                    x: 281
                    y: 8
                    text: qsTr("Settembre")
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: label10
                    x: 14
                    y: 105
                    width: 65
                    height: 50
                    text: qsTr("Prima")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label11
                    x: 14
                    y: 162
                    width: 65
                    height: 50
                    text: qsTr("Seconda")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label12
                    x: 14
                    y: 224
                    width: 65
                    height: 50
                    text: qsTr("Altre")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    rotation: 0
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label13
                    x: 85
                    y: 74
                    text: qsTr("Giornaliero")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label14
                    x: 218
                    y: 74
                    text: qsTr("Settimanale")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label15
                    x: 357
                    y: 74
                    text: qsTr("Quindicina")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label16
                    x: 496
                    y: 74
                    text: qsTr("Mensile")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Settembre_Prima_Giorn
                    x: 92
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                Label {
                    id: label17
                    x: 39
                    y: 74
                    text: qsTr("FILA")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Settembre_Seconda_Giorn
                    x: 92
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Altre_Giorn
                    x: 92
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Prima_Sett
                    x: 229
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Seconda_Sett
                    x: 229
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Altre_Sett
                    x: 229
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Prima_Quind
                    x: 362
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Seconda_Quind
                    x: 362
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Altre_Quind
                    x: 362
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Prima_Mens
                    x: 488
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Seconda_Mens
                    x: 488
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Settembre_Altre_Mens
                    x: 488
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }
            }

            Rectangle {
                id: rectangleLugio
                x: 15
                y: 374
                width: 594
                height: 332
                color: "#00ffffff"
                Label {
                    id: label18
                    x: 281
                    y: 8
                    text: qsTr("Luglio")
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: label19
                    x: 14
                    y: 105
                    width: 65
                    height: 50
                    text: qsTr("Prima")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label20
                    x: 14
                    y: 162
                    width: 65
                    height: 50
                    text: qsTr("Seconda")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label21
                    x: 14
                    y: 224
                    width: 65
                    height: 50
                    text: qsTr("Altre")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    rotation: 0
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label22
                    x: 85
                    y: 74
                    text: qsTr("Giornaliero")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label23
                    x: 218
                    y: 74
                    text: qsTr("Settimanale")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label24
                    x: 357
                    y: 74
                    text: qsTr("Quindicina")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label25
                    x: 496
                    y: 74
                    text: qsTr("Mensile")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Luglio_Prima_Giorn
                    x: 92
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                Label {
                    id: label26
                    x: 39
                    y: 74
                    text: qsTr("FILA")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Luglio_Seconda_Giorn
                    x: 92
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Altre_Giorn
                    x: 92
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Prima_Sett
                    x: 229
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Seconda_Sett
                    x: 229
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Altre_Sett
                    x: 229
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Prima_Quind
                    x: 362
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Seconda_Quind
                    x: 362
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Altre_Quind
                    x: 362
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Prima_Mens
                    x: 488
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Seconda_Mens
                    x: 488
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Luglio_Altre_Mens
                    x: 488
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }
            }

            Rectangle {
                id: rectangleAgosto
                x: 636
                y: 374
                width: 594
                height: 332
                color: "#00ffffff"
                Label {
                    id: label27
                    x: 281
                    y: 8
                    text: qsTr("Agosto")
                    font.bold: true
                    font.pointSize: 12
                }

                Label {
                    id: label28
                    x: 14
                    y: 105
                    width: 65
                    height: 50
                    text: qsTr("Prima")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label29
                    x: 14
                    y: 162
                    width: 65
                    height: 50
                    text: qsTr("Seconda")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label30
                    x: 14
                    y: 224
                    width: 65
                    height: 50
                    text: qsTr("Altre")
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    rotation: 0
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label31
                    x: 85
                    y: 74
                    text: qsTr("Giornaliero")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label32
                    x: 218
                    y: 74
                    text: qsTr("Settimanale")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label33
                    x: 357
                    y: 74
                    text: qsTr("Quindicina")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                Label {
                    id: label34
                    x: 496
                    y: 74
                    text: qsTr("Mensile")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Agosto_Prima_Giorn
                    x: 92
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                Label {
                    id: label35
                    x: 39
                    y: 74
                    text: qsTr("FILA")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                }

                TextField {
                    id: textField_Agosto_Seconda_Giorn
                    x: 92
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Altre_Giorn
                    x: 92
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Prima_Sett
                    x: 229
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Seconda_Sett
                    x: 229
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Altre_Sett
                    x: 229
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Prima_Quind
                    x: 362
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Seconda_Quind
                    x: 362
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Altre_Quind
                    x: 362
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Prima_Mens
                    x: 488
                    y: 105
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Seconda_Mens
                    x: 488
                    y: 162
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }

                TextField {
                    id: textField_Agosto_Altre_Mens
                    x: 488
                    y: 224
                    width: 80
                    height: 50
                    placeholderText: qsTr("Text Field")
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:6}D{i:7}D{i:8}D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}D{i:15}
D{i:16}D{i:17}D{i:18}D{i:19}D{i:20}D{i:21}D{i:22}D{i:23}D{i:24}D{i:25}D{i:26}D{i:27}
D{i:28}D{i:29}D{i:30}D{i:31}D{i:32}D{i:33}D{i:34}D{i:35}D{i:14}D{i:5}D{i:1}
}
##^##*/
