pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
  id: root

  property var battery: UPower.displayDevice
  readonly property int battery_percent: Math.round(battery.percentage * 100)
  readonly property string battery_icon: {
    if (battery.state == UPowerDeviceState.FullyCharged || battery_percent >= 95) return "\uf240"
    if (battery.state == UPowerDeviceState.Charging) return "\uf0e7"
    if (battery_percent >= 75) return "\uf241"
    if (battery_percent >= 50) return "\uf242"
    if (battery_percent >= 25) return "\uf243"
    return "\uf244"
  }
}
