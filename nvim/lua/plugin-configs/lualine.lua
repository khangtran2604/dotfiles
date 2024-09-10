return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Adapted from: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes
		local colors = {
			color2 = "#0f1419",
			color3 = "#ffee99",
			color4 = "#e6e1cf",
			color5 = "#14191f",
			color13 = "#b8cc52",
			color10 = "#36a3d9",
			color8 = "#f07178",
			color9 = "#3e4b59",
		}

		local ayu_dark = {
			visual = {
				a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color5 },
			},
			replace = {
				a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color5 },
			},
			inactive = {
				c = { fg = colors.color4, bg = colors.color2 },
				a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color5 },
			},
			normal = {
				c = { fg = colors.color9, bg = colors.color2 },
				a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color5 },
			},
			insert = {
				a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
				b = { fg = colors.color4, bg = colors.color5 },
			},
		}

		-- Import color theme based on environment variable NVIM_THEME
		local env_var_nvim_theme = os.getenv("NVIM_THEME") or "nord"

		-- Define a table of themes
		local themes = {
			onedark = ayu_dark,
			-- nord = "nord",
		}

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = themes[env_var_nvim_theme], -- Set theme based on environment variable
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch" },
				lualine_c = { filename, diagnostics },
				lualine_x = {
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive" },
		})
	end,
}
