import Quickshell
import QtQuick
import qs.services

import "../../components"
import "../power"

BarButton {
  id: powerButton
  icon: "\uf011"
  onClicked: PowerWindow.toggle(powerButton)
}
