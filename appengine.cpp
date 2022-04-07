#include "appengine.h"

#include <iostream>
#include <string>

#include<QDebug>

appEngine::appEngine(QObject *parent) : QObject(parent)
{
    //connect(receiver, &serReceiver::com_msg, this, &AppCore::sendToQml);
    timer = new QTimer(this);

    connect(timer, SIGNAL(timeout()), this, SLOT(readData()));

    timer->start(3000);
}

void appEngine::readData()
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
qDebug() << message;
    message.replace(",", " ");

    std::string msg = message.toStdString();

    std::sscanf(msg.c_str(), "%f,%f,%f,%f\n", &humidity, &water_temperature, &air_temperature, &wave_height);

    emit sendToQml({static_cast<double>(humidity), static_cast<double>(water_temperature),static_cast<double>(air_temperature),static_cast<double>(wave_height)});
    //emit sendToQml({1,2,3,2});


}

void appEngine::receiveFromQml()
{

}
