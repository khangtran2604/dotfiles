return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "]w",
      function()
        require("illuminate").goto_next_reference()
      end,
      desc = "Goto next reference",
    },
    {
      "[w",
      function()
        require("illuminate").goto_prev_reference()
      end,
      desc = "Goto previous reference",
    },
  },
}
