import QtQuick 2.12
import QtQuick.Controls 2.12

ToolBarLeftForm {
    Component.onCompleted: {
        infoAreaFreeOmb.labelInfo.text = "Liberi:"
        infoAreaArrive.labelInfo.text = "Arrivi:"
        infoAreaDepart.labelInfo.text = "Partenze:"
        infoAreaBooked.labelInfo.text = "Abbonati:"
        infoAreaDaily.labelInfo.text = "Giornalieri:"
        infoAreaFreeOmb.labelValue.text = Backend.getFreeOmbCount()
        infoAreaArrive.labelValue.text = Backend.getIncomingOmbCount()
        infoAreaDepart.labelValue.text = Backend.getLeavingOmbCount()
        infoAreaBooked.labelValue.text = Backend.getBookingOmbCount()
        infoAreaDaily.labelValue.text = Backend.getDailyOmbCount()

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

    Connections {
        target: Backend

        function onGridUpdateCompleted() {
            infoAreaFreeOmb.labelValue.text = Backend.getFreeOmbCount()
            infoAreaArrive.labelValue.text = Backend.getIncomingOmbCount()
            infoAreaDepart.labelValue.text = Backend.getLeavingOmbCount()
            infoAreaBooked.labelValue.text = Backend.getBookingOmbCount()
            infoAreaDaily.labelValue.text = Backend.getDailyOmbCount()

        }
    }


    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: { dateTimeLabel.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd \n hh:mm:ss").toString()

        }

    }

}
