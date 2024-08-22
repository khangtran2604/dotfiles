return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "christoomey/vim-tmux-navigator", event = "VimEnter" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = require "configs.telescope",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "nvim-treesitter/nvim-treesitter-context", -- Show code context
        opts = {
          enable = true,
          mode = "topline",
          line_numbers = true,
        },
      },
    },
    opts = require "configs.treesitter",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    lazy = true,
    event = "VeryLazy",
    config = function()
      local map = vim.keymap.set

      map("n", "zR", require("ufo").openAllFolds)
      map("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup()
    end,
  },
}
