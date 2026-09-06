---------------------
---- KEYBINDINGS ----
---------------------
-- TODO:
-- fix workspace movement(only active workspace)

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local var = require("config/variables")

--- APPS ---
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(var.terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(var.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(var.menu))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(var.browser))

--- ACTIONS ---
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

--- WORKSPACES ---
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- Special
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("steam"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.workspace.toggle_special("caprine"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.workspace.toggle_special(var.music))
-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))
-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "e+1" }))

--- WINDOW ---
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
-- Move window position
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--- MULTIMEDIA KEYS ---
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
-- PLayer
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
