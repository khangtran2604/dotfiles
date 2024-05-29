return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function(_, opts)
    local harpoon = require 'harpoon'
    harpoon:setup(opts)
  end,
}
