import QtQuick 2.0

Image {
    source: "assets/background.jpg"
    
    Image {
        x: 40; y: 80
        width: 100; height: 200
        source: "assets/rocket.png"
    
        NumberAnimation on x {
            to: 800
            duration: 4000
            loops: Animation.Infinite
        }
        RotationAnimation on rotation {
            to: 360
            duration: 4000
            loops: Animation.Infinite
        }    
        NumberAnimation on scale {
            to: 0.0
            duration: 4000
            loops: Animation.Infinite
        }
    }
}
