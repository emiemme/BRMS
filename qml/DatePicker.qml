import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.1


Rectangle {
    id: backgroundRect
    height: 140
    color: "white"

    signal ok(string startDate, string stopDate)
    signal cancel()
    property alias calendar: calendar



    Calendar {
        id: calendar
        width: parent.width
        height: parent.height - 40
        frameVisible: true
        weekNumbersVisible: false
        focus: true
        property var startDate:  new Date()
        property var stopDate: new Date();



        style: CalendarStyle {
            dayDelegate: Item {
                readonly property color sameMonthDateTextColor: "#444"
                readonly property color selectedDateColor: "#3778d0"
                readonly property color selectedDateTextColor: "white"
                readonly property color differentMonthDateTextColor: "#bbb"
                readonly property color invalidDatecolor: "#dddddd"
                property var dateOnFocus: styleData.date



                Rectangle {
                    anchors.fill: parent
                    border.color: "transparent"
                    color: styleData.date !== undefined && styleData.selected ? selectedDateColor : "transparent"

                }

                Rectangle{
                    id:fl
                    anchors.fill: parent
                    property bool flag: false
                    color: ((dateOnFocus>calendar.startDate) && (dateOnFocus< calendar.stopDate))?"#55555555":
                           (calendar.startDate !==undefined && dateOnFocus.getTime()===calendar.startDate.getTime())?"#3778d0":"transparent"
                }


                MouseArea{
                    anchors.fill: parent
                    propagateComposedEvents: true
                    onPressed: {

                        if(calendar.startDate===undefined){
                            calendar.startDate=styleData.date
                        }
                        else if(calendar.stopDate=== undefined){
                            calendar.stopDate=styleData.date
                        }
                        else{
                            calendar.startDate=styleData.date
                            calendar.stopDate= undefined
                        }

                        if(calendar.stopDate<=calendar.startDate){
                            calendar.startDate=styleData.date
                            calendar.stopDate= undefined
                        }

                        mouse.accepted = false
                    }
                }


                Label {
                    id: dayDelegateText
                    text: styleData.date.getDate()
                    anchors.centerIn: parent
                    color: {
                        var color = invalidDatecolor;
                        if (styleData.valid) {
                            // Date is within the valid range.
                            color = styleData.visibleMonth ? sameMonthDateTextColor : differentMonthDateTextColor;
                            if (styleData.selected) {
                                color = selectedDateTextColor;
                            }
                            else if (dateOnFocus.getTime()===calendar.startDate.getTime()) {
                                color = selectedDateTextColor;
                            }
                        }
                        color;
                    }
                }
            }
        }
    }

        Row {
            layoutDirection: "RightToLeft"
            spacing: 5
            anchors {
                right: parent.right
                bottom: parent.bottom
            }

            height: 40
            width:  parent.width

            Rectangle {
                id: okBtn
                height: parent.height
                width: 60
                color: "#0c3483"
                radius: 5
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
                states: State {
                    name: "pressed"; when: mouseAreaOk.pressed
                    PropertyChanges { target: okBtn; scale: 0.92 }
                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
                }

                Text {
                    id: okBtnText
                    anchors.centerIn: parent
                    font.pixelSize: calendar.fontSizePx * 1.8
                    color: "black"
                    text: "OK"
                }
                MouseArea {
                    id: mouseAreaOk
                    anchors.fill: parent
                    onClicked: {
                        if(calendar.stopDate === undefined ) {
                           calendar.stopDate =  calendar.startDate
                        }

                        backgroundRect.ok(calendar.startDate.toISOString().split('T')[0],calendar.stopDate.toISOString().split('T')[0]);
                        console.log(calendar.startDate.toISOString().split('T')[0])
                    }
                }
            }
            Rectangle {
                id: cancelBtn
                height: parent.height
                width: 60
                color: "#0c3483"
                radius: 5
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
                states: State {
                    name: "pressed"; when: mouseAreaCancel.pressed
                    PropertyChanges { target: cancelBtn; scale: 0.92 }
                }

                transitions: Transition {
                    NumberAnimation { properties: "scale"; duration: 200; easing.type: Easing.InOutQuad }
                }
                Text {
                    id: cancelBtnText
                    anchors.centerIn: parent
                    font.pixelSize: calendar.fontSizePx * 1.8
                    color: palette.buttonText
                    text: "CANCEL"
                }
                MouseArea {
                    id: mouseAreaCancel
                    anchors.fill: parent
                    onClicked: {
                        backgroundRect.cancel();
                    }
                }
            }
        }

}
