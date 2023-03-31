import QtQuick 2.12
import QtCharts 2.3
import QtGraphicalEffects 1.0

Item
{
    property string chartTitle: chartTitle
    property color chartColor: chartColor
    property real timeh: 0
    property real timeh_new: 0
    property real heightValueRect: 0

    Rectangle
    {
        width: parent.width
        height: parent.height

        radius: 15
    /*Glow {
        id:glow
        anchors.fill: chartView
        radius: 18
        samples: 37
        color: chartColor
        source: chartView
        transparentBorder: true;
    }

    RadialBlur {
        anchors.fill: chartView
        source: chartView
        angle: 360
        samples: 20
    }

    ZoomBlur {
        anchors.fill: chartView
        source: chartView
        length: 2
        samples: 20
    }*/

    ChartView
    {
        id:chartView

        width: parent.width
        height: parent.height
        //backgroundColor: "transparent"
        legend.visible: false
        antialiasing: true
        animationDuration : 1000
        animationOptions: ChartView.AllAnimations;

        layer.enabled: true
        layer.effect: OpacityMask
        {
            maskSource: Item
            {
                width: chartView.width
                height: chartView.height

                Rectangle
                {
                    radius: 15
                    anchors.fill: parent
                }
            }
        }

        Rectangle{
            id:heightRect
            width: parent.width / 11
            height: parent.height / 11
            x: parent.width * 0.859
            y: parent.height / 11.2
            border.color: "dodgerblue"
            border.width: 4
            Text {
                id: texthR
                text: heightValueRect.toString()+qsTr("M")
                font.pixelSize: parent.height / 2
                font.family: "Verdana"
                anchors.centerIn: parent
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        ValueAxis
        {
            id: valueAxisY

            titleFont.pointSize: 20
            titleFont.family: "Verdana"

            gridLineColor: "black"
            titleText: "Высота волны, м"
            min: 0
            max: 1
            labelsFont.pointSize: 15
        }

        ValueAxis
        {
            id: valueAxisX

            titleFont.pointSize: 20
            titleFont.family: "Verdana"

            titleText: "Время, ч"
            min: 0
            max: 24
            labelsFont.pointSize: 15
            labelFormat: "%i"
            gridLineColor: "black"
        }

        SplineSeries
        {
            id: seriesY

            color: "red"
            axisX: valueAxisX
            axisY: valueAxisY
            width: 4
        }
    }

             /*Component.onCompleted:
             {
                 for (var i = 0; i <= 50; i++)
                 {
                     seriesY.append(i, Math.random() + Math.random());

                 }
             }*/

             MouseArea
             {
                 anchors.fill: parent

                 onClicked:
                 {
                     //valueAxisX.max += 1

                     for (var i = 0; i <= 1; i++)
                 {
                     seriesY.append(i+valueAxisX.max-1, Math.random() + Math.random());

                 }
            }
        }

    }

    function add(height)
    {
        heightValueRect = height;

        timeh_new = new Date().getHours() + new Date().getMinutes() / 60;

        if(timeh - timeh_new > 18)
        {
            seriesY.clear();
        }

        if (height >= valueAxisY.max)
        {
            valueAxisY.max = height * 1.3;
        }

        seriesY.append(timeh_new, height);

        timeh = timeh_new

        /*valueAxisX.max += 1;

        if (height >= valueAxisY.max)
        {
            valueAxisY.max = height * 1.3;
        }

        seriesY.append(valueAxisX.max-1, height);*/
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
