return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  config = function()
    require("illuminate").configure {}
  end,
}
