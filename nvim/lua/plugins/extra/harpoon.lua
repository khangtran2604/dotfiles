return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Add to Harpoon list",
		},
		{
			"<leader>hl",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Show Harpoon list",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Select 1st item",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Select 2nd item",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Select 3rd item",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Select 4th item",
		},
		{
			"<leader>h5",
			function()
				require("harpoon"):list():select(5)
			end,
			desc = "Select 5th item",
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")

		harpoon:setup(opts)
	end,
}
