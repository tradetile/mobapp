import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width:320; height:480

    Rectangle {
        id: page1
        //width:320; height:480
        anchors.fill: parent
        color:'lightgray'

        //! Animated TextView with Property
        Text {
            id:helloText
            text:"Hello Wolrd"
            //y:30
            anchors.horizontalCenter: page1.horizontalCenter
            anchors.verticalCenter: page1.verticalCenter
            font.pointSize: 24; font.bold: true

            //! Mouse Event Area
            MouseArea {id: mouseArea; anchors.fill: parent}

            //! property change event
            onColorChanged: console.log('Text.Color :='+color)

            //! State definition.
            states: State {
                name: "down"; when: mouseArea.pressed == true
                PropertyChanges {target: helloText; y: 160; rotation: 180; color: "red"}
            }

            //! Transition between State.
            transitions: Transition {
                from:""; to:"down";reversible: true
                ParallelAnimation{
                    NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                    ColorAnimation { duration: 500 }
                }
            }
        }

        //! GridView with event.
        Grid {
            id: colorPicker
            x:4; anchors.bottom: page1.bottom; anchors.bottomMargin: 4
            rows:2; columns: 3; spacing:3

            Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
            Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
        }

        // ListView with delegate
        ListView{
            id: listView
            width: 400; height:function(){return this.model * 100;}
            model: 2
            delegate: myItem.mycomponet
            MyItem {id:myItem}
        }
    }
}

/*
Window {
    visible: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    GridView {
        id: gridView1
        x: 0
        y: 0
        width: 140
        height: 140
        boundsBehavior: Flickable.StopAtBounds
        layoutDirection: Qt.LeftToRight
        flow: GridView.FlowTopToBottom
        cellHeight: 70
        cellWidth: 70
        delegate: Item {
            x: 5
            height: 50
            Column {
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    x: 5
                    text: name
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
                spacing: 5
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }
}
//*/
