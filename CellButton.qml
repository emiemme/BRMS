import QtQuick 2.12
import QtQuick.Controls 2.12

CellButtonForm {
    property alias cellButton: cellButton
    id:cellButton

    MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                console.log("cell "+ labelNumber.text  +" Clicked")
                homeTicketForm.visible = true
                homeTicketForm.labelUmbrella.text = labelNumber.text
                homeTicketForm.textFieldName.text = cellButton.labelClientName.text
            }
        }



    function setNumber(n) {
        labelNumber.text = n
    }

}


