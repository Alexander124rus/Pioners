
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: homeButton
    width: 70
    height: 70

    implicitWidth: Math.max(
                       buttonBackground ? buttonBackground.implicitWidth : 0,
                       textItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        buttonBackground ? buttonBackground.implicitHeight : 0,
                        textItem.implicitHeight + topPadding + bottomPadding)
    leftPadding: 0
    rightPadding: 0

    bottomPadding: 0
    topPadding: 0
    font.pointSize: 15

    background: buttonBackground
    Image {
        id: homeBattonImage
        width: 65
        height: 65
        anchors.verticalCenter: parent.verticalCenter
        source: "../../images/playBatton.png"
        anchors.verticalCenterOffset: 3
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:4}D{i:1}
}
##^##*/
