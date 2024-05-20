return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local additional_rg_args = { "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }

		local find_args = {
			"rg",
			"--files",
			"--follow",
			"--hidden",
			"--no-ignore-vcs",
			"--smart-case",
			"--glob",
			"!**/.git/*",
		}

		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				-- color_devicons = true,
				-- layout_strategy = "horizontal",
				-- layout_config = {
				-- prompt_position = "top",
				-- horizontal = {
				-- height = 0.85,
				-- preview_cutoff = 0,
				-- },
				-- },
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
				prompt_prefix = "  ",
				selection_caret = "▍ ",
				multi_icon = " ",
				set_env = { COLORTERM = "truecolor" },
				winblend = 10,
			},
			picker = {
				find_files = {
					find_command = find_args,
				},
				live_grep = { additional_args = additional_rg_args },
				grep_string = { additional_args = additional_rg_args },
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

		-- Load Extnesions
		require("telescope").load_extension("fzf")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
		vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
		vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "[L]ist document symbols" })

		vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>fz", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily find in current buffer" })
		vim.keymap.set("n", "<leader>?", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fa", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find All Files" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Find by Grep" })
		vim.keymap.set("n", "<leader>fW", function()
			builtin.live_grep({
				additional_args = function(args)
					return vim.list_extend(args, { "--hidden", "--no-ignore" })
				end,
			})
		end, { desc = "Find words in all files" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
		vim.keymap.set("n", "<leader>;", builtin.resume, { desc = "[F]ind [R]esume" })
		vim.keymap.set("n", "<leader>fT", function()
			builtin.colorscheme({ enable_preview = true })
		end, { desc = "Find Theme" })
	end,
}
