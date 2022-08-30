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
            source: "../../images/bagraund_Lida.jpg"
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
            ScrollView {
                id: scrollViewNefantiev
                y: 200
                width: 1000
                height: 1687
                hoverEnabled: true
                focusPolicy: Qt.NoFocus
                clip: true
                contentHeight: 2900
                contentWidth: 1000
                anchors.horizontalCenter: parent.horizontalCenter
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn
                Label {
                    id: label
                    width: 956
                    height: 57
                    text: qsTr("Подвиг Лиды Прушинской ")
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.WordWrap
                    anchors.topMargin: 0
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.styleName: "Bold"
                    font.family: "Pobeda"
                    font.pointSize: 40
                }
                Text {
                    id: nefantievText
                    width: 960
                    height: 988
                    color: "#2f2f2f"
                    font.pointSize: 24
                    textFormat: Text.RichText
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">\t<span style=\" font-family:'Times New Roman','serif'; font-size:20pt;\">Лида Прушинская родилась в Красноярске 26 января 1950 года. Она училась в школе №19. У девочки было слабое здоровье, она часто болела, поэтому в 1964-1965 учебном году ее оставили на второй год в 5 классе. </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman','serif'; font-size:20pt;\">\tВ последний день школьных каникул, 31 августа 1964 года, Лида шла к маме на работу. Она услышала детский крик и увидела столб черного дыма. Оказалось, что неподалеку перевернулся бензовоз, топливо разлилось по улице и горело. Лида, не думая, бросилась к маленькой девочке, которая уже была объята пламенем. Лида схватила девочку и вынесла ее из огня, но на ней самой уже горело платье и длинная черная коса. Вместе они упали на землю. В воспоминаниях современников встречается информация, что рядом с местом, где случилось происшествие, были взрослые люди, которые пытались затушить огонь. Им она успела сказать свой адрес и плача от боли, срывая с себя горящую одежду и кожу, говорила, как сильно ей хочется жить!..</span><span style=\" font-size:20pt;\"> </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman','serif'; font-size:20pt;\">\tВ страшных ожогах обеих девочек привезли в больницу. 6-летняя Оля Битова умерла, не приходя в сознание, а Лида была жива еще несколько часов, но ее травмы не были совместимы с жизнью. </span></p>\n<p align=\"justify\" style=\" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Times New Roman','serif'; font-size:20pt;\">\tУказом Президиума Верховного Совета РСФСР от 3 октября 1964 года Лида Прушинская награждена медалью «За отвагу на пожаре» (посмертно). Позднее ее именем назвали улицу в Красноярске (бывшая улица Солидарности). В школе, где училась Лида Прушинская, оформили памятный уголок с портретом на стене. Пионерка с внимательным и серьезным взглядом черных глаз и длинными подвязанными косичками стала известна в разных городах большой страны благодаря статье в «Пионерской правде». В школу и маме Лиды приходили многочисленные письма с просьбой прислать фотографию и рассказать о том, какой была юная героиня. Учитель Тамара Михайловна Князева описывала Лиду так: «Лида была скромной и трудолюбивой девочкой, очень исполнительной. Вместе с классом разучивала и пела пионерские песни, интересовалась историями о пионерах-героях, любила домашних животных».</span><span style=\" font-size:20pt;\"> </span><span style=\" font-family:'Times New Roman','serif'; font-size:20pt;\">Так пионерка Лида Прушинская навечно осталась в строю.</span></p></body></html>"
                    anchors.top: label.bottom
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 20
                }
                GridView {
                    id: gridView
                    interactive: false
                    y: 1000
                    width: 960
                    anchors.left: parent.left
                    anchors.top: nefantievText.bottom
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                    cellWidth: 500


                    delegate: Item {
                        x: 20
                        height: 50
                        Column {
                            spacing: 5



                            Button {
                                id: button
                                x: 20
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


                                /*contentWidth: viewN.implicitWidth
                                    contentHeight: viewN.implicitHeight*/
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


                                /*ListModel{
                                            id: mymodel
                                            ListElement{
                                                name: "name1"
                                                background: "red"
                                            }
                                            ListElement{
                                                name: "name2"
                                                background: "salmon"
                                            }
                                            ListElement{
                                                name: "name2"
                                                background: "gray"
                                            }
                                        }*/
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
                                        model: modelLida

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
                    model: modelLida
                    /*model: ListModel {
                        id: modelPhoto



                        Component.onCompleted: {
                            for (var i = 1; i <= 39; i++) {
                                modelPhoto.append({
                                                      idImg: i,
                                                      "imgMin": "../../images/photos/min/" + i + ".jpg",
                                                      "imgNormal": "../../images/photos/normal/"
                                                                   + i + ".jpg"
                                                  })
                            }
                        }
                    }*/
                    cellHeight: 320


                }




            }


        }
    }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:5}D{i:6}D{i:7}D{i:4}D{i:2}D{i:1}
}
##^##*/
