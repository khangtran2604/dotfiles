return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  config = function()
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>ft', '<cmd>:TodoTelecope<cr>', { desc = '[F]ind Todo List' })
  end,
}
