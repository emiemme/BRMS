import QtQuick 2.12
import QtQuick.Controls 2.12

CellButtonForm {
    property alias cellButton: cellButton
    property alias cellStatusEmpty: cellButton.isCellEmpty
    property bool isCellEmpty
    id:cellButton

    Component.onCompleted: {
        console.log(isCellEmpty)
    }

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
                    infoCell.visible = true
                    infoCell.displayInfo(labelNumber.text)
                }
            }
        }

    function setNumber(n) {
        labelNumber.text = n
    }
}
