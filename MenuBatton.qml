import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: homeButton
    width: 265
    height: 188

    implicitWidth: Math.max(
                       buttonBackground ? buttonBackground.implicitWidth : 0,
                       textItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        buttonBackground ? buttonBackground.implicitHeight : 0,
                        textItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 4
    rightPadding: 4

    text: ""
    font.pointSize: 15

    background: buttonBackground
    Rectangle {
        id: buttonBackground
        color: "#00139d28"
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        radius: 2
        border.color: "#00000000"

        Image {
            id: homeBattonImage
            x: 0
            y: 0
            width: 265
            height: 188
            source: "../../images/menuBattonNormal.png"
        }
    }

    states: [
        State {
            name: "normal"
            when: !homeButton.down

            PropertyChanges {
                target: buttonBackground
                color: "#00000000"
                border.color: "#00047eff"
            }

            PropertyChanges {
                target: startButton
                text: ""
            }
        },
        State {
            name: "down"
            when: homeButton.down

            PropertyChanges {
                target: buttonBackground
                color: "#00ff2800"
                border.color: "#00000000"
            }

            PropertyChanges {
                target: homeBattonImage
                source: "../../images/menuBattonActive.png"
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}D{i:2}D{i:1}
}
##^##*/
