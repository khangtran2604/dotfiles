-- Filename: ~/github/dotfiles-latest/wezterm/wezterm.lua
-- ~/github/dotfiles-latest/wezterm/wezterm.lua

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Load the colors from my existing neobean colors.lua file
local colors_module = dofile(os.getenv("HOME") .. "/.config/wezterm/shared/colors.lua")
local colors = colors_module.load_colors()

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {

	-- -- Setting the term to wezterm is what allows support for undercurl
	-- --
	-- -- BEFORE you can set the term to wezterm, you need to install a copy of the
	-- -- wezterm TERM definition
	-- -- https://wezfurlong.org/wezterm/config/lua/config/term.html?h=term
	-- --
	-- -- If you're using tmux, set your tmux.conf file to:
	-- -- set -g default-terminal "${TERM}"
	-- -- So that it picks up the wezterm TERM we're defining here
	-- --
	-- -- NOTE: When inside neovim, run a `checkhealth` and under `tmux` you will see that
	-- -- the term is set to `wezterm`. If the term is set to something else:
	-- -- - Reload your tmux configuration,
	-- -- - Then close all your tmux sessions, one at a time and quit wezterm
	-- -- - re-open wezterm
	-- term = "wezterm",
	-- term = "xterm-256color",

	-- When using the wezterm terminfo file, I had issues with images in neovim, images
	-- were shown like split in half, and some part of the image always stayed on the
	-- screen until I quit neovim
	--
	-- Images are working wonderfully in kitty, so decided to try the kitty.terminfo file
	-- https://github.com/kovidgoyal/kitty/blob/master/terminfo/kitty.terminfo
	--
	-- NOTE: I added a modified version of this in my zshrc file, so if the kitty terminfo
	-- file is not present it will be downloaded and installed automatically
	--
	-- But if you want to manually download and install the kitty terminfo file
	-- run the command below on your terminal:
	-- tempfile=$(mktemp) && curl -o "$tempfile" https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo && tic -x -o ~/.terminfo "$tempfile" && rm "$tempfile"
	--
	-- NOTE: When inside neovim, run a `checkhealth` and under `tmux` you will see that
	-- the term is set to `xterm-kitty`. If the term is set to something else:
	-- - Reload your tmux configuration,
	-- - Then close all your tmux sessions, one at a time and quit wezterm
	-- - re-open wezterm
	--
	-- Then you'll be able to set your terminal to `xterm-kitty` as seen below
	-- term = "xterm-kitty",

	-- To enable kitty graphics
	-- https://github.com/wez/wezterm/issues/986
	-- It seems that kitty graphics is not enabled by default according to this
	-- Not sure, so I'm enabling it just in case
	-- https://github.com/wez/wezterm/issues/1406#issuecomment-996253377
	-- enable_kitty_graphics = true,

	-- I got the GPU settings below from a comment by user @anthonyknowles
	-- In my wezterm video and will test them out
	-- https://youtu.be/ibCPb4tSRXM
	-- https://wezfurlong.org/wezterm/config/lua/config/animation_fps.html?h=animation
	-- animation_fps = 60,

	-- https://wezfurlong.org/wezterm/config/lua/config/front_end.html?h=front_
	-- front_end = "WebGpu",

	-- https://wezfurlong.org/wezterm/config/lua/config/webgpu_preferred_adapter.html?h=webgpu_preferred_adapter
	-- webgpu_preferred_adapter

	-- webgpu_power_preference = "LowPower"
	-- https://wezfurlong.org/wezterm/config/lua/config/webgpu_power_preference.html

	-- I use this for ñ and tildes in spanish á é í ó ú
	-- If you're a gringo, you wouldn't understand :wink:
	-- https://github.com/wez/wezterm/discussions/4650
	send_composed_key_when_left_alt_is_pressed = true,

	default_prog = {
		"/bin/zsh",
		"--login",
		"--interactive",
		-- "-c",
		-- [[
		--   if command -v tmux >/dev/null 2>&1; then
		--     tmux attach || tmux new;
		--   else
		--     exec zsh;
		--   fi
		--   ]],
	},

	-- For example, changing the color scheme:
	-- color_scheme = "AdventureTime"

	-- Removes the macos bar at the top with the 3 buttons
	window_decorations = "RESIZE",

	-- https://wezfurlong.org/wezterm/config/lua/wezterm/font.html
	-- font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
	font = wezterm.font("JetBrainsMono Nerd Font"),
	-- font_size = 14.5,
	font_size = 15,

	-- I don't use tabs
	enable_tab_bar = false,

	-- Slightly transparent and blurred background
	window_background_opacity = 0.9,
	macos_window_background_blur = 15,

	window_close_confirmation = "NeverPrompt",

	-- -- NOTE: My cursor was not blinking when using wezterm with the "wezterm" terminfo
	-- -- Setting my term to "xterm-kitty" fixed the issue
	-- -- I also use the zsh-vi-mode plugin, I had to set up the blinking cursor
	-- -- for that in my zshrc file
	-- -- Neovim didn't need cursor changes, worked by setting it to "xterm-kitty"
	-- --
	-- default_cursor_style = "BlinkingBlock",

	-- I don't like the the "Linear", which gives it a fade effect between blinks
	cursor_blink_ease_out = "Constant",
	cursor_blink_ease_in = "Constant",
	cursor_blink_rate = 400,

	window_padding = {
		left = 2,
		right = 2,
		top = 15,
		bottom = 0,
	},

	colors = {
		-- The default text color
		foreground = colors["linkarzu_color14"],
		-- The default background color
		background = colors["linkarzu_color10"],

		-- Overrides the cell background color when the current cell is occupied by the cursor
		cursor_bg = colors["linkarzu_color14"],
		-- Overrides the text color when the current cell is occupied by the cursor
		cursor_fg = colors["linkarzu_color10"],
		-- Specifies the border color of the cursor when the cursor style is set to Block
		cursor_border = colors["linkarzu_color02"],

		-- The foreground color of selected text
		selection_fg = colors["linkarzu_color14"],
		-- The background color of selected text
		selection_bg = colors["linkarzu_color16"],

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = colors["linkarzu_color10"],

		-- The color of the split lines between panes
		split = colors["linkarzu_color02"],

		-- ANSI color palette
		ansi = {
			colors["linkarzu_color10"], -- black
			colors["linkarzu_color11"], -- red
			colors["linkarzu_color02"], -- green
			colors["linkarzu_color05"], -- yellow
			colors["linkarzu_color04"], -- blue
			colors["linkarzu_color01"], -- magenta
			colors["linkarzu_color03"], -- cyan
			colors["linkarzu_color14"], -- white
		},

		-- Bright ANSI color palette
		brights = {
			colors["linkarzu_color08"], -- bright black
			colors["linkarzu_color11"], -- bright red
			colors["linkarzu_color02"], -- bright green
			colors["linkarzu_color05"], -- bright yellow
			colors["linkarzu_color04"], -- bright blue
			colors["linkarzu_color01"], -- bright magenta
			colors["linkarzu_color03"], -- bright cyan
			colors["linkarzu_color14"], -- bright white
		},
	},
}

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
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
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

-- return the configuration to wezterm
return config
