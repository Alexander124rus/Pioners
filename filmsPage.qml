import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
import QtMultimedia 5.15

import "../modules"
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
            source: "../../images/bagraund_Films.jpg"
            fillMode: Image.PreserveAspectFit

            MenuBatton {
                id: menuBatton
                x: 0
                y: 0
                width: 180
                height: 184
                onClicked: {
                    stackView.push(Qt.resolvedUrl("menuPage.qml"))
                    videoPlayer.stopPlay()
                }
            }

            VideoPlayer {
                id:videoPlayer
                x: 30
                y: 252
            }

            Rectangle {
                id: playlist
                height: 500
                color: "#00ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 40
                anchors.leftMargin: 40
                anchors.bottomMargin: 35
                anchors.topMargin: 1207
                ListView {
                    id: listViewFilms
                    anchors.fill: parent
                    anchors.bottomMargin: -14
                    //interactive: false
                    Layout.fillWidth: parent
                    Layout.fillHeight: true
                    Layout.columnSpan: 0
                    Layout.preferredHeight: -1
                    Layout.preferredWidth: -1
                    Layout.rowSpan: 0
                    model: modelVideo
                    delegate: Item {
                        x: 0
                        width: 80
                        height: 120
                        Row {
                            id: row
                            width: 200
                            height: 400
                            spacing: 20
                            PlayBatton {
                                id: playBatton
                                topPadding: 0
                                onClicked: {
                                    listViewFilms.currentIndex = index
                                    videoPlayer.sourcePlayVideo = source
                                    videoPlayer.listView = listViewFilms
                                    videoPlayer.playlistModel = modelVideo
                                }
                            }

                            Text {
                                id: textPlayer
                                x: 0
                                y: 0
                                width: 960
                                height: 172
                                text: qsTr(title)
                                font.pointSize: 42
                                anchors.top: parent.top
                                wrapMode: Text.WordWrap
                                anchors.topMargin: 10
                                font.family: "Pobeda"
                                color: "#ae2f2d"
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
    D{i:0;formeditorZoom:0.66}D{i:3}D{i:4}D{i:6}D{i:5}D{i:2}D{i:1}
}
##^##*/
