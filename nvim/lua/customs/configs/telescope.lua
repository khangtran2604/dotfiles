local nvchad_config = require "nvchad.configs.telescope"

nvchad_config.defaults.mappings.i = {
  ["<C-u>"] = false,
  ["<C-d>"] = false,
  ["<C-p>"] = false,
  ["<C-n>"] = false,
  ["jk"] = { "<esc>", type = "command" },
  ["<C-j>"] = require("telescope.actions").move_selection_next,
  ["<C-k>"] = require("telescope.actions").move_selection_previous,
  ["<C-b>"] = require("telescope.actions").preview_scrolling_up,
  ["<C-f>"] = require("telescope.actions").preview_scrolling_down,
  ["<Esc>"] = require("telescope.actions").close,
}

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

local opts = {
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
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  },
}

local override_conf = vim.tbl_deep_extend("force", nvchad_config, opts)

require("telescope").setup(override_conf)

require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
