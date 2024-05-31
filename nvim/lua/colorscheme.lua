return {
	"Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	config = function()
		require("ayu").colorscheme()

		require("lualine").setup({
			options = {
				theme = "ayu",
				globalstatus = true,
				-- disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			-- overrides = {
			-- 	Normal = { bg = "None" },
			-- 	ColorColumn = { bg = "None" },
			-- 	SignColumn = { bg = "None" },
			-- 	Folded = { bg = "None" },
			-- 	FoldColumn = { bg = "None" },
			-- 	CursorLine = { bg = "None" },
			-- 	CursorColumn = { bg = "None" },
			-- 	WhichKeyFloat = { bg = "None" },
			-- 	VertSplit = { bg = "None" },
			-- },
		})

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
		vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
	end,
}
