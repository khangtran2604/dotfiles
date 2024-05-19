local function get_matched_ratio(dimensions, size)
	for min_cols, scale in pairs(dimensions) do
		if min_cols == "lower" or size >= min_cols then
			return math.floor(size * scale)
		end
	end
	return dimensions.lower
end

local function width_tiny(_, cols, _)
	return get_matched_ratio({ [180] = 0.27, lower = 0.37 }, cols)
end

local function width_small(_, cols, _)
	return get_matched_ratio({ [180] = 0.4, lower = 0.5 }, cols)
end

local function width_medium(_, cols, _)
	return get_matched_ratio({ [180] = 0.5, [110] = 0.6, lower = 0.75 }, cols)
end

local function width_large(_, cols, _)
	return get_matched_ratio({ [180] = 0.7, [110] = 0.8, lower = 0.85 }, cols)
end

-- Enable indent-guides in telescope preview
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	group = vim.api.nvim_create_augroup("rafi_telescope", {}),
	callback = function(args)
		if args.buf ~= vim.api.nvim_win_get_buf(0) then
			return
		end
		vim.opt_local.listchars = vim.wo.listchars .. ",tab:▏\\ "
		vim.opt_local.list = true
		vim.opt_local.number = true
	end,
})

return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local has_ripgrep = vim.fn.executable("rg") == 1

		local vimgrep_args = {
			unpack(require("telescope.config").values.vimgrep_arguments),
		}

		local path_sep = jit and (jit.os == "Windows" and "\\" or "/") or package.config:sub(1, 1)

		local find_args = {
			"rg",
			"--vimgrep",
			"--files",
			"--follow",
			"--hidden",
			"--no-ignore-vcs",
			"--smart-case",
			"--glob",
			"!**/.git/*",
		}

		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			defaults = {
				sorting_strategy = "ascending",
				cache_picker = { num_pickers = 3 },

				prompt_prefix = "  ", -- ❯  
				selection_caret = "▍ ",
				multi_icon = " ",

				path_display = { "truncate" },
				file_ignore_patterns = { "node_modules" },
				set_env = { COLORTERM = "truecolor" },
				vimgrep_arguments = has_ripgrep and vimgrep_args or nil,

				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
					horizontal = {
						height = 0.85,
						preview_cutoff = 0,
					},
				},
				history = {
					path = vim.fn.stdpath("state") .. path_sep .. "telescope_history",
				},

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
				color_devicons = true,
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					sort_mru = true,
					layout_config = { width = width_large, height = 0.7 },
					mappings = {
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},
				find_files = {
					find_command = has_ripgrep and find_args or nil,
					layout_config = { preview_width = 0.5 },
				},
				live_grep = {
					dynamic_preview_title = true,
				},
				colorscheme = {
					enable_preview = true,
					layout_config = { preview_width = 0.7 },
				},
				highlights = {
					layout_config = { preview_width = 0.7 },
				},
				vim_options = {
					theme = "dropdown",
					layout_config = { width = width_medium, height = 0.7 },
				},
				command_history = {
					theme = "dropdown",
					layout_config = { width = width_medium, height = 0.7 },
				},
				search_history = {
					theme = "dropdown",
					layout_config = { width = width_small, height = 0.6 },
				},
				spell_suggest = {
					theme = "cursor",
					layout_config = { width = width_tiny, height = 0.45 },
				},
				registers = {
					theme = "cursor",
					layout_config = { width = 0.35, height = 0.4 },
				},
				oldfiles = {
					theme = "dropdown",
					previewer = false,
					layout_config = { width = width_medium, height = 0.7 },
				},
				lsp_definitions = {
					layout_config = { width = width_large, preview_width = 0.55 },
				},
				lsp_implementations = {
					layout_config = { width = width_large, preview_width = 0.55 },
				},
				lsp_references = {
					layout_config = { width = width_large, preview_width = 0.55 },
				},
				lsp_code_actions = {
					theme = "cursor",
					previewer = false,
					layout_config = { width = 0.3, height = 0.4 },
				},
				lsp_range_code_actions = {
					theme = "cursor",
					previewer = false,
					layout_config = { width = 0.3, height = 0.4 },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				["file_browser"] = {
					depth = 1,
					auto_depth = false,
					hidden = { file_browser = true, folder_browser = true },
					hide_parent_dir = false,
					collapse_dirs = false,
					prompt_path = false,
					quiet = false,
					dir_icon = "󰉓 ",
					dir_icon_hl = "Default",
					display_stat = { date = true, size = true, mode = true },
					git_status = true,
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "file_browser")

		-- See `:help telescope.builtin`
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
