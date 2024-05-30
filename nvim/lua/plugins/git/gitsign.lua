return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			function merge_tables(t1, t2)
				for k, v in pairs(t2) do
					t1[k] = v
				end
				return t1
			end

			local function map(mode, l, r, opts)
				opts = merge_tables({ noremap = true, silent = true }, opts or {})

				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			-- NOTE: Should replace by another keys binding
			map({ "n", "v" }, "]e", function()
				if vim.wo.diff then
					return "]e"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to next hunk" })
			map({ "n", "v" }, "[e", function()
				if vim.wo.diff then
					return "[e"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to previous hunk" })

			-- Actions
			-- visual mode
			map("v", "<leader>ghs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage selected hunk" })
			map("v", "<leader>ghr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset selected hunk" })
			map("n", "<leader>ghs", gs.stage_hunk, { desc = "Git hunk stage" })
			map("n", "<leader>ghr", gs.reset_hunk, { desc = "Git hunk reset" })
			map("n", "<leader>ghS", gs.stage_buffer, { desc = "Git hunk stage buffer" })
			map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
			map("n", "<leader>ghR", gs.reset_buffer, { desc = "Git hunk reset" })
			map("n", "<leader>ghp", gs.preview_hunk, { desc = "Git hunk preview" })
			map("n", "<leader>gb", function()
				gs.blame_line({ full = false })
			end, { desc = "Git blame line" })
			map("n", "<leader>gd", gs.diffthis, { desc = "Git diff against index" })
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "Git diff against last commit" })

			-- Toggles
			map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle git blame line" })
			map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle git show deleted" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
		end,
	},
}
