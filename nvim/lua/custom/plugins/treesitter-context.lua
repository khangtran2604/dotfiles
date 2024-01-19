return {
  "nvim-treesitter/nvim-treesitter-context",
  lazy = false,
  keys = {
    {
      "<leader>cc",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Treesitter Context jump to current context",
    },
  },
}
