import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    width: 120
    height: 30
    property alias cellStatusRectColor: separatorRect.color
    property alias labelClientName: labelClientName
    property alias backgroundRect: backgroundRect
    property alias labelNumber: labelNumber

    Rectangle {
        id: backgroundRect
        width: 120
        color: "#fccb6d"
        anchors.fill: parent
        z: 0


        Image {
            id: image
            anchors.left: parent.left
            anchors.right: separatorRect.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "Icons/sun-umbrella.png"
            sourceSize.width: 1000
            anchors.rightMargin: 5
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit

            Label {
                id: labelNumber
                text: qsTr("100")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                rotation: 0
                anchors.topMargin: 19
                anchors.rightMargin: 0
                anchors.leftMargin: 16
                anchors.bottomMargin: 0
            }
        }

        Rectangle {
            id: separatorRect
            x: 38
            width: 8
            height: 20
            color: "#0126d8"
            anchors.right: labelClientName.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 4
            anchors.bottomMargin: 2
            anchors.topMargin: 2
        }

        Label {
            id: labelClientName
            x: 47
            y: 0
            width: 73
            height: 30
            text: qsTr("")
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            anchors.rightMargin: 0
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
