import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    width: 100
    height: 50
    property alias backgroundRect: backgroundRect
    property alias mouseAreaButton: mouseAreaButton
    property alias labelButton: labelButton

    Rectangle {
        id: backgroundRect
        color: "#0c3483"
        radius: 5
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#0acffe"
            }

            GradientStop {
                position: 1
                color: "#495aff"
            }
        }

        Label {
            id: labelButton
            color: "#ddffffff"
            text: qsTr("Label")
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.bold: true
        }
    }

    MouseArea {
        id: mouseAreaButton
        anchors.fill: parent
    }
}
