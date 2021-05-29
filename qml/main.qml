import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    property alias topBarDescription: topBarDescription
    title: qsTr("Genome Assembly")


    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                }

                Rectangle {
                    id: topBarDescription
                    y: 28
                    width: 908
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        height: 25
                        color: "#5f6a82"
                        text: qsTr("App Info")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 302
                        anchors.leftMargin: 8
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        height: 25
                        color: "#5f6a82"
                        text: qsTr("Right Info")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 0
                        anchors.rightMargin: 10
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    Image {
                        id: iconApp
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("My App Title")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 889
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: btnMinimize

                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                    }

                    TopBarButton {
                        id: btnClose
                        colorClicked: "#f1000c"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Column {
                        id: columnMenus
                        width: 200
                        height: 400
                        visible: true
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: false
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Home")
                            isActiveMenu: true
                        }

                        LeftMenuBtn {
                            id: btnUpload
                            width: leftMenu.width
                            text: qsTr("Home")
                            btnIconSource: "../images/svg_images/open_icon.svg"
                        }

                        LeftMenuBtn {
                            id: btnSCS
                            width: leftMenu.width
                            text: qsTr("Home")
                        }

                        LeftMenuBtn {
                            id: btnSCSGreedy
                            width: leftMenu.width
                            text: qsTr("Home")
                        }

                        LeftMenuBtn {
                            id: btnOLC
                            width: leftMenu.width
                            text: qsTr("Home")
                        }

                        LeftMenuBtn {
                            id: btnDG
                            width: leftMenu.width
                            text: qsTr("Home")
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
                        text: qsTr("Home")
                        anchors.bottom: parent.bottom
                        btnIconSource: "../images/svg_images/settings_icon.svg"
                        clip: false
                        anchors.bottomMargin: 25
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: rectangle
                    height: 200
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelExtraInfo
                        height: 25
                        color: "#5f6a82"
                        text: qsTr("App Info")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 8
                        anchors.rightMargin: 30
                        anchors.topMargin: 0
                    }
                }
            }
        }
    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:13}D{i:14}D{i:24}
}
##^##*/
