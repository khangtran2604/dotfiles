return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

    local keymap = vim.keymap

    keymap.set('n', '<leader>j', '<cmd>HopChar2<CR>', { desc = 'Jump to 2 characters', silent = true })
  end,
}
