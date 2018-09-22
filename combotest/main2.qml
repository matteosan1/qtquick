ComboBox {
    currentIndex: 2
    activeFocusOnPress: true
    style: ComboBoxStyle {
        id: comboBox
        background: Rectangle {
            id: rectCategory
            radius: 5
            border.width: 2
            color: "#fff"

            Image {
                source: "pics/corner.png"
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.bottomMargin: 5
                anchors.rightMargin: 5
            }
        }
        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
            font.family: "Courier"
            font.capitalization: Font.SmallCaps
            color: "black"
            text: control.currentText
        }
    }

    model: ListModel {
        id: cbItems
        ListElement { text: "Banana" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
    }
    width: 200
}