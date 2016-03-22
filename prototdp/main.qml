import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true

    Rectangle {
        id: nome_giocatore
        width: 100; height: 100
        anchors.left: parent
        color: "lightblue";
        Text {
            anchors.fill: parent
            text: "MATTEO SANI"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }


    ListModel {
        id: contrade

        ListElement {name: "Aquila"; cost: 2.45 }
        ListElement {name: "Bruco"; cost: 2.45 }
        ListElement {name: "Chiocciola"; cost: 2.45 }
        ListElement {name: "Civetta"; cost: 2.45 }
        ListElement {name: "Drago"; cost: 2.45 }
        ListElement {name: "Giraffa"; cost: 2.45 }
        ListElement {name: "Istrice"; cost: 2.45 }
        ListElement {name: "Leocorno"; cost: 2.45 }
        ListElement {name: "Lupa"; cost: 2.45 }
        ListElement {name: "Nicchio"; cost: 2.45 }
        ListElement {name: "Oca"; cost: 2.45 }
        ListElement {name: "Onda"; cost: 2.45 }
        ListElement {name: "Pantera"; cost: 2.45 }
        ListElement {name: "Selva"; cost: 2.45 }
        ListElement {name: "Tartuca"; cost: 2.45 }
        ListElement {name: "Torre"; cost: 2.45 }
        ListElement {name: "Montone"; cost: 2.45 }
    }

    Component {
        id: contradaDelegate
        Text {
            text: name;
            font.pixelSize: 24
        }
    }

    ListView {
        anchors.fill: parent
        clip: true
        model: contrade
        delegate: contradaDelegate
        /*
        header: bannercomponent
        footer: Rectangle {
            width: parent.width; height: 30;
            gradient: clubcolors
        }
        highlight: Rectangle {
            width: parent.width
            color: "lightgray"
        }*/
    }
}

