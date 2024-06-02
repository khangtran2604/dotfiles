return {
	"max397574/better-escape.nvim",
	event = "BufEnter",
	config = function()
		require("better_escape").setup({
			mapping = { "jk" },
		})
	end,
}
