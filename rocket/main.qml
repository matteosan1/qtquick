import QtQuick 2.0

Item {
    width: bg.width
    height: bg.height

    Image {
        id: bg
        source: "assets/background.jpg"
    }

    MouseArea {
        id: backgroundClicker
        anchors.fill: parent
    
        onClicked: {
            rocket1.x = 20
            rocket2.rotation = 0
            rocket3.rotation = 0
            rocket3.scale = 1
        }
    }

    ClickableImage {
        id: rocket1
        x: 20; y:100
        source: "assets/rocket.png"
        onClicked: {
            x += 5
        }
    }
    ClickableImage {
        id: rocket2
        x: 340; y:100
        source: "assets/rocket.png"
        onClicked: {
            rotation += 5
        }
    }
    ClickableImage {
        id: rocket3
        x: 640; y:100
        source: "assets/rocket.png"
        onClicked: {
            rotation += 5
            scale -= 0.05
        }
    }
}
