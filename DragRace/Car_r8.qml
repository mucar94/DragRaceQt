import QtQuick 2.0

Image{
    fillMode: Image.PreserveAspectFit
    source : "qrc:/picture/vehicles/r8.png"
        height: 400

    Image{
        id: backwheel
        x:168
        y:212
        height: 119
        width: 119
        source : "qrc:/picture/vehicles/r8_wheel.png"
        transform: Rotation { origin.x: 59.5; origin.y: 59.5; angle: 0}

    }
    Image{
        id: frontwheel
        x:646
        y:212
        height: 119
        width: 119
        source : "qrc:/picture/vehicles/r8_wheel.png"
        transform: Rotation { origin.x: 59.5; origin.y: 59.5; angle: 0}

    }

}
