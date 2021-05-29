import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnLeftMenu

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color colorDefault: "#1c1d20"
    property color colorMouseOver: "#23272E"
    property color colorClicked: "#00a1f1"
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#2c313c"
    property int iconWidth: 18
    property int iconHeight: 18
    property bool isActiveMenu: false

    // QTObject will contain function that will be called when btn is pressed or mouse is over CustomBtn
    QtObject{
        id: internal

        property var dynamicColor: if(btnLeftMenu.down) {
                                       btnLeftMenu.down ? colorClicked : colorDefault
                                   }else {
                                       btnLeftMenu.hovered ? colorMouseOver : colorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor

        Rectangle {
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle {
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }
    }
    contentItem: Item {
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.height: iconHeight
            sourceSize.width: iconWidth
            height: iconHeight
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text {
            color: "#ffffff"
            font: btnLeftMenu.font
            text: btnLeftMenu.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}
