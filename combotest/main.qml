Item {
id: app
width: 200
height: 150

ListModel{
    id: dataModel
    ListElement{ name: "Day" }
    ListElement{ name: "Week" }
    ListElement{ name: "Month" }
    ListElement{ name: "Year" }
}

Button {
    id: comboButton
    width: parent.width
    height: parent.height / 5
    checkable: true

    style: ButtonStyle {
       background: Rectangle {
           color: control.pressed ? "#888" : "#fff"
           smooth: true
           radius: 5
           border.width: 2

           Image {
               source: "pics/corner.png"
               anchors.bottom: parent.bottom
               anchors.right: parent.right
               anchors.bottomMargin: 5
               anchors.rightMargin: 5
           }
       }
       label: Text {
            renderType: Text.NativeRendering
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Courier"
            font.capitalization: Font.SmallCaps
            font.pointSize: 15
            color: "black"
            text: "Day"
        }
    }
    onVisibleChanged: {
        if(!visible)
            checked = false
    }
}

TableView {
    id: tableView
    height: 120
    width: parent.width
    anchors.bottom: parent.bottom
    highlightOnFocus: true
    headerVisible: false
    visible: comboButton.checked ? true : false

    TableViewColumn {
        role: "name"
    }
    model: dataModel

    itemDelegate: Item {
        Rectangle {
            color: styleData.selected  ? "#888" : "#fff"
            height: comboButton.height - 0.5
            border.width: 0.5
            width: parent.width

            Text {
                renderType: Text.NativeRendering
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Courier"
                font.capitalization: Font.SmallCaps
                font.pointSize: 15
                color: "black"
                elide: styleData.elideMode
                text: styleData.value
            }
        }
    }

    rowDelegate: Item {
        height: comboButton.height - 0.5
    }

    onClicked: {
       comboButton.checked = false
       tableView.selection.clear()
    }
}
} 