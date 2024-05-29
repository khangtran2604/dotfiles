return {
  { 'folke/neodev.nvim', opts = {} },
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  {
    'tpope/vim-sleuth',
  },
  {
    'SmiteshP/nvim-navic',
    config = function()
      local icons = require 'config.icons'
      require('nvim-navic').setup {
        highlight = true,
        lsp = {
          auto_attach = true,
          -- preference = { 'typescript-tools' },
          preference = nil,
        },
        click = true,
        separator = ' ' .. icons.ui.ChevronRight .. ' ',
        depth_limit = 0,
        depth_limit_indicator = '..',
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = ' ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = ' ',
          Interface = ' ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = ' ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = ' ',
          EnumMember = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' ',
        },
      }
    end,
  },
  -- Comment
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {},
    config = function()
      require('nvim-treesitter.configs').setup {
        enable_autocmd = false,
      }
    end,
  },
  { 'tpope/vim-commentary' },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {},
    config = function()
      require('mini.comment').setup {
        options = {
          custom_commentstring = function()
            return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    end,
  },
  -- Scroll
  {
    'karb94/neoscroll.nvim',
    event = 'BufEnter',
    config = function()
      require('neoscroll').setup {
        stop_eof = true,
        easing_function = 'sine',
        hide_cursor = true,
        -- respect_scrolloff = true,
        cursor_scrolls_alone = true,
        -- performance_mode = false
      }
    end,
  },
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- Nvim bqf
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    init = function()
      require 'plugins.configs.bqf-init'
    end,
  },
  -- Git conflict
  {
    'akinsho/git-conflict.nvim',
    lazy = false,
    config = function()
      require 'plugins.configs.git-conflict'
    end,
    keys = {
      { '<leader>gcb', '<cmd>GitConflictChooseBoth<CR>', desc = 'choose both' },
      { '<leader>gcn', '<cmd>GitConflictNextConflict<CR>', desc = 'move to next conflict' },
      { '<leader>gcc', '<cmd>GitConflictChooseOurs<CR>', desc = 'choose current' },
      { '<leader>gcp', '<cmd>GitConflictPrevConflict<CR>', desc = 'move to prev conflict' },
      { '<leader>gci', '<cmd>GitConflictChooseTheirs<CR>', desc = 'choose incoming' },
    },
  },
}
