import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    property string getText: text1.text
    property string setText: ""

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        ScrollView {
            id: scrollView
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            clip: true

            Text {
                id: text1
                text: setText
                anchors.fill: parent
                font.pixelSize: 15
                clip: true
            }
        }


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:470;width:800}D{i:1}
}
##^##*/
