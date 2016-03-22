import QtQuick 2.1

Item {
    width: 500
    height: 300

    ListView {
        anchors { fill: parent; margins: 20 }
        model: sqlModel
        delegate: Text {
            text: author + ' - ' + title
        }
    }
}
