import QtQuick 2.12
import QtQuick.Layouts 1.12

Item
{
    property color element_color: element_color

    property string img_path: img_path

    property string element_value: element_value
    property string type_of_measure: type_of_measure

    property double imgWidth: 80
    property double imgHeight: 80

    Rectangle
    {
        id: best
        width: parent.width
        height: parent.width

        radius: parent.width / 2

        color: "#00c4c4c4"
        border.color: element_color
        border.width: 5

        Column
        {
            id: column
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter


            padding: 10
            spacing: 10

            Image
            {
                width: imgWidth
                height: imgHeight

                source: img_path
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text
            {
                text: element_value + " " + type_of_measure
                color: element_color

                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Tahoma"

                font.pointSize: 20
                minimumPointSize: 20
            }
        }
    }


}
