pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
  id: root

  readonly property var notifications: server.trackedNotifications

  NotificationServer {
    id: server

    actionsSupported: true
    bodySupported: true
    bodyHyperlinksSupported: true 
    keepOnReload: true
    bodyImagesSupported: true
    actionIconsSupported: true
    persistenceSupported: true
    bodyMarkupSupported: true

    onNotification : notif => {
      console.log("[Notification] ", notif.summary, "--", notif.body)
      notif.tracked = true;
    }
  }
}
