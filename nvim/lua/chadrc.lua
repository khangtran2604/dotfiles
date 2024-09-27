-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  transparency = true,
  integrations = {
    "telescope",
    "syntax",
    "blankline",
    "cmp",
    "git",
    "statusline",
    "lsp",
    "defaults",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  cmp = {
    icons = true,
  },
  statusline = {
    theme = "default",
    separator_style = "arrow",
  },
}

return M
