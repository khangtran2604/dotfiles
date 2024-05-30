return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"bash",
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
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<c-space>",
				node_incremental = "<c-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["a="] = "@assignment.outer", -- Select outer part of an assignment
					["i="] = "@assignment.inner", -- Select inner part of an assignment
					["l="] = "@assignment.lhs", -- Select left hand side of an assignment
					["r="] = "@assignment.rhs", -- Select right hand side of an assignment

					["aa"] = "@parameter.outer", -- Select outer part of a parameter/argument
					["ia"] = "@parameter.inner", -- Select inner part of a parameter/argument

					["af"] = "@call.outer", -- Select outer part of a function call
					["if"] = "@call.inner", -- Select inner part of a function call

					["ai"] = "@conditional.outer", -- Select outer part of a conditional
					["ii"] = "@conditional.inner", -- Select inner part of a conditional

					["al"] = "@loop.outer", -- Select outer part of a loop
					["il"] = "@loop.inner", -- Select inner part of a loop

					["am"] = "@function.outer", -- Select outer part of a method/function definition
					["im"] = "@function.inner", -- Select inner part of a method/function definition

					["ac"] = "@class.outer", -- Select outer part of a class
					["ic"] = "@class.inner", -- Select inner part of a class
				},
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
				},
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
	},
	config = function(_, opts)
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

		-- Prefer git instead of curl in order to improve connectivity in some environments
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)

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
}
