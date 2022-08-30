import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import "../controls"

Item {
    width: 1020
    height: 920
    //Экземпляр пути для передачи пути в mediaPlayer
    property var sourcePlayVideo
    property var listView
    property var playlistModel

    //Функция позволяет отключать mediaPlayer по собудию кнопки menu для экземпляров объекта AudioPlayer
    function stopPlay() {
            mediaPlayerVideo.stop()
        }

    //Инициализирует объект MediaPlayer
    MediaPlayer {
        id: mediaPlayerVideo
        autoPlay: true
        videoOutput: videoOutput
        source: sourcePlayVideo
        readonly property string title: metaData.title
    }

    //Визуализация плеера + управление
    Rectangle {
        id: player
        x: 0
        y: 0
        width: 1020
        height: 920
        color: "#00ffffff"
        border.color: "#ae2f2d"
        border.width: 10
        clip: true

        Rectangle {
            id: infoTitle
            x: 54
            y: 21
            width: 900
            height: 59
            color: "#00000000"
            border.color: "#001f1b1b"
            Layout.preferredHeight: 34
            Layout.preferredWidth: -1

            Text {
                id: textC
                text: mediaPlayerVideo.title
                anchors.fill: parent
                font.pixelSize: 60
                horizontalAlignment: Text.AlignHCenter
                anchors.bottomMargin: -20
                anchors.horizontalCenter: parent.horizontalCenter
                font.styleName: "Regular"
                font.family: "Pobeda"
                color: "#ae2f2d"
            }

            Slider{
                id:positionSlider
                y: 740
                width: 900
                height: 22
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                enabled: mediaPlayerVideo.seekable
                to: mediaPlayerVideo.duration
                value: mediaPlayerVideo.position

                onMoved: mediaPlayerVideo.seek(value)


                background: Rectangle {
                    x: positionSlider.leftPadding
                    y: positionSlider.topPadding + positionSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 6
                    width: positionSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#bdbebf"

                    Rectangle {
                        width: positionSlider.visualPosition * parent.width
                        height: parent.height
                        color: "#ae2f2d"
                        radius: 2
                    }
                }
            }
        }

        RowLayout {
            y: 807
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.preferredWidth: 0
            Layout.leftMargin: 10

            ToolButton {
                width: 28
                text: qsTr("")
                enabled: listView.currentIndex > 0
                onClicked: {
                    listView.currentIndex--
                    var index = listView.currentIndex
                    var path = playlistModel.get(index)
                    sourcePlayVideo = path


                }

                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: previous_sound
                        source: "../../images/previousSoundBatton.png"
                    }
                }

            }

            ToolButton {
                width: 28
                text: qsTr("")
                enabled: mediaPlayerVideo.position > 0
                onClicked: mediaPlayerVideo.seek(mediaPlayerVideo.position - mediaPlayerVideo.duration / 10)
                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: previous
                        source: "../../images/previousBatton.png"
                    }
                }
            }

            ToolButton {
                id: playPauseBatton
                enabled: mediaPlayerVideo.hasAudio || listView.currentItem
                Layout.preferredWidth: playPauseBatton.implicitHeight
                //iconSource: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "img/pause.png" : "img/pause.png"
                onClicked: {
                    if  (mediaPlayerVideo.playbackState === MediaPlayer.PlayingState){
                        mediaPlayerVideo.pause()
                    }
                    else if(mediaPlayerVideo.playbackState === MediaPlayer.StoppedState){
                        var index = listView.curentIndex
                        mediaPlayerVideo.source = source
                    }
                    else {
                        mediaPlayerVideo.play()
                    }

                }
                text: qsTr("")
                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: playPause
                        source: mediaPlayerVideo.playbackState === MediaPlayer.PlayingState ? "../../images/pauseBatton.png" : "../../images/playBatton.png"
                    }
                }
            }

            /*ToolButton {
                id: stopButton
                width: 28
                enabled: mediaPlayerVideo.hasAudio
                //iconSource: "img/stop.png"
                onClicked: mediaPlayerVideo.stop()
                text: qsTr("")
                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: stop
                        source: "../../images/stopBatton.png"
                    }
                }

            }*/

            ToolButton {
                width: 28
                text: qsTr("")
                enabled: mediaPlayerVideo.position < mediaPlayerVideo.duration
                onClicked: mediaPlayerVideo.seek(mediaPlayerVideo.position + mediaPlayerVideo.duration / 10)
                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: next
                        source: "../../images/nextBatton.png"
                    }
                }
            }



            ToolButton {
                width: 28
                text: qsTr("")
                enabled: listView.currentIndex < listView.count - 1
                onClicked: {
                    listView.currentIndex++
                    var index = listView.currentIndex
                    var path = playlistModel.get(index)
                    sourcePlayVideo = path
                }

                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: next_sound
                        source: "../../images/nextSoundBatton.png"
                    }
                }

            }

            Slider {
                id: volumeSlider
                value: 1.0
                stepSize: 0.01
                implicitWidth: 50

                property bool sync: false
                width: 100
                Layout.minimumWidth: 150
                Layout.leftMargin: 30

                onValueChanged: {
                    if (!sync) {
                        mediaPlayerVideo.volume = value
                    }
                }
            }

            ToolButton {
                id:muteBatton
                width: 28
                text: qsTr("")
                Layout.leftMargin: 0
                checkable: true
                onClicked: {
                    mediaPlayerVideo.muted = checked
                }
                background: Rectangle {
                    color: "#00ffffff"
                    border.color: "#00000000"
                    implicitWidth: 65
                    implicitHeight: 65
                    Image {
                        id: volume
                        source: "../../images/volumeBatton.png"
                    }
                }
            }
        }

        Rectangle {
            id: videoContent
            width: 1000
            height: 600
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -40
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            VideoOutput {
                id:videoOutput
                anchors.fill: parent
                source: mediaPlayerVideo
            }

        }

    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.25;height:480;width:640}D{i:1}D{i:3}D{i:8}D{i:31}
D{i:2}
}
##^##*/
