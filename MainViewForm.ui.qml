import QtQuick 2.12
import QtQuick.Controls 2.12
import Qt.labs.qmlmodels 1.0

Page {
    id: mainView
    width: 1366
    height: 768
    property alias mainView: mainView
    property alias stackView: stackView

    ToolBarLeft {
        id: toolBarLeft
        x: 1240
        width: 126
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0
    }
    StackView {
        id: stackView
        width: 1240
        visible: true
        anchors.left: parent.left
        anchors.right: toolBarLeft.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        initialItem: "Home.qml"
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:1}D{i:2}
}
##^##*/
