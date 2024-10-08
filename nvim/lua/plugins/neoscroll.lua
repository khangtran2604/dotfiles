return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    require("neoscroll").setup({
      respect_scrolloff = true,
    })
  end,
}
