import Quickshell 
import QtQuick 

PanelWindow {
  anchors {
    left: true
  }
  implicitHeight: 30 
  implicitWidht: 10
  Text {
    id: clock
    anchors.centerIn: parent

    Process { 
      id: dateProc

      command: ["date"]
      running: true 

      stdout: StdioCollector {
        onStreamFinished: clock.text = this.text
      }
    }
    Timer { 
      interval: 1000
      running: true 
      repeat: true 
      onTriggered: dateProc.running = true
}

