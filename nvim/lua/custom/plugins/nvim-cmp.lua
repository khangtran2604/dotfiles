return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local M = require "plugins.configs.cmp"
    -- M.completion.completeopt = "menu,menuone,noselect"
    -- M.mapping["<CR>"] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Insert,
    --   select = false,
    -- }
    table.insert(M.sources, { name = "crates" })
    return M
  end,
}
