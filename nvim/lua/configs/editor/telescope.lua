return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = function()
    local conf = require "nvchad.configs.telescope"
    local actions = require "telescope.actions"

    -- Using ripgrep
    conf.defaults.vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    }
    -- Reduce memory usage
    conf.defaults.layout_strategy = "horizontal"
    conf.defaults.layout_config = {
      preview_cutoff = 120, -- Disable preview for large files
    }
    -- If you are working on a large project, you might want to split work across different jobs
    conf.defaults.path_display = { "smart" }
    conf.defaults.results_height = 10
    conf.defaults.results_width = 8
    -- Ignore some files
    conf.defaults.file_ignore_patterns = { "node_modules", "vendor", ".git/" }
    conf.defaults.set_env = { COLORTERM = "truecolor" }
    conf.defaults.mappings = {
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
    }
    -- Caching
    conf.defaults.cache_picker = {
      num_pickers = 20,
    }
    -- Enable Transparent Floats
    conf.defaults.winblend = 10
    -- Enable Debuggin
    -- conf.defaults.debug = true

    conf.extensions.fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    }

    conf.extensions["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    }

    conf.extensions_list = { "fzf", "ui-select" }

    return conf
  end,
}
