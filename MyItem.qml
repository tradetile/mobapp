import QtQuick 2.0

Item {
    property Component mycomponet: comp1
    property alias cellColor: internalSettings.color
    width:200; height:200;

    QtObject{
        id: internalSettings
        property color color: "green"
    }

    Component {
        id: comp1
        Rectangle{
            color:internalSettings.color;
            width:200; height:200;
            anchors.fill: parent
        }
        //onCompleted:function(){console.log('completed..')}
    }
}
