return {
	"akinsho/bufferline.nvim",
	version = "*",
	branch = "main",
	commit = "73540cb95f8d95aa1af3ed57713c6720c78af915",
	dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
	event = "VeryLazy",
	opts = {
		options = {
			-- tab_size = 10,
			-- mode = "tabs",
			separator_style = "bar",
			show_close_icon = false,
			show_buffer_close_icons = false,
			diagnostics = "nvim_lsp",
			show_tab_indicators = true,
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			-- indicator = {
			-- 	style = 'underline',
			-- },
			-- close_command = function(n)
			-- 	LazyVim.ui.bufremove(n)
			-- end,
			-- right_mouse_command = function(n)
			-- 	LazyVim.ui.bufremove(n)
			-- end,
			diagnostics_indicator = function(_, _, diag)
				local icons = require("configs.icons").diagnostics
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			custom_areas = {
				right = function()
					local result = {}
					local root = LazyVim.root()
					table.insert(result, {
						text = "%#BufferLineTab# " .. vim.fn.fnamemodify(root, ":t"),
					})

					-- Session indicator
					if vim.v.this_session ~= "" then
						table.insert(result, { text = "%#BufferLineTab#  " })
					end
					return result
				end,
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "center",
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

		local keymap = vim.keymap

		keymap.set("n", "<tab>", "<cmd>:BufferLineCycleNext<CR>", { desc = "Next Tab" })
		keymap.set("n", "<S-tab>", "<cmd>:BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
		keymap.set("n", "<leader>bco", "<cmd>:BufferLineCloseOthers<CR>", { desc = "Close other tabs" })
		keymap.set("n", "<leader>x", function()
			require("bufdelete").bufdelete(0, true)
		end, { desc = "Close current tab" })
	end,
}
