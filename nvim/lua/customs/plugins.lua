return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = require "customs.configs.treesitter",
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = require("customs.configs.gitsigns").opts,
    on_attach = require("customs.configs.gitsigns").on_attach,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },

  {
    "nvim-pack/nvim-spectre",
    -- event = "BufEnter",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "customs.configs.spectre",
  },

  {
    "folke/zen-mode.nvim",
    opts = {},
    lazy = true,
    cmd = "ZenMode",
  },
}
