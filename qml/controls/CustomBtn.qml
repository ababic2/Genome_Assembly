import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: customBtn

    //CUSTOM PROPERTIES
    property color colorDefault: "#55aaff"
    property color colorMouseOver: "#cccccc"
    property color colorPressed: "#333333"

    // QTObject will contain function that will be called when btn is pressed or mouse is over CustomBtn
    QtObject{
        id: internal

        property var dynamicColor: if(customBtn.down) {
                                       customBtn.down ? colorPressed : colorDefault
                                   }else {
                                       customBtn.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Custom Btn")
    implicitWidth: 200
    implicitHeight: 40
    background: Rectangle{
        color: internal.dynamicColor
    }
    contentItem: Item{
        id: item1
        Text {
            id: textBtn
            text: customBtn.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
        }
    }
}


