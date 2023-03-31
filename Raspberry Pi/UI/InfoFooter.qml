import QtQuick 2.12
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.12

import "../Elements"

Item
{
    id: footer

    property string humidity : "10.0";
    property string water_temperature :  "25";
    property string air_temperature : "25";

    Row
    {
        anchors.fill: parent

        padding: 10
        spacing: 10

        Rectangle
        {
            id: mainRect
            width: parent.width * 2 / 3 - 15
            height: parent.height

            radius: 15

            color: "white"

            Row
            {
                anchors.fill: parent

                padding: 30
                spacing: 20

                Column
                {
                    id: column1
                    width: parent.width / 3 - 10
                    height: mainRect.height

                    spacing: 10

                    InfoTemp
                    {
                        width: 200
                        height: 200

                        element_color: "#20DD92"

                        img_path: "qrc:/buoy_icons/humidity.png"
                        element_value: footer.humidity //default value "10"
                        type_of_measure: "%"
                    }

                    Text
                    {
                        text: " Влажность\nвоздуха"
                        color: "#20DD92"

                        font.family: "Tahoma"
                        font.pointSize: 20
                        minimumPointSize: 20

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                }

                Column
                {
                    id: column2
                    width: parent.width / 3 - 10
                    height: mainRect.height

                    spacing: 10

                    InfoTemp
                    {
                        width: 200
                        height: 200

                        element_color: "#FE6876"

                        img_path: "qrc:/buoy_icons/wind.png"
                        element_value: footer.water_temperature
                        type_of_measure: "°C"
                    }

                    Text
                    {
                        text: "Температура\nвоздуха"
                        color: "#FE6876"

                        font.family: "Tahoma"
                        font.pointSize: 20
                        minimumPointSize: 20

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                }

                Column
                {
                    id: column3
                    width: parent.width / 3 - 10
                    height: mainRect.height

                    spacing: 10

                    InfoTemp
                    {
                        width: 200
                        height: 200

                        element_color: "#0E82EE"

                        img_path: "qrc:/buoy_icons/sea.png"
                        element_value: footer.air_temperature
                        type_of_measure: "°C"
                    }

                    Text
                    {
                        text: "Температура\nводы"
                        color: "#0E82EE"

                        font.family: "Tahoma"
                        font.pointSize: 20
                        minimumPointSize: 20

                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                }


            }
        }

        Calendar
        {
            id: calendar

            width: parent.width / 3 - 15
            height: parent.height

            layer.enabled: true
            layer.effect: OpacityMask
            {
                maskSource: Item
                {
                    width: calendar.width
                    height: calendar.height

                    Rectangle
                    {
                        radius: 15
                        anchors.fill: parent
                    }
                }
            }
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
