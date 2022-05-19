import QtQuick 2.12
import QtCharts 2.12
import QtGraphicalEffects 1.0

Item
{
    property string chartTitle: chartTitle
    property color chartColor: chartColor

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

        ValueAxis
        {
            id: valueAxisY

            titleFont.pointSize: 20
            titleFont.family: "Verdana"

            gridLineColor: "black"
            titleText: "Высота волны, м"
            min: 0
            max: 2
            labelsFont.pointSize: 15
        }

        ValueAxis
        {
            id: valueAxisX

            titleFont.pointSize: 20
            titleFont.family: "Verdana"

            titleText: "Время, ч"
            min: 0
            max: 50
            labelsFont.pointSize: 15
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

             Component.onCompleted:
             {
                 for (var i = 0; i <= 50; i++)
                 {
                     seriesY.append(i, Math.random() + Math.random());

                 }
             }

             MouseArea
             {
                 anchors.fill: parent

                 onClicked:
                 {
                     valueAxisX.max += 1

                     for (var i = 0; i <= 1; i++)
                 {
                     seriesY.append(i+valueAxisX.max-1, Math.random() + Math.random());

                 }
            }
        }

    }

    function add(height)
    {
        valueAxisX.max += 1;

        if (height >= valueAxisY.max)
        {
            valueAxisY.max = height += 1;
        }

        seriesY.append(valueAxisX.max-1, height);
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
