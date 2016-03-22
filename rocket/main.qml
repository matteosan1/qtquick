import QtQuick 2.0

Item {
    id: root
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

    ClickableImageV2 {
        id: rocket1
        x: 40; y:root.height-height
	    width: 100; height: 200   
        source: "assets/rocket.png"
        text: "animation on property"
        NumberAnimation on y {
            to: 40; duration: 4000
        }
    }
    ClickableImageV2 {
        id: rocket2
        x: 152; y:root.height-height
	    width: 100; height: 200   
        source: "assets/rocket.png"
        text: "behavior on property"
        Behavior on y {
            NumberAnimation { duration: 4000 }
        }
        onClicked: y=40
    }
    ClickableImageV2 {
        id: rocket3
        x: 264; y:root.height-height
	    width: 100; height: 200   
        source: "assets/rocket.png"
        onClicked: anim.start()
        text: "standalone animation"
        NumberAnimation {
            id: anim
            target: rocket3
            properties: "y"
            to: 40; duration: 4000
        }
    }
}
