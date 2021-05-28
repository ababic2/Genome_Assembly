import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnToggle
    implicitWidth: 70
    implicitHeight: 68

    background: Rectangle{
        id:bgBtn
        color: "#1c1d20"

        Image {
            id: iconBtn
            source: "../../images/svg_images/menu_icon.svg"
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
