import QtQuick 2.12
import QtQuick.Controls 2.12
//import QtQuick.Controls 1.4 as Old

ToolBarLeftForm {

    //    Old.Calendar {
    //         anchors.centerIn: parent
    //         id: calendar
    //     }

    Component.onCompleted: {
        infoAreaFreeOmb.labelInfo.text = "Ombrelloni liberi:"
        infoAreaArrive.labelInfo.text = "Arrivi:"
        infoAreaDepart.labelInfo.text = "Partenze:"

    }

    toolButtonMenu.text: stackView.depth > 1 ? "\u25C0" : "\u2630"
    toolButtonMenu.onClicked: {
        if (stackView.depth > 1) {
            stackView.pop()
        } else {
            drawer.open()
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Database Settings")
                width: parent.width
                onClicked: {
                    stackView.push("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("GUI Settings")
                width: parent.width
                onClicked: {
                    stackView.push("Page2Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Exit")
                width: parent.width
                onClicked: {
                    Qt.quit()
                }
            }
       }
    }

    buttonUpdateDB.onClicked: {
        console.log("Updating DB with a custom date: " + textAreaDate.text)
        Backend.updateStatusGrid(155, textAreaDate.text)
    }

    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: dateTimeLabel.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd \n hh:mm:ss").toString()
    }

}
