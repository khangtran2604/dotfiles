return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
			end
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				ignore_install = { "javascript" },
				modules = {},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				-- context_commentstring = { enable = true, enable_autocmd = false },
				auto_install = true,
				ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "vim",
            "vimdoc",
            -- Python
            "python",
            -- Rust
            "rust",
            -- JS/Ts
            "tsx",
            "javascript",
            "typescript",
            -- Neorg
            "norg",
            -- JSON
            "json",
            "json5",
            "jsonc",
            -- Golang
            "go",
            "gomod",
            "gowork",
            "gosum",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>vv",
						node_incremental = "+",
						scope_incremental = false,
						node_decremental = "_",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = { query = "@function.outer", desc = "around a function" },
							["if"] = { query = "@function.inner", desc = "inner part of a function" },
							["ac"] = { query = "@class.outer", desc = "around a class" },
							["ic"] = { query = "@class.inner", desc = "inner part of a class" },
							["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
							["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
							["al"] = { query = "@loop.outer", desc = "around a loop" },
							["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
							["ap"] = { query = "@parameter.outer", desc = "around parameter" },
							["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@parameter.inner"] = "v", -- charwise
							["@function.outer"] = "v", -- charwise
							["@conditional.outer"] = "V", -- linewise
							["@loop.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						include_surrounding_whitespace = false,
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@call.outer", -- Next function call start
              ["]a"] = "@function.outer", -- Next method/function definition start
              ["]c"] = "@class.outer", -- Next class start
              ["]i"] = "@conditional.outer", -- Next conditional start
              ["]l"] = "@loop.outer", -- Next loop start
            },
            goto_next_end = {
              ["]F"] = "@call.outer", -- Next function call end
              ["]A"] = "@function.outer", -- Next method/function definition end
              ["]C"] = "@class.outer", -- Next class end
              ["]I"] = "@conditional.outer", -- Next conditional end
              ["]L"] = "@loop.outer", -- Next loop end
            },
            goto_previous_start = {
              ["[f"] = "@call.outer", -- Previous function call start
              ["[a"] = "@function.outer", -- Previous method/function definition start
              ["[c"] = "@class.outer", -- Previous class start
              ["[i"] = "@conditional.outer", -- Previous conditional start
              ["[l"] = "@loop.outer", -- Previous loop start
            },
            goto_previous_end = {
              ["[F"] = "@call.outer", -- Previous function call end
              ["[A"] = "@function.outer", -- Previous method/function definition end
              ["[C"] = "@class.outer", -- Previous class end
              ["[I"] = "@conditional.outer", -- Previous conditional end
              ["[L"] = "@loop.outer", -- Previous loop end
            }
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
				},
			})

      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, "<S-;>", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	},
}
