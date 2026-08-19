-- ***********************************************************************************************
--                                    THE EAGLE'S HYPRLAND
-- REQUIREMENTS:    FILE-MANAGER: THUNAR
--                  TUI-FILE-MANAGER: YAZI
--                  MUSIC-PLAYER: FOOYIN
--                  TERMINAL-EMULATOR: KITTY
--                  WEB-BROWSER: LIBRE-WOLF
--                  QUICKSHELL: NOCTALIA-SHELL
-- ***********************************************************************************************

-- ============================================================
-- Modular structure: each concern lives in its own module file.
-- Load the relevant modules instead of sourcing old .conf files.
-- ============================================================

dofile(os.getenv("HOME") .. "/.config/hypr/modules/env.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/monitors.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/autostart.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/appearance.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/input.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/keybinds.lua")
dofile(os.getenv("HOME") .. "/.config/hypr/modules/windowrules.lua")
