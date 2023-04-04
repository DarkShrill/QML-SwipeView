import QtQuick 2.0

Item {

    property var texts:["",""]
    property var font_colors:["white","white"]
    property var font_size
    property var font_bold : false

    property var current_index: 0

    signal currentIndexChanged(var curr_index)

    Rectangle{
        id: page1
        width: (parent.width/2)
        height: parent.height
        radius: height/2
        color:"#D7DCE0"

        MouseArea{
            width: parent.width - 40
            height:parent.height

            onClicked: {
                changeCurrentIndex(0)
            }
        }

        function setTextColor(color){
            txt_1.color = color
        }
    }


    Text {
        id: txt_1
        anchors.fill:page1
        text: texts[0]
        anchors.verticalCenter: page1.verticalCenter
        anchors.horizontalCenter: page1.horizontalCenter
        horizontalAlignment: TextInput.AlignHCenter
        verticalAlignment:  TextInput.AlignVCenter
        font.pointSize: font_size;
        color: font_colors[0]
        font.family: "Poppins";
        font.bold: font_bold
        z:201
    }


    Rectangle{
        id: page2
        width: (parent.width/2)
        height:parent.height
        radius: height/2
        anchors.left: page1.right
        anchors.leftMargin: -20
        color:"#D7DCE0"


        MouseArea{
            width: parent.width - 40
            height:parent.height
            anchors.left: parent.left
            anchors.leftMargin: 40

            onClicked: {
                changeCurrentIndex(1)
            }
        }
        function setTextColor(color){
            txt_2.color = color
        }
    }

    Text {
        id:txt_2
        anchors.fill:page2
        text: texts[1]
        anchors.verticalCenter: page2.verticalCenter
        anchors.horizontalCenter: page2.horizontalCenter
        horizontalAlignment: TextInput.AlignHCenter
        verticalAlignment:  TextInput.AlignVCenter
        font.pointSize: font_size;
        color: font_colors[1]
        font.family: "Poppins";
        font.bold: font_bold
        z:200
    }


    Rectangle{
        id:move_rect
        width: (parent.width/2)
        height: parent.height
        radius: height/2
        color: "#3D4C58"
        z:150

        states:[
        State{
             name: "page1"
             AnchorChanges { target: move_rect; anchors.left: page1.left }
         },
        State{
             name: "page2"
             AnchorChanges { target: move_rect; anchors.left: page2.left }
         }]


        transitions: Transition {
             // smoothly reanchor myRect and move into new position
             AnchorAnimation { duration: 400 }
         }
    }




    function changeCurrentIndex(index){

        if(index === 0){
            page1.z             = 100
            page2.z             = 80
            page1.setTextColor(font_colors[0])
            page2.setTextColor(font_colors[1])

            move_rect.state     = "page1";
        }else{
            page1.z             = 80
            page2.z             = 100
            page1.setTextColor(font_colors[1])
            page2.setTextColor(font_colors[0])
            move_rect.state     = "page2";
        }

        currentIndexChanged(index)
    }

    Component.onCompleted: {
        changeCurrentIndex(0);
    }

}
