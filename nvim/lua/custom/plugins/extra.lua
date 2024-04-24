return {
  -- Code generation
  {
    'danymat/neogen',
    version = '*',
    config = function()
      local opts = { noremap = true, silent = true, desc = '[C]ode generate document' }
      vim.api.nvim_set_keymap('n', '<Leader>cgd', ":lua require('neogen').generate()<CR>", opts)

      require('neogen').setup {}
    end,
  },
  -- Neorg
  {
    'nvim-neorg/neorg',
    dependencies = { {
      'vhyrro/luarocks.nvim',
      priority = 1000,
      config = true,
    } },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
  },
  -- Highlighting
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure {}
    end,
  },
  -- Hop
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }

      local keymap = vim.keymap

      keymap.set('n', '<leader>j', '<cmd>HopChar2<CR>', { desc = 'Jump to 2 characters', silent = true })
    end,
  },
  -- Todo Comments
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  -- Nvim Surround
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  -- Auto Pairs
  {
    'windwp/nvim-autopairs',
    event = { 'InsertEnter' },
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require 'nvim-autopairs'

      -- configure autopairs
      autopairs.setup {
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { 'string' }, -- don't add pairs in lua string treesitter nodes
          javascript = { 'template_string' }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      }

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require 'cmp'

      -- make autopairs and completion work together
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
