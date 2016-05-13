import QtQuick 2.0
import QtQuick.Controls 1.2

/***
* Component: Cell2 to load json data from server.
* Author : dujung@kaist.ac.kr
*/
Item {
    id: container
    property alias cellColor: rectangle.color
    property alias text: text.text
    signal clicked(color cellColor)

    width: 200; height: 200

    //! Read Remote Data via http-request.
    function getInternetTime() {
        var xmlhttp = new XMLHttpRequest();
        var url = "http://www.timeapi.org/utc/now?\\I:\\M:\\S";

        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                myFunction(xmlhttp.responseText);
            }
        }
        xmlhttp.open("GET", url, true);
        xmlhttp.send();
    }

    //! update self information.
    function myFunction(response) {
        //var arr = JSON.parse(response)||response;
        container.text = response;
    }

    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: getInternetTime()
    }

    Component.onCompleted: {
        console.log("The rectangle's color is", cellColor);
        getInternetTime();
    }

    Rectangle {
        id: rectangle
        border.color: "red"
        anchors.fill: parent

        //! Animated TextView with Property
        Text {
            id:text
            text:"Loading..."
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 16; font.bold: true
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log('Clicked :='+container.cellColor)
            container.clicked(container.cellColor)
        }
    }
}
