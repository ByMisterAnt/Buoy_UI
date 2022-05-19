import QtQuick 2.12
import QtQuick.Layouts 1.12

import "../Elements"

Item
{

        Row
        {
            anchors.fill: parent

            padding: 10
            spacing: 20

            InfoPanel
            {
                visible: true

                width: parent.width / 3 - 20
                height: parent.height

                infoText: "НИО 301"

                gradientStart: "#1AD090"
                gradientStop: "#5FE7CE"

                filePath: "qrc:/buoy_icons/mai.png"
            }

            InfoPanel
            {
                visible: true

                width: parent.width / 3 - 20
                height: parent.height

                infoText: "Часовой моря"

                gradientStart: "#FF547B"
                gradientStop: "#FF9375"

                filePath: "qrc:/buoy_icons/buoy.png"
            }

            InfoPanel
            {
                id: clock

                visible: true

                width: parent.width / 3 - 20
                height: parent.height

                Timer
                    {
                        interval: 500; running: true; repeat: true
                        onTriggered: clock.infoText = "Время: " + new Date().toTimeString()
                    }

                infoText: "Время кушать"

                gradientStart: "#2ACDFF"
                gradientStop: "#00F2FF"

                imgHeight: 0
                imgWidth: 0
            }


        }
    }


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
