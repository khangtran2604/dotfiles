return {
  'kdheepak/lazygit.nvim',
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      '<leader>gl',
      ':LazyGit<CR>',
      desc = 'Open LazyGit',
    },
  },
}
