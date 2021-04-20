import QtQuick 2.4

ToolbarInfoCellForm {
    states: State {
        name: "pressed"; when: mouseAreaInfoCell.pressed
        PropertyChanges { target: backgroundRect; scale: 0.92 }
    }

    transitions: Transition {
        NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
    }
}
