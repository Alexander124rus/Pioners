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

        /*Label {
            id: label
            x: 302
            y: 194
            color: "#ffffff"
            text: qsTr("Settings Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }*/

        Image {
            id: bagraund
            x: 0
            y: 0
            width: 1080
            height: 1920
            source: "../../images/menuPage.jpg"
            fillMode: Image.PreserveAspectFit

            MenuBattonStart {
                id: menuBattonStartMemories
                x: 562
                y: 638
                width: 519
                height: 873
                onClicked: {
                    stackView.push(Qt.resolvedUrl("memoriesPage.qml"))
                }
            }

            MenuBattonStart {
                id: menuBattonStartPhoto
                x: 0
                y: 0
                width: 559
                height: 826
                onClicked: {
                    stackView.push(Qt.resolvedUrl("photoPage.qml"))
                }
            }

            MenuBattonStart {
                id: menuBattonStartFilms
                x: 0
                y: 826
                width: 559
                height: 685
                onClicked: {
                    stackView.push(Qt.resolvedUrl("filmsPage.qml"))
                }
            }

            MenuBattonStart {
                id: menuBattonStartMusic
                x: 562
                y: 0
                width: 519
                height: 637
                onClicked: {
                    stackView.push(Qt.resolvedUrl("musicPage.qml"))
                }
            }

            MenuBattonStart {
                id: menuBattonStartMargorita
                x: 0
                y: 1512
                width: 1080
                height: 408
                onClicked: {
                    stackView.push(Qt.resolvedUrl("margaritaPage.qml"))
                }
            }


        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:2}D{i:1}
}
##^##*/
