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

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    config = function()
      require "customs.configs.lint"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
      require "customs.configs.telescope"
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>To", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
}
