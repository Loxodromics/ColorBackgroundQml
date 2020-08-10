import QtQuick 2.11

Rectangle {
    id: root
    property int colorIndex: 0

    color: colors[1]


    ColorAnimation on color {
        id: colorAnimation
        to: colors[2]
        duration: 2000
    }

    MouseArea {

        anchors.fill: parent
        onClicked: {
            console.log("clicked")
            root.colorIndex++;
            root.colorIndex = root.colorIndex % colors.length
            colorAnimation.to = colors[root.colorIndex]
            colorAnimation.start()
        }
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: {
            console.log("timer")
            root.colorIndex++;
            root.colorIndex = root.colorIndex % colors.length
            colorAnimation.to = colors[root.colorIndex]
            colorAnimation.start()
        }
    }
}
