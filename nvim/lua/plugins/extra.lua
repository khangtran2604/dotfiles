return {
  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", event = "BufEnter" },
  -- Smooth scrolling neovim plugin written in lua
  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    config = function()
      require("neoscroll").setup {
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
}
