return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = { signs = false },
  keys = {
    {
      "<leader>ft",
      "<CMD>TodoTelescope<CR>",
      desc = "Find todos",
    },
  },
}
