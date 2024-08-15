return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter",
	-- dependencies = {
	--   {
	--     'zbirenbaum/copilot-cmp',
	--     config = function()
	--       require('copilot_cmp').setup()
	--     end,
	--   },
	-- },
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<c-l>",
					accept_word = false,
					accept_line = false,
					next = "<c-j>",
					prev = "<c-k>",
					dismiss = "<C-h>",
				},
			},
			panel = { enabled = false },
		})
	end,
}
