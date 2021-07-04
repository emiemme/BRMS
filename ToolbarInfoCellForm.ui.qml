import QtQuick 2.15

import QtQuick.Controls 2.15

Item {
    width: 200
    height: 60
    property alias backgroundRect: backgroundRect
    property alias mouseAreaInfoCell: mouseAreaInfoCell
    property alias labelValue: labelValue
    property alias labelInfo: labelInfo

    Rectangle {
        id: backgroundRect
        color: "#0089ea"
        radius: 5
        border.width: 0
        anchors.fill: parent

        Label {
            id: labelInfo
            height: 32
            text: qsTr("Label")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            font.bold: true
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.topMargin: 0
        }

        Label {
            id: labelValue
            text: qsTr("Label")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: labelInfo.bottom
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            font.bold: true
            anchors.leftMargin: 5
            anchors.bottomMargin: 8
            anchors.topMargin: 0
            anchors.rightMargin: 5
        }
    }

    MouseArea {
        id: mouseAreaInfoCell
        anchors.fill: parent
    }
}
