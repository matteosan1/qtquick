import QtQuick 2.0

Rectangle {
    id: root
    width: 600; height: 340

    property variant easings: [
    "Linear", "InQuad", "OutQuad", "InOutQuad",
    "InCubic", "InSine", "InCirc", "InElastic",
    "InBack", "InBounce"]

    Grid {
        id: container
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 16
        height: 200
        columns: 5
        spacing: 16
        
        Repeater {
            model: easings
            ClickableImageV2 {
                framed: true
                text: modelData
                //source: "curves/"+modelData+".png"
                source: "curves/rocket.png"
                onClicked: {
                    anim.easing.type = modelData
                    anim.restart()
                }
            }
        }
    }
    
    Rectangle {
        id: square
        x: 40; y: 260
        width:20; height: 20
        color: "green"
    }

    NumberAnimation {
        id: anim
        target: square
        from: 40; to: root.width-40-square.width
        properties: "x"
        duration: 2000
    }
}
