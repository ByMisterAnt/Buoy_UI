import QtQuick 2.12
import QtQuick.Layouts 1.12

Item
{
    property color gradientStart: "#1AD090"
    property color gradientStop: "#5FE7CE"

    property string filePath: filePath
    property string infoText: infoText

    property double imgWidth: 70
    property double imgHeight: 70

    Rectangle
    {
        id: rectangle
        anchors.fill: parent

        radius: 15
        gradient: Gradient
        {
            orientation: Gradient.Horizontal
            GradientStop
            {
                position: 0
                color: gradientStart
            }

            GradientStop
            {
                position: 1
                color: gradientStop
            }

        }

        Row
        {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 10
            padding: 10

            Image
            {
                width: imgWidth
                height: imgHeight

                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter

                anchors.verticalCenter: parent.verticalCenter

                source: filePath
            }

            Text
            {
                text: infoText
                color: "white"

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Tahoma"

                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 30
                minimumPointSize: 20
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
