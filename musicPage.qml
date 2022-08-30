import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
import QtMultimedia 5.15

import "../controls"
import "../modules"

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
            source: "../../images/bagraund_Music.jpg"
            fillMode: Image.PreserveAspectFit

            MenuBatton {
                id: menuBatton
                x: 0
                y: 0
                width: 180
                height: 184
                onClicked: {
                    stackView.push(Qt.resolvedUrl("menuPage.qml"))
                    audioPlayer.stopPlay()
                }
            }



            ListView {
                id: listView
                x: 20
                y: 250
                Layout.fillWidth: parent
                //width: 613
                height: 1172
                Layout.fillHeight: true
                Layout.columnSpan: 0
                Layout.preferredHeight: -1
                Layout.preferredWidth: -1
                Layout.rowSpan: 0
                model: modelMusic
                delegate: Item {
                    x: 5
                    width: 80
                    height: 120
                    Row {
                        id: row
                        width: 200
                        height: 400
                        PlayBatton {

                            id: playBatton
                            topPadding: 0
                            onClicked: {
                                listView.currentIndex = index
                                audioPlayer.sourcePlay = source
                                audioPlayer.listView = listViewMusic
                                audioPlayer.playlistModel = modelMusic
                            }

                        }

                        Text {
                            color: "#ae2f2d"
                            text: qsTr(title)
                            anchors.top: parent.top
                            font.styleName: "Bold"
                            anchors.topMargin: 0
                            font.pointSize: 60
                            font.family: "Pobeda"
                        }
                        spacing: 20
                    }

                }



            }



            //Экземпляр аудио плеера
            AudioPlayer {
                id: audioPlayer
                x: 30
                y: 1505
                width: 1020
                height: 260
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:3}D{i:5}D{i:6}D{i:4}D{i:11}D{i:10}D{i:9}D{i:8}D{i:19}
D{i:18}D{i:17}D{i:16}D{i:7}D{i:24}D{i:2}D{i:1}
}
##^##*/
