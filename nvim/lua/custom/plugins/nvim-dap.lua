return {
  "mfussenegger/nvim-dap",
  init = function()
    require("core.utils").load_mappings "dap"
  end,
}
