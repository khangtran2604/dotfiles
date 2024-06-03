return {
	"max397574/better-escape.nvim",
	-- event = "BufEnter",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("better_escape").setup({
			mapping = { "jk" },
		})
	end,
}
