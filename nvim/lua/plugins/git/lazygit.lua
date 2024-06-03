return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- event = "VeryLazy",
	keys = {
		{
			"<leader>gl",
			"<CMD>LazyGit<CR>",
			desc = "Open LazyGit",
		},
	},
}
