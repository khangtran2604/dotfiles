return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Add harpoon file",
    },
    {
      "<leader>hl",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon quick menu",
    },
    {
      "<leader>h1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "harpoon to file 1",
    },
    {
      "<leader>h2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "harpoon to file 2",
    },
    {
      "<leader>h3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "harpoon to file 3",
    },
    {
      "<leader>h4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "harpoon to file 4",
    },
    {
      "<leader>h5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "harpoon to file 5",
    },
    {
      "<leader>hln",
      function()
        require("harpoon"):list():next()
      end,
      desc = "harpoon next file",
    },
    {
      "<leader>hlp",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "harpoon prev file",
    },
  },
}