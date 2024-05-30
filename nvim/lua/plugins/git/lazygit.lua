return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>gl",
			"<CMD>LazyGit<CR>",
			desc = "Open LazyGit",
		},
	},
}
