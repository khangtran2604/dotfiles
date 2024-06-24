return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local luasnip = require 'luasnip'
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup {
        formatting = lsp_zero.cmp_format { details = true },
        completion = { completeopt = 'menu,menuone,noinsert' },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'copilot' },
          { name = 'luasnip' },
          { name = 'path' },
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      }
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      {
        'nvimdev/lspsaga.nvim',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-tree/nvim-web-devicons',
        },
      },
    },
    config = function()
      local map = vim.keymap.set

      -- This is where all the LSP shenanigans will live
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      -- LSP Saga
      require('lspsaga').setup {
        ui = {
          code_action = require('configs.icons').diagnostics.Hint,
        },
      }
      map('n', '<leader>rn', ':Lspsaga rename<CR>', { silent = true, desc = 'LSP Rename' })
      -- map('n', '<leader>ca', ':Lspsaga code_action<CR>', { silent = true, desc = 'LSP Code Actions' })
      map('n', '<leader>ca', function()
        local ok, _ = pcall(vim.cmd, 'Lspsaga code_action')
        if not ok then
          vim.lsp.buf.code_action()
        end
      end, { silent = true, desc = 'LSP Code Actions' })
      map('n', '<leader>To', ':Lspsaga outline<CR>', { silent = true, desc = 'LSP Outline' })

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps { buffer = bufnr }

        -- map('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
        -- map('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
      end)

      lsp_zero.set_server_config {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      }

      local mason_ensure_installed = {
        'stylua',
        'html-lsp',
        'css-lsp',
        'typescript-language-server',
        'prettierd',
        'prettier',
        'eslint_d',
        'isort',
        'black',
        'marksman',
      }
      require('mason-tool-installer').setup { ensure_installed = mason_ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'html',
          'cssls',
          'tsserver',
          'rust_analyzer',
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup {}
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      }
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
