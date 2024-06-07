return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  lazy = true,
  config = function(_, opts)
    local harpoon = require "harpoon"

    harpoon:setup(opts)
  end,
}
