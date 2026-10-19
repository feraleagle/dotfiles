-- ============================================================
-- Autostart
-- ============================================================

hl.on("hyprland.start", function()
	-- NVIDIA environment variables
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	hl.env("GBM_BACKEND", "nvidia-drm")

	-- Start Hyprshade filter
	hl.exec_cmd("hyprshade on vibrance")

	-- Start Noctalia v5 shell
	hl.exec_cmd("noctalia")
end)
