import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import MyCppObject 1.0

import "./Elements"
import "./UI"

Window
{
    width: 1280
    height: 1024

    visible: true

    // uncomment when build release version on raspberry pi
    visibility: "FullScreen"

    title: "Часовой моря (calibration mode)"

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



    Timer
    {
        interval: 4000; running: true; repeat: true
        onTriggered: updateData();//lolkek.text = cpp_obj.name[1] + "Время: " + new Date().toTimeString()
     }

    function updateData()
    {
        try {

        var dataStr = cpp_obj.dataVector;

        var a = [];

        var buf = "";

        for (var i = 0; i < dataStr.length; i++)
        {
            if(dataStr[i] != " ")
            {
                buf += dataStr[i];
            } else {
                a.push(buf);
                buf = "";
            }
            if (i == dataStr.length - 2)
            {
                a.push(buf);
            }
        }


        footer.humidity =a[0];
        footer.water_temperature = a[1];
        footer.air_temperature = a[2];
        main.add_value(a[3]);
        } catch (error) {
            1+1;//console.log(error);
        }

    }

    CppObject
    {
        id:cpp_obj
    }

}
