import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config

import "../../components/"

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
        implicitHeight: Config.iconSize >= Config.fontSize - 10 ? Config.iconSize + 15: Config.iconSize + 2
        color:"transparent"


        // --- LEFT LAYOUT ---
        RowLayout {
          id: left_layout
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          implicitHeight: parent.implicitHeight
          spacing: 5

          AppLauncherWidget {}
          // WorkspaceWidget {}
        }

        // --- CENTER LAYOUT ---
        RowLayout {
          id: center_layout
          anchors.centerIn: parent
          implicitHeight: parent.implicitHeight
          spacing: 5

          ClockWidget {}
        }

        // --- RIGHT LAYOUT ---
        RowLayout {
          id: right_layout
          anchors.right : parent.right
          anchors.verticalCenter: parent.verticalCenter
          implicitHeight: parent.implicitHeight
          spacing: 5

          SystemMonitorWidget {} 
          // WifiWidget {}
          // BluetoothWidget {}
          NotificationWidget {}
          BatteryWidget {}
          PowerWidget {}
        }
      }
    }
  }
}
