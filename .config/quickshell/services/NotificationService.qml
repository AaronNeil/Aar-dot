import Quickshell
import QtQuick
import Quickshell.Services.Notifications

Scope {
  id: root

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

  Variants{
    model: Quickshell.screens;
    delegate: Component{
      PanelWindow {
        id: notification_window
        required property var modelData
        screen: modelData

        anchors {top: true; right: true}
        margins {top: 2; right: 2}
        implicitWidth: 300
        implicitHeight: 80

        color: "transparent"

        exclusionMode: ExclusionMode.Ignore
      }
    }
  }



}
