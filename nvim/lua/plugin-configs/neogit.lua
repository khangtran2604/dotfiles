return {
	"NeogitOrg/neogit",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua", -- optional
	},
	config = function()
		local neogit = require("neogit")
		local map = require("core.utils").map

		neogit.setup({})

		map("n", "<leader>gg", function()
			neogit.open({ kind = "auto" })
		end)
	end,
}
