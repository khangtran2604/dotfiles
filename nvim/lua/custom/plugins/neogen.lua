return {
  'danymat/neogen',
  version = '*',
  config = function()
    local opts = { noremap = true, silent = true, desc = '[C]ode generate document' }
    vim.api.nvim_set_keymap('n', '<Leader>cgd', ":lua require('neogen').generate()<CR>", opts)

    require('neogen').setup {}
  end,
}
