import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: item1
    width: 100
    height: 400
    property alias textAreaDate: textAreaDate
    property alias buttonUpdateDB: buttonUpdateDB
    property alias infoArea: infoArea
    property alias toolButtonMenu: toolButtonMenu
    property alias dateTimeLabel: dateTimeLabel

    Rectangle {
        id: backgroundRect
        color: "#4facfe"
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#4facfe"
            }

            GradientStop {
                position: 1
                color: "#00f2fe"
            }
        }

        ToolbarInfoCell {
            id: infoArea
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: toolBar.bottom
            anchors.topMargin: 10
            anchors.leftMargin: 8
            anchors.rightMargin: 8
        }

        ToolBar {
            id: toolBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            Label {
                id: dateTimeLabel
                text: qsTr("Label")
                anchors.left: parent.left
                anchors.right: toolButtonMenu.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 5
            }

            ToolButton {
                id: toolButtonMenu
                x: 80
                width: 20
                text: qsTr("Tool Button")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.rightMargin: 5
            }
        }

        ToolbarInfoCell {
            id: infoArea1
            y: 89
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: infoArea.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 8
            anchors.leftMargin: 8
        }

        ToolbarInfoCell {
            id: infoArea2
            y: 89
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: infoArea1.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 8
            anchors.leftMargin: 8
        }

        ToolbarInfoCell {
            id: infoArea3
            y: 151
            height: 50
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: infoArea2.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 8
            anchors.leftMargin: 8
        }

        Button {
            id: buttonUpdateDB
            y: 303
            text: qsTr("Update DB")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
        }

        TextArea {
            id: textAreaDate
            y: 348
            height: 44
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            placeholderText: qsTr("Text Area")
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}D{i:5}D{i:7}D{i:8}D{i:6}D{i:9}D{i:10}D{i:11}D{i:1}
}
##^##*/
