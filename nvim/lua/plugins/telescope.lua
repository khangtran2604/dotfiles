return {
	{
		"nvim-telescope/telescope.nvim",
		-- cmd = "Telescope",
		version = false,
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"telescope-dap.nvim",
			"kkharji/sqlite.lua",
			-- "nvim-telescope/telescope-frecency.nvim",
		},
		keys = {
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep({ search_dirs = { "%:p" } })
				end,
				desc = "Find Buffers",
			},
			{
				"<leader><space>",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Find Buffers",
			},
			{
				"<leader>fa",
				function()
					require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
				end,
				desc = "Find All File (CWD)",
			},
			{
				"<leader>fn",
				":Telescope noice<cr>",
				desc = "Find Noices",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find File (CWD)",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Find Help",
			},
			{
				"<leader>fo",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Find Recent Files",
			},
			{
				"<leader>fw",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find Live Grep",
			},
			{
				"<leader>fW",
				function()
					require("telescope.builtin").live_grep({
						additional_args = function(args)
							return vim.list_extend(args, { "--hidden", "--no-ignore" })
						end,
					})
				end,
				desc = "Find Live Grep",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Find Neovim Config Files",
			},
			-- {
			--   "<leader>fd",
			--   function()
			--     require("telescope.builtin").diagnostics()
			--   end,
			--   desc = "Find Diagnostics",
			-- },
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Find Keymaps",
			},
			{
				"<leader>;",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume last search",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")
			local icons = require("config.icons")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "TelescopeResults",
				callback = function(ctx)
					vim.api.nvim_buf_call(ctx.buf, function()
						vim.fn.matchadd("TelescopeParent", "\t\t.*$")
						vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
					end)
				end,
			})

			-- local function formattedName(_, path)
			--   local tail = vim.fs.basename(path)
			--   local parent = vim.fs.dirname(path)
			--   if parent == "." then
			--     return tail
			--   end
			--   return string.format("%s\t\t%s", tail, parent)
			-- end

			telescope.setup({
				file_ignore_patterns = { "%.git/.", "node_modules", "vendor" },
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				defaults = {
					mappings = {
						i = {
							["<esc>"] = actions.close,
							["<C-t>"] = trouble.open,
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

						n = { ["<C-t>"] = trouble.open },
					},
					-- path_display = formattedName,
					path_display = {
						"filename_first",
					},
					previewer = false,
					prompt_prefix = " " .. icons.ui.Telescope .. " ",
					selection_caret = icons.ui.BoldArrowRight .. " ",
					file_ignore_patterns = { "node_modules", "package-lock.json" },
					initial_mode = "insert",
					select_strategy = "reset",
					sorting_strategy = "ascending",
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					layout_config = {
						prompt_position = "top",
						preview_cutoff = 120,
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob=!.git/",
					},
				},
				pickers = {
					find_files = {
						previewer = false,
						-- path_display = formattedName,
						layout_config = {
							height = 0.4,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					git_files = {
						previewer = false,
						-- path_display = formattedName,
						layout_config = {
							height = 0.4,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					buffers = {
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
							n = {
								["<c-d>"] = actions.delete_buffer,
							},
						},
						previewer = false,
						initial_mode = "normal",
						-- theme = "dropdown",
						layout_config = {
							height = 0.4,
							width = 0.6,
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					current_buffer_fuzzy_find = {
						previewer = true,
						layout_config = {
							prompt_position = "top",
							preview_cutoff = 120,
						},
					},
					live_grep = {
						only_sort_text = true,
						previewer = true,
					},
					grep_string = {
						only_sort_text = true,
						previewer = true,
					},
					lsp_references = {
						show_line = false,
						previewer = true,
					},
					treesitter = {
						show_line = false,
						previewer = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							previewer = false,
							initial_mode = "normal",
							sorting_strategy = "ascending",
							layout_strategy = "horizontal",
							layout_config = {
								horizontal = {
									width = 0.5,
									height = 0.4,
									preview_width = 0.6,
								},
							},
						}),
					},
					package_info = {
						-- Optional theme (the extension doesn't set a default theme)
						-- theme = "ivy",
					},
					-- frecency = {
					--   default_workspace = "CWD",
					--   show_scores = true,
					--   show_unindexed = true,
					--   disable_devicons = false,
					--   ignore_patterns = {
					--     "*.git/*",
					--     "*/tmp/*",
					--     "*/lua-language-server/*",
					--   },
					-- },
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			-- telescope.load_extension("refactoring")
			telescope.load_extension("dap")
			-- telescope.load_extension("frecency")
			-- telescope.load_extension("notify")
			telescope.load_extension("package_info")
		end,
	},
}
