M = {}
M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto definition')
  -- nmap('gr', require('telescope.builtin').lsp_references, 'Goto references')
  -- nmap('gi', require('telescope.builtin').lsp_implementations, 'Goto implementation')
  -- nmap('gt', require('telescope.builtin').lsp_type_definitions, 'Type definition')
  nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'List document symbols')
  nmap('<leader>crn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code actions')

  nmap('gl', vim.diagnostic.open_float, 'Open Diagnostic Float')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gs', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, 'Goto declaration')

  -- Coding
  nmap('<leader>co', function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { 'source.organizeImports.ts' },
        diagnostics = {},
      },
    }
  end, 'Organize Imports')
  nmap('<leader>cR', function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { 'source.removeUnused.ts' },
        diagnostics = {},
      },
    }
  end, 'Remove Unused Imports')
end

return M
