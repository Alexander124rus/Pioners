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
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Image {
            id: bagraund
            x: 0
            y: 0
            width: 1080
            height: 1920
            source: "../../images/bagraund_Memories.jpg"
            fillMode: Image.PreserveAspectFit

            MenuBatton {
                id: menuBatton
                x: 0
                y: 0
                width: 180
                height: 184
                onClicked: {
                    stackView.push(Qt.resolvedUrl("menuPage.qml"))
                    audioPlayerMemories.stopPlay()
                }
            }

            //Экземпляр аудио плеера
            AudioPlayer {
                id: audioPlayerMemories
                x: 30
                y: 1505
                width: 1020
                height: 260
            }

            Label {
                id: label
                y: 250
                width: 956
                height: 97
                text: qsTr("Воспоминание советского писателя, нашего земляка Георгия Ивановича Кублицкого о своем пионерском детстве")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.styleName: "Bold"
                font.family: "Pobeda"
                font.pointSize: 34
            }

            Text {
                id: textKubickoy
                width: 956
                height: 833
                color: "#000000"
                font.pointSize: 24
                textFormat: Text.RichText
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\"><img src='../../images/memories/kubickoy/Georgij_Kublickij_1933.png' align='right' vspace='5' hspace='50'>\t«...Мы с Пашкой Шадриным ходили в отряд кожевников. Мне поручили там редактировать сатирическую газету «Метёлка». Пионеры из нашего отряда расклеивали лозунги... Отряд устраивал походы. Во главе с вожатым отряда Осей Козулиным мы переправлялись через Енисей. Высаживались у песчаного берега. За домиками огородников, поселившихся возле переправы, начиналась степь с перелесками (ныне правобережная предмостная площадь). Она тянулась до заречных гор. Ни души, одни суслики настороженно торчали у нор рыжими столбиками. Мы воспитывали волю и выносливость. Воды с собой не брали, под июльским солнцем босиком брели по жесткой траве к горам. Будь у нас барабан или горн – было бы легче. Но в отряде по бедности не имелось ни того, ни другого. Шагали под песню:</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; font-style:italic; color:#000000;\">\tПионер, будь готов</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; font-style:italic; color:#000000;\">\tБить буржуев, кулаков.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tКрасноярских мальчишек тайга ничуть не пугала. Летом, во время каникул, мы переваливали по Цветочному логу через горы в долину реки Базаихи. Строили там шалаши, ловили хариусов, копали сладкие коренья. Мы умели лазить по скалам, ловить бурундуков, могли соорудить из бревен плот – салик – и спускаться на нём по реке, устроиться на ночлег в сыром лесу, мигом развести костер, найти след».</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p></body></html>"
                anchors.top: label.bottom
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
            }

            Rectangle {
                id: playlistKubickoy

                width: 960
                height: 200
                color: "#00ffffff"
                anchors.top: textKubickoy.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20

                ListView {
                    id: listViewKubickoy
                    anchors.fill: parent
                    Layout.fillWidth: parent
                    Layout.fillHeight: true
                    Layout.columnSpan: 0
                    Layout.preferredHeight: 0
                    Layout.preferredWidth: 0
                    Layout.rowSpan: 0
                    model: modelKubickoy
                    delegate: Item {
                        x: 5
                        width: 80
                        height: 120
                        Row {
                            id: rowKubickoy
                            width: 200
                            height: 400
                            spacing: 20
                            PlayBatton {

                                id: playBattonKubickoy
                                topPadding: 0
                                onClicked: {
                                    listViewKubickoy.currentIndex = index
                                    audioPlayerMemories.sourcePlay = source
                                    audioPlayerMemories.listView = listViewKubickoy
                                    audioPlayerMemories.playlistModel = modelKubickoy
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

                        }

                    }
                }
            }
        }
    }
}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:3}D{i:4}D{i:5}D{i:6}D{i:8}D{i:7}D{i:2}D{i:1}
}
##^##*/
