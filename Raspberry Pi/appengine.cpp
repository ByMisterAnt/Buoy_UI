#include "appengine.h"
#include <QDebug>
#include <iostream>
#include <string>
#include <QString>
#include <QStringList>

appengine::appengine(QObject *parent) : QObject(parent)
{
    //connect(receiver, &serReceiver::com_msg, this, &AppCore::sendToQml);
    timer = new QTimer(this);

    connect(timer, SIGNAL(timeout()), this, SLOT(readData()));

    timer->start(3000);
}

void appengine::readData()
{


    QSerialPort serialPort;

    foreach (const QSerialPortInfo &serial_Info, QSerialPortInfo::availablePorts())
    {
        port_name = serial_Info.portName();
    }

    serialPort.setPortName(port_name);

    serialPort.setBaudRate(QSerialPort::Baud9600);

    if (!serialPort.open(QIODevice::ReadWrite))
    {
        return;
    }

    while (serialPort.waitForReadyRead(10))
    {
        message = serialPort.readLine();
    }

    //message.replace(",", " ");

    //std::string msg = message.toStdString();

    //std::sscanf(msg.c_str(), "%f,%f,%f,%f\n", &humidity, &water_temperature, &air_temperature, &wave_height);
 data = message;
 data.replace(",", " ");


    // -------------------удалить область, если заработает -------

    humidity = 91.0;
    water_temperature = 2.344;
    air_temperature = 22.45;
    wave_height = 4.5;

    //-------------------------------------------------------------
    //data = {static_cast<double>(humidity), static_cast<double>(water_temperature),static_cast<double>(air_temperature),static_cast<double>(wave_height)};
//qDebug() << "dd";//data[1];
//qDebug() << msg.c_str();
//qDebug() << data;
/*qDebug() << humidity;
qDebug() << water_temperature;
qDebug() << air_temperature;
qDebug() << wave_height;*/
data = "27.0 1.0 3.0 44.0";
}

QString appengine::getData()
{
    return data;
}
