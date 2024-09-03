require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
				["<C-p>"] = false,
				["<C-n>"] = false,
				["jk"] = { "<esc>", type = "command" },
				["<C-j>"] = {
					require("telescope.actions").move_selection_next,
					type = "action",
					opts = { nowait = true, silent = true },
				},
				["<C-k>"] = {
					require("telescope.actions").move_selection_previous,
					type = "action",
					opts = { nowait = true, silent = true },
				},
				["<C-b>"] = require("telescope.actions").preview_scrolling_up,
				["<C-f>"] = require("telescope.actions").preview_scrolling_down,
			},
		},
		winblend = 10,
	},
})
