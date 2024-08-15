---@diagnostic disable: undefined-global
return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local map = vim.keymap.set

		map("n", "zR", require("ufo").openAllFolds)
		map("n", "zM", require("ufo").closeAllFolds)

		require("ufo").setup()
	end,
}
