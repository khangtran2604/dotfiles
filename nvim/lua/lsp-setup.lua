-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- nmap('<leader>crn', vim.lsp.buf.rename, '[C]ode rename')
  nmap('<leader>ca', function()
    vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
  end, '[L]ist [C]ode [A]ctions')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[L]ist document symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
require('which-key').register {
  -- Rebuild my own definitions
  -- Buffer
  ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
  -- Coding
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>cr'] = { name = 'Rename/Replace', _ = 'which_key_ignore' },
  ['<leader>cg'] = { name = 'Generate', _ = 'which_key_ignore' },
  -- Debugging
  ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
  -- Finding
  ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
  -- Gits
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>gh'] = { name = 'Hunk', _ = 'which_key_ignore' },
  ['<leader>gt'] = { name = 'Toggle', _ = 'which_key_ignore' },
  -- Harpoon
  ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
  -- Listing
  ['<leader>l'] = { name = '[L]ist', _ = 'which_key_ignore' },
  -- Testing
  ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
  -- Toggling
  ['<leader>T'] = { name = '[T]oggling', _ = 'which_key_ignore' },
  -- UI
  ['<leader>u'] = { name = '[U]ser Interface', _ = 'which_key_ignore' },
  ['<leader>us'] = { name = 'Splitting', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },

  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>cr'] = { name = 'Rename/Replace', _ = 'which_key_ignore' },

  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>gh'] = { name = 'Hunk', _ = 'which_key_ignore' },
}, { mode = 'v' })

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.

local servers = {
  html = {},
  cssls = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },

  -- Javascript/TypeScript
  -- tsserver = {},

  -- Docker
  dockerls = {},
  docker_compose_language_service = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

local util = require 'lspconfig.util'

-- JSON
require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'json', 'json5', 'jsonc' },
  on_new_config = function(new_config)
    new_config.settings.json.schemas = new_config.settings.json.schemas or {}
    vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
  end,
  settings = {
    json = {
      format = {
        enable = true,
      },
      validate = { enable = true },
    },
  },
}

-- JavaScript/TypeScript
require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'js', 'jsx', 'ts', 'tsx' },
  ---@diagnostic disable-next-line: missing-fields
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}
vim.keymap.set('n', '<leader>co', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.organizeImports.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>cR', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.removeUnused.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Remove Unused Imports' })

-- vim.keymap.set('n', '<leader>co', ':TSToolsOrganizeImports<CR>', { desc = 'Organize Imports' })
-- vim.keymap.set('n', '<leader>cR', ':TSToolsRemoveUnused<CR>', { desc = 'Remove All Unused Statement' })

-- Golang
require('lspconfig').gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
      semanticTokens = true,
    },
  },
}

-- Rust
--
-- require('lspconfig').rust_analyzer.setup {
--   filetypes = { 'rust' },
--   root_dir = util.root_pattern 'Cargo.toml',
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- }

vim.g.rustaceanvim = function()
  return {
    server = {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'rust' },
      root_dir = util.root_pattern 'Cargo.toml',
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
          },
        },
      },
    },
  }
end

-- vim: ts=2 sts=2 sw=2 et
