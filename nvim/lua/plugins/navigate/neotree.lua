return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = function()
    local map = vim.keymap.set

    map('n', '<leader>e', '<CMD>Neotree float<CR>', { desc = 'Toggle Neotree', silent = true })
    -- map('n', '<leader>o', '<CMD>Neotree focus<CR>', { desc = 'Focus Neotree', silent = true })
  end,
  config = function()
    require('neo-tree').setup {
      filesystem = {
        window = {
          fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
            ['<C-j>'] = 'move_cursor_down',
            ['<C-k>'] = 'move_cursor_up',
          },
        },
      },
    }
  end,
}
