local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
			file_ignore_patterns = {
				"node_modules",
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})

  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		mapvimkey(";k", "Telescope keymaps", "Show Keymaps"),
		mapvimkey(";h", "Telescope help_tags", "Show Help Tags"),
		mapvimkey(";f", "Telescope find_files", "Find Files"),
		mapvimkey(";r", "Telescope live_grep", "Live Grep"),
		mapvimkey(";b", "Telescope buffers", "Find Buffers"),
		mapvimkey(";;", "Telescope resume", "Resume Previous Searching"),
		mapvimkey("<leader>o", "Telescope lsp_document_symbols", "List Symbols In Current Buffer"),
		mapvimkey("<leader>sw", "Telescope grep_string", "[S]earch current [W]ord"),
	},
}
