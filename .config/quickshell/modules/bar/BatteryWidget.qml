import Quickshell
import qs.services

import "../../components"

Box {
  id: battery
  icon: BatteryService.battery_icon
  label: BatteryService.battery_percent + "%"
}
