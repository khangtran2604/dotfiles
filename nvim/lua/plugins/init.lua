local plugins = require("configs").plugins

return {
	{ import = "plugin-configs.lsp", enabled = true },
	{ import = "plugin-configs.cmp", enabled = true },
	{ import = "plugin-configs.conform", enabled = true },
	{ import = "plugin-configs.gitsigns", enabled = true },
	{ import = "plugin-configs.tmux_navigator", enabled = true },
	{ import = "plugin-configs.bufferlines", enabled = plugins.bufferlines },
	{ import = "plugin-configs.blankline", enabled = plugins.blankline },
	{ import = "plugin-configs.neotree", enabled = plugins.neotree },
	{ import = "plugin-configs.tele_project", enabled = plugins.tele_project },
	{ import = "plugin-configs.tele_scope", enabled = plugins.tele_scope },
	{ import = "plugin-configs.telescope", enabled = plugins.telescope },
	{ import = "plugin-configs.oil", enabled = plugins.oil },
	{ import = "plugin-configs.autopairs", enabled = plugins.autopairs },
	{ import = "plugin-configs.treesitter", enabled = plugins.treesitter },
	{ import = "plugin-configs.dressing", enabled = plugins.dressing },
	{ import = "plugin-configs.neoscroll", enabled = plugins.neoscroll },
	{ import = "plugin-configs.surround", enabled = plugins.surround },
	{ import = "plugin-configs.ufo", enabled = plugins.ufo },
	{ import = "plugin-configs.windline", enabled = plugins.windline },
	{ import = "plugin-configs.lualine", enabled = plugins.lualine },
	{ import = "plugin-configs.zenmode", enabled = plugins.zenmode },
	{ import = "plugin-configs.flash", enabled = plugins.flash },
	{ import = "plugin-configs.harpoon", enabled = plugins.harpoon },
	{ import = "plugin-configs.illuminate", enabled = plugins.illuminate },
	{ import = "plugin-configs.copilot", enabled = plugins.copilot },
	{ import = "plugin-configs.spectre", enabled = plugins.spectre },
	{ import = "plugin-configs.todo_comments", enabled = plugins.todo_comments },
	{ import = "plugin-configs.notify", enabled = plugins.notify },
	{ import = "plugin-configs.noice", enabled = plugins.noice },
	{ import = "plugin-configs.none-ls", enabled = plugins.none_ls },
	{ import = "plugin-configs.neogit", enabled = plugins.neogit },
}
