import QtQuick 2.0

Rectangle {
    id:root
    width: 80
    height:300
    
    ListView {
        anchors.fill:parent
        anchors.margins: 20
        clip:true
        model:100
        delegate: numberDelegate
        spacing: 5
        //orientation: ListView.Horizontal
        highlight: highlightComponent
        focus: true
    }

    Component {
        id: highlightComponent
        /*Rectangle {
            width:ListView.view.width// height:40
            color: "blue"
            Text {
                anchors.centerIn: parent
            }
        }
        */
        Item {
            width: ListView.view.width
            height: ListView.view.currentItem.height
            y: ListView.view.currentItem.y

            Behavior on y {
                SequentialAnimation {
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 1}
                    NumberAnimation { duration: 1}
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 1}
                }
            }

            Rectangle {
                id: highlightRectangle
                color: "blue"
                anchors.fill: parent
            }
        }
    }
    Component {
        id: numberDelegate
        /*
        Rectangle {
            width:40; height:40
            color: "red"
            Text {
                anchors.centerIn: parent
                text: index
            }
        }
        */
        Item {
            width: ListView.view.width
            height: 10
            Text {
                anchors.centerIn: parent
                font.pixelSize: 10
                text: index
            }
        }
    }
}
