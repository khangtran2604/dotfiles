return {
  "theHamsta/nvim-dap-virtual-text",
  lazy = false,
  config = function(_, opts)
    require("nvim-dap-virtual-text").setup()
  end,
  init = function()
    vim.g.dap_virtual_text = true
  end,
}
