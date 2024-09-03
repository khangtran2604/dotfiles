require("catppuccin").setup({
	flavour = "mocha",
	term_colors = true,
	transparent_background = true,
	integrations = {
		flash = true,
		notify = true,
		aerial = true,
		alpha = true,
		cmp = true,
		gitsigns = true,
		treesitter = true,
		harpoon = true,
		telescope = {
			enabled = true,
		},
		mason = true,
		nvimtree = true,
		noice = true,
		which_key = true,
		fidget = true,
		lsp_trouble = true,
		illuminate = {
			enabled = true,
			lsp = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	color_overrides = {
		mocha = {
			base = "#252525",
			mantle = "#252525",
			crust = "#252525",
		},
	},
})
