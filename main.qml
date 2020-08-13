import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Color Changer")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    ColorChangerRectangle {
        id: background

        anchors.fill: parent
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
