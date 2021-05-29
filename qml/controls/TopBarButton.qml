import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnTopBar

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color colorDefault: "#1c1d20"
    property color colorMouseOver: "#23272E"
    property color colorClicked: "#00a1f1"

    // QTObject will contain function that will be called when btn is pressed or mouse is over CustomBtn
    QtObject{
        id: internal

        property var dynamicColor: if(btnTopBar.down) {
                                       btnTopBar.down ? colorClicked : colorDefault
                                   }else {
                                       btnTopBar.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 35
    implicitHeight: 35

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            antialiasing: false
            visible: false
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}
