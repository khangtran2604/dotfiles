return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	lazy = true,
	event = "VeryLazy",
	opts = {},
	config = function()
		require("ibl").setup()
	end,
}
