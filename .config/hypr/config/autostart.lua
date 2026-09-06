-----------------
--- AUTOSTART ---
-----------------

-- TODO:
-- create dynamic wallpaper picker, static wallpaper for now
-- add quickshell later on

hl.on("hyprland.start", function()
	-- Wallpaper --
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww img Pictures/Wallpapers/watcherEndD.png")
end)
