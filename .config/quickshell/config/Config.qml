pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property color black: "#000000"
  readonly property color white: "#ffffff"
  readonly property color green: "#98c379"
  readonly property color yellow: "#e5c07b"
  readonly property color red: "#e06c75"
  readonly property color sf1: "#FFBC70"
  readonly property color sf2: "#D8A11A"
  readonly property color sf3: "#A16708"
  readonly property color ac1: "#764A05"
  readonly property color ac2: "#523404"
  readonly property color ac3: "#271902"

  readonly property string fontFamily: "OMORI_GAME"
  readonly property int fontSize: 21

  readonly property int boxSize: 30

}
