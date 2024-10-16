-- return {
--   "Shatur/neovim-ayu",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     vim.cmd([[colorscheme ayu-dark]])
--
--     require("ayu").setup({
--       mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--       terminal = true, -- Set to `false` to let terminal manage its own colors.
--       overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
--     })
--   end,
-- }
--
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        harpoon = true,
        noice = true,
        notify = true,
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
