return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  config = function()
    local bufnr = vim.api.nvim_get_current_buf()

    vim.keymap.set('n', '<leader>ca', function()
      vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
    end, { silent = true, buffer = bufnr })

    -- vim.keymap.set('n', '<S-k>', function()
    --   vim.cmd.RustLsp { 'hover', 'actions' }
    -- end, { silent = true, buffer = bufnr })
  end,
}
