import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config

import "../components/"

// TODO:
// - working Notif Center
// - hover = change color & display additional info
// - onClick events
// - Bluetooth
// - Wifi
// - System Monitor
// - Workspaces
// - Calendar?
// - Logout stuff

Scope {
  id: root
  Variants {
    model: Quickshell.screens;
    delegate:Component {
      PanelWindow {
        id: bar
        required property var modelData
        screen: modelData

        anchors {top: true; left: true; right: true }
        margins { top: 2; left: 2; right: 2; bottom: 0}

        implicitHeight: Config.boxSize
        // implicitHeight: 15
        color:"transparent"
        // CLock
        Box {
          id: clock
          anchors.centerIn: parent
          label: Clock.time
          icon: "../icons/clock.svg"
          click_event: "yes"
        }

        RowLayout {
          id: right_layout
          anchors.right : parent.right
          anchors.verticalCenter: parent.verticalCenter
          implicitHeight: parent.implicitHeight
          spacing: 5

          // System Monitor
          // Box {
          //   id: systemMonitor
          //   label: "test1"
          // }
          // // Wifi
          // Box {
          //   id: wifi
          //   label: "test2"
          // }
          // // Bluetooth
          // Box {
          //   id: bluetooth
          //   label: "test3"
          // }
          // // Notif
          // Box {
          //   id: notification
          //   label: "test4"
          // }
          
          Box {
            id: battery
            label: Battery.battery_percent + " %"
          }
        }
      }
    }
  }
}
