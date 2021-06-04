import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: titleLabel
            color: "#55aaff"
            text: qsTr("Greedy Shortest Common Superstring")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 21
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 20
        }

        Rectangle {
            id: rectangle1
            color: "#23272e"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: titleLabel.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 0

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: resultLabel.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                anchors.bottomMargin: 20
                anchors.topMargin: 10
                Text {
                    id: text1
                    height: 30
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt; font-style:italic; color:#555753;\">Result will be displayed after clicking Run button</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 20
                    minimumPointSize: 20
                    minimumPixelSize: 20
                    fontSizeMode: Text.FixedSize
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    clip: true
                    textFormat: Text.RichText
                }
            }

            Rectangle {
                id: rectangle2
                x: 5
                y: 10
                height: 44
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 10

                Button {
                    id: buttonUpload
                    text: qsTr("Upload")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    flat: false
                    anchors.leftMargin: 100
                    layer.smooth: false
                    layer.textureMirroring: ShaderEffectSource.MirrorVertically
                    highlighted: true
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    onPressed: {
                        fileOpen.open()
                    }

                    FileDialog{
                        id: fileOpen
                        title: "Please choose a file"
                        folder: shortcuts.home
                        selectMultiple: false
                        nameFilters: ["Text File (*.txt)"]
                        onAccepted: {
                            backend.readFile(fileOpen.fileUrl)
                        }
                    }
                }

                Button {
                    id: buttonRun
                    text: qsTr("Run")
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 100
                    anchors.topMargin: 0
                    layer.smooth: false
                    highlighted: true
                    layer.textureMirroring: ShaderEffectSource.MirrorVertically
                    anchors.bottomMargin: 0

                    onPressed: {
                        backend.runGSCS("");
                    }
                }
            }

            Label {
                id: resultLabel
                x: 35
                y: 84
                color: "#55aaff"
                text: qsTr("Result:")
                anchors.left: parent.left
                anchors.top: rectangle2.bottom
                font.family: "Times New Roman"
                font.pointSize: 14
                anchors.leftMargin: 30
                anchors.topMargin: 30
            }
        }
    }

    Connections{
        target: backend

        function onSetResult(text) {
            text1.text = text
        }
    }
}
