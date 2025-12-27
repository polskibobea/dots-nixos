import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import Quickshell.Hyprland
import Quickshell.Services.UPower

ShellRoot {

property string batPercent: "0"
    property string batStatus: "Discharging"

    // Proces do czytania procentów
    Process {
        id: readCap
        command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
        stdout: Proxy {
            onTextChanged: batPercent = text.trim()
        }
    }

    // Proces do czytania statusu
    Process {
        id: readStatus
        command: ["cat", "/sys/class/power_supply/BAT0/status"]
        stdout: Proxy {
            onTextChanged: batStatus = text.trim()
        }
    }

    // Timer odświeżający obie wartości co 5 sekund
    Timer {
        interval: 5000; running: true; repeat: true; triggeredOnStart: true
        onTriggered: {
            readCap.run();
            readStatus.run();
        }
    }

 PanelWindow {
  anchors {
    left: true
    bottom: true
    top: true
  }
  color: "black"
  implicitHeight: 1080
  implicitWidth: 38
  objectName: "quickshell-panel"

  //Workspace
Column {
  anchors.top: parent.top
  anchors.horizontalCenter: parent.horizontalCenter
  anchors.topMargin: 5
  spacing: 5
  Repeater {
    model: Hyprland.workspaces.values
    delegate: Rectangle {
      width: 40 
      height: 30
      color: "transparent"
      Text {
               anchors.centerIn: parent
        text: modelData.active ? "●" : "○"
        color: modelData.active ? "#f5c2e7" : "#585b70"
        font.pointSize: 20
      }
    }
  }
}
//bateria

Column {
        id: batterySection
        anchors.bottom: clockContainer.top // Umieszczamy baterię nad zegarem
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 4

        // Jeśli primaryDevice nie działa, pokaże się ten tekst (diagnostyka)
        Text {
            visible: !UPower.primaryDevice.present
            text: "no-bat"
            color: "red"
            font.pixelSize: 8
        }

        Row {
            spacing: 2
            visible: UPower.primaryDevice.present
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                // State 1 = Charging (ładowanie)
                text: UPower.primaryDevice.state === 1 ? "󱐋" : "󰁹"
                color: UPower.primaryDevice.state === 1 ? "#a6e3a1" : (UPower.primaryDevice.percentage < 20 ? "#f38ba8" : "white")
                font.pixelSize: 16
                font.family: "JetBrainsMono Nerd Font"
            }

            Text {
                // Wyświetlamy procenty
                text: Math.round(UPower.primaryDevice.percentage) + "%"
                color: UPower.primaryDevice.percentage < 20 ? "#f38ba8" : "#bac2de"
                font.pixelSize: 11
                font.bold: true
            }
        }
    }

//data i godzina
   Text {
    id: clock
    horizontalAlignment: Text.AlignHCenter
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 15
    color: "white"
    font.pointSize: 14

    function updateTime() {
      clock.text = Qt.formatDateTime(new Date(), "HH\nmm")
    }
    Timer {
      interval: 1000
      running: true 
      repeat: true
      onTriggered: clock.updateTime()
    }
    Component.onCompleted: updateTime()
  }

  Text {
    id: date 
    color: "white"
    font.pointSize: 9
    horizontalAlignment: Text.AlignHCenter
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    function updateDate() {
      date.text = Qt.formatDateTime(new Date(), "dd.MM")
    }
    Component.onCompleted: updateDate()
    Timer {
      interval: 60000; running: true; repeat: true
      onTriggered: date.updateDate()
    }
  }
}
}
