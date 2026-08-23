-- ============================================================
-- Autostart
-- ============================================================

hl.on("hyprland.start", function()
	-- Start Hyprshade filter
	hl.exec_cmd("hyprshade on vibrance")

	-- Start Noctalia v5 shell
	hl.exec_cmd("noctalia")
end)
