return {
		"nvim-telescope/telescope.nvim",
    tag = '0.1.8',
		event = "VimEnter",
		dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
      local telescope = require("telescope")
      local actions = require 'telescope.actions'

      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", "vendor" },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
              ["<C-p>"] = false,
              ["<C-n>"] = false,
              ["jk"] = { "<esc>", type = "command" },
              ["<C-j>"] = {
                actions.move_selection_next,
                type = "action",
                opts = { nowait = true, silent = true },
              },
              ["<C-k>"] = {
                actions.move_selection_previous,
                type = "action",
                opts = { nowait = true, silent = true },
              },
              ["<C-b>"] = actions.preview_scrolling_up,
              ["<C-f>"] = actions.preview_scrolling_down,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        }
      })

      telescope.load_extension("fzf")
      telescope.load_extension("scope")
      telescope.load_extension("projects")
      telescope.load_extension("notify")
      telescope.load_extension("noice")
      -- telescope.load_extension("aerial")

		end,
	}
