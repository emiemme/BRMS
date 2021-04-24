import QtQuick 2.12
import QtQuick.Controls 2.12

CellButtonForm {
    property alias cellButton: cellButton
    property alias cellStatus: cellButton.isCellEmpty
    property bool isCellEmpty
    id:cellButton

    MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if (isCellEmpty === true) {
                    console.log("cell "+ labelNumber.text  +" Clicked but Empty")
                    homeTicketForm.visible = true
                    homeTicketForm.labelUmbrella.text = labelNumber.text
                    homeTicketForm.textFieldName.text = cellButton.labelClientName.text
                } else {
                    console.log("cell "+ labelNumber.text  +" Clicked but not Empty")

                }
            }
        }

    function setNumber(n) {
        labelNumber.text = n
    }
}
