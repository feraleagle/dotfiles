-- ============================================================
-- Keybindings & Variables
-- ============================================================

local mainMod = "ALT"
local secMod = "SUPER"

local terminalEmulator = "kitty"
local fileManager = "thunar"
local tuiFileManager = "yazi"
local webBrowser = "librewolf"
local musicPlayer = "fooyin"

-- Workspace Configuration
hl.workspace_rule({ workspace = "1", default_name = "WEB", persistent = true })
hl.workspace_rule({ workspace = "2", default_name = "TST", persistent = true })
hl.workspace_rule({ workspace = "3", default_name = "CODEX-C", persistent = true })
hl.workspace_rule({ workspace = "4", default_name = "EXP", persistent = true })
hl.workspace_rule({ workspace = "5", default_name = "MSC", persistent = true })

-- ── Core WM ────────────────────────────────────────────────
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(secMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- ── Focus Movement ─────────────────────────────────────────
hl.bind(secMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(secMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(secMod .. " + k", hl.dsp.focus({ direction = "u" }))
hl.bind(secMod .. " + j", hl.dsp.focus({ direction = "d" }))

-- ── Workspaces ─────────────────────────────────────────────
for i = 1, 7 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

-- ── Move Window to Workspace ───────────────────────────────
for i = 1, 7 do
	hl.bind(secMod .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- ── Special Workspaces ─────────────────────────────────────
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("music"))

-- ── Scroll Workspaces ──────────────────────────────────────
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- ── App Shortcuts ──────────────────────────────────────────
hl.bind(secMod .. " + Q", hl.dsp.exec_cmd(terminalEmulator .. " --class floating-term"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminalEmulator))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(terminalEmulator .. " --class tui-file-manager -e " .. tuiFileManager))

-- ── Media Controls ─────────────────────────────────────────
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " volume 0.01-"),
	{ repeating = true }
)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " volume 0.01+"),
	{ repeating = true }
)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " play-pause"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " previous"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind(secMod .. " + SPACE", hl.dsp.exec_cmd("playerctl -p " .. musicPlayer .. " play-pause"))

-- ── Noctalia v5 IPC Bindings ────────────────────────────
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind(secMod .. " + X", hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
hl.bind("PRINT", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))

-- ── Window Move / Resize (Mouse) ───────────────────────────
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(secMod .. " + mouse:272", hl.dsp.window.resize(), { mouse = true })
