import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"
import QtQuick.Dialogs 1.3


Window {
    id: mainWindow
    title: qsTr("Genome Assembly")
    width: 1000
    height: 580

    //define min height/width because of resizing window with mouse
    minimumHeight: 500
    minimumWidth: 800
    visible: true
    color: "#00000000"
    property alias topBarDescription: topBarDescription

    //REMOVING TITLE BAR
    //The window flags control the window's appearance
    flags: Qt.Window | Qt.FramelessWindowHint

    //Window status for maximize and restore
    property int windowStatus: 0
    property int windowMargin: 10

    // Text Edit Properties
    property alias actualPage: stackView.currentItem

    // Funkcije za Max/Min/restore window
    QtObject {
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

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
                    onClicked: animationMenu.running = true
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

                    DragHandler {
                        onActiveChanged: if(active) {
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/dna_icon.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("Genome Assemlby")
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
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }


                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        colorClicked: "#f1000c"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
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
                clip: true
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

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 285; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

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
                            onClicked: {
                                btnSCS.isActiveMenu = false
                                btnInfo.isActiveMenu = false
                                btnHome.isActiveMenu = true
                                btnSCSGreedy.isActiveMenu = false
//                                btnOLC.isActiveMenu = false
                                btnDG.isActiveMenu = false
                                btnUpload.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))

                            }
                        }

                        LeftMenuBtn {
                            id: btnUpload
                            width: leftMenu.width
                            text: qsTr("Upload File")
                            btnIconSource: "../images/svg_images/open_icon.svg"
                            onPressed: {
                                fileOpen.open()
                                btnHome.isActiveMenu = false
                                btnUpload.isActiveMenu = true
                                stackView.push(Qt.resolvedUrl("pages/fileView.qml"))

                            }

                            FileDialog{
                                id: fileOpen
                                title: "Please choose a file"
                                folder: shortcuts.home
                                selectMultiple: false
                                nameFilters: ["FASTA (*.fa)", "Text File (*.txt)"]
                                onAccepted: {
                                    backend.openFile(fileOpen.fileUrl)
                                }
                            }
                        }
                        LeftMenuBtn {
                            id: btnSCS
                            width: leftMenu.width
                            text: qsTr("Shortest Common Superstring")
                            iconWidth: 20
                            iconHeight: 20
                            btnIconSource: "../images/svg_images/one_icon.png"
                            onClicked: {
                                btnSCS.isActiveMenu = true
                                btnInfo.isActiveMenu = false
                                btnHome.isActiveMenu = false
                                btnSCSGreedy.isActiveMenu = false
//                                btnOLC.isActiveMenu = false
                                btnDG.isActiveMenu = false
                                btnUpload.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/scsPage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnSCSGreedy
                            width: leftMenu.width
                            text: qsTr("Greedy SCS")
                            iconWidth: 20
                            iconHeight: 20
                            btnIconSource: "../images/svg_images/two_icon.png"
                            onClicked: {
                                btnSCS.isActiveMenu = false
                                btnInfo.isActiveMenu = false
                                btnHome.isActiveMenu = false
                                btnSCSGreedy.isActiveMenu = true
//                                btnOLC.isActiveMenu = false
                                btnDG.isActiveMenu = false
                                btnUpload.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/gscsPage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnDG
                            width: leftMenu.width
                            text: qsTr("DeBrujin Graph")
                            iconWidth: 20
                            iconHeight: 20
                            btnIconSource: "../images/svg_images/three_icon.png"
                            onClicked: {
                                btnSCS.isActiveMenu = false
                                btnInfo.isActiveMenu = false
                                btnHome.isActiveMenu = false
                                btnSCSGreedy.isActiveMenu = false
//                                btnOLC.isActiveMenu = false
                                btnDG.isActiveMenu = true
                                btnUpload.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/dgPage.qml"))
                            }
                        }
                    }

                    LeftMenuBtn {
                        id: btnInfo
                        width: leftMenu.width
                        text: qsTr("Home")
                        anchors.bottom: parent.bottom
                        btnIconSource: "../images/svg_images/info_icon.png"
                        clip: false
                        anchors.bottomMargin: 25
                        onClicked: {
                            btnSCS.isActiveMenu = false
                            btnInfo.isActiveMenu = true
                            btnHome.isActiveMenu = false
                            btnSCSGreedy.isActiveMenu = false
//                            btnOLC.isActiveMenu = false
                            btnDG.isActiveMenu = false
                            btnUpload.isActiveMenu = false
                            stackView.push(Qt.resolvedUrl("pages/infoPage.qml"))
                        }
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    }
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
                        text: qsTr("https://github.com/ababic2/Genome_Assembly")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 8
                        anchors.rightMargin: 30
                        anchors.topMargin: 0
                    }
                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 0
                        opacity: 0.5
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler {
                            target: null
                            onActiveChanged: if(active) { mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)}
                        }

                        Image {
                            id: resizeImage
                            width: 16
                            height: 16
                            anchors.fill: parent
                            source: "../images/svg_images/resize_icon.svg"
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }

                    }
                }
            }
        }
    }

    MouseArea {
        id: resizeLeft
        width: 10
        height: 580
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if(active) { mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        height: 580
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if(active) { mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if(active) { mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    MouseArea {
        id: resizeTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if(active) { mainWindow.startSystemResize(Qt.TopEdge)}
        }
    }

    //Sjena oko glavnog prozora
    DropShadow{
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }

    Connections{
            target: backend

            function onReadText(text){
                actualPage.setText = text
            }
        }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
