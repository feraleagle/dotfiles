-- ============================================================
-- Input — Keyboard, Mouse, Touchpad, Gestures
-- ============================================================

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		accel_profile = "flat",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 to 1.0; 0 = no modification

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- Workspace swipe gesture
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Per-device configuration
hl.device({
	name = "epic-mouse-v1",
	sensitivity = 1,
})
