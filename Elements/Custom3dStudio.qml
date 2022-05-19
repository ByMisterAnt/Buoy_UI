import QtQuick 2.12
import QtQuick3D 1.12
import QtStudio3D.OpenGL 2.5



Studio3D
{
    id: studio3D

    property url presentation_path: presentation_path

    ViewerSettings
    {

        scaleMode: ViewerSettings.ScaleModeFill
    }

    Presentation
    {
        source: presentation_path
    }
}

