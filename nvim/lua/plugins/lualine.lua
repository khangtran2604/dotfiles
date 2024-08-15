return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = {
    options = {
      -- theme = "tokyonight",
      -- theme = "sonokai",
      theme = "catppuccin",
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = {
--     "meuter/lualine-so-fancy.nvim",
--   },
--   lazy = true,
--   event = { "BufReadPost", "BufNewFile", "VeryLazy" },
--   config = function()
--     -- local icons = require("config.icons")
--     require("lualine").setup({
--       options = {
--         theme = "auto",
--         -- theme = "github_dark",
--         -- theme = "catppuccin",
--         globalstatus = true,
--         icons_enabled = true,
--         -- component_separators = { left = "│", right = "│" },
--         component_separators = { left = "|", right = "|" },
--         section_separators = { left = "", right = "" },
--         disabled_filetypes = {
--           statusline = {
--             "alfa-nvim",
--             "help",
--             "neo-tree",
--             "Trouble",
--             "spectre_panel",
--             "toggleterm",
--           },
--           winbar = {},
--         },
--       },
--       sections = {
--         lualine_a = {},
--         lualine_b = {
--           "fancy_branch",
--         },
--         lualine_c = {
--           {
--             "filename",
--             path = 1, -- 2 for full path
--             symbols = {
--               modified = "  ",
--               -- readonly = "  ",
--               -- unnamed = "  ",
--             },
--           },
--           { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
--           { "fancy_searchcount" },
--         },
--         lualine_x = {
--           "fancy_lsp_servers",
--           "fancy_diff",
--           "progress",
--         },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { "filename" },
--         -- lualine_x = { "location" },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       extensions = { "neo-tree", "lazy" },
--     })
--   end,
-- }
