import QtQuick 2.0

Image {
    id: root
    width: container.childrenRect.width
    height: container.childrenRect.height
    property alias text: label.text
    property alias sorce: image.source
    signal clicked
    
    Column {
        id: container
        Image {
            id: image
        }
        Text {
            id: label
            width: image.width
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            color: "#111111"
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
