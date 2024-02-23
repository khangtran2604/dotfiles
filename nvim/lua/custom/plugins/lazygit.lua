return {
  'kdheepak/lazygit.nvim',
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>lg',
      '<cmd> LazyGit <CR>',
      desc = 'Open LazyGit',
    },
  },
}
