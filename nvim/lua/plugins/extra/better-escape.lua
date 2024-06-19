return {
	"max397574/better-escape.nvim",
	lazy = true,
	event = { "InsertEnter" },
	opts = {
		mapping = { "jk" },
	},
	config = function(_, opts)
		require("better_escape").setup(opts)
	end,
}
