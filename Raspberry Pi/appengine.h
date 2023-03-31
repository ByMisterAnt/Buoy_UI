#include <QObject>

#include <QSerialPortInfo>
#include <QSerialPort>

#include <QString>
#include <QVector>
#include <QTimer>

#include <QObject>
#include <QStringList>

class appengine : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString dataVector READ getData)

public:

    explicit appengine(QObject *parent = 0);


public slots:

    void readData();

    QString getData();


private:

    QString port_name;

    QString message;
    QString data = "27.0 1.0 3.0 44.0";;

    QTimer *timer;

    //QVector<double> data = {1.0, 2.0, 3.0, 4.0};

    float humidity, water_temperature, air_temperature, wave_height;

};
