return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  opts = {},
  keys = {
    {
      'n',
      '<leader>z',
      ':ZenMode<CR>',
      { noremap = true, silent = true },
    },
  },
}
