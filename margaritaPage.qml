import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    width: 1080
    height: 1920
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Image {
            id: bagraund
            x: 0
            y: 0
            width: 1080
            height: 1920
            source: "../../images/bagraund_Margarita.jpg"
            fillMode: Image.PreserveAspectFit
        }

        MenuBatton {
            id: menuBatton
            x: 0
            y: 0
            width: 180
            height: 184
            onClicked: {
                stackView.push(Qt.resolvedUrl("menuPage.qml"))
            }
        }

        ScrollView {
            id: scrollView
            x: 40
            y: 250
            width: 1000
            height: 1614
            anchors.top: parent.top
            clip: true
            anchors.topMargin: 250
            anchors.horizontalCenter: parent.horizontalCenter
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            GridView {
                id: gridView
                y: 221
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                cellWidth: 500
                cellHeight: 500
                model: modelMargarita

                delegate: Item {
                    x: 5
                    height: 50
                    Column {
                        spacing: 5

                        Button {
                            id: button

                            width: 450
                            height: 450
                            onClicked: popup.open()

                            background: buttonBackground
                            Rectangle {
                                id: buttonBackground
                                color: "#cb139d28"
                                implicitWidth: 100
                                implicitHeight: 60
                                opacity: enabled ? 1 : 0.3
                                radius: 0
                                border.color: "#00000000"
                                border.width: 0

                                Image {
                                    id: homeBattonImage
                                    x: 0
                                    y: 0
                                    source: imgMin
                                }
                            }
                        }

                        Popup {
                            id: popup

                            width: 1080
                            height: 1920
                            opacity: 0.9
                            font.letterSpacing: 0
                            clip: true
                            font.wordSpacing: 0
                            spacing: 0
                            margins: 0
                            leftMargin: 0
                            topMargin: 0
                            dim: true
                            modal: true
                            focus: true
                            background: Rectangle {
                                id: popupBackground
                                color: "#000000"
                                radius: 1
                                border.color: "#000000"
                                border.width: 0
                                clip: true
                                scale: 1
                            }
                            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                            CloseBatton {
                                id: closeBatton
                                x: 910
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.topMargin: 10
                                anchors.rightMargin: 10
                                onClicked: popup.close()
                            }

                            SwipeView {
                                id: viewN
                                width: 950
                                height: 1111
                                visible: true
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                clip: true
                                currentIndex: idImg
                                Repeater {
                                    layer.textureSize.height: 0
                                    layer.textureSize.width: 0
                                    model: modelMargarita

                                    Rectangle {
                                        id: photoNormal
                                        color: "#ec000000"
                                        border.color: "#00000000"
                                        clip: true
                                        scale: 1

                                        Image {
                                            id: photoModel
                                            anchors.verticalCenter: parent.verticalCenter
                                            source: imgNormal
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:2}D{i:3}D{i:5}D{i:4}D{i:1}
}
##^##*/
