import QtQuick 2.4

MainViewForm {
    id: mainViewSrc
    signal viewName(bool view)
    signal addSearchSolutionBooking(var name, var dateArrive, var dateDeparture)

    toolBarLeft.onAddSearchSolutionBooking: {
        console.log("bbbbb"+name)
        stackView.get(0).addSearchSolutionBooking(name,dateArrive,dateDeparture)
    }

}


