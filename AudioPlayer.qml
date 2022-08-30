import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import "../controls"

Item {
    width: 1020
    height: 260

    //Экземпляр пути для передачи пути в mediaPlayer
    property var sourcePlay
    property var listView
    property var playlistModel


    //Функция позволяет отключать mediaPlayer по собудию кнопки menu для экземпляров объекта AudioPlayer
    function stopPlay() {
            mediaPlayer.stop()
        }

    //Инициализирует объект MediaPlayer
    MediaPlayer {
        id: mediaPlayer
        autoPlay: true
        source: sourcePlay
        property string title: metaData.title
    }

    /*ListView {
        id: listViewMusic
        model: playlistModel
    }*/

    //Визуализация плеера + управление
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 1020
        height: 260
        color: "#00ffffff"
        border.color: "#ae2f2d"
        border.width: 10

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
                text: mediaPlayer.title
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
                y: 100
                width: 900
                height: 22
                anchors.horizontalCenter: parent.horizontalCenter
                enabled: mediaPlayer.seekable
                to: mediaPlayer.duration
                value: mediaPlayer.position
                onMoved: mediaPlayer.seek(value)

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
            y: 163
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
                    sourcePlay = path
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
                enabled: mediaPlayer.position > 0
                onClicked: mediaPlayer.seek(mediaPlayer.position - mediaPlayer.duration / 10)
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
                enabled: mediaPlayer.hasAudio || listViewMusic.currentItem
                Layout.preferredWidth: playPauseBatton.implicitHeight
                //iconSource: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "img/pause.png" : "img/pause.png"
                onClicked: {
                    if  (mediaPlayer.playbackState === MediaPlayer.PlayingState){
                        mediaPlayer.pause()
                    }
                    else if(mediaPlayer.playbackState === MediaPlayer.StoppedState){
                        var index = listViewMusic.curentIndex
                        mediaPlayer.source = source
                    }
                    else {
                        mediaPlayer.play()
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
                        source: mediaPlayer.playbackState === MediaPlayer.PlayingState ? "../../images/pauseBatton.png" : "../../images/playBatton.png"
                    }
                }
            }

            /*ToolButton {
                id: stopButton
                width: 28
                enabled: mediaPlayer.hasAudio
                //iconSource: "img/stop.png"
                onClicked: mediaPlayer.stop()
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
                enabled: mediaPlayer.position < mediaPlayer.duration
                onClicked: mediaPlayer.seek(mediaPlayer.position + mediaPlayer.duration / 10)
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
                    sourcePlay = path
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
                property bool sync: false
                value: 1.0
                stepSize: 0.01
                implicitWidth: 50
                width: 100
                Layout.minimumWidth: 150
                Layout.leftMargin: 30

                onValueChanged: {
                    if (!sync) {
                        mediaPlayer.volume = value
                        //muteBatton.iconSource = mediaPlayer.iconFromVolume
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
                    mediaPlayer.muted = checked
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
    }
}


