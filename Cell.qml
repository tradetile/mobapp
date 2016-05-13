import QtQuick 2.0

Item {
    id: container
    property alias cellColor: rectangle.color
    signal clicked(color cellColor)

    //width: 40; height: 25
    //anchors.top: parent.top
    //anchors.fill: parent

    Rectangle {
        id: rectangle
        border.color: "white"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log('Clicked :='+container.cellColor)
            container.clicked(container.cellColor)
        }
    }
}
