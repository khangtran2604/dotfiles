require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		enabled = true,
		keymap = {
			accept = "<c-l>",
			accept_word = false,
			accept_line = false,
			next = "<c-j>",
			prev = "<c-k>",
			dismiss = "<C-h>",
		},
	},
	panel = {
		enabled = false,
	},
})
