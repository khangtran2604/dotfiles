return {
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
          require("treesitter-context").setup({
            max_lines = 1,
            multiline_threshold = 2,
          })
				end,
			},
			{ "windwp/nvim-ts-autotag"},
			{ "HiPhish/rainbow-delimiters.nvim"},
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
		config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        incremental_selection = { enable = true },
        autotag = { enable = true },
        rainbow = { enable = true, disable = { "html" }, extended_mode = false },
      })
		end,
	}
