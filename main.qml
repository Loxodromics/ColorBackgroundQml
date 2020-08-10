import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")

    property var colors: ["#2c9ab7", "#3498db", "#8adcb3", "#f1c40f", "#167c80", "#33495e"]

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
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
                background.colorIndex++;
                background.colorIndex = background.colorIndex % colors.length
                colorAnimation.to = colors[background.colorIndex]
                colorAnimation.start()
            }
        }

        Timer {
            interval: 10000
            running: true
            repeat: true
            onTriggered: {
                console.log("timer")
                background.colorIndex++;
                background.colorIndex = background.colorIndex % colors.length
                colorAnimation.to = colors[background.colorIndex]
                colorAnimation.start()
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
