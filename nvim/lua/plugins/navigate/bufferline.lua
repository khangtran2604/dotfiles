---@diagnostic disable: undefined-global
return {
	"akinsho/bufferline.nvim",
	version = "*",
	branch = "main",
	commit = "73540cb95f8d95aa1af3ed57713c6720c78af915",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<Tab>",
			"<CMD>BufferLineCycleNext<CR>",
			desc = "Next tab",
		},
		{
			"<S-Tab>",
			"<CMD>BufferLineCyclePrev<CR>",
			desc = "Previous tab",
		},
		{
			"<leader>X",
			"<CMD>BufferLineCloseOthers<CR>",
			desc = "Close other tabs",
		},
		{
			"<leader>x",
			function()
				require("bufdelete").bufdelete(0, true)
			end,
			desc = "Close other tabs",
		},
	},
	opts = {
		options = {
			separator_style = "blank",
			show_close_icon = false,
			show_buffer_close_icons = false,
			show_buffer_icons = true,
			diagnostics = "nvim_lsp",
			show_tab_indicators = true,
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			diagnostics_indicator = function(_, _, diag)
				local icons = require("configs.icons").diagnostics
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "  File Explorer ",
					text_align = "left",
				},
			},
		},
	},
	config = function(_, opts)
		vim.opt.termguicolors = true
		require("bufferline").setup(opts)

		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					---@diagnostic disable-next-line: undefined-global
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
