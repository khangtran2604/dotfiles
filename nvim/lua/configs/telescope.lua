local conf = require "nvchad.configs.telescope"

conf.defaults.mappings.i = {
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

return conf
