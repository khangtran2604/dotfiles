local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

telescope.setup {
  defaults = {
    -- Your custom default settings
    file_ignore_patterns = { "node_modules", "vendor", "venv", "__pycache__" },
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
  pickers = {
    -- Your custom picker configurations
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

-- Load extensions
-- telescope.load_extension("fzf")
-- telescope.load_extension("file_browser")
telescope.load_extension "scope"
telescope.load_extension "notify"
telescope.load_extension "noice"
telescope.load_extension "projects"
telescope.load_extension "fzf"

local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", function()
  builtin.git_files { hidden = true }
end)
map("n", "<leader>fw", builtin.live_grep)
map("n", "<leader>fW", function()
  builtin.live_grep { hidden = true, no_ignore = true }
end)
map("n", "<leader><space>", builtin.buffers)
map("n", "<leader>fh", builtin.help_tags)
map("n", "<leader>fa", function()
  builtin.find_files { no_ignore = true, hidden = true }
end)
-- map("n", "<leader>/", function()
-- 	builtin.live_grep({ search_dirs = "%:p" })
-- end)
map("n", "<leader>fo", builtin.oldfiles)
map("n", "<leader>fd", builtin.diagnostics)
map("n", "<leader>;", builtin.resume)
map("n", "<leader>fc", function()
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end)
map("n", "<leader>fk", builtin.keymaps)
map("n", "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>")
map("n", "<leader>fn", "<CMD>Telescope noice<CR>")
map("n", "<leader>fp", "<CMD>Telescope projects<CR>")
map("n", "<leader>/", "<CMD>Telescope live_grep search_dirs='%:p'<CR>")
