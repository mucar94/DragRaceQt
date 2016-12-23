import QtQuick 2.0

Image{
    fillMode: Image.PreserveAspectFit
    source : "qrc:/picture/vehicles/mx5.png"
    height: 400

    Image{
        id: backwheel
        x:213
        y:219
        height: 108
        width: 108
        source : "qrc:/picture/vehicles/mx5_wheel.png"
        transform: Rotation { origin.x: 54; origin.y: 54; angle: demopage.position_g*100}

    }
    Image{
        id: frontwheel
        x:628
        y:219
        height: 108
        width: 108
        source : "qrc:/picture/vehicles/mx5_wheel.png"
        transform: Rotation { origin.x: 54; origin.y: 54; angle: demopage.position_g*100}

    }

}
