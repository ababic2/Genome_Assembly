import QtQuick 2.0
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Image {
            id: image
            anchors.fill: parent
            source: "../../../dnaHp.jpg"
            fillMode: Image.Stretch

            Label {
                id: label
                y: 382
                color: "#042240"
                text: qsTr("De novo Genome Assembly")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 50
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                font.family: "Times New Roman"
                font.pointSize: 40
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:3}D{i:2}
}
##^##*/
