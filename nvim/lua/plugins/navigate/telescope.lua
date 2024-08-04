---@diagnostic disable: undefined-global
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = function()
    local builtin = require 'telescope.builtin'
    local map = vim.keymap.set

    map('n', '<leader><space>', builtin.buffers, { desc = 'Find existing buffers' })
    map('n', '<leader>/', function()
      builtin.live_grep { search_dirs = { '%:p' } }
    end, { desc = 'Fuzzily find in current buffer' })
    -- map('n', '<leader>/', function()
    --   -- You can pass additional configuration to telescope to change theme, layout, etc.
    --   builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = 'Fuzzily find in current buffer' })
    map('n', '<leader>?', builtin.builtin, { desc = 'Search Select Telescope' })
    map('n', '<leader>fg', builtin.git_files, { desc = 'Find Git Files' })
    map('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    map('n', '<leader>fo', builtin.oldfiles, { desc = 'Find Old Files' })
    map('n', '<leader>fa', function()
      builtin.find_files { hidden = true, no_ignore = true }
    end, { desc = 'Find All Files' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    map('n', '<leader>fw', builtin.live_grep, { desc = 'Find by Grep' })
    map('n', '<leader>fW', function()
      builtin.live_grep {
        additional_args = function(args)
          return vim.list_extend(args, { '--hidden', '--no-ignore' })
        end,
      }
    end, { desc = 'Find words in all files' })
    map('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
    map('n', '<leader>;', builtin.resume, { desc = 'Find Resume' })
    map('n', '<leader>fc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind [N]eovim files' })
    map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
  end,
  config = function()
    local actions = require 'telescope.actions'

    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { 'node_modules', 'vendor' },
        set_env = { COLORTERM = 'truecolor' },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<C-p>'] = false,
            ['<C-n>'] = false,
            ['jk'] = { '<esc>', type = 'command' },
            ['<C-j>'] = {
              actions.move_selection_next,
              type = 'action',
              opts = { nowait = true, silent = true },
            },
            ['<C-k>'] = {
              actions.move_selection_previous,
              type = 'action',
              opts = { nowait = true, silent = true },
            },
            ['<C-b>'] = actions.preview_scrolling_up,
            ['<C-f>'] = actions.preview_scrolling_down,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {
            -- even more opts
          },
        },
      },
    }

    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'noice'
  end,
}
