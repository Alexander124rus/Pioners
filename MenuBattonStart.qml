import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: menuBattonStart
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
    }

    states: [
        State {
            name: "normal"
            when: !menuBattonStart.down

            PropertyChanges {
                target: buttonBackground
                color: "#00000000"
                border.color: "#00047eff"
            }

            PropertyChanges {
                target: startButton
                text: ""
            }

            PropertyChanges {
                target: homeBattonImage
                source: "../../main/PySide2/qml/QtQuick/Controls/Styles/Base/images/arrow-down.png"
            }
        },
        State {
            name: "down"
            when: menuBattonStart.down

            PropertyChanges {
                target: buttonBackground
                color: "#57e53919"
                border.color: "#00000000"
            }

            PropertyChanges {
                target: homeBattonImage
                source: "../../images/menuBattonActive.png"
            }
        }
    ]
}



