import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    id: appWindow
    visible: true
    width:640; height:480

    //! Main background setting
    //Rectangle {
    Flickable {
        id: page1
        anchors.fill: parent
        //color:'lightgray'
        clip: true

        //! GridView with event.
        Grid {
            id: grid
            anchors.fill: parent
            anchors.margins: 2; spacing:2
            rows: 2; columns: 3
            flow: Grid.TopToBottom  //Grid.LeftToRight

            //! transition animation if new-item was added.
            add: Transition {
                NumberAnimation { property: "scale";  from: 0.4; to: 1.0; duration: 300; }
            }

            //! dynamically create object when clicked.
            function clicked(c){
                console.log('clicked('+c+')..., len='+grid.children.length);
                //! destroy example
                if (grid.children.length >= 6) {
                    grid.children[0].destroy();
                    //grid.childAt(0,0).destroy();
                }
                //! create cell.
                var even = grid.children.length%2 == 0 ? true :false;
                var color = ""+c;     // convert to string.
                var component = Qt.createComponent(even ? "Cell2.qml" : "content/Clock.qml");
                var cell2 = component.createObject(grid, {"width": grid.width/3, "height": grid.height/2});
                if(even){
                  cell2.cellColor = color;
                } else {
                  cell2.city = "London";
                  cell2.shift = 2*grid.children.length;
                }
            }

            //! initial components in display.
            Cell { cellColor: "red"; onClicked: function(c){return grid.clicked(c)}; width: grid.width/3; height: grid.height/2}
            Cell { cellColor: "green"; onClicked: function(c){return grid.clicked(c)} ; width: grid.width/3; height: grid.height/2}
        }
    }
}

