-- ============================================================
-- Autostart
-- ============================================================

hl.on("hyprland.start", function()
	-- Start Hyprshade filter
	hl.exec_cmd("hyprshade on vibrance")

	-- Start Noctalia v5 shell
	hl.exec_cmd("noctalia")

	-- Clipboard manager background workers (cliphist)
	hl.exec_cmd("cliphist list | grep -E '\\[Binary data|image/' | cliphist delete")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
