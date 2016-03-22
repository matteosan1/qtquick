import QtQuick 2.3

Image {
      id: root
      source: "images/background.jpg"
      Image {
      	    id: pole
	    anchors.horizontalCenter: parent.horizontalCenter
	    anchors.bottom: parent.bottom
	    source: "images/pole.png"
	    }
      Image {
      	    id: wheel
	    anchors.centerIn: parent
	    anchors.verticalCenterOffset: 250
	    source: "images/pin_wheel.png"
	    Behavior on rotation {
	    	     NumberAnimation {
		     		     duration: 250
				     }
				 }
	    }
      MouseArea {
      		anchors.fill: parent
		onClicked: wheel.rotation += 360.
		}
}
