-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()
-- (This is where our config will go)

-- # COLOR SCHEME
config.color_scheme = "ayu"
-- Darker
-- config.color_scheme = "Ayu Dark (Gogh)"

-- # FONT
-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font({ family = "FiraCode Nerd Font" })
-- And a font size that won't have you squinting
config.font_size = 15

-- # WINDOW STYLE
-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
-- Sets the font for the window frame (tab bar)
config.window_frame = {
	-- Berkeley Mono for me again, though an idea could be to try a
	-- serif font here instead of monospace for a nicer look?
	font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Bold" }),
	font_size = 13,
}

-- # STATUS LINE

local function segments_for_right_status(window)
	return {
		-- window:active_workspace(),
		wezterm.strftime("%a %b %-d %H:%M"),
		wezterm.hostname(),
	}
end

wezterm.on("update-status", function(window)
	-- Grab the utf8 character for the "powerline" left facing
	-- solid arrow.
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Grab the current window's configuration, and from it the
	-- palette (this is the combination of your chosen colour scheme
	-- including any overrides).
	local color_scheme = window:effective_config().resolved_palette
	local bg = color_scheme.background
	local fg = color_scheme.foreground

	window:set_right_status(wezterm.format({
		-- First, we draw the arrow...
		{ Background = { Color = "none" } },
		{ Foreground = { Color = bg } },
		{ Text = SOLID_LEFT_ARROW },
		-- Then we draw our text
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = " " .. wezterm.hostname() .. " " },
	}))
end)

-- # KEY MAPPINGS
local act = wezterm.action
local projects = require("projects")

config.disable_default_key_bindings = true
config.leader = { key = "b", mods = "CTRL", timeout_miliseconds = 2000 }
config.keys = {
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	-- { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
	-- { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
	-- { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
	-- { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

	{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
	{ key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("DefaultDomain") },
	{ key = "a", mods = "LEADER", action = wezterm.action.ActivateLastTab },
	{ key = "p", mods = "LEADER", action = projects.choose_project() },
	{
		key = "f",
		mods = "LEADER",
		-- Present a list of existing workspaces
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 2 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },

		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config

-- local config = {}
--
-- -- Color theme
-- function scheme_for_appearance(appearance)
-- 	if appearance:find("Dark") then
-- 		return "Catppuccin Mocha"
-- 	else
-- 		return "Catppuccin Latte"
-- 	end
-- end
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
--
-- -- Font
-- config.font = wezterm.font_with_fallback {
--   "MonoLisa Static",
--   'FiraCode Nerd Font',
-- }
-- config.font_size = 14
--
-- -- Key Mappings
-- config.leader = { key = "a", mods = "CTRL" }
-- config.keys = {
-- 	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
-- 	{ key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
-- 	{ key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
-- 	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
-- 	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
-- 	{ key = "h", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
-- 	{ key = "j", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
-- 	{ key = "k", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
-- 	{ key = "l", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
-- 	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
-- 	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
-- 	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
-- 	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
-- 	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
-- 	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
-- 	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
-- 	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
-- 	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
-- 	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
-- 	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
-- 	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
-- 	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
-- 	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
-- 	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
--
-- 	{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
-- 	{ key = "v", mods = "SHIFT|CTRL", action = wezterm.action.PasteFrom("Clipboard") },
-- 	{ key = "c", mods = "SHIFT|CTRL", action = wezterm.action.CopyTo("Clipboard") },
-- }
--
-- return config
