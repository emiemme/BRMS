import QtQuick 2.12
import QtQuick.Controls 2.12

GeneralButtonForm {

    states: State {
        name: "pressed"; when: mouseAreaButton.pressed
        PropertyChanges { target: backgroundRect; scale: 0.92 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
    }

    function popStack() {
        stackView.pop();
    }
}
