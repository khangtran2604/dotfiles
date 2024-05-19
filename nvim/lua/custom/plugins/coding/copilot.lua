local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp",
	},
}

function M.config()
	require("copilot").setup({
		panel = {
			enabled = false,
			keymap = {
				jump_next = "<C-j>",
				jump_prev = "<C-k>",
				accept = "<C-l>",
				refresh = "r",
				open = "<M-CR>",
			},
		},
		suggestion = {
			enabled = false,
			-- auto_trigger = true,
			keymap = {
				accept = "<C-l>",
				next = "<C-j>",
				prev = "<C-k>",
				dismiss = "<C-h>",
			},
		},
		-- filetypes = {
		--   markdown = true,
		--   help = false,
		--   gitcommit = false,
		--   gitrebase = false,
		--   hgcommit = false,
		--   svn = false,
		--   cvs = false,
		--   ['.'] = false,
		-- },
		-- copilot_node_command = 'node',
	})

	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<C-s>", ":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

	require("copilot_cmp").setup()
end

return M
