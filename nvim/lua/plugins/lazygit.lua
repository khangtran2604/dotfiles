return {
  "kdheepak/lazygit.nvim",
  -- optional: you can specify a custom command to open LazyGit
  cmd = "LazyGit",
  -- optional: you can specify dependencies
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = function()
    return {
      { "<leader>lg", "<CMD>LazyGit<CR>" },
    }
  end,
}
