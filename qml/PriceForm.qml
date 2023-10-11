import QtQuick 2.12
import QtQuick.Controls 2.12

PriceFormForm {

    Component.onCompleted: {
       updatePrices()
    }

    closeButton.mouseAreaButton.onClicked: {
        stackView.pop()
    }

    confirmButton.mouseAreaButton.onClicked: {
        savePrices()
        stackView.pop()
    }

    function updatePrices() {
        if (Backend.getNewPrices() ) {
            console.log("Get new Price OK");
            for(var rowIndex = 1; rowIndex<4; rowIndex++) {
                var junePrice      = Backend.getJunePrice(rowIndex)
                var julyPrice      = Backend.getJulyPrice(rowIndex)
                var augustPrice    = Backend.getAugustPrice(rowIndex)
                var septemberPrice = Backend.getSeptemberPrice(rowIndex)

                // JUNE
                if(rowIndex == 1 && junePrice.length > 0) {
                    textField_Giugno_Prima_Giorn.text = junePrice[0]
                    textField_Giugno_Prima_Sett.text = junePrice[1]
                    textField_Giugno_Prima_Quind.text = junePrice[2]
                    textField_Giugno_Prima_Mens.text =  junePrice[3]

                } else if (rowIndex == 2 && junePrice.length > 0) {
                    textField_Giugno_Seconda_Giorn.text = junePrice[0]
                    textField_Giugno_Seconda_Sett.text = junePrice[1]
                    textField_Giugno_Seconda_Quind.text = junePrice[2]
                    textField_Giugno_Seconda_Mens.text =  junePrice[3]

                } else if (rowIndex == 3 && junePrice.length > 0) {
                    textField_Giugno_Altre_Giorn.text = junePrice[0]
                    textField_Giugno_Altre_Sett.text = junePrice[1]
                    textField_Giugno_Altre_Quind.text = junePrice[2]
                    textField_Giugno_Altre_Mens.text =  junePrice[3]
                }

                // JULY
                if(rowIndex == 1 && julyPrice.length > 0) {
                    textField_Luglio_Prima_Giorn.text = julyPrice[0]
                    textField_Luglio_Prima_Sett.text = julyPrice[1]
                    textField_Luglio_Prima_Quind.text = julyPrice[2]
                    textField_Luglio_Prima_Mens.text =  julyPrice[3]

                } else if (rowIndex == 2 && julyPrice.length > 0) {
                    textField_Luglio_Seconda_Giorn.text = julyPrice[0]
                    textField_Luglio_Seconda_Sett.text =  julyPrice[1]
                    textField_Luglio_Seconda_Quind.text = julyPrice[2]
                    textField_Luglio_Seconda_Mens.text =  julyPrice[3]

                } else if (rowIndex == 3 && julyPrice.length > 0) {
                    textField_Luglio_Altre_Giorn.text = julyPrice[0]
                    textField_Luglio_Altre_Sett.text =  julyPrice[1]
                    textField_Luglio_Altre_Quind.text = julyPrice[2]
                    textField_Luglio_Altre_Mens.text =  julyPrice[3]
                }

                // AUGUST
                if(rowIndex == 1 && augustPrice.length > 0) {
                    textField_Agosto_Prima_Giorn.text = augustPrice[0]
                    textField_Agosto_Prima_Sett.text =  augustPrice[1]
                    textField_Agosto_Prima_Quind.text = augustPrice[2]
                    textField_Agosto_Prima_Mens.text =  augustPrice[3]

                } else if (rowIndex == 2 && augustPrice.length > 0) {
                    textField_Agosto_Seconda_Giorn.text = augustPrice[0]
                    textField_Agosto_Seconda_Sett.text =  augustPrice[1]
                    textField_Agosto_Seconda_Quind.text = augustPrice[2]
                    textField_Agosto_Seconda_Mens.text =  augustPrice[3]

                } else if (rowIndex == 3 && augustPrice.length > 0) {
                    textField_Agosto_Altre_Giorn.text = augustPrice[0]
                    textField_Agosto_Altre_Sett.text =  augustPrice[1]
                    textField_Agosto_Altre_Quind.text = augustPrice[2]
                    textField_Agosto_Altre_Mens.text =  augustPrice[3]
                }

                // SEPTEMBER
                if(rowIndex == 1 && septemberPrice.length > 0) {
                    textField_Settembre_Prima_Giorn.text = septemberPrice[0]
                    textField_Settembre_Prima_Sett.text =  septemberPrice[1]
                    textField_Settembre_Prima_Quind.text = septemberPrice[2]
                    textField_Settembre_Prima_Mens.text =  septemberPrice[3]

                } else if (rowIndex == 2 && septemberPrice.length > 0) {
                    textField_Settembre_Seconda_Giorn.text = septemberPrice[0]
                    textField_Settembre_Seconda_Sett.text =  septemberPrice[1]
                    textField_Settembre_Seconda_Quind.text = septemberPrice[2]
                    textField_Settembre_Seconda_Mens.text =  septemberPrice[3]

                } else if (rowIndex == 3 && septemberPrice.length > 0) {
                    textField_Settembre_Altre_Giorn.text = septemberPrice[0]
                    textField_Settembre_Altre_Sett.text =  septemberPrice[1]
                    textField_Settembre_Altre_Quind.text = septemberPrice[2]
                    textField_Settembre_Altre_Mens.text =  septemberPrice[3]
                }

            }
        }
    }


    function savePrices(){
        for(var rowIndex = 1; rowIndex<4; rowIndex++) {
            let junePrice      = []  //= Backend.getJunePrice(rowIndex)
            var julyPrice      = []  //= Backend.getJulyPrice(rowIndex)
            var augustPrice    = []  //= Backend.getAugustPrice(rowIndex)
            var septemberPrice = []  //= Backend.getSeptemberPrice(rowIndex)

            // JUNE
            if(rowIndex == 1) {
                junePrice.push(textField_Giugno_Prima_Giorn.text)
                junePrice.push(textField_Giugno_Prima_Sett.text )
                junePrice.push(textField_Giugno_Prima_Quind.text)
                junePrice.push(textField_Giugno_Prima_Mens.text )

            } else if (rowIndex == 2) {
                junePrice.push(textField_Giugno_Seconda_Giorn.text)
                junePrice.push(textField_Giugno_Seconda_Sett.text )
                junePrice.push(textField_Giugno_Seconda_Quind.text)
                junePrice.push(textField_Giugno_Seconda_Mens.text )

            } else if (rowIndex == 3) {
                junePrice.push(textField_Giugno_Altre_Giorn.text)
                junePrice.push(textField_Giugno_Altre_Sett.text )
                junePrice.push(textField_Giugno_Altre_Quind.text)
                junePrice.push(textField_Giugno_Altre_Mens.text )
            }

            // JULY
            if(rowIndex == 1) {
                julyPrice.push(textField_Luglio_Prima_Giorn.text)
                julyPrice.push(textField_Luglio_Prima_Sett.text )
                julyPrice.push(textField_Luglio_Prima_Quind.text)
                julyPrice.push(textField_Luglio_Prima_Mens.text )

            } else if (rowIndex == 2) {
                julyPrice.push(textField_Luglio_Seconda_Giorn.text)
                julyPrice.push(textField_Luglio_Seconda_Sett.text )
                julyPrice.push(textField_Luglio_Seconda_Quind.text)
                julyPrice.push(textField_Luglio_Seconda_Mens.text )

            } else if (rowIndex == 3) {
                julyPrice.push(textField_Luglio_Altre_Giorn.text)
                julyPrice.push(textField_Luglio_Altre_Sett.text )
                julyPrice.push(textField_Luglio_Altre_Quind.text)
                julyPrice.push(textField_Luglio_Altre_Mens.text )
            }

            // AUGUST
            if(rowIndex == 1) {
                augustPrice.push(textField_Agosto_Prima_Giorn.text)
                augustPrice.push(textField_Agosto_Prima_Sett.text )
                augustPrice.push(textField_Agosto_Prima_Quind.text)
                augustPrice.push(textField_Agosto_Prima_Mens.text )

            } else if (rowIndex == 2) {
                augustPrice.push(textField_Agosto_Seconda_Giorn.text)
                augustPrice.push(textField_Agosto_Seconda_Sett.text )
                augustPrice.push(textField_Agosto_Seconda_Quind.text)
                augustPrice.push(textField_Agosto_Seconda_Mens.text )

            } else if (rowIndex == 3) {
                augustPrice.push(textField_Agosto_Altre_Giorn.text)
                augustPrice.push(textField_Agosto_Altre_Sett.text )
                augustPrice.push(textField_Agosto_Altre_Quind.text)
                augustPrice.push(textField_Agosto_Altre_Mens.text )
            }

            // SEPTEMBER
            if(rowIndex == 1) {
                septemberPrice.push(textField_Settembre_Prima_Giorn.text)
                septemberPrice.push(textField_Settembre_Prima_Sett.text )
                septemberPrice.push(textField_Settembre_Prima_Quind.text)
                septemberPrice.push(textField_Settembre_Prima_Mens.text )

            } else if (rowIndex == 2) {
                septemberPrice.push(textField_Settembre_Seconda_Giorn.text)
                septemberPrice.push(textField_Settembre_Seconda_Sett.text )
                septemberPrice.push(textField_Settembre_Seconda_Quind.text)
                septemberPrice.push(textField_Settembre_Seconda_Mens.text )

            } else if (rowIndex == 3) {
                septemberPrice.push(textField_Settembre_Altre_Giorn.text)
                septemberPrice.push(textField_Settembre_Altre_Sett.text )
                septemberPrice.push(textField_Settembre_Altre_Quind.text)
                septemberPrice.push(textField_Settembre_Altre_Mens.text )
            }

            Backend.setJunePrice(junePrice,rowIndex);
            Backend.setJulyPrice(julyPrice,rowIndex);
            Backend.setAugustPrice(augustPrice,rowIndex);
            Backend.setSeptemberPrice(septemberPrice,rowIndex);
        }

        Backend.setNewPrices()
    }
}



