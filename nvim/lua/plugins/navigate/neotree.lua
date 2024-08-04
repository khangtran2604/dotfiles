return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = function()
    local map = vim.keymap.set

    map('n', '<leader>e', '<CMD>Neotree reveal<CR>', { desc = 'Toggle Neotree', silent = true })
  end,
  config = function()
    require('neo-tree').setup {
      filesystem = {
        window = {
          mappings = {
            ['q'] = 'close_window',
          },
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ['<C-j>'] = 'move_cursor_down',
            ['<C-k>'] = 'move_cursor_up',
          },
        },
      },
    }
  end,
}
