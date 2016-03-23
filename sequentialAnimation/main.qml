import QtQuick 2.0

Rectangle {
    id:root
    width: 600
    height: 400
    property int duration: 3000
    
    property Item ufo: ufo
    Image {
        anchors.fill:parent
        source: "assets/background.jpg"
    }
    
    ClickableImageV2 {
        id: ufo
        x: 20; y: root.height-height
        width: 100; height: 200
        text: "rocket"
        source: "assets/rocket.png"
        onClicked: anim.restart()
    }

    SequentialAnimation {
        id: anim
        NumberAnimation {
            target: ufo
            properties: "y"
            to: 20
            duration: root.duration*0.6
        }
        NumberAnimation {
            target: ufo
            properties: "x"
            to: 4000
            duration: root.duration*0.4
        }
    }
}
