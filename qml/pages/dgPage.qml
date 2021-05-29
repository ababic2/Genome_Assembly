import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: titleLabel
            color: "#55aaff"
            text: qsTr("De Brujin Graph")
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
                anchors.rightMargin: 5
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                anchors.topMargin: 0

                Text {
                    id: text1
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:14pt;\">ATATATATATATTATATTATATT</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    textFormat: Text.RichText
                    anchors.topMargin: 30
                    anchors.rightMargin: 30
                    anchors.leftMargin: 30
                    anchors.bottomMargin: 30
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
                    id: buttonInfo
                    text: qsTr("Info")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 100
                    layer.smooth: false
                    layer.textureMirroring: ShaderEffectSource.MirrorVertically
                    highlighted: true
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
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

}
