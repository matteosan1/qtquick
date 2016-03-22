import QtQuick 2.0

Image {
    id: root
    width: container.childrenRect.width + 16
    height: container.childrenRect.height + 16
    property alias text: label.text
    property alias sorce: image.source
    signal clicked

    property bool framed: false
    Column {
    	   id: container
	   Rectangle {
    	      anchors.fille: parent
	      color: "white"
	      visible: root.framed
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
