import QtQuick 2.11

Rectangle {
    id: root

    property int interval: 15000
    property bool running: true

    property var colors: ["#2c9ab7", "#3498db", "#8adcb3", "#f1c40f", "#167c80", "#33495e"]


    color: colors[1]


    ColorAnimation on color {
        id: colorAnimation
        to: colors[2]
        duration: 2000
    }

    Timer {
        property int colorIndex: 0

        interval: root.interval
        running: root.running
        repeat: true
        onTriggered: {
            console.log("timer")
            colorIndex++;
            colorIndex = colorIndex % colors.length
            colorAnimation.to = colors[colorIndex]
            colorAnimation.start()
        }
    }
}
