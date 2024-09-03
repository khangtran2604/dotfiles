require("catppuccin").setup({
	flavour = "mocha",
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	integrations = {
		notify = true,
		aerial = true,
		alpha = true,
		lsp_trouble = true,
	},
	dim_inactive = { enabled = true },
	color_overrides = {
		mocha = {
			base = "#252525",
			mantle = "#252525",
			crust = "#252525",
		},
	},
})
