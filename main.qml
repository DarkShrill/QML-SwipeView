import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQml 2.12
import QtQuick.Window 2.12

Window {
    id:app
    visible: true
    minimumWidth: 800
    minimumHeight: 480
    title: qsTr("SLIDER PAGE INDICATOR")
    color: "#8E8D92"

    SwipeView {
        id: view
        currentIndex: 0
        width: parent.width
        height: parent.height - 40
        anchors.bottom: parent.bottom

        function addPage(page) {
            addItem(page)
            page.visible = true
        }

        function removePage(page) {
            for (var n = 0; n < count; n++) { if (page === itemAt(n)) { removeItem(n) } }
            page.visible = false
        }

    }

    Indicator{
        width: 320
        height:32
        texts:["PAGE 1", "PAGE 2"]
        font_colors:["#FFFFFF","#3D4C58"]
        font_size:16
        font_bold:false

        x: (app.width - width)/2
        y: 4


        onCurrentIndexChanged: {
            if(curr_index == 0){
                view.currentIndex       = curr_index
            }else{
                view.currentIndex       = curr_index
            }
        }
    }

    Page {
        id: page1
        visible: false;
        background: Rectangle { color: "#FE6158" }
        Label {
            anchors.centerIn: parent
            text: "Page1"
        }
    }

    Page {
        id: page2
        visible: false;
        background: Rectangle { color: "#31D27A" }
        Label {
            anchors.centerIn: parent
            text: "Page2"
        }
    }

    Component.onCompleted: {
        view.addPage(page1)
        view.addPage(page2)
    }
}
