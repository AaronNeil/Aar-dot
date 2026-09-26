pragma Singleton

import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../components/"
import qs.config
import qs.services


Singleton {
  id: root

  property bool opened: false
  property Item anchorItem: null
  property int height: anchorItem != null? anchorItem.implicitHeight : 0
  property int width: anchorItem != null? anchorItem.implicitWidth : 0

// --- Functions --- //
  function toggle(button: Item): void {
    if (opened) {
      close()
    } else {
      anchorItem = button
      opened = true
    }
  }
  function close(): void {
    opened = false
    anchorItem = null
  }

// --- PopupWindow --- //
  PopupWindow {
    id: popup

    visible: root.opened && root.anchorItem !== null
    anchor {
      item: root.anchorItem
      edges: Edges.Bottom
      gravity: Edges.Bottom
      margins.top: root.height + 5
    }
    implicitWidth: root.width + 10
    implicitHeight: button_layout.implicitHeight + 10
    color: "transparent"

    Rectangle {
      anchors.fill: parent
      color: Config.ac3
      radius: 6
      opacity: 0.9

      border {
        width: 1
        color: Config.sf1
      }

// --- Buttons --- //
      ColumnLayout {
        id: button_layout
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        
        spacing: 5

        BarButton {
          id: shutdown
          icon: "\uf011"
        }
        BarButton {
          id: restart
          icon: "\uf2f9"
        }
        BarButton {
          id: lock_screen
          icon: "\uf023"
        }
        BarButton {
          id: sleep
          icon: "\uf186"
        }
        BarButton {
          id: hibernate
          icon: "\uf236"
        }
         BarButton {
          id: switch_user
          icon: "\uf007"
        }
      }
    }
  }
}
