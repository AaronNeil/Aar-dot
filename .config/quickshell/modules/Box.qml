import QtQuick
import qs.config

Rectangle {
  id: root

  property string label: ""

  implicitWidth: child.implicitWidth + 30
  implicitHeight: child.implicitHeight + 10
  radius: 20
  border.width: 2
  border.color: Config.sf1

  color: "transparent"
  //
  MouseArea{
    anchors.fill: root
    hoverEnabled: true
    onEntered: root.color = Config.ac2
    onExited: root.color = "transparent"
  }


  Text {
    id: child
    anchors.centerIn: root
    font.pixelSize: Config.fontSize
    // font: Config.fontFamily
    text: root.label
    color: Config.sf1
  }
}
