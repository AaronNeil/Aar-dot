pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
  id: root

  property var battery: UPower.displayDevice
  readonly property int battery_percent: Math.round(battery.percentage * 100)

  // Variants {
  //   model: UPower.devices
  //   delegate: QtObject {
  //     required property var modelData
  //
  //   }
  // }
}
