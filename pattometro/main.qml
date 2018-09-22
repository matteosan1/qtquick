import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Extras 1.4

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Pattometro")

    Image {
        anchors.fill: parent
        source: "../images/notte1.jpeg"
    }

    function formatText(count, modelData) {
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    function setDay(modelData) {
        var array = [];
        for (var i = 1; i <= days[monthTumbler.currentIndex]; ++i) {
            array.push(i);
        }
        modelData = array;
        //dayTumbler.model = array;
        if (dayTumbler.currentIndex > days[monthTumbler.currentIndex]-1) {
            dayTumbler.currentIndex = 0
        } else {
            return dayTumbler.currentIndex + 1
        }
    }

    //property Component tumbler: ControlView {
    Rectangle {
        anchors.centerIn: parent
            id: tumblerView
            //darkBackground: false

            Tumbler {
                id: tumbler
                anchors.centerIn: parent

                // TODO: Use FontMetrics with 5.4
                Label {
                    id: characterMetrics
                    font.bold: true
                    //font.pixelSize: textSingleton.font.pixelSize * 1.25
                    //font.family: openSans.name
                    visible: false
                    text: "M"
                }

                readonly property real delegateTextMargins: characterMetrics.width * 1.5
                readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

                TumblerColumn {
                    id: tumblerDayColumn

                    function updateModel() {
                        var previousIndex = tumblerDayColumn.currentIndex;
                        var newDays = tumbler.days[monthColumn.currentIndex];

                        if (!model) {
                            var array = [];
                            for (var i = 0; i < newDays; ++i) {
                                array.push(i + 1);
                            }
                            model = array;
                        } else {
                            if (currentIndex > newDays)
                                tumblerDayColumn.currentIndex = 0
                            // If we've already got days in the model, just add or remove
                            // the minimum amount necessary to make spinning the month column fast.
                            var difference = model.length - newDays;
                            if (model.length > newDays) {
                                model.splice(model.length - 1, difference);
                            } else {
                                var lastDay = model[model.length - 1];
                                for (i = lastDay; i < lastDay + difference; ++i) {
                                    model.push(i + 1);
                                }
                            }
                        }

                        tumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
                    }
                }
                TumblerColumn {
                    id: monthColumn
                    width: characterMetrics.width * 3 + tumbler.delegateTextMargins
                    model: ["Gen", "Feb", "Mar", "Apr", "Mag", "Giu", "Lug", "Ago", "Set", "Ott", "Nov", "Dic"]
                    onCurrentIndexChanged: tumblerDayColumn.updateModel()
                }
//                TumblerColumn {
//                    width: characterMetrics.width * 4 + tumbler.delegateTextMargins
//                    model: ListModel {
//                        Component.onCompleted: {
//                            for (var i = 2000; i < 2100; ++i) {
//                                append({value: i.toString()});
//                            }
//                        }
//                    }
//                }
            }
        }




//    Rectangle {
//        id: theTumbler
//        //anchors.horizontalCenter: parent
//        width: frame.implicitWidth + 10
//        height: frame.implicitHeight + 10

//        FontMetrics {
//            id: fontMetrics
//        }

//        Component {
//            id: delegateComponent

//            Label {
//                text: setDay(modelData) //modelData//formatText(Tumbler.tumbler.count, modelData)
//                opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                font.pixelSize: fontMetrics.font.pixelSize * 1.25
//            }
//        }
//        Component {
//            id: delegateComponent3

//            Label {
//                text: modelData //etDay(dayTumbler.modelData)//formatText(Tumbler.tumbler.count, modelData)
//                opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                font.pixelSize: fontMetrics.font.pixelSize * 1.25
//            }
//        }

//        Frame {
//            id: frame_date
//            padding: 0
//            anchors.centerIn: parent

//            Row {
//                id: row_date

//                Tumbler {
//                    id: dayTumbler
//                    height: 80
//                    visibleItemCount: 1
//                    currentIndex: 10
//                    model: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
//                    delegate: delegateComponent
//                }

//                Tumbler {
//                    id: monthTumbler
//                    height: 80
//                    visibleItemCount: 3
//                    model: ["Gen", "Feb", "Mar", "Apr", "Mag", "Giu", "Lug", "Ago", "Set", "Ott", "Nov", "Dic"]
//                    delegate: delegateComponent3
//                }

//                //Tumbler {
//                //    id: amPmTumbler
//                //    model: ["AM", "PM"]
//                //    delegate: delegateComponent
//                //}
//            }
//        }
//    }

//    Rectangle {
//        id: theTumbler2
//        //anchors.horizontalCenter: parent
//        width: frame.implicitWidth + 10
//        height: frame.implicitHeight + 10
//        anchors.top: theTumbler.bottom

//        FontMetrics {
//            id: fontMetrics2
//        }

//        Component {
//            id: delegateComponent2

//            Label {
//                text: formatText(Tumbler.tumbler.count, modelData)
//                opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                font.pixelSize: fontMetrics2.font.pixelSize * 1.25
//            }
//        }

//        Frame {
//            id: frame
//            padding: 0
//            anchors.centerIn: parent

//            Row {
//                id: row

//                Tumbler {
//                    id: hoursTumbler
//                    height: 80
//                    visibleItemCount: 3
//                    model: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
//                    delegate: delegateComponent2
//                }

//                Tumbler {
//                    id: minutesTumbler
//                    height: 80
//                    visibleItemCount: 3
//                    model: [0, 30]
//                    delegate: delegateComponent2
//                }

//                //Tumbler {
//                //    id: amPmTumbler
//                //    model: ["AM", "PM"]
//                //    delegate: delegateComponent
//                //}
//            }
//        }
//    }

//    Rectangle {
//        id: theButton
//        height: 100
//        width:100
//        color: "red"
//        //anchors.top: theTumbler2.bottom

//        //text: "ORA PATTA"
//        MouseArea {
//            anchors.fill: theButton
//            onClicked: {
//                var oraPatta = hoursTumbler.currentIndex + ":" + minutesTumbler.currentIndex + ":" + amPmTumbler.currentIndex
//                patimer.goTimer(oraPatta)
//            }
//        }
//    }

//    Text {
//        id: countDown
//        anchors.top: theButton.bottom
//        text: patimer.timeTo
//    }
//    Column {
//            anchors.fill: parent
//            spacing: (height - happyButton.height - sadButton.height - title.height) / 3

//            Text {
//                id: title
//                color: "black"
//                font.pixelSize: parent.width / 20
//                text: "How are you feeling?"
//                width: parent.width
//                horizontalAlignment: Text.AlignHCenter
//            }

//            Image {
//                id: happyButton
//                height: parent.height / 5
//                fillMode: Image.PreserveAspectFit
//                source: "../images/happy.png"
//                anchors.horizontalCenter: parent.horizontalCenter
//                smooth: true

//                Behavior on scale {
//                    PropertyAnimation {
//                        duration: 100
//                    }
//                }

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: notificationClient.notification = "User is happy!"
//                    onPressed: happyButton.scale = 0.9
//                    onReleased: happyButton.scale = 1.0
//                }
//            }

//            Image {
//                id: sadButton
//                height: parent.height / 5
//                fillMode: Image.PreserveAspectFit
//                source: "../images/sad.png"
//                anchors.horizontalCenter: parent.horizontalCenter
//                smooth: true

//                Behavior on scale {
//                    PropertyAnimation {
//                        duration: 100
//                    }
//                }

//                MouseArea {
//                    anchors.fill: parent
//                    onClicked: notificationClient.notification = "User is sad :("
//                    onPressed: sadButton.scale = 0.9
//                    onReleased: sadButton.scale = 1.0
//                }
//            }
//        }
}
