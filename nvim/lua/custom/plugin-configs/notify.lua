return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    require("notify").setup {
      -- stages = "fade",
      -- timeout = 3000,
      -- text_colour = "#ffffff",
      background_colour = "#000000",
    }
  end,
}
