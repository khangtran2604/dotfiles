return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
		cmd = "Neotree",
		opts = {},
		keys = function()
			local map = vim.keymap.set

			map('n', '<leader>e', '<CMD>Neotree<CR>', {desc = "Toggle Neotree", silent = true})
			map('n', '<leader>o', '<CMD>Neotree focus<CR>', {desc = "Focus Neotree", silent = true})
		end
}
