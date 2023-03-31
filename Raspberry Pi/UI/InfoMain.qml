import QtQuick 2.12
import QtQuick.Controls 1.0
import QtGraphicalEffects 1.0

import "../Elements"

Item
{

    Row
    {
        id: column

        anchors.fill: parent
        padding: 10
        spacing: 10

        CustomChart
        {
            id: heightChart
            width: parent.width * 2 / 3 - 15
            height: parent.height

            chartColor: "red"
        }

        Image {
            id: buoyImage
            width: parent.width / 3 - 15
            height: parent.height
            //source: "qrc:/buoy_icons/buoyimg.png"
            source: "qrc:/buoy_icons/imgbuy.png"
        }

    }

    function add_value(value)
    {
        heightChart.add(value)
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/
