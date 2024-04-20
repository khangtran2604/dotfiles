-- return {
--   'stevearc/conform.nvim',
--   -- event = { 'BufReadPre', 'BufNewFile' },
--   config = function()
--     local conform = require 'conform'
--
--     conform.setup {
--       formatters_by_ft = {
--         lua = { 'stylua' },
--         -- Use a sub-list to run only the first available formatter
--         html = { { 'prettierd', 'prettier' } },
--         css = { { 'prettierd', 'prettier' } },
--         json = { { 'prettierd', 'prettier' } },
--         yaml = { { 'prettierd', 'prettier' } },
--         markdown = { { 'prettierd', 'prettier' } },
--         javascript = { { 'prettierd', 'prettier' } },
--         typescript = { { 'prettierd', 'prettier' } },
--         javascriptreact = { { 'prettierd', 'prettier' } },
--         typescriptreact = { { 'prettierd', 'prettier' } },
--         go = { { 'gofumpt', 'goimports-reviser' } },
--       },
--       format_on_save = {
--         lsp_fallback = true,
--         -- async = false,
--         timeout_ms = 500,
--       },
--     }
--
--     vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
--       conform.format {
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 1000,
--       }
--     end, { desc = 'Format Code' })
--
--     vim.api.nvim_create_autocmd('BufWritePre', {
--       pattern = '*',
--       callback = function(args)
--         require('conform').format { bufnr = args.buf }
--       end,
--     })
--   end,
-- }
--
return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
