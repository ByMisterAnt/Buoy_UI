import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "./Elements"
import "./UI"

Window
{
    width: 1280
    height: 1024

    visible: true

    // uncomment when build release version on raspberry pi
    //visibility: "FullScreen"

    title: "Часовой моря"

    color: "#C4C4C4"

    Column
    {
        anchors.fill: parent

        spacing: 10

        InfoHeader
        {
            id: header

            width: parent.width
            height: 90
        }

        InfoMain
        {
            id: main

            width: parent.width
            height: parent.height / 2
        }

        InfoFooter
        {
            id: footer

            width: parent.width
            height: parent.height / 3
        }

    }


    Connections
    {

        target: app

        function onSendToQml(count)
        {

            var a = count;
            footer.humidity = a[0];
            footer.water_temperature = a[1];
            footer.air_temperature = a[2];
            main.add_value(a[3]);


        }
    }

}
