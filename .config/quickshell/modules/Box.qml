import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config

Rectangle {
  id: root
  
  property string icon: ""
  property string label: ""
  property var click_event: null

  implicitWidth: text.implicitWidth + icon_image.implicitWidth + 20
  implicitHeight: text.implicitHeight
  radius: 6
  border.width: 1
  border.color: Config.sf1
  opacity: 0.8
  
  color: {
    if (root.click_event == null) {
      return Config.ac3
    }
    if (mouse_area.pressed) {
      return Config.ac1
    }
    if (mouse_area.containsMouse) {
      return Config.ac2
    }
    return Config.ac3
  }

  MouseArea{
    id: mouse_area
    anchors.fill: root

    enabled: root.click_event != null
    hoverEnabled: root.click_event != null

    onClicked : {
     // Run click event
    }
  }

  RowLayout {
    id: layout
    anchors.centerIn: root
    spacing: 2

    Image {
      id: icon_image
      source: root.icon

      Layout.alignment: Qt.AlignVCenter
    }
    
    Text{
      id: text
      font.pixelSize: Config.fontSize
      font.family: Config.fontFamily
      font.weight: Font.Bold
      text: root.label
      color: Config.sf1

      Layout.alignment: Qt.AlignVCenter

    }
  }
}
