import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnToggle

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/menu_icon.svg"
    property color colorDefault: "#1c1d20"
    property color colorMouseOver: "#23272E"
    property color colorClicked: "#00a1f1"

    // QTObject will contain function that will be called when btn is pressed or mouse is over CustomBtn
    QtObject{
        id: internal

        property var dynamicColor: if(btnToggle.down) {
                                       btnToggle.down ? colorClicked : colorDefault
                                   }else {
                                       btnToggle.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 68

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}
