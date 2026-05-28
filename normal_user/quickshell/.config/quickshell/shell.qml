import QtQuick
import Quickshell
ShellRoot {
    PanelWindow {
        id: panel
        visible: true
        color: "transparent"
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: 34
        Rectangle {
            anchors.fill: parent
            color: "#1f2329"
            opacity: 0.95
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                color: "#e6edf3"
                font.pixelSize: 13
                text: "Quickshell"
            }
            Text {
                id: clock
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                color: "#e6edf3"
                font.pixelSize: 13
                text: Qt.formatDateTime(new Date(), "ddd MMM d  hh:mm:ss")
            }
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd MMM d  hh:mm:ss")
            }
        }
    }
}

