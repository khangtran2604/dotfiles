return {
  "phaazon/hop.nvim",
  branch = "v2",
  config = function()
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
  end,
  keys = {
    {
      "<leader>j",
      "<cmd>:HopChar2<CR>",
      desc = "Hop find 2 characters",
    },
  },
}
