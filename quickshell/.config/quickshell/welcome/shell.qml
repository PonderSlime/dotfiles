import Quickshell
import QtQuick
import QtQuick.Controls

FloatingWindow {
  id: floatWin
  implicitWidth: 600
  implicitHeight: 300
  title: "Hypr Welcome Screen"

  Rectangle {
    anchors.fill: parent
    color: "#1e1e2e"
    border.color: "#89b4fa"
    border.width: 2

    Row {
      anchors.fill: parent
      anchors.margins: 20
      spacing: 20

      // Left column: profile picture + greeting
      Column {
        width: parent.width / 4
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter

        // Rounded profile picture
        Rectangle {
          width: 120
          height: 120
          radius: width/2  // makes it circular
          clip: true
          color: "transparent"

          Image {
            anchors.fill: parent
            source: "/home/micah/.config/quickshell/profile.png"
            fillMode: Image.PreserveAspectCrop
            clip: true
          }
        }

        // Greeting
        Text {
          text: "Hello, Micah!"
          color: "white"
          font.pixelSize: 22
          horizontalAlignment: Text.AlignHCenter
          anchors.horizontalCenter: parent.horizontalCenter
        }
      }

      Column {
        width: parent.width * 2 / 3 - 40
        spacing: 15
        anchors.verticalCenter: parent.verticalCenter

        Text {
          text: "What are you up to today?"
          color: "#f38ba8"
          font.pixelSize: 18
        }
        // School
        Button {
          width: 400
          font.pixelSize: 16
          text: "School"
          hoverEnabled: true
          padding: 10
          background: Rectangle {
            color: "#3e3e5e"
            radius: 8
          }
          onHoveredChanged: {
            if (hovered) background.color = "#5e5e8e"
              else background.color = "#3e3e5e"
          }
          onClicked: {
            Quickshell.execDetached(["qs", "kill", "-c", "welcome"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 2] vivaldi"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 3 silent] obsidian"])
          }
        }
        // Work
        Button {
          width: 400
          font.pixelSize: 16
          text: "Work"
          hoverEnabled: true
          padding: 10
          background: Rectangle {
            color: "#3e3e5e"
            radius: 8
          }
          onHoveredChanged: {
            if (hovered) background.color = "#5e5e8e"
              else background.color = "#3e3e5e"
          }
          onClicked: {
            Quickshell.execDetached(["qs", "kill", "-c", "welcome"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 1 silent] slack"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 2] vivaldi"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 3 silent] obsidian"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 4 silent] gitkraken"])
          }
        }
        Button {
          width: 400
          font.pixelSize: 16
          text: "Games"
          padding: 10
          background: Rectangle {
            color: "#3e3e5e"
            radius: 8
          }
          hoverEnabled: true
          onHoveredChanged: {
            if (hovered) background.color = "#5e5e8e"
              else background.color = "#3e3e5e"
          }
          onClicked: {
            Quickshell.execDetached(["qs", "kill", "-c", "welcome"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 1 silent] slack"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 2 silent] vivaldi"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 3] steam"])
            Quickshell.execDetached(["hyprctl", "dispatch", "exec", "[workspace 4 silent] obsidian"])
          }
        }
      }
    }
  }
}
