-- ============================================================
-- Window Rules & Workspace Assignments
-- ============================================================

-- Floating Terminal
hl.window_rule({
	match = { class = "^(floating-term)$" },
	float = true,
	size = { 900, 500 },
	opacity = "0.85",
})

-- Kitty Terminal
hl.window_rule({
	match = { class = "^(kitty)$" },
	opacity = "0.85",
})

-- Workspace Assignments
hl.window_rule({
	match = { class = "^(firefox)$" },
	workspace = "1",
})

hl.window_rule({
	match = { class = "^(thunar)$" },
	workspace = "4",
	opacity = "0.80 0.80",
})

hl.window_rule({
	match = { class = "^(tui-file-manager)$" },
	workspace = "4",
	opacity = "0.85",
})

hl.window_rule({
	match = { class = "^(org.fooyin.fooyin)$" },
	workspace = "special:music",
	opacity = "0.75 0.75",
})

-- Opacity Rules
hl.window_rule({
	match = { title = ".*YouTube.*" },
	opaque = true,
})

hl.window_rule({
	match = { class = "sqlitebrowser" },
	opacity = "0.80 0.80",
})

-- Global Fixes
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	match = { class = "hyprland-run" },
	float = true,
	move = { 20, "monitor_h-120" },
})

hl.window_rule({
	match = { class = "^(xdg-desktop-portal-gtk)$" },
	float = true,
	size = { 900, 500 },
})
