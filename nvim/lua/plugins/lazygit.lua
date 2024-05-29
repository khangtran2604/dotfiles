return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'VimEnter',
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
  end,
}
