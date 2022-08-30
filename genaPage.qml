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
            source: "../../images/bagraund_Gena.jpg"
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

            Label {
                id: label
                y: 220
                width: 956
                height: 57
                text: qsTr("Как Павлик Морозов")
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                font.styleName: "Bold"
                font.family: "Pobeda"
                font.pointSize: 40
            }

            Text {
                id: nefantievText
                width: 960
                height: 648
                color: "#2f2f2f"
                font.pointSize: 24
                textFormat: Text.RichText
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">\t<span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">Гена Щукин родился в Красноярске в 1923 (или 1924) году, здесь прошло его детство. А через 9 лет Гена вместе с матерью и отчимом уехал в село Шира, там учился со 2 класса. Его отчим Константин Акимов работал помощником механика гаража Ширинской базы «Союззолото».</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tВернувшись поздно вечером с пионерского сбора, Гена случайно узнал, что отчим ночью планировал пробраться на работу и поджечь гаражи с машинами.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tГена твердо решил рассказать об этом одному из шоферов или сотруднику НКВД. О своем решении он заявил отчиму, а тот набросился на Гену с топором… Так погиб пионер Гена Щукин, прервав осуществление злостного замысла.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tМальчик даже не успел совершить подвиг в духе Павлика Морозова, но он был не равнодушен к преступным намерениям и за это поплатился жизнью.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tОб этой истории кратко сообщила газета «Советская Хакассия» 9 февраля 1937 года, затем «Красноярский комсомолец» представил ряд публикаций и другие издания поведали о подвиге пионера. Во многих пионерских отрядах школ проходили митинги, посвящённые Гене Щукину с призывами применить самые суровые наказания к убийце.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman'; font-size:20pt; color:#000000;\">\tВ 1948 году в честь Гены Щукина назвали детскую библиотеку неподалеку от станции Енисей в Красноярске.</span><span style=\" font-family:'Times New Roman'; font-size:20pt;\"> </span></p></body></html>"
                anchors.top: label.bottom
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
            }

            GridView {
                id: gridView
                interactive: false
                width: 960
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 60
                anchors.topMargin: 965
                anchors.horizontalCenter: parent.horizontalCenter
                cellWidth: 480
                cellHeight: 300
                model: modelGena


                delegate: Item {
                    x: 0
                    height: 50
                    Button {
                        width: 450
                        height: 270

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
                            id: viewIMG
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
                                model: modelGena

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
                        PageIndicator {
                            id: indicator

                            count: viewIMG.count
                            currentIndex: viewIMG.currentIndex

                            anchors.bottom: viewIMG.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }

        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:4}D{i:5}D{i:6}D{i:2}D{i:1}
}
##^##*/
