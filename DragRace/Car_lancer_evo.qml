import QtQuick 2.0


Image{
    fillMode: Image.PreserveAspectFit
    source : "qrc:/picture/vehicles/lancer_evo.png"
    height: 400

    Image{
        id: backwheel
        x:215
        y:228
        height: 85
        width: 85
        source : "qrc:/picture/vehicles/lancer_evo_wheel.png"
        transform: Rotation { origin.x: 42.5; origin.y: 42.5; angle: position_g*100}

    }
    Image{
        id: frontwheel
        x:651
        y:230
        height: 85
        width: 85
        source : "qrc:/picture/vehicles/lancer_evo_wheel.png"
        transform: Rotation { origin.x: 42.5; origin.y: 42.5; angle: position_g*100}

    }

}
