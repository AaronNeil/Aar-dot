import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import qs.config

Rectangle {
  id: root
  
  property string icon: ""
  property string label: ""

  signal clicked()

  implicitWidth:  Math.max(40, layout.implicitWidth +  16)
  implicitHeight: text.implicitHeight > icon.implicitHeight ? text.implicitHeight: icon.implicitHeight
  radius: 6
  border.width: 1
  border.color: Config.sf1
  opacity: 0.8
  
  color: {
    if (mouse_area.pressed) return Config.ac1
    if (mouse_area.containsMouse) return Config.ac2
    return Config.ac3
  }

  MouseArea{
    id: mouse_area
    anchors.fill: root
    hoverEnabled: true

    onClicked: root.clicked()
  }

  RowLayout {
    id: layout
    anchors.centerIn: root
    spacing: root.label == ""? 0 : 3

    Text{
      id:  icon
      font.pixelSize: Config.iconSize
      font.family: Config.iconFont
      text: root.icon
      topPadding: 3
      bottomPadding: 3
      color: Config.sf1

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
